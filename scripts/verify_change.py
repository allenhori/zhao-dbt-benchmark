#!/usr/bin/env python3
"""Fail unless the working tree differs from <base> by exactly the benchmark change in change/change.json.

Usage: verify_change.py <base-ref>     (e.g. origin/master)
"""
import json
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
base = sys.argv[1] if len(sys.argv) > 1 else "origin/master"
change = json.loads((ROOT / "change" / "change.json").read_text())

changed = subprocess.run(["git", "diff", "--name-only", f"{base}...HEAD"], cwd=ROOT, capture_output=True,
                         text=True, check=True).stdout.split()
expected = sorted({e["file"] for e in change["edits"]})
problems = []
if sorted(changed) != expected:
    problems.append(f"changed files {sorted(changed)} != expected {expected}")
for e in change["edits"]:
    text = (ROOT / e["file"]).read_text()
    if e["new_line"] not in text or e["old_line"] in text:
        problems.append(f"{e['file']}: the benchmark edit is not (only) applied")
if problems:
    sys.exit("PR does not carry exactly the benchmark change:\n  " + "\n  ".join(problems))
print("OK: the PR carries exactly the benchmark change:", change["description"])
