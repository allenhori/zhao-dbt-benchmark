# zhao-dbt-benchmark

**How much of a big dbt project does a small change really touch?**

`dbt build --select state:modified+` rebuilds the changed model and *everything downstream of it*, whether or
not those models read the thing that changed. [`zhao diff`](https://github.com/allenhori/zhao-cli) traces
column-level lineage and names only the models that actually depend on the changed column, so you can build
just those.

This repo lets you check that claim yourself, on a project big enough to matter:

- **1,952 dbt models** and **3,000 tests** on [DuckDB](https://duckdb.org) — no warehouse, no credentials.
- **50M-row fact tables**, generated locally and deterministically (nothing large is committed).
- **One tiny change**: a single line in one hub view, changing the logic of one column.
- **Two dbt engines**, like for like: dbt 1.x (`dbt-core`) and dbt Fusion 2.x.
- **Two strategies**: `state:modified+`, and `zhao diff` → `dbt build --select <the models zhao names>`.

## The result

The change edits one column in one model, `int_ev_0000.v7` (`p.m4 + p.m3` → `(p.m4 + p.m3) * 1.1`).

| | `dbt build --select state:modified+` | `zhao diff` → `dbt build --select …` |
|---|---:|---:|
| Models built (of 1,952) | **702** (36%) | **61** (3%) |
| Tests run | 1,320 | 106 |

Timings differ by machine, so the numbers below are from one run on an Apple-silicon laptop with dbt's
`--threads 4` (the same setting CI uses). Compare the *ratios*, and run it yourself for your own numbers.
[The four benchmark pull requests](#the-four-pull-requests) show the same comparison measured on GitHub Actions.

| Wall-clock, select + build | `state:modified+` | `zhao diff` → build | |
|---|---:|---:|---:|
| dbt 1.x | 87.2 s | 25.0 s | 3.5× faster |
| dbt Fusion 2.x | 45.3 s | 7.5 s | 6.0× faster |

Wall-clock includes dbt's own fixed cost of starting up and parsing all 1,952 models (13.3 s on dbt 1.x, 3.1 s on
Fusion), which no selection strategy can avoid. With that removed, the work of building the selected models is
**6.5× less on dbt 1.x (73.9 s → 11.4 s) and 10.6× less on Fusion (42.2 s → 4.0 s)**. Running `zhao diff`
itself took 0.3–0.4 s.

The 61 models `zhao` selects are exactly the models that read the changed column, directly or through a column
derived from it. The generator knows the true column lineage of every model it writes, and `make compare`
checks that `zhao`'s answer equals it.

## Is the comparison fair?

- **Same starting point.** Both strategies run against byte-identical copies of the same freshly built
  "production" database, and both use the same committed baseline manifest (`state/v1/manifest.json`,
  `state/v2/manifest.json`).
- **Only the selected work is timed.** Generating data, building the baseline, and compiling the changed project
  are set-up steps; they are excluded and reported separately. `zhao diff`'s own planning time *is* included in
  its total.
- **`zhao` really drives dbt.** The `zhao` side runs `zhao diff --format json`, reads the `impacted_models`
  array, and passes those names to a real `dbt build --select`. The exact command is printed.
- **Checked, not assumed.** After each run, dbt's `run_results.json` is compared with what was selected: dbt must
  have built exactly those models, no more and no fewer. `zhao`'s set must also be a subset of
  `state:modified+`'s, and equal to the true column reach the generator computed independently.
- **Honest about where it doesn't help.** See [When `zhao diff` doesn't help](#when-zhao-diff-doesnt-help).

## Try it yourself

You need a Mac or Linux machine with about **16 GB of RAM and 20 GB of free disk**, and:

| Tool | Why | Install |
|---|---|---|
| [`uv`](https://docs.astral.sh/uv/) | manages the Python environment and dbt 1.x | `curl -LsSf https://astral.sh/uv/install.sh \| sh` |
| `make`, `git`, `curl`, `jq` | run the steps | usually preinstalled (`jq`: `brew install jq` / `apt install jq`) |
| [`zhao`](https://github.com/allenhori/zhao-cli) **0.5.2 or newer** | the tool being tested | `curl -fsSL https://raw.githubusercontent.com/allenhori/zhao-cli/master/scripts/install.sh \| sh` |

Check `zhao --version` prints 0.5.2 or newer (older versions don't report column logic changes). If `zhao`
isn't on your `PATH`, set `ZHAO_BIN=/path/to/zhao`.

### 1. dbt 1.x

```bash
git clone https://github.com/allenhori/zhao-dbt-benchmark
cd zhao-dbt-benchmark

make use-v1      # installs dbt 1.x (dbt-core + dbt-duckdb) with uv
make baseline    # generates the data and builds the whole project once   (~5–10 min, ~8 GB of disk)
make compare     # applies the change and runs both strategies             (~3–5 min)
```

`make compare` prints a side-by-side table like this (yours will differ in seconds, not in model counts):

```
                               state:modified+    zhao diff -> build
models selected                            702                    61
models built                               702                    61
tests run                                 1320                   106
wall-clock select + build (s)             87.2                  25.0
  incl. zhao diff planning (s)                -                   0.3
build work only (s)                       73.9                  11.4
speed-up, wall-clock                                            3.5x
speed-up, build work only                                       6.5x
verification: OK
```

It also writes what differs to `results/v1/`:

- `only_in_state_modified_plus.txt` — the 641 models `state:modified+` rebuilds that `zhao` correctly leaves alone,
- `zhao_diff_selection.txt` — the 61 models `zhao` selects,
- `result.json` — every number above.

### 2. dbt Fusion (2.x)

```bash
make use-v2      # downloads dbt Fusion into .tools/ (it does not touch your shell config)
make baseline    # its own baseline database, kept separate from dbt 1.x's
make compare
```

The engine you last selected with `make use-v1` / `make use-v2` is the one `make baseline` and `make compare` use.
To run one without switching, call the script directly: `.venv/bin/python scripts/bench.py compare --engine v2`.

### Doing it by hand

`make compare` is a thin wrapper. To see each step yourself (shown for dbt 1.x; for Fusion use
`.tools/fusion/dbt` instead of `.venv/bin/dbt` and `state/v2`):

```bash
# 1. work on a copy of the baseline database (it must keep the file name bench.duckdb — see Troubleshooting)
mkdir -p data/v1/by-hand && cp data/v1/baseline/bench.duckdb data/v1/by-hand/bench.duckdb
export BENCH_DB=$PWD/data/v1/by-hand/bench.duckdb

# 2. make the change (one line in one file) and look at it
python3 scripts/apply_change.py
git diff

# 3. compile the changed project
.venv/bin/dbt compile --profiles-dir .

# 4a. what does dbt's state:modified+ select?
.venv/bin/dbt ls --profiles-dir . --resource-type model --select state:modified+ --state state/v1 --output name --quiet | wc -l

# 4b. what does zhao select?
zhao diff --state state/v1/manifest.json                   # human-readable report
zhao diff --state state/v1/manifest.json --format json | jq '.impacted_models | length'

# 5. build what zhao selected
.venv/bin/dbt build --profiles-dir . \
  --select $(zhao diff --state state/v1/manifest.json --format json | jq -r '.impacted_models | join(" ")')

python3 scripts/apply_change.py --revert                   # put the project back
```

Run `zhao diff` *before* any `dbt build`: a build rewrites `target/manifest.json` without the compiled SQL of the
models it didn't run, and `zhao` needs the fully compiled manifest.

## The four pull requests

The comparison is also run as real pull requests, measured on GitHub Actions:

| | `state:modified+` | `zhao diff` → `dbt build` |
|---|---|---|
| dbt 1.x | PR `bench/v1-state-modified` | PR `bench/v1-zhao-diff` |
| dbt Fusion 2.x | PR `bench/v2-state-modified` | PR `bench/v2-zhao-diff` |

Each PR carries the identical one-line change. The [`benchmark` workflow](.github/workflows/benchmark.yml) reads
the engine and strategy from the branch name, refuses to run unless the PR contains exactly that change,
builds the baseline from `master` (not timed), runs the strategy, verifies what dbt built, and posts the result
as a PR comment. The PRs are deliberately left open and unmerged: they are the evidence, and merging one would
change the baseline.

## What's in the project

```
models/
  staging/        12 views over the raw source tables (8 event tables, 4 customer tables)
  intermediate/   440 views, event grain: derive metric columns from one parent view
  marts/          900 tables, customer grain: aggregate an event view (sum, avg, max, min, median,
                  stddev) or join other customer models
  rollups/        600 tables, segment grain: aggregate customer models / join segment models
state/v1, v2/     committed baseline manifests — the "production" state both strategies compare against
change/           change.json: the exact one-line change, and the true set of models that read it
scripts/          generate_project.py, generate_data.py, apply_change.py, bench.py
```

Every model selects an explicit list of columns (no `SELECT *`), and most models read only a few of their
parents' columns — as real projects do. That is what gives column-level lineage something to find. The raw data
(three 50M-row tables and five 12.5M-row tables, plus customer tables) is generated by DuckDB from hashes of the
row number, so the same command always produces the same data.

Regenerating the project (optional; the generated models are committed):

```bash
python3 scripts/generate_project.py --ev-views 440 --cust 900 --seg 400 --rollup 200 --seed 42
```

It picks the change automatically: a column in an early hub view whose downstream cone is large (≥ 35% of the
project) but whose true column reach is small (3–10%).

## When `zhao diff` doesn't help

- If the changed column is read by most of the downstream graph, the two selections converge. The benchmark
  deliberately uses a hub view whose *other* columns feed the rest of the graph; a change to a column everything
  uses would show little difference, and that is the correct answer.
- `SELECT *` hides column dependencies, so models built that way are conservatively included.
- The fixed cost of dbt parsing the whole project is the same for every strategy.
- Absolute seconds depend on your machine; the model and test counts do not.

## Troubleshooting

- **`zhao not found` / `too old`** — install zhao ≥ 0.5.2 (above), or set `ZHAO_BIN`.
- **`no baseline database`** — run `make baseline` first (for the engine you selected).
- **`Catalog Error … database "…" does not exist` after copying a `.duckdb` file** — dbt-duckdb records the
  database file's *name* inside view definitions, so a copy must keep the name `bench.duckdb` and live in a
  different folder. The scripts already do this.
- **`manifest.json looks stale`** — run `dbt compile` again before `zhao diff`.
- **Out of memory** — lower dbt's threads: `.venv/bin/python scripts/bench.py compare --threads 2`.
- **Start over** — `make clean` removes `data/`, `target/` and `results/` (the baseline databases are large).

## License

Apache License 2.0 — see [LICENSE](LICENSE).
