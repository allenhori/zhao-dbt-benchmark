#!/usr/bin/env python3
"""Create the deterministic synthetic `raw` schema in a DuckDB file.

Usage: generate_data.py <duckdb path> [--fact-rows N] [--customers N]
All values come from DuckDB's hash() of the row number, so the same arguments always
produce identical data. Nothing is downloaded and nothing large is committed to git.
"""
import argparse
import duckdb

N_EVENT_SRC = 8
N_CUST_SRC = 4
SEGMENTS = 500


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("db")
    ap.add_argument("--fact-rows", type=int, default=50_000_000, help="rows in each heavy event table")
    ap.add_argument("--customers", type=int, default=50_000)
    a = ap.parse_args()
    con = duckdb.connect(a.db)
    con.execute("create schema if not exists raw")
    for i in range(N_EVENT_SRC):
        # first three event tables are heavy, the rest a quarter of that size
        rows = a.fact_rows if i < 3 else max(a.fact_rows // 4, 1)
        metrics = ", ".join(
            f"cast(hash(i * {97 + j} + {i}) % 10000 as integer) as m{j}" for j in range(1, 13)
        )
        con.execute(f"""
            create or replace table raw.ev_{i:02d} as
            select
                i as event_id,
                cast(hash(i * 31 + {i}) % {a.customers} as integer) as customer_id,
                cast((hash(i * 31 + {i}) % {a.customers}) % {SEGMENTS} as integer) as segment_id,
                {metrics}
            from range({rows}) t(i)
        """)
        print(f"raw.ev_{i:02d}: {rows:,} rows")
    for i in range(N_CUST_SRC):
        attrs = ", ".join(f"cast(hash(c * {53 + j} + {i}) % 1000 as integer) as a{j}" for j in range(1, 7))
        con.execute(f"""
            create or replace table raw.cu_{i} as
            select
                cast(c as integer) as customer_id,
                cast(c % {SEGMENTS} as integer) as segment_id,
                {attrs}
            from range({a.customers}) t(c)
        """)
        print(f"raw.cu_{i}: {a.customers:,} rows")
    con.close()


if __name__ == "__main__":
    main()
