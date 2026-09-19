# state:modified+ vs `zhao diff` on a ~1,000-model dbt project (DuckDB).
# See README.md. Typical run:  make use-v1 && make baseline && make compare

.PHONY: use-v1 use-v2 baseline state compare clean

use-v1:      ## select dbt 1.x (dbt-core + dbt-duckdb, installed by uv)
	uv sync
	@echo v1 > .engine
	@echo "engine: dbt 1.x  (dbt-core $$(.venv/bin/dbt --version | sed -n 's/.*installed: *//p' | head -1))"

use-v2:      ## select dbt 2.x (dbt Fusion, downloaded into .tools/fusion)
	uv sync
	.venv/bin/python scripts/bench.py install-fusion
	@echo v2 > .engine
	@echo "engine: dbt Fusion 2.x  ($$(.tools/fusion/dbt --version | head -1))"

baseline:    ## generate the raw data and build the whole (unchanged) project once
	.venv/bin/python scripts/bench.py baseline

state:       ## (maintainers) refresh state/<engine>/manifest.json from the unchanged project
	.venv/bin/python scripts/bench.py state

compare:     ## apply the change, run both strategies, print the side-by-side result
	.venv/bin/python scripts/bench.py compare

clean:
	rm -rf data target logs results
