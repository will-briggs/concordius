#!/usr/bin/env bash
# Frontispieces for the Adam interludes (Book 2, Section A → Interludes).
# Sources public-domain artwork from Wikimedia Commons via Special:FilePath
# (curl -fL follows the redirect to the current file; -f means an HTTP error
# is NOT written to disk). After each download, check_image() verifies the file
# is a real image, not an accidentally-saved HTML redirect/error page.
# Filenames below are best-guess Commons page titles; any that fail are listed
# at the end with their source URLs for manual download, and the script exits 1.
DIR="$(cd "$(dirname "$0")" && pwd)"
UA="Mozilla/5.0 (compatible; Concordius/1.0)"
ERRORS=0
FAILED_FILES=()
FAILED_URLS=()
MAX_KB=2048  # resize if image exceeds 2 MB

dl() {
  # Usage: dl <output-filename> <Commons File page title> <label>
  # Skips if the file already exists and is a valid image. Resizes if > MAX_KB.
  local out="$DIR/$1" page="$2" label="$3"
  local enc; enc=$(python3 -c "import urllib.parse,sys;print(urllib.parse.quote(sys.argv[1]))" "$page")
  local url="https://commons.wikimedia.org/wiki/Special:FilePath/$enc"
  eval "URL_FOR_$(echo "$1" | tr '.-' '__')=\"$url\""
  if [ -f "$out" ] && python3 -c "
import sys
with open(sys.argv[1],'rb') as f: m=f.read(12)
sys.exit(0 if (m[:3]==b'\xff\xd8\xff' or m[:4]==b'\x89PNG' or m[:6] in (b'GIF87a',b'GIF89a') or m[:4]==b'RIFF') else 1)
" "$out" 2>/dev/null; then
    echo "Skipping $label (already valid)"
    return 0
  fi
  echo "Downloading $label..."
  curl -fL -o "$out" "$url" --user-agent "$UA" || true
  sleep 2
  local kb
  kb=$(du -k "$out" 2>/dev/null | cut -f1)
  if [ -n "$kb" ] && [ "$kb" -gt "$MAX_KB" ]; then
    echo "  Resizing $1 (${kb}KB > ${MAX_KB}KB limit)..."
    sips --resampleWidth 1400 "$out" --out "$out" >/dev/null 2>&1
    local kb_after
    kb_after=$(du -k "$out" 2>/dev/null | cut -f1)
    echo "  → ${kb_after}KB"
    if [ -n "$kb_after" ] && [ "$kb_after" -gt "$MAX_KB" ]; then
      echo "  ERROR: $1 still ${kb_after}KB after resize — aborting"
      FAILED_FILES+=("$1"); FAILED_URLS+=("$url"); ERRORS=$((ERRORS + 1)); return 1
    fi
  fi
}

check_image() {
  local filename="$1" path="$DIR/$1"
  local url_var="URL_FOR_$(echo "$1" | tr '.-' '__')"; local url="${!url_var}"
  if [ ! -s "$path" ]; then
    echo "  FAIL: $filename — file is empty or missing"
    FAILED_FILES+=("$filename"); FAILED_URLS+=("$url"); ERRORS=$((ERRORS + 1)); return 1
  fi
  local is_image
  is_image=$(python3 -c "
import sys
try:
    with open(sys.argv[1],'rb') as f: magic=f.read(12)
    if (magic[:3]==b'\xff\xd8\xff' or magic[:4]==b'\x89PNG' or magic[:6] in (b'GIF87a',b'GIF89a') or magic[:4]==b'RIFF'):
        print('ok')
    else:
        print('fail:'+repr(magic[:40]))
except Exception as e:
    print('fail:'+str(e))
" "$path" 2>/dev/null)
  if [ "$is_image" = "ok" ]; then
    echo "  OK:   $filename  ($(wc -c < "$path" | tr -d ' ') bytes)"
  else
    local snippet; snippet=$(head -c 120 "$path" | tr -d '\000' | cut -c1-80)
    echo "  FAIL: $filename — not a valid image ($is_image): $snippet"
    FAILED_FILES+=("$filename"); FAILED_URLS+=("$url"); ERRORS=$((ERRORS + 1)); return 1
  fi
}

# ─── Adam interlude frontispieces (title-keyed; all public domain) ───────────
dl vermeer-letter.jpg           "Jan Vermeer van Delft 002.jpg"                                                 "A0 — Vermeer, Girl Reading a Letter at an Open Window (c.1657-59)"
dl repin-unexpected-visitor.jpg "Ilya Repin Unexpected visitors.jpg"                                            "A1 — Repin, They Did Not Expect Him (1884-88)"
dl hoogstraten-letter-rack.jpg  "Samuel van Hoogstraten - Trompe l'oeil.jpg"                                    "A2 — van Hoogstraten, Trompe-l'oeil Letter Rack (c.1664)"
dl bruegel-blind.jpg            "Pieter Bruegel the Elder - The Parable of the Blind Leading the Blind.jpg"      "A2A — Bruegel, The Blind Leading the Blind (1568)"
dl bronzino-allegory.jpg        "Angelo Bronzino - Venus, Cupid, Folly and Time - National Gallery, London.jpg" "A2B — Bronzino, Venus, Cupid, Folly and Time (c.1545)"
dl duchamp-nude-descending.jpg  "Duchamp - Nude Descending a Staircase.jpg"                                     "A2C — Duchamp, Nude Descending a Staircase No.2 (1912)"
dl champaigne-vanitas.jpg       "StillLifeWithASkull.jpg"                                                       "A2D — de Champaigne, Vanitas (c.1671)"
dl van-gogh-shoes.jpg           "Vincent van Gogh - Shoes - Google Art Project.jpg"                             "A3 — Van Gogh, Shoes (1886)"
dl durer-jerome-study.jpg       "Albrecht Dürer - St. Jerome in His Study (1514).jpg"                            "A4 — Dürer, St. Jerome in His Study (1514)"
dl wright-alchemist.jpg         "JosephWright-Alchemist.jpg"                                                    "A5 — Wright of Derby, The Alchemist (1771)"
dl hammershoi-open-doors.jpg    "Vilhelm Hammershøi - Interior, Strandgade 30 - Google Art Project.jpg"         "A6 — Hammershøi, Interior, Strandgade 30 (c.1901)"
dl friedrich-sea-of-ice.jpg     "Caspar David Friedrich - Das Eismeer - Hamburger Kunsthalle - 02.jpg"          "A6½ — Friedrich, The Sea of Ice (1823-24)"

# ─── Verification ────────────────────────────────────────────────────────────
echo ""
echo "Verifying all downloads..."
for f in \
  vermeer-letter.jpg repin-unexpected-visitor.jpg hoogstraten-letter-rack.jpg \
  bruegel-blind.jpg bronzino-allegory.jpg duchamp-nude-descending.jpg \
  champaigne-vanitas.jpg van-gogh-shoes.jpg durer-jerome-study.jpg \
  wright-alchemist.jpg hammershoi-open-doors.jpg friedrich-sea-of-ice.jpg; do
  check_image "$f"
done

echo ""
if [ "$ERRORS" -gt 0 ]; then
  echo "DONE WITH ERRORS: $ERRORS file(s) failed. Save each manually to quartz/static/images/"
  echo "(search the Commons title; the Special:FilePath URL is shown for reference):"
  echo ""
  for i in "${!FAILED_FILES[@]}"; do
    echo "  ${FAILED_FILES[$i]}"
    echo "  ${FAILED_URLS[$i]}"
    echo ""
  done
  exit 1
else
  echo "All Adam frontispieces verified successfully."
fi
