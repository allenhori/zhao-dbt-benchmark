#!/usr/bin/env python3
"""Generate the benchmark dbt project's models (deterministic for a given seed).

Every model selects an explicit list of columns and every derived column records exactly
which parent columns it reads, so the generator knows the true column-level lineage. That
ground truth is used to pick the benchmark's column change and is written out to
`change/change.json` so the harness can check zhao's answer against it.

Layers (default sizes give ~2,000 models):
  stg_*      views over raw source tables (event grain / customer grain)
  int_ev_*   views, event grain, derive metric columns from one parent view
  cust_*     tables, customer grain: aggregate an event view, or join customer models
  seg_*      tables, segment grain: aggregate a customer model
  rollup_*   tables, segment grain: join segment models
"""
import argparse
import json
import random
import re
import shutil
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
N_EVENT_SRC = 8
N_CUST_SRC = 4
N_EV_METRICS = 12
N_CU_ATTRS = 6


class Model:
    def __init__(self, name, layer, mat, keys):
        self.name, self.layer, self.mat, self.keys = name, layer, mat, keys
        self.cols = {}  # metric col -> (expr_sql, deps [(model, col)])
        self.body = ""  # rendered later
        self.parents = []
        self.depth = 0
        self.line_of = {}  # metric col -> exact rendered select line


def pick(rng, seq, k):
    return rng.sample(list(seq), min(k, len(seq)))


def unary(rng, a):
    c = rng.choice([2, 3, 5, 7, 11, 13])
    return rng.choice([
        f"{a} * {c}",
        f"{a} + {c}",
        f"round({a} / {c}.0, 4)",
        f"case when {a} > {c * 100} then {a} else 0 end",
        f"coalesce({a}, 0) + {c}",
    ])


def binary(rng, a, b):
    return rng.choice([
        f"{a} + {b}",
        f"{a} * 0.5 + {b} * 0.5",
        f"{a} - {b}",
        f"case when {a} > {b} then {a} else {b} end",
    ])


def build(args):
    rng = random.Random(args.seed)
    # Aggregate-function choice has its own stream so it can be tuned without reshuffling the graph.
    fn_rng = random.Random(args.seed + 1)
    models = []

    def add(m):
        models.append(m)
        return m

    # ---- staging ------------------------------------------------------------
    stg_ev, stg_cu = [], []
    for i in range(N_EVENT_SRC):
        m = add(Model(f"stg_ev_{i:02d}", "staging", "view", ["event_id", "customer_id", "segment_id"]))
        for j in range(1, N_EV_METRICS + 1):
            m.cols[f"m{j}"] = (f"m{j}", [("source:ev_%02d" % i, f"m{j}")])
        m.source = f"ev_{i:02d}"
        stg_ev.append(m)
    for i in range(N_CUST_SRC):
        m = add(Model(f"stg_cu_{i}", "staging", "view", ["customer_id", "segment_id"]))
        for j in range(1, N_CU_ATTRS + 1):
            m.cols[f"a{j}"] = (f"a{j}", [(f"source:cu_{i}", f"a{j}")])
        m.source = f"cu_{i}"
        stg_cu.append(m)

    # ---- event-grain views --------------------------------------------------
    ev_pool = list(stg_ev)
    ev_views = []
    for n in range(args.ev_views):
        cands = [p for p in ev_pool if p.depth < 4]
        if rng.random() < 0.5:  # a few widely shared upstream views, like real projects
            cands = [p for p in ev_pool[:40] if p.depth < 4]
        parent = rng.choice(cands)
        m = add(Model(f"int_ev_{n:04d}", "intermediate", "view", ["event_id", "customer_id", "segment_id"]))
        m.parents, m.depth = [parent], parent.depth + 1
        m.filter = rng.random() < 0.2
        srcs = pick(rng, parent.cols, rng.randint(2, 3))
        for k in range(1, rng.randint(6, 8) + 1):
            s = rng.choice(srcs)
            others = [x for x in srcs if x != s]
            if others and rng.random() < 0.3:
                other = rng.choice(others)
                expr = binary(rng, f"p.{s}", f"p.{other}")
                deps = [(parent.name, s), (parent.name, other)]
            else:
                expr, deps = unary(rng, f"p.{s}"), [(parent.name, s)]
            m.cols[f"v{k}"] = (expr, deps)
        ev_pool.append(m)
        ev_views.append(m)

    # ---- customer-grain tables ---------------------------------------------
    cust_pool = list(stg_cu)
    cust_models = []
    for n in range(args.cust):
        if rng.random() < args.agg_share or not cust_models:
            parent = rng.choice(ev_pool)
            m = add(Model(f"cust_{n:04d}", "marts", "table", ["customer_id", "segment_id"]))
            m.parents, m.kind, m.depth = [parent], "agg", 1
            srcs = pick(rng, parent.cols, rng.randint(2, 3))
            for k in range(1, rng.randint(4, 6) + 1):
                s = rng.choice(srcs)
                rng.choice(range(4))  # keeps the main stream (and so the graph) unchanged
                fn = fn_rng.choice(["sum", "avg", "max", "min", "median", "stddev_samp"])
                m.cols[f"s{k}"] = (f"{fn}(p.{s})", [(parent.name, s)])
        else:
            cands = [p for p in cust_pool if p.depth < 6]
            base = rng.choice(cands)
            others = pick(rng, [p for p in cust_pool if p is not base], rng.randint(0, 2))
            m = add(Model(f"cust_{n:04d}", "marts", "table", ["customer_id", "segment_id"]))
            m.parents, m.kind = [base] + others, "join"
            m.depth = max(p.depth for p in m.parents) + 1
            usable = {p.name: pick(rng, p.cols, 2) for p in m.parents}
            for k in range(1, rng.randint(4, 6) + 1):
                p1 = rng.choice(m.parents)
                a = rng.choice(usable[p1.name])
                if len(m.parents) > 1 and rng.random() < 0.4:
                    p2 = rng.choice([p for p in m.parents if p is not p1])
                    b = rng.choice(usable[p2.name])
                    ia, ib = m.parents.index(p1), m.parents.index(p2)
                    expr = binary(rng, f"p{ia}.{a}", f"p{ib}.{b}")
                    deps = [(p1.name, a), (p2.name, b)]
                else:
                    ia = m.parents.index(p1)
                    expr, deps = f"p{ia}.{a}", [(p1.name, a)]
                m.cols[f"t{k}"] = (expr, deps)
        cust_pool.append(m)
        cust_models.append(m)

    # ---- segment-grain tables ----------------------------------------------
    seg_models = []
    for n in range(args.seg):
        parent = rng.choice(cust_models)
        m = add(Model(f"seg_{n:04d}", "rollups", "table", ["segment_id"]))
        m.parents, m.kind, m.depth = [parent], "segagg", 1
        segsrc = pick(rng, parent.cols, 2)
        for k in range(1, rng.randint(3, 4) + 1):
            s = rng.choice(segsrc)
            fn = rng.choice(["sum", "avg", "max"])
            m.cols[f"g{k}"] = (f"{fn}(p.{s})", [(parent.name, s)])
        seg_models.append(m)

    # ---- roll-ups -----------------------------------------------------------
    roll_pool = list(seg_models)
    for n in range(args.rollup):
        cands = [p for p in roll_pool if p.depth < 4]
        parents = pick(rng, cands, rng.randint(2, 3))
        m = add(Model(f"rollup_{n:04d}", "rollups", "table", ["segment_id"]))
        m.parents, m.kind = parents, "join_seg"
        m.depth = max(p.depth for p in parents) + 1
        for k in range(1, rng.randint(2, 4) + 1):
            p1 = rng.choice(parents)
            a = rng.choice(list(p1.cols))
            ia = parents.index(p1)
            if rng.random() < 0.5:
                p2 = rng.choice([p for p in parents if p is not p1])
                b = rng.choice(list(p2.cols))
                ib = parents.index(p2)
                m.cols[f"r{k}"] = (binary(rng, f"p{ia}.{a}", f"p{ib}.{b}"), [(p1.name, a), (p2.name, b)])
            else:
                m.cols[f"r{k}"] = (f"p{ia}.{a}", [(p1.name, a)])
        roll_pool.append(m)
    return models


def render(m):
    lines = []
    add = lines.append
    if m.layer == "staging":
        add("select")
        keys = m.keys
        for k in keys:
            add(f"    {k},")
        cols = list(m.cols)
        for i, c in enumerate(cols):
            m.line_of[c] = f"    {c} as {c}" + ("," if i < len(cols) - 1 else "")
            add(m.line_of[c])
        add(f"from {{{{ source('raw', '{m.source}') }}}}")
    elif m.layer == "intermediate":
        p = m.parents[0]
        add("select")
        for k in m.keys:
            add(f"    p.{k} as {k},")
        cols = list(m.cols)
        for i, c in enumerate(cols):
            expr, _ = m.cols[c]
            m.line_of[c] = f"    {expr} as {c}" + ("," if i < len(cols) - 1 else "")
            add(m.line_of[c])
        add(f"from {{{{ ref('{p.name}') }}}} as p")
        if m.filter:
            add("where p.customer_id % 97 <> 0")
    elif m.kind == "agg":
        p = m.parents[0]
        add("select")
        add("    p.customer_id as customer_id,")
        add("    max(p.segment_id) as segment_id,")
        cols = list(m.cols)
        for i, c in enumerate(cols):
            expr, _ = m.cols[c]
            m.line_of[c] = f"    {expr} as {c}" + ("," if i < len(cols) - 1 else "")
            add(m.line_of[c])
        add(f"from {{{{ ref('{p.name}') }}}} as p")
        add("group by p.customer_id")
    elif m.kind == "join":
        add("select")
        add("    p0.customer_id as customer_id,")
        add("    p0.segment_id as segment_id,")
        cols = list(m.cols)
        for i, c in enumerate(cols):
            expr, _ = m.cols[c]
            m.line_of[c] = f"    {expr} as {c}" + ("," if i < len(cols) - 1 else "")
            add(m.line_of[c])
        add(f"from {{{{ ref('{m.parents[0].name}') }}}} as p0")
        for i, p in enumerate(m.parents[1:], 1):
            add(f"left join {{{{ ref('{p.name}') }}}} as p{i} on p{i}.customer_id = p0.customer_id")
    elif m.kind == "segagg":
        p = m.parents[0]
        add("select")
        add("    p.segment_id as segment_id,")
        cols = list(m.cols)
        for i, c in enumerate(cols):
            expr, _ = m.cols[c]
            m.line_of[c] = f"    {expr} as {c}" + ("," if i < len(cols) - 1 else "")
            add(m.line_of[c])
        add(f"from {{{{ ref('{p.name}') }}}} as p")
        add("group by p.segment_id")
    elif m.kind == "join_seg":
        add("select")
        add("    p0.segment_id as segment_id,")
        cols = list(m.cols)
        for i, c in enumerate(cols):
            expr, _ = m.cols[c]
            m.line_of[c] = f"    {expr} as {c}" + ("," if i < len(cols) - 1 else "")
            add(m.line_of[c])
        add(f"from {{{{ ref('{m.parents[0].name}') }}}} as p0")
        for i, p in enumerate(m.parents[1:], 1):
            add(f"inner join {{{{ ref('{p.name}') }}}} as p{i} on p{i}.segment_id = p0.segment_id")
    m.body = "\n".join(lines) + "\n"


def lineage_reach(models):
    """For every (model, col) -> set of model names that (transitively) read it, itself included."""
    readers = {}  # (model, col) -> list of (child_model, child_col)
    for m in models:
        for c, (_, deps) in m.cols.items():
            for d in deps:
                readers.setdefault(d, []).append((m.name, c))
    reach = {}
    for m in models:
        for c in m.cols:
            seen, stack, names = {(m.name, c)}, [(m.name, c)], {m.name}
            while stack:
                cur = stack.pop()
                for nxt in readers.get(cur, []):
                    if nxt not in seen:
                        seen.add(nxt)
                        names.add(nxt[0])
                        stack.append(nxt)
            reach[(m.name, c)] = names
    return reach


def model_cone(models):
    """model name -> set of all downstream model names (model-level, what state:modified+ selects)."""
    children = {}
    for m in models:
        for p in m.parents:
            children.setdefault(p.name, set()).add(m.name)
    memo = {}

    def down(n):
        if n in memo:
            return memo[n]
        out = set()
        for c in children.get(n, ()):
            out.add(c)
            out |= down(c)
        memo[n] = out
        return out

    return {m.name: down(m.name) for m in models}


def choose_change(models, args, rng):
    reach, cone = lineage_reach(models), model_cone(models)
    total = len(models)
    best = None
    for m in models:
        if m.layer != "intermediate" or m.depth > 2:
            continue
        for c in m.cols:
            r = len(reach[(m.name, c)])
            cn = len(cone[m.name]) + 1
            if not (args.min_reach * total <= r <= args.max_reach * total):
                continue
            if cn < args.min_cone * total:
                continue
            score = cn / r
            if best is None or score > best[0]:
                best = (score, m, c, r, cn)
    if best is None:
        raise SystemExit("no (model, column) satisfies the reach/cone constraints; adjust args")
    return best


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--seed", type=int, default=42)
    ap.add_argument("--ev-views", type=int, default=440)
    ap.add_argument("--cust", type=int, default=900)
    ap.add_argument("--agg-share", type=float, default=0.4)
    ap.add_argument("--seg", type=int, default=400)
    ap.add_argument("--rollup", type=int, default=200)
    ap.add_argument("--min-reach", type=float, default=0.03)
    ap.add_argument("--max-reach", type=float, default=0.10)
    ap.add_argument("--min-cone", type=float, default=0.35)
    args = ap.parse_args()

    models = build(args)
    for m in models:
        render(m)

    out = ROOT / "models"
    if out.exists():
        shutil.rmtree(out)
    for layer in ("staging", "intermediate", "marts", "rollups"):
        (out / layer).mkdir(parents=True)
    tests = {"marts": [], "rollups": []}
    for m in models:
        (out / m.layer / f"{m.name}.sql").write_text(m.body)
        if m.layer in tests:
            tests[m.layer].append(m)

    for layer, ms in tests.items():
        lines = ["version: 2", "models:"]
        for m in ms:
            key = m.keys[0]
            lines += [f"  - name: {m.name}", "    columns:", f"      - name: {key}", "        tests: [unique, not_null]"]
        (out / layer / "schema.yml").write_text("\n".join(lines) + "\n")

    src = ["version: 2", "sources:", "  - name: raw", "    schema: raw", "    tables:"]
    for i in range(N_EVENT_SRC):
        src += [f"      - name: ev_{i:02d}", "        columns:"]
        for c in ["event_id", "customer_id", "segment_id"] + [f"m{j}" for j in range(1, N_EV_METRICS + 1)]:
            src.append(f"          - name: {c}")
    for i in range(N_CUST_SRC):
        src += [f"      - name: cu_{i}", "        columns:"]
        for c in ["customer_id", "segment_id"] + [f"a{j}" for j in range(1, N_CU_ATTRS + 1)]:
            src.append(f"          - name: {c}")
    (out / "sources.yml").write_text("\n".join(src) + "\n")

    _, cm, col, reach_n, cone_n = choose_change(models, args, random.Random(args.seed))
    reach = lineage_reach(models)[(cm.name, col)]
    old_line = cm.line_of[col]
    expr, _ = cm.cols[col]
    new_line = old_line.replace(expr, f"({expr}) * 1.1", 1)
    assert new_line != old_line
    change = {
        "description": f"change the logic of {cm.name}.{col}: multiply its expression by 1.1",
        "model": cm.name,
        "column": col,
        "edits": [{"file": f"models/{cm.layer}/{cm.name}.sql", "old_line": old_line, "new_line": new_line}],
        "files_changed": 1,
        "total_models": len(models),
        "model_cone_size": cone_n - 1,
        "column_reach_size": reach_n,
        "column_reach": sorted(reach),
    }
    (ROOT / "change").mkdir(exist_ok=True)
    (ROOT / "change" / "change.json").write_text(json.dumps(change, indent=2) + "\n")

    print(f"models: {len(models)} "
          f"({sum(m.layer == 'staging' for m in models)} stg, "
          f"{sum(m.layer == 'intermediate' for m in models)} int, "
          f"{sum(m.layer == 'marts' for m in models)} marts, "
          f"{sum(m.layer == 'rollups' for m in models)} rollups)")
    print(f"change: {cm.name}.{col}")
    print(f"  state:modified+ would select {cone_n} models ({cone_n / len(models):.0%})")
    print(f"  column-level reach is {reach_n} models ({reach_n / len(models):.1%})")


if __name__ == "__main__":
    main()
