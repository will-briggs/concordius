#!/usr/bin/env bash
# Run this from the quartz/static/images/ directory to download
# the four Section header images from Wikimedia Commons.
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Downloading Section I: Masaccio - The Trinity..."
curl -L -o "$DIR/masaccio-trinity.jpg" \
  "https://upload.wikimedia.org/wikipedia/commons/2/21/Masaccio_trinit%C3%A0.jpg" \
  --user-agent "Mozilla/5.0 (compatible; Concordius/1.0)"

echo "Downloading Section II: Ladder of Divine Ascent..."
curl -L -o "$DIR/ladder-of-divine-ascent.jpg" \
  "https://upload.wikimedia.org/wikipedia/commons/5/5d/The_Ladder_of_Divine_Ascent_Monastery_of_St_Catherine_Sinai_12th_century.jpg" \
  --user-agent "Mozilla/5.0 (compatible; Concordius/1.0)"

echo "Downloading Section III: Bonaiuto - Triumph of St. Thomas Aquinas..."
curl -L -o "$DIR/bonaiuto-triumph-aquinas.jpg" \
  "https://upload.wikimedia.org/wikipedia/commons/1/16/Andrea_di_Bonaiuto_-_Trionfo_di_San_Tommaso_-_Google_Art_Project.jpg" \
  --user-agent "Mozilla/5.0 (compatible; Concordius/1.0)"

echo "Downloading Section IV: Blake - Glad Day..."
curl -L -o "$DIR/blake-glad-day.jpg" \
  "https://upload.wikimedia.org/wikipedia/commons/f/f2/William_Blake_-_Glad_Day%2C_or_%27The_Dance_of_Albion%27.jpg" \
  --user-agent "Mozilla/5.0 (compatible; Concordius/1.0)"

echo "Done. All four images downloaded."
