#!/usr/bin/env bash
# Run this from anywhere — it writes to quartz/static/images/.
# URLs verified via Wikimedia Commons MD5 path formula.
# After each download, check_image() verifies the file is a real image,
# not an accidentally-saved HTML redirect page.
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
UA="Mozilla/5.0 (compatible; Concordius/1.0)"
ERRORS=0

dl() {
  # Usage: dl <output-filename> <url> <label>
  local out="$DIR/$1" url="$2" label="$3"
  echo "Downloading $label..."
  curl -L --fail -o "$out" "$url" --user-agent "$UA"
}

check_image() {
  # Verifies the file is a real image, not an HTML redirect page saved as jpg/png.
  local path="$DIR/$1"
  if [ ! -s "$path" ]; then
    echo "  FAIL: $1 — file is empty or missing"
    ERRORS=$((ERRORS + 1))
    return 1
  fi
  local sig
  sig=$(file "$path")
  if echo "$sig" | grep -qiE "JPEG image|PNG image|GIF image|WebP image|bitmap"; then
    local size
    size=$(wc -c < "$path" | tr -d ' ')
    echo "  OK:   $1  ($(echo "$sig" | grep -oiE "JPEG|PNG|GIF|WebP"), ${size} bytes)"
  else
    local snippet
    snippet=$(head -c 120 "$path" | tr -d '\000' | cut -c1-80)
    echo "  FAIL: $1 — not a valid image. Content starts with: $snippet"
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
  "https://upload.wikimedia.org/wikipedia/commons/f/fc/Pieter_Bruegel_the_Elder_-_The_Tower_of_Babel_%28Vienna%29_-_Google_Art_Project_-_edited.jpg" \
  "Language: Bruegel - Tower of Babel (1563)"

# ─── Verification ────────────────────────────────────────────────────────────

echo ""
echo "Verifying all downloads..."
for f in \
  masaccio-trinity.jpg ladder-of-divine-ascent.jpg \
  bonaiuto-triumph-aquinas.jpg blake-glad-day.jpg \
  kells-chi-rho.png raphael-parnassus.jpg friedrich-wanderer.jpg \
  durer-self-portrait.jpg bayeux-comet.jpg david-death-of-socrates.jpg \
  van-eyck-mystic-lamb.jpg durer-melancholia.jpg \
  durer-praying-hands.jpg bruegel-tower-of-babel.jpg; do
  check_image "$f"
done

echo ""
if [ "$ERRORS" -gt 0 ]; then
  echo "DONE WITH ERRORS: $ERRORS file(s) failed validation. Check output above."
  exit 1
else
  echo "All downloads verified successfully."
fi
