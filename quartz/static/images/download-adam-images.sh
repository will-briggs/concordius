#!/usr/bin/env bash
# Frontispieces for the Adam interludes (Book 2, Section A → Interludes).
# Sources public-domain artwork from Wikimedia Commons via Special:FilePath
# (curl -L follows the redirect to the current file). Writes to this folder.
# Filenames below are best-guess Commons page titles; any that 404 are listed
# at the end for manual download.
set -u
DIR="$(cd "$(dirname "$0")" && pwd)"
UA="Mozilla/5.0 (compatible; Concordius/1.0)"
FAILED=()

valid_image() { python3 - "$1" <<'PY' 2>/dev/null
import sys
m=open(sys.argv[1],'rb').read(12)
ok=(m[:3]==b'\xff\xd8\xff' or m[:4]==b'\x89PNG' or m[:6] in (b'GIF87a',b'GIF89a') or m[:4]==b'RIFF')
sys.exit(0 if ok else 1)
PY
}

dl() { # dl <local-filename> <Commons File page title> <label>
  local out="$DIR/$1" page="$2" label="$3"
  if [ -f "$out" ] && valid_image "$out"; then echo "skip  $1 (already valid)"; return 0; fi
  local enc; enc=$(python3 -c "import urllib.parse,sys;print(urllib.parse.quote(sys.argv[1]))" "$page")
  echo "get   $1  <-  $page"
  curl -fsSL --user-agent "$UA" -o "$out" "https://commons.wikimedia.org/wiki/Special:FilePath/$enc" || true
  sleep 1
  if [ -f "$out" ] && valid_image "$out"; then
    local kb; kb=$(du -k "$out" 2>/dev/null | cut -f1)
    if [ -n "$kb" ] && [ "$kb" -gt 2048 ]; then sips --resampleWidth 1400 "$out" --out "$out" >/dev/null 2>&1 || true; fi
    echo "  ok"
  else
    echo "  FAILED"
    rm -f "$out"
    FAILED+=("$1  <-  $page")
  fi
}

dl vermeer-letter.jpg          "Jan Vermeer van Delft 002.jpg"                                              "A0 — Vermeer, Girl Reading a Letter"
dl repin-unexpected-visitor.jpg "Ilya Repin Unexpected visitors.jpg"                                        "A1 — Repin, They Did Not Expect Him"
dl hoogstraten-letter-rack.jpg "Samuel van Hoogstraten - Trompe l'oeil.jpg"                                 "A2 — van Hoogstraten, Letter Rack"
dl bruegel-blind.jpg           "Pieter Bruegel the Elder - The Parable of the Blind Leading the Blind.jpg"  "A2A — Bruegel, The Blind Leading the Blind"
dl bronzino-allegory.jpg       "Angelo Bronzino - Venus, Cupid, Folly and Time - National Gallery, London.jpg" "A2B — Bronzino, Venus, Cupid, Folly and Time"
dl duchamp-nude-descending.jpg "Duchamp - Nude Descending a Staircase.jpg"                                  "A2C — Duchamp, Nude Descending a Staircase"
dl champaigne-vanitas.jpg      "StillLifeWithASkull.jpg"                                                    "A2D — de Champaigne, Vanitas"
dl van-gogh-shoes.jpg          "Vincent van Gogh - Shoes - Google Art Project.jpg"                          "A3 — Van Gogh, Shoes"
dl durer-jerome-study.jpg      "Albrecht Dürer - St. Jerome in His Study (1514).jpg"                         "A4 — Dürer, St. Jerome in His Study"
dl wright-alchemist.jpg        "JosephWright-Alchemist.jpg"                                                 "A5 — Wright of Derby, The Alchemist"
dl hammershoi-open-doors.jpg   "Vilhelm Hammershøi - Interior, Strandgade 30 - Google Art Project.jpg"      "A6 — Hammershøi, Interior, Strandgade 30"
dl friedrich-sea-of-ice.jpg    "Caspar David Friedrich - Das Eismeer - Hamburger Kunsthalle - 02.jpg"       "A6½ — Friedrich, The Sea of Ice"

echo
if [ ${#FAILED[@]} -eq 0 ]; then
  echo "All Adam frontispieces downloaded."
else
  echo "The following need manual download (search the title on Wikimedia Commons,"
  echo "save into $DIR with the local filename shown):"
  for x in "${FAILED[@]}"; do echo "  - $x"; done
fi
