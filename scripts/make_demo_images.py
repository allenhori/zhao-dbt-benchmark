#!/usr/bin/env python3
"""Render the README / social images into docs/images/.

  * terminal screenshots, drawn from the REAL output recorded by scripts/capture_demo.sh
    (docs/captures/*.txt). Long output is shortened with an explicit "lines omitted" marker; no
    line is edited.
  * comparison.png, the side-by-side summary, drawn from docs/results.json.

Run:  uv run --no-project --with pillow python scripts/make_demo_images.py
"""
import json
import re
import sys
import textwrap
from pathlib import Path

from PIL import Image, ImageDraw, ImageFont

ROOT = Path(__file__).resolve().parent.parent
CAP = ROOT / "docs" / "captures"
OUT = ROOT / "docs" / "images"
MONO = "/System/Library/Fonts/Menlo.ttc"
SANS = "/System/Library/Fonts/Helvetica.ttc"


# ------------------------------------------------------------------ terminal screenshots
PALETTE = {  # standard + bright ANSI colours, tuned for a dark background
    30: "#4d4d4d", 31: "#ff6b6b", 32: "#7ee787", 33: "#f2cc60", 34: "#79c0ff", 35: "#d2a8ff", 36: "#56d4dd", 37: "#d0d7de",
    90: "#6e7681", 91: "#ff8e8e", 92: "#9be9a8", 93: "#f7dc82", 94: "#a5d6ff", 95: "#e2c5ff", 96: "#8be9f0", 97: "#ffffff",
}
FG = "#d0d7de"
BG = "#0d1117"
ANSI = re.compile(r"\x1b\[([0-9;?]*)([A-Za-z])")


def parse_ansi(line):
    """-> list of (text, colour, bold). Handles SGR colours; drops every other escape sequence."""
    segs, pos, color, bold = [], 0, FG, False
    for m in ANSI.finditer(line):
        if m.start() > pos:
            segs.append((line[pos:m.start()], color, bold))
        pos = m.end()
        if m.group(2) != "m":
            continue
        codes = [int(c) for c in m.group(1).split(";") if c.isdigit()] or [0]
        i = 0
        while i < len(codes):
            c = codes[i]
            if c == 0:
                color, bold = FG, False
            elif c == 1:
                bold = True
            elif c == 22:
                bold = False
            elif c == 39:
                color = FG
            elif c in PALETTE:
                color = PALETTE[c]
            elif c == 38 and i + 2 < len(codes) and codes[i + 1] == 5:
                n = codes[i + 2]
                color = PALETTE.get(30 + n if n < 8 else 90 + n - 8, FG)
                i += 2
            elif c == 38 and i + 4 < len(codes) and codes[i + 1] == 2:
                color = "#%02x%02x%02x" % tuple(codes[i + 2:i + 5])
                i += 4
            i += 1
    if pos < len(line):
        segs.append((line[pos:], color, bold))
    return [s for s in segs if s[0]]


def clean(raw):
    raw = raw.replace("\r\n", "\n").replace("\r", "\n")
    raw = raw.replace("^[[", "\x1b[")  # GitHub stores the escape character in caret notation
    raw = re.sub(r"\x1b\][^\x07]*\x07", "", raw)
    raw = raw.replace("\x04", "").replace("\x08", "").replace("^D", "")
    return raw.split("\n")


def plain(line):
    return ANSI.sub("", line)


def wrap_segs(segs, cols, indent="    "):
    """Hard-wrap a list of coloured segments to `cols` characters."""
    out, cur, n = [], [], 0
    for text, color, bold in segs:
        while text:
            room = cols - n - (0 if out == [] else 0)
            if len(text) <= room:
                cur.append((text, color, bold))
                n += len(text)
                break
            cut = text.rfind(" ", 0, room + 1)
            cut = cut if cut > 0 else room
            cur.append((text[:cut], color, bold))
            out.append(cur)
            text = indent + text[cut:].lstrip()
            cur, n = [], 0
    if cur or not out:
        out.append(cur)
    return out


def render_terminal(name, title, command, lines, cols=112, size=19, note=None):
    font = ImageFont.truetype(MONO, size)
    bold = ImageFont.truetype(MONO, size, index=1)
    cw = font.getlength("M")
    lh = int(size * 1.5)
    rows = []
    prompt = [("$ ", "#7ee787", True), (command, "#ffffff", False)]
    rows += wrap_segs(prompt, cols - 4, indent="    ")
    for item in lines:
        if isinstance(item, str):
            rows += wrap_segs(parse_ansi(item), cols - 4) if item else [[]]
        else:  # already segmented
            rows.append(item)
    pad, bar = 26, 46
    w = int(cw * cols) + pad * 2
    h = bar + pad + lh * len(rows) + pad + (34 if note else 0)
    scale = 2
    img = Image.new("RGB", (w * scale, h * scale), "#000000")
    d = ImageDraw.Draw(img)
    d.rounded_rectangle((0, 0, w * scale, h * scale), radius=18 * scale, fill=BG)
    d.rounded_rectangle((0, 0, w * scale, bar * scale), radius=18 * scale, fill="#161b22")
    d.rectangle((0, (bar - 18) * scale, w * scale, bar * scale), fill="#161b22")
    for i, c in enumerate(("#ff5f56", "#ffbd2e", "#27c93f")):
        cx = (24 + i * 24) * scale
        d.ellipse((cx - 7 * scale, (bar // 2 - 7) * scale, cx + 7 * scale, (bar // 2 + 7) * scale), fill=c)
    tf = ImageFont.truetype(SANS, 15 * scale)
    d.text((w * scale // 2, bar * scale // 2), title, font=tf, fill="#8b949e", anchor="mm")
    f2 = ImageFont.truetype(MONO, size * scale)
    b2 = ImageFont.truetype(MONO, size * scale, index=1)
    y = bar + pad
    for row in rows:
        x = pad * scale
        for text, color, is_bold in row:
            fnt = b2 if is_bold else f2
            d.text((x, y * scale), text, font=fnt, fill=color)
            x += fnt.getlength(text)
        y += lh
    if note:
        nf = ImageFont.truetype(SANS, 14 * scale)
        d.text((pad * scale, (h - 26) * scale), note, font=nf, fill="#6e7681")
    OUT.mkdir(parents=True, exist_ok=True)
    path = OUT / f"{name}.png"
    img = img.resize((w * scale // 1, h * scale // 1), Image.LANCZOS)
    img.save(path, optimize=True)
    print("wrote", path.relative_to(ROOT), f"{w}x{h}")


def read(name):
    p = CAP / name
    if not p.exists():
        sys.exit(f"missing {p}; run scripts/capture_demo.sh first")
    return clean(p.read_text(errors="replace"))


def omitted(n):
    return [(f"…  {n:,} lines omitted", "#6e7681", False)]


def tail_lines(lines, n, head=4):
    body = [l for l in lines if plain(l).strip() != ""]
    if len(body) <= n + head:
        return body
    return body[:head] + [omitted(len(body) - n - head)] + body[-n:]


def zhao_diff_image(engine):
    lines = [l for l in read(f"{engine}-zhao-diff.txt")]
    body = [l for l in lines if plain(l).strip() != "" or True]
    text = "\n".join(body)
    # keep: the whole "Changed" block, the first few "Downstream impact" lines, then Summary + Impacted models
    L = [l for l in lines]
    idx_down = next(i for i, l in enumerate(L) if "Downstream impact" in plain(l))
    idx_sum = next(i for i, l in enumerate(L) if plain(l).startswith("Summary"))
    idx_imp = next(i for i, l in enumerate(L) if plain(l).startswith("Impacted models"))
    idx_defer = next((i for i, l in enumerate(L) if plain(l).startswith("Defer plan")), len(L))
    head = L[:idx_down + 1 + 4]
    hidden = idx_sum - (idx_down + 1 + 4)
    imp = wrap_segs(parse_ansi(L[idx_imp]), 108)
    imp = imp[:4] + ([[("    …", "#6e7681", False)]] if len(imp) > 4 else [])
    lines_out = [l for l in head] + [omitted(hidden)] + [""] + [L[idx_sum], ""] + [*imp]
    render_terminal(f"{engine}-zhao-diff", "zhao diff — what does this change actually reach?",
                    "zhao diff --state state/%s/manifest.json" % engine, lines_out)


def build_image(engine, kind, tail):
    name = f"{engine}-{kind}-build"
    lines = read(f"{engine}-{kind}-build.txt")
    if kind == "state-modified":
        cmd = f"dbt build --select state:modified+ --state state/{engine}"
        title = "dbt state:modified+ — selects the whole downstream cone"
    else:
        cmd = f"dbt build --select $(zhao diff --state state/{engine}/manifest.json --format json | jq -r '.impacted_models | join(\" \")')"
        title = "zhao diff, then dbt build — only the models that read the changed column"
    render_terminal(name, title, cmd, tail_lines(lines, tail))


# ------------------------------------------------------------------ comparison card
def comparison(results="results.json", out="comparison.png"):
    r = json.loads((ROOT / "docs" / results).read_text())
    W, H, S = 1600, 1000, 2
    img = Image.new("RGB", (W * S, H * S), "#ffffff")
    d = ImageDraw.Draw(img)

    def font(size, weight=0):
        return ImageFont.truetype(SANS, size * S, index=weight)

    def text(xy, s, size, fill="#111827", weight=0, anchor="la"):
        d.text((xy[0] * S, xy[1] * S), s, font=font(size, weight), fill=fill, anchor=anchor)

    ACC, ACC_BG, GREY, GREY_BG, INK = "#0a8f5b", "#e7f7ef", "#6b7280", "#f3f4f6", "#111827"
    text((80, 60), "One column changed. How much gets rebuilt?", 46, INK, 1)
    text((80, 122), f"{r['total_models']:,}-model dbt project · DuckDB · 50M-row facts · a one-line logic change to int_ev_0000.v7",
         22, GREY)

    # bars: models and tests
    def bars(x, y, label, a, b, unit):
        text((x, y), label, 24, INK, 1)
        full = 640
        d.rounded_rectangle((x * S, (y + 44) * S, (x + full) * S, (y + 84) * S), 8 * S, fill=GREY)
        text((x + 14, y + 52), f"state:modified+  {a:,}", 21, "#ffffff", 1)
        wb = max(int(full * b / a), 150)
        d.rounded_rectangle((x * S, (y + 96) * S, (x + wb) * S, (y + 136) * S), 8 * S, fill=ACC)
        text((x + 14, y + 104), f"zhao diff  {b:,}", 21, "#ffffff", 1)
        text((x + full, y + 142), f"{a / b:.1f}× fewer {unit}", 22, ACC, 1, "ra")

    bars(80, 190, "Models rebuilt", r["models"]["state_modified"], r["models"]["zhao"], "models")
    bars(860, 190, "Tests run", r["tests"]["state_modified"], r["tests"]["zhao"], "tests")

    # table
    x0, y0 = 80, 420
    cols = [("", 470), ("state:modified+", 300), ("zhao diff, then dbt build", 340), ("Gap", 190)]
    xs = [x0]
    for _, wdt in cols:
        xs.append(xs[-1] + wdt)
    rh = 78
    d.rounded_rectangle((xs[2] * S, (y0 - 8) * S, xs[3] * S, (y0 + rh * 5 + 8) * S), 16 * S, fill=ACC_BG, outline=ACC, width=3 * S)
    for i, (name, _) in enumerate(cols):
        anchor = "la" if i == 0 else "ma"
        cx = xs[i] + 22 if i == 0 else (xs[i] + xs[i + 1]) // 2
        text((cx, y0 + 18), name, 23, ACC if i >= 2 else GREY, 1, anchor)
    rows = []
    for eng, label in (("v1", "dbt 1.x"), ("v2", f"Fusion {r['fusion_version']}")):
        e = r[eng]
        rows.append((f"{label}, wall-clock", e["wall"]["state_modified"], e["wall"]["zhao"]))
        rows.append((f"{label}, build work only", e["work"]["state_modified"], e["work"]["zhao"]))
    for i, (lab, a, b) in enumerate(rows):
        y = y0 + rh * (i + 1)
        d.line((x0 * S, y * S, xs[4] * S, y * S), fill="#e5e7eb", width=2 * S)
        text((xs[0] + 22, y + 22), lab, 25, INK, 1)
        text(((xs[1] + xs[2]) // 2, y + 20), f"{a:.1f} s", 30, GREY, 0, "ma")
        text(((xs[2] + xs[3]) // 2, y + 16), f"{b:.1f} s", 36, ACC, 1, "ma")
        text(((xs[3] + xs[4]) // 2, y + 16), f"{a / b:.1f}×", 36, ACC, 1, "ma")

    text((80, 880), "Same change, same baseline, both engines. After every run dbt's run_results.json is checked: it built exactly the models selected.",
         21, GREY)
    text((80, 918), "\"Build work only\" removes dbt's fixed cost of parsing the whole project. Timings: " + r["machine"] + ".",
         21, GREY)
    text((80, 956), "github.com/allenhori/zhao-dbt-benchmark", 24, ACC, 1)
    OUT.mkdir(parents=True, exist_ok=True)
    img = img.resize((W, H), Image.LANCZOS)
    img.save(OUT / out, optimize=True)
    print("wrote docs/images/" + out)


if __name__ == "__main__":
    what = sys.argv[1:] or ["comparison", "terminals"]
    if "comparison" in what:
        comparison("results.json", "comparison.png")
        comparison("results-ci.json", "comparison-ci.png")
    if "terminals" in what:
        for eng in ("v1", "v2"):
            if (CAP / f"{eng}-zhao-diff.txt").exists():
                if eng == "v1":
                    zhao_diff_image(eng)
                build_image(eng, "state-modified", 9 if eng == "v1" else 12)
                build_image(eng, "zhao", 9 if eng == "v1" else 12)
