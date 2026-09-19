#!/usr/bin/env python3
"""Pull the real dbt / zhao output of the four benchmark runs from GitHub Actions into docs/captures/,
for scripts/make_demo_images.py to render.

Needs the `gh` CLI, signed in. Usage: scripts/fetch_ci_logs.py
"""
import json
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
CAP = ROOT / "docs" / "captures"
PREFIX = re.compile(r"^[^\t]*\t[^\t]*\t﻿?\d{4}-\d{2}-\d{2}T[\d:.]+Z ?")
BRANCHES = {"v1-state-modified": ("v1", "state-modified-build"), "v1-zhao-diff": ("v1", "zhao-build"),
            "v2-state-modified": ("v2", "state-modified-build"), "v2-zhao-diff": ("v2", "zhao-build")}


def gh(*args):
    return subprocess.run(["gh", *args], cwd=ROOT, capture_output=True, text=True, check=True).stdout


def groups(log_lines):
    """-> {group title: [lines]} for the ::group:: sections of the 'Run the strategy' step."""
    out, cur = {}, None
    for raw in log_lines:
        parts = raw.split("\t")
        if len(parts) < 3 or "Run the strategy" not in parts[1]:
            continue
        line = PREFIX.sub("", raw)
        if line.startswith("##[group]"):  # GitHub rewrites ::group:: to ##[group] in the stored log
            cur = line[len("##[group]"):].strip()
            out[cur] = []
        elif line.startswith("##[endgroup]"):
            cur = None
        elif cur is not None:
            out[cur].append(line)
    return out


def main():
    CAP.mkdir(parents=True, exist_ok=True)
    runs = json.loads(gh("run", "list", "--workflow", "benchmark", "--limit", "20", "--json",
                         "databaseId,headBranch,conclusion,status"))
    for br, (eng, name) in BRANCHES.items():
        run = next((r for r in runs if r["headBranch"] == f"bench/{br}" and r["conclusion"] == "success"), None)
        if not run:
            sys.exit(f"no successful run for bench/{br}")
        lines = gh("run", "view", str(run["databaseId"]), "--log").splitlines()
        g = groups(lines)
        build = next((v for k, v in g.items() if k.startswith("dbt build")), None)
        if build is None:
            sys.exit(f"bench/{br}: no dbt build group in the log (was it run with output streaming?)")
        (CAP / f"{eng}-{name}.txt").write_text("\n".join(build) + "\n")
        report = next((v for k, v in g.items() if k.startswith("zhao diff")), None)
        if report is not None:
            (CAP / f"{eng}-zhao-diff.txt").write_text("\n".join(report) + "\n")
        print(f"bench/{br}: run {run['databaseId']}, {len(build)} build lines" + (f", zhao report {len(report)} lines" if report else ""))


if __name__ == "__main__":
    main()
