#!/usr/bin/env python3
"""Apply (or --revert) the benchmark's column change, as recorded in change/change.json."""
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
change = json.loads((ROOT / "change" / "change.json").read_text())
revert = "--revert" in sys.argv
for e in change["edits"]:
    old, new = (e["new_line"], e["old_line"]) if revert else (e["old_line"], e["new_line"])
    p = ROOT / e["file"]
    text = p.read_text()
    assert old in text, f"{e['file']}: expected line not found"
    p.write_text(text.replace(old, new, 1))
print(("reverted" if revert else "applied") + f": {change['description']} ({len(change['edits'])} lines in {change['files_changed']} files)")
