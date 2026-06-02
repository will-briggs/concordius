#!/usr/bin/env bash
# Run this from anywhere — it writes to quartz/static/images/.
# URLs verified via Wikimedia Commons MD5 path formula.
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Downloading Section I: Masaccio - The Trinity..."
curl -L -o "$DIR/masaccio-trinity.jpg" \
  "https://upload.wikimedia.org/wikipedia/commons/1/16/Masaccio,_Holy_Trinity,_1425-28,_Santa_Maria_Novella,_Florence.jpg" \
  --user-agent "Mozilla/5.0 (compatible; Concordius/1.0)"

echo "Downloading Section II: Ladder of Divine Ascent..."
curl -L -o "$DIR/ladder-of-divine-ascent.jpg" \
  "https://upload.wikimedia.org/wikipedia/commons/5/5c/The_Ladder_of_Divine_Ascent_Monastery_of_St_Catherine_Sinai_12th_century.jpg" \
  --user-agent "Mozilla/5.0 (compatible; Concordius/1.0)"

echo "Downloading Section III: Bonaiuto - Triumph of St. Thomas Aquinas..."
curl -L -o "$DIR/bonaiuto-triumph-aquinas.jpg" \
  "https://upload.wikimedia.org/wikipedia/commons/e/e0/Cappellone_degli_Spagnoli_Santa_Maria_Novella_Florenz-1.jpg" \
  --user-agent "Mozilla/5.0 (compatible; Concordius/1.0)"

echo "Downloading Section IV: Blake - Albion Rose (Glad Day)..."
curl -L -o "$DIR/blake-glad-day.jpg" \
  "https://upload.wikimedia.org/wikipedia/commons/4/47/William_Blake_-_Albion_Rose_-_from_A_Large_Book_of_Designs_1793-6.jpg" \
  --user-agent "Mozilla/5.0 (compatible; Concordius/1.0)"

echo ""
echo "Verifying downloads..."
for f in masaccio-trinity.jpg ladder-of-divine-ascent.jpg bonaiuto-triumph-aquinas.jpg blake-glad-day.jpg; do
  type=$(file "$DIR/$f" | grep -o "JPEG\|PNG\|ASCII")
  echo "  $f: $type"
done
