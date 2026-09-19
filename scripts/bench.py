#!/usr/bin/env python3
"""Benchmark harness: dbt `state:modified+` vs `zhao diff` -> `dbt build`.

Subcommands (all take --engine v1|v2, default: the engine chosen by `make use-v1|use-v2`):

  install-fusion   download the pinned dbt Fusion binary into .tools/fusion (no shell config touched)
  data             generate the deterministic raw data into the engine's baseline DuckDB file
  baseline         data + full `dbt build` of the unchanged project (the "production" state)
  state            re-compile the unchanged project and refresh state/<engine>/manifest.json
  compare          apply the change, then run both strategies from identical copies of the
                   baseline and print a side-by-side result

The DuckDB file is always named `bench.duckdb` (in a different folder per copy): dbt-duckdb bakes
the file's name into view definitions as the catalog name, so copying under another name breaks them.
"""
import argparse
import json
import os
import platform
import re
import shutil
import subprocess
import sys
import tarfile
import time
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
DATA = ROOT / "data"
FUSION_VERSION = "2.0.5"
MIN_ZHAO = (0, 5, 2)


def engine_of(args):
    if args.engine:
        return args.engine
    f = ROOT / ".engine"
    return f.read_text().strip() if f.exists() else "v1"


def dbt_bin(engine):
    if engine == "v1":
        p = ROOT / ".venv" / "bin" / "dbt"
    else:
        p = ROOT / ".tools" / "fusion" / "dbt"
    if not p.exists():
        sys.exit(f"dbt for engine {engine} not found at {p}; run `make use-{engine}` first")
    return str(p)


def zhao_bin():
    z = os.environ.get("ZHAO_BIN", "zhao")
    try:
        out = subprocess.run([z, "--version"], capture_output=True, text=True, check=True).stdout.split()[-1]
    except (OSError, subprocess.CalledProcessError):
        sys.exit("zhao not found. Install it (see README) or set ZHAO_BIN to its path.")
    if tuple(int(x) for x in out.split(".")[:3]) < MIN_ZHAO:
        sys.exit(f"zhao {out} is too old; this benchmark needs zhao >= {'.'.join(map(str, MIN_ZHAO))}")
    return z


ENGINE_NAMES = {"v1": "dbt Core (v1)", "v2": "dbt Fusion (v2)"}
STRATEGY_NAMES = {"state-modified": "state:modified+", "zhao-diff": "zhao diff \u2192 dbt build"}


def engine_version(engine):
    """The engine's version without running dbt (`dbt --version` makes network calls)."""
    if engine == "v2":
        return FUSION_VERSION
    from importlib.metadata import version
    return version("dbt-core")


def db_path(engine, name):
    return DATA / engine / name / "bench.duckdb"


def run(cmd, env=None, capture=False, check=True):
    e = {**os.environ, "DBT_SEND_ANONYMOUS_USAGE_STATS": "false", **(env or {})}
    return subprocess.run(cmd, cwd=ROOT, env=e, text=True, capture_output=capture, check=check)


def dbt(engine, sub, db, extra=(), capture=False, check=True):
    cmd = [dbt_bin(engine), *sub, "--profiles-dir", str(ROOT), *extra]
    return run(cmd, env={"BENCH_DB": str(db)}, capture=capture, check=check)


def install_fusion(_args):
    system = platform.system().lower()
    machine = platform.machine().lower()
    triple = {
        ("darwin", "arm64"): "aarch64-apple-darwin",
        ("darwin", "x86_64"): "x86_64-apple-darwin",
        ("linux", "x86_64"): "x86_64-unknown-linux-gnu",
        ("linux", "aarch64"): "aarch64-unknown-linux-gnu",
    }.get((system, machine))
    if not triple:
        sys.exit(f"no dbt Fusion build known for {system}/{machine}")
    dest = ROOT / ".tools" / "fusion"
    if (dest / "dbt").exists() and FUSION_VERSION in run([str(dest / "dbt"), "--version"], capture=True).stdout:
        print(f"dbt Fusion {FUSION_VERSION} already installed")
        return
    url = f"https://public.cdn.getdbt.com/fs/cli/fs-v{FUSION_VERSION}-{triple}.tar.gz"
    dest.mkdir(parents=True, exist_ok=True)
    tgz = dest / "fusion.tar.gz"
    print(f"downloading {url}")
    urllib.request.urlretrieve(url, tgz)
    with tarfile.open(tgz) as t:
        t.extractall(dest, filter="data")
    tgz.unlink()
    (dest / "dbt").chmod(0o755)
    print(run([str(dest / "dbt"), "--version"], capture=True).stdout.strip())


def make_data(engine, fact_rows, customers):
    db = db_path(engine, "baseline")
    db.parent.mkdir(parents=True, exist_ok=True)
    db.unlink(missing_ok=True)
    py = ROOT / ".venv" / "bin" / "python"
    t = time.time()
    run([str(py), "scripts/generate_data.py", str(db), "--fact-rows", str(fact_rows), "--customers", str(customers)])
    print(f"raw data generated in {time.time() - t:.0f}s")


def baseline(args):
    engine = engine_of(args)
    revert_change()
    make_data(engine, args.fact_rows, args.customers)
    db = db_path(engine, "baseline")
    t = time.time()
    dbt(engine, ["build"], db, ["--threads", str(args.threads)])
    print(f"baseline full build: {time.time() - t:.0f}s ({db.stat().st_size / 1e9:.2f} GB)")


def revert_change():
    subprocess.run([sys.executable, "scripts/apply_change.py", "--revert"], cwd=ROOT, capture_output=True)


def apply_change():
    return run([sys.executable, "scripts/apply_change.py"], capture=True).stdout.strip()


def refresh_state(args):
    engine = engine_of(args)
    revert_change()
    db = db_path(engine, "baseline")
    dbt(engine, ["compile"], db, capture=True)
    out = ROOT / "state" / engine
    out.mkdir(parents=True, exist_ok=True)
    shutil.copy(ROOT / "target" / "manifest.json", out / "manifest.json")
    print(f"wrote {out / 'manifest.json'}")


def executed_models(engine):
    """(model names built, tests run, dbt execution seconds, summed per-node compute seconds)."""
    rr = json.loads((ROOT / "target" / "run_results.json").read_text())
    ids = set()
    tests = 0
    compute = 0.0
    for r in rr["results"]:
        uid = r["unique_id"]
        compute += float(r.get("execution_time") or 0)
        if uid.startswith("model."):
            ids.add(uid.split(".")[-1])
        elif uid.startswith("test."):
            tests += 1
    return ids, tests, float(rr.get("elapsed_time") or 0), compute


def fresh_copy(engine, name):
    dst = db_path(engine, name)
    dst.parent.mkdir(parents=True, exist_ok=True)
    src = db_path(engine, "baseline")
    if not src.exists():
        sys.exit("no baseline database; run `make baseline` first")
    shutil.copyfile(src, dst)
    return dst


def compare(args):
    engine = engine_of(args)
    zhao = zhao_bin()
    state_dir = ROOT / "state" / engine
    if not (state_dir / "manifest.json").exists():
        sys.exit(f"missing {state_dir}/manifest.json")
    change = json.loads((ROOT / "change" / "change.json").read_text())
    print(f"engine: {engine}   change: {apply_change()}")
    print(f"  {change['edits'][0]['old_line'].strip()}  ->  {change['edits'][0]['new_line'].strip()}")
    base = db_path(engine, "baseline")

    # Setup (not timed): compile the changed project so both strategies read the same current state.
    t = time.time()
    dbt(engine, ["compile"], base, capture=True)
    setup_s = time.time() - t

    results = {}
    threads = ["--threads", str(args.threads)]

    # zhao reads the compiled manifest in target/, and a later `dbt build` rewrites it without the
    # compiled SQL of models it did not run, so plan now, before either strategy builds anything.
    t = time.time()
    plan = run([zhao, "diff", "--state", str(state_dir / "manifest.json"), "--format", "json", "--no-color"],
               capture=True).stdout
    zhao_plan_s = time.time() - t
    (ROOT / "target" / "zhao_plan.json").write_text(plan)
    impacted = json.loads(plan)["impacted_models"]

    # ---- Strategy A: dbt state:modified+ ---------------------------------------------------------
    db_a = fresh_copy(engine, "modified_plus")
    # dbt's fixed cost (start-up + parsing the whole project), measured by building one trivial view.
    # Neither strategy can avoid it, so it is subtracted to show the cost of the selected work itself.
    t = time.time()
    dbt(engine, ["build", "--select", "stg_cu_0"], db_a, threads, capture=True)
    fixed_s = time.time() - t
    listed = dbt(engine, ["ls", "--resource-type", "model", "--select", "state:modified+", "--state", str(state_dir),
                          "--output", "name"], db_a, capture=True).stdout.split()
    manifest = json.loads((ROOT / "target" / "manifest.json").read_text())
    model_names = {n["name"] for n in manifest["nodes"].values() if n["resource_type"] == "model"}
    selected_a = {l.split(".")[-1] for l in listed} & model_names
    cmd_a = "dbt build --select state:modified+ --state state/" + engine
    t = time.time()
    dbt(engine, ["build", "--select", "state:modified+", "--state", str(state_dir)], db_a, threads, capture=True)
    time_a = time.time() - t
    built_a, tests_a = executed_models(engine)[:2]
    results["state:modified+"] = dict(command=cmd_a, selected=sorted(selected_a), built=sorted(built_a),
                                      tests=tests_a, seconds=round(time_a, 1), plan_seconds=0.0)

    # ---- Strategy B: zhao diff -> dbt build ------------------------------------------------------
    db_b = fresh_copy(engine, "zhao")
    select = " ".join(impacted)
    cmd_b = f"zhao diff --format json | dbt build --select <{len(impacted)} models from impacted_models>"
    t = time.time()
    dbt(engine, ["build", "--select", *impacted], db_b, threads, capture=True)
    time_b = time.time() - t + zhao_plan_s
    built_b, tests_b = executed_models(engine)[:2]
    results["zhao diff"] = dict(command=cmd_b, selected=sorted(impacted), built=sorted(built_b),
                                tests=tests_b, seconds=round(time_b, 1), select=select,
                                plan_seconds=round(zhao_plan_s, 1))

    revert_change()

    ea = max(results["state:modified+"]["seconds"] - fixed_s, 0.1)
    eb = max(results["zhao diff"]["seconds"] - results["zhao diff"]["plan_seconds"] - fixed_s, 0.1)
    results["state:modified+"]["build_work_seconds"] = round(ea, 1)
    results["zhao diff"]["build_work_seconds"] = round(eb, 1)

    # ---- verification --------------------------------------------------------------------------
    problems = []
    for name, r in results.items():
        if set(r["selected"]) != set(r["built"]):
            problems.append(f"{name}: dbt built {len(r['built'])} models but {len(r['selected'])} were selected")
    a, b = set(results["state:modified+"]["built"]), set(results["zhao diff"]["built"])
    if not b <= a:
        problems.append(f"zhao selected models state:modified+ did not: {sorted(b - a)[:5]}")
    truth = set(change["column_reach"])
    if b != truth:
        problems.append(f"zhao's selection differs from the generator's true column reach "
                        f"({len(b - truth)} extra, {len(truth - b)} missing)")

    only_a = sorted(a - b)
    out = ROOT / "results" / engine
    out.mkdir(parents=True, exist_ok=True)
    (out / "only_in_state_modified_plus.txt").write_text("\n".join(only_a) + "\n")
    (out / "zhao_diff_selection.txt").write_text("\n".join(sorted(b)) + "\n")
    (out / "result.json").write_text(json.dumps(
        dict(engine=engine, change=change["description"], total_models=change["total_models"],
             setup_seconds_not_timed=round(setup_s, 1), fixed_dbt_overhead_seconds=round(fixed_s, 1), strategies=results, verification_problems=problems),
        indent=2) + "\n")

    ra, rb = results["state:modified+"], results["zhao diff"]
    print()
    print(f"{'':28}{'state:modified+':>18}{'zhao diff -> build':>22}")
    print(f"{'models selected':28}{len(ra['selected']):>18}{len(rb['selected']):>22}")
    print(f"{'models built':28}{len(ra['built']):>18}{len(rb['built']):>22}")
    print(f"{'tests run':28}{ra['tests']:>18}{rb['tests']:>22}")
    print(f"{'wall-clock select + build (s)':28}{ra['seconds']:>18}{rb['seconds']:>22}")
    print(f"{'  incl. zhao diff planning (s)':28}{'-':>18}{rb['plan_seconds']:>22}")
    print(f"{'build work only (s)':28}{ea:>18.1f}{eb:>22.1f}")
    print(f"{'speed-up, wall-clock':28}{'':>18}{ra['seconds'] / rb['seconds']:>21.1f}x")
    print(f"{'speed-up, build work only':28}{'':>18}{ea / eb:>21.1f}x")
    print(f"(dbt's fixed cost of parsing the whole project, {fixed_s:.1f}s, is inside wall-clock and removed from 'build work only')")
    print(f"(not timed: compiling the changed project, {setup_s:.1f}s; both strategies share it)")
    print(f"models state:modified+ builds that zhao doesn't: {len(only_a)}  (list: results/{engine}/only_in_state_modified_plus.txt)")
    print("verification:", "OK" if not problems else "")
    for p in problems:
        print("  PROBLEM:", p)
    sys.exit(1 if problems else 0)


def ci_run(args):
    """One strategy against the project exactly as checked out (a PR branch that already carries the
    change). Writes results/<engine>/<strategy>.{json,md}; appends the markdown to the GitHub job summary."""
    engine, strategy = engine_of(args), args.strategy
    state_dir = ROOT / "state" / engine
    threads = ["--threads", str(args.threads)]
    version = f"{ENGINE_NAMES[engine]} {engine_version(engine)}"

    # Setup (not timed): compile the project as checked out.
    dbt(engine, ["compile"], db_path(engine, "baseline"), capture=True)
    manifest = json.loads((ROOT / "target" / "manifest.json").read_text())
    model_names = {n["name"] for n in manifest["nodes"].values() if n["resource_type"] == "model"}

    plan_s, impacted = 0.0, []
    if strategy == "zhao-diff":
        # Plan before building anything: a later `dbt build` rewrites target/manifest.json without the
        # compiled SQL of models it did not run.
        t = time.time()
        plan = run([zhao_bin(), "diff", "--state", str(state_dir / "manifest.json"), "--format", "json",
                    "--no-color"], capture=True).stdout
        plan_s = time.time() - t
        (ROOT / "target" / "zhao_plan.json").write_text(plan)
        impacted = json.loads(plan)["impacted_models"]

    # One strategy per job, so run on the baseline database itself (no 8 GB copy: CI runners have little disk).
    db = db_path(engine, "baseline")
    t = time.time()
    dbt(engine, ["build", "--select", "stg_cu_0"], db, threads, capture=True)
    fixed_s = time.time() - t

    if strategy == "state-modified":
        listed = dbt(engine, ["ls", "--resource-type", "model", "--select", "state:modified+", "--state",
                              str(state_dir), "--output", "name"], db, capture=True).stdout.split()
        selected = {l.split(".")[-1] for l in listed} & model_names
        command = f"dbt build --select state:modified+ --state state/{engine}"
        t = time.time()
        dbt(engine, ["build", "--select", "state:modified+", "--state", str(state_dir)], db, threads, capture=True)
        wall = time.time() - t
    else:
        selected = set(impacted)
        command = f"zhao diff --state state/{engine}/manifest.json --format json  ->  dbt build --select <impacted_models>"
        t = time.time()
        dbt(engine, ["build", "--select", *impacted], db, threads, capture=True)
        wall = time.time() - t + plan_s

    built, tests = executed_models(engine)[:2]
    problems = []
    if not selected:
        problems.append("nothing was selected")
    if selected != built:
        problems.append(f"dbt built {len(built)} models but {len(selected)} were selected")
    work = max(wall - plan_s - fixed_s, 0.1)
    res = dict(engine=engine, dbt=version, strategy=strategy, command=command, total_models=len(model_names),
               models_selected=len(selected), models_built=len(built), tests_run=tests,
               wall_clock_seconds=round(wall, 1), zhao_planning_seconds=round(plan_s, 1),
               dbt_fixed_overhead_seconds=round(fixed_s, 1), build_work_seconds=round(work, 1),
               selected=sorted(selected), verification_problems=problems)
    out = ROOT / "results" / engine
    out.mkdir(parents=True, exist_ok=True)
    (out / f"{strategy}.json").write_text(json.dumps(res, indent=2) + "\n")
    md = "\n".join([
        f"### {ENGINE_NAMES[engine]} \u00b7 {STRATEGY_NAMES[strategy]}",
        "",
        f"Engine: {version}",
        "",
        f"`{command}`",
        "",
        "| | |",
        "|---|---:|",
        f"| Models in project | {len(model_names)} |",
        f"| Models selected / built | {len(selected)} / {len(built)} |",
        f"| Tests run | {tests} |",
        f"| Wall-clock, select + build | {wall:.1f} s |",
        f"| of which `zhao diff` planning | {plan_s:.1f} s |",
        f"| dbt fixed cost (start-up, parsing the whole project) | {fixed_s:.1f} s |",
        f"| Build work only (wall-clock minus the two lines above) | {work:.1f} s |",
        f"| Verification (dbt built exactly the selected models) | {'OK' if not problems else 'FAILED: ' + '; '.join(problems)} |",
        "",
        "_Baseline build, data generation and compiling the project are set-up steps and are not timed._",
        "",
    ])
    (out / f"{strategy}.md").write_text(md)
    print(md)
    summary = os.environ.get("GITHUB_STEP_SUMMARY")
    if summary:
        with open(summary, "a") as f:
            f.write(md + "\n")
    sys.exit(1 if problems else 0)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd", choices=["install-fusion", "data", "baseline", "state", "compare", "ci-run"])
    ap.add_argument("--engine", choices=["v1", "v2"])
    ap.add_argument("--strategy", choices=["state-modified", "zhao-diff"])
    ap.add_argument("--fact-rows", type=int, default=50_000_000)
    ap.add_argument("--customers", type=int, default=50_000)
    ap.add_argument("--threads", type=int, default=4)
    args = ap.parse_args()
    {
        "install-fusion": install_fusion,
        "data": lambda a: make_data(engine_of(a), a.fact_rows, a.customers),
        "baseline": baseline,
        "state": refresh_state,
        "compare": compare,
        "ci-run": ci_run,
    }[args.cmd](args)


if __name__ == "__main__":
    main()
