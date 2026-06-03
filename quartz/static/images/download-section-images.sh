#!/usr/bin/env bash
# Run this from anywhere — it writes to quartz/static/images/.
# URLs verified via Wikimedia Commons MD5 path formula.
# After each download, check_image() verifies the file is a real image,
# not an accidentally-saved HTML redirect page.
DIR="$(cd "$(dirname "$0")" && pwd)"
UA="Mozilla/5.0 (compatible; Concordius/1.0)"
ERRORS=0
# Parallel arrays: failed filenames and their source URLs for manual download
FAILED_FILES=()
FAILED_URLS=()

MAX_KB=1536  # warn and resize if image exceeds 1.5 MB

dl() {
  # Usage: dl <output-filename> <url> <label>
  # Skips download if the file already exists and is a valid image.
  # After download, auto-resizes to max 1400px wide if file exceeds MAX_KB.
  local out="$DIR/$1" url="$2" label="$3"
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
  curl -L -o "$out" "$url" --user-agent "$UA"
  sleep 2
  # Resize if too large
  local kb
  kb=$(du -k "$out" 2>/dev/null | cut -f1)
  if [ -n "$kb" ] && [ "$kb" -gt "$MAX_KB" ]; then
    echo "  Resizing $1 (${kb}KB > ${MAX_KB}KB limit)..."
    python3 - "$out" <<'PYEOF'
import sys
from PIL import Image
Image.MAX_IMAGE_PIXELS = None
path = sys.argv[1]
img = Image.open(path)
img.thumbnail((1400, 1400), Image.LANCZOS)
fmt = img.format or "JPEG"
img.save(path, fmt, quality=82, optimize=True)
import os
print(f"  → {os.path.getsize(path) // 1024}KB")
PYEOF
  fi
}

check_image() {
  local filename="$1"
  local path="$DIR/$filename"
  local url_var="URL_FOR_$(echo "$filename" | tr '.-' '__')"
  local url="${!url_var}"
  if [ ! -s "$path" ]; then
    echo "  FAIL: $filename — file is empty or missing"
    FAILED_FILES+=("$filename")
    FAILED_URLS+=("$url")
    ERRORS=$((ERRORS + 1))
    return 1
  fi
  # Validate using magic bytes — catches HTML, JSON errors, and any non-image content
  local is_image
  is_image=$(python3 -c "
import sys
try:
    with open(sys.argv[1], 'rb') as f:
        magic = f.read(12)
    if (magic[:3] == b'\xff\xd8\xff' or        # JPEG
        magic[:4] == b'\x89PNG' or              # PNG
        magic[:6] in (b'GIF87a', b'GIF89a') or  # GIF
        magic[:4] == b'RIFF'):                  # WebP
        print('ok')
    else:
        print('fail:' + repr(magic[:40]))
except Exception as e:
    print('fail:' + str(e))
" "$path" 2>/dev/null)
  if [ "$is_image" = "ok" ]; then
    local size
    size=$(wc -c < "$path" | tr -d ' ')
    echo "  OK:   $filename  (${size} bytes)"
  else
    local snippet
    snippet=$(head -c 120 "$path" | tr -d '\000' | cut -c1-80)
    echo "  FAIL: $filename — not a valid image ($is_image): $snippet"
    FAILED_FILES+=("$filename")
    FAILED_URLS+=("$url")
    ERRORS=$((ERRORS + 1))
    return 1
  fi
}

# ─── Book 1 — Concordius Papers section frontispieces ───────────────────────

dl masaccio-trinity.jpg \
  "https://upload.wikimedia.org/wikipedia/commons/1/16/Masaccio,_Holy_Trinity,_1425-28,_Santa_Maria_Novella,_Florence.jpg" \
  "Book 1 Section I: Masaccio - The Trinity"

dl ladder-of-divine-ascent.jpg \
  "https://upload.wikimedia.org/wikipedia/commons/5/5c/The_Ladder_of_Divine_Ascent_Monastery_of_St_Catherine_Sinai_12th_century.jpg" \
  "Book 1 Section II: Ladder of Divine Ascent"

dl bonaiuto-triumph-aquinas.jpg \
  "https://upload.wikimedia.org/wikipedia/commons/e/e0/Cappellone_degli_Spagnoli_Santa_Maria_Novella_Florenz-1.jpg" \
  "Book 1 Section III: Bonaiuto - Triumph of Aquinas"

dl blake-glad-day.jpg \
  "https://upload.wikimedia.org/wikipedia/commons/4/47/William_Blake_-_Albion_Rose_-_from_A_Large_Book_of_Designs_1793-6.jpg" \
  "Book 1 Section IV: Blake - Albion Rose"

# ─── Book 3 — Structural Readings section frontispieces ─────────────────────

dl flammarion-engraving.jpg \
  "https://upload.wikimedia.org/wikipedia/commons/8/87/Flammarion.jpg" \
  "Book 1 index: Flammarion engraving (1888)"

dl melies-trip-to-moon.jpg \
  "https://upload.wikimedia.org/wikipedia/commons/0/04/Le_Voyage_dans_la_lune.jpg" \
  "Movies: Méliès - A Trip to the Moon (1902)"

dl kells-chi-rho.png \
  "https://upload.wikimedia.org/wikipedia/commons/9/98/Book_of_Kells_ChiRho_Folio_34R.png" \
  "The Bible: Book of Kells Chi-Rho page (c. 800)"

dl raphael-parnassus.jpg \
  "https://upload.wikimedia.org/wikipedia/commons/d/dc/Raphael_-_The_Parnassus.jpg" \
  "Literature: Raphael - Parnassus (1511)"

dl friedrich-wanderer.jpg \
  "https://upload.wikimedia.org/wikipedia/commons/b/b9/Caspar_David_Friedrich_-_Wanderer_above_the_sea_of_fog.jpg" \
  "Mysticism: Friedrich - Wanderer above the Sea of Fog (1818)"

dl durer-self-portrait.jpg \
  "https://upload.wikimedia.org/wikipedia/commons/d/dc/Albrecht_D%C3%BCrer_-_1500_self-portrait_%28High_resolution_and_detail%29.jpg" \
  "Visual Art: Dürer - Self-Portrait (1500)"

dl bayeux-comet.jpg \
  "https://upload.wikimedia.org/wikipedia/commons/2/27/Bayeux_Tapestry_scene32_Halley_comet.jpg" \
  "Memes: Bayeux Tapestry - Halley's Comet scene (c. 1070s)"

dl david-death-of-socrates.jpg \
  "https://upload.wikimedia.org/wikipedia/commons/8/8c/David_-_The_Death_of_Socrates.jpg" \
  "Aphorisms: David - The Death of Socrates (1787)"

dl van-eyck-mystic-lamb.jpg \
  "https://upload.wikimedia.org/wikipedia/commons/1/18/Ghent_Altarpiece_D_-_Adoration_of_the_Lamb_2.jpg" \
  "Bible Thematic: Van Eyck - Adoration of the Mystic Lamb (1432)"

dl durer-melancholia.jpg \
  "https://upload.wikimedia.org/wikipedia/commons/e/e1/Albrecht_D%C3%BCrer_-_Melencolia_I_-_Google_Art_Project.jpg" \
  "Human Conditions: Dürer - Melencolia I (1514)"

dl durer-praying-hands.jpg \
  "https://upload.wikimedia.org/wikipedia/commons/6/63/Albrecht_D%C3%BCrer_-_Praying_Hands%2C_1508_-_Google_Art_Project.jpg" \
  "Health: Dürer - Praying Hands (1508)"

dl bruegel-tower-of-babel.jpg \
  "https://upload.wikimedia.org/wikipedia/commons/5/50/Pieter_Bruegel_the_Elder_-_The_Tower_of_Babel_(Vienna)_-_Google_Art_Project.jpg" \
  "Language: Bruegel - Tower of Babel (1563)"

# ─── Verification ────────────────────────────────────────────────────────────

echo ""
echo "Verifying all downloads..."
for f in \
  masaccio-trinity.jpg ladder-of-divine-ascent.jpg \
  bonaiuto-triumph-aquinas.jpg blake-glad-day.jpg \
  flammarion-engraving.jpg melies-trip-to-moon.jpg \
  kells-chi-rho.png raphael-parnassus.jpg friedrich-wanderer.jpg \
  durer-self-portrait.jpg bayeux-comet.jpg david-death-of-socrates.jpg \
  van-eyck-mystic-lamb.jpg durer-melancholia.jpg \
  durer-praying-hands.jpg bruegel-tower-of-babel.jpg; do
  check_image "$f"
done

echo ""
if [ "$ERRORS" -gt 0 ]; then
  echo "DONE WITH ERRORS: $ERRORS file(s) failed. Save each manually to quartz/static/images/:"
  echo ""
  for i in "${!FAILED_FILES[@]}"; do
    echo "  ${FAILED_FILES[$i]}"
    echo "  ${FAILED_URLS[$i]}"
    echo ""
  done
  exit 1
else
  echo "All downloads verified successfully."
fi
