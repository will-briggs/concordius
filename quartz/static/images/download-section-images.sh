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

MAX_KB=2048  # warn and resize if image exceeds 2 MB

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
  # Resize if too large — uses sips (macOS built-in, no dependencies)
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
      FAILED_FILES+=("$1")
      FAILED_URLS+=("$url")
      ERRORS=$((ERRORS + 1))
      return 1
    fi
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

# ─── Book 1 — Concordius Papers individual paper images ────────────────────

dl antonello-jerome-study.jpg \
  "https://uploads4.wikiart.org/images/antonello-da-messina/st-jerome-in-his-study.jpg" \
  "Paper 2: Antonello da Messina - St. Jerome in His Study (c. 1474-75)"

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

dl apianus-spheres.png \
  "https://upload.wikimedia.org/wikipedia/commons/3/3a/Ptolemaicsystem-small.png" \
  "Structural Themes: Apianus nested spheres diagram (1539)"

dl flammarion-engraving.jpg \
  "https://upload.wikimedia.org/wikipedia/commons/8/87/Flammarion.jpg" \
  "Book 1 index: Flammarion engraving (1888)"

dl melies-trip-to-moon.jpg \
  "https://upload.wikimedia.org/wikipedia/commons/d/d5/Melies_color_Voyage_dans_la_lune.jpg" \
  "Movies: Méliès - A Trip to the Moon (1902)"

dl gray-anatomy-appendix.png \
  "https://upload.wikimedia.org/wikipedia/commons/a/ad/Gray536.png" \
  "Book 4 Appendix: Gray's Anatomy Fig. 536 — vermiform appendix (1858)"

dl fan-kuan-travelers.jpg \
  "https://upload.wikimedia.org/wikipedia/commons/c/c2/Fan_Kuan_-_Travelers_Among_Mountains_and_Streams_-_Google_Art_Project.jpg" \
  "Eastern Traditions: Fan Kuan - Travelers among Mountains and Streams (c. 1000 CE)"

dl kells-chi-rho.png \
  "https://upload.wikimedia.org/wikipedia/commons/9/98/Book_of_Kells_ChiRho_Folio_34R.png" \
  "The Bible: Book of Kells Chi-Rho page (c. 800)"

dl raphael-parnassus.jpg \
  "https://upload.wikimedia.org/wikipedia/commons/d/dc/Raphael_-_The_Parnassus.jpg" \
  "Literature: Raphael - Parnassus (1511)"

dl friedrich-wanderer.jpg \
  "https://upload.wikimedia.org/wikipedia/commons/b/b9/Caspar_David_Friedrich_-_Wanderer_above_the_sea_of_fog.jpg" \
  "Mysticism: Friedrich - Wanderer above the Sea of Fog (1818)"

dl friedrich-abbey-oakwood.jpg \
  "https://upload.wikimedia.org/wikipedia/commons/3/32/Caspar_David_Friedrich_-_Abtei_im_Eichwald_-_Google_Art_Project.jpg" \
  "Mysticism: Friedrich - The Abbey in the Oakwood (1809-10)"

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

# ─── Main landing page ──────────────────────────────────────────────────────

dl friedrich-monk-by-the-sea.jpg \
  "https://uploads4.wikiart.org/00126/images/caspar-david-friedrich/the-monk-by-the-sea-0a.jpg" \
  "Main index: Friedrich - Monk by the Sea (1808-10)"

# ─── Book 2 — Reasonablenessism frontispiece ────────────────────────────────

dl rembrandt-two-old-men-disputing.jpg \
  "https://uploads1.wikiart.org/images/rembrandt/two-old-men-disputing.jpg" \
  "Book 2: Rembrandt - Two Old Men Disputing (1628)"

# ─── Book 3 — Structural Readings frontispiece ──────────────────────────────

dl holbein-the-ambassadors.jpg \
  "https://upload.wikimedia.org/wikipedia/commons/8/88/Hans_Holbein_the_Younger_-_The_Ambassadors_-_Google_Art_Project.jpg" \
  "Book 3: Holbein - The Ambassadors (1533)"

# ─── Book 2 — Reasonablenessism feature images ──────────────────────────────

dl feature-01-vermeer-balance.jpg \
  "https://commons.wikimedia.org/wiki/Special:FilePath/Johannes%20Vermeer%20-%20Woman%20Holding%20a%20Balance%20-%20Google%20Art%20Project.jpg" \
  "Feature 1: Vermeer - Woman Holding a Balance (c.1664)"

dl feature-02-forge-of-vulcan.jpg \
  "https://commons.wikimedia.org/wiki/Special:FilePath/Diego%20Vel%C3%A1zquez%20-%20The%20Forge%20of%20Vulcan%20-%20WGA24376.jpg" \
  "Feature 2: Velázquez - The Forge of Vulcan (1630)"

dl feature-03-incredulity-of-thomas.jpg \
  "https://commons.wikimedia.org/wiki/Special:FilePath/The%20Incredulity%20of%20Saint%20Thomas-Caravaggio%20%281601-2%29.jpg" \
  "Feature 3: Caravaggio - Incredulity of St Thomas (c.1602)"

dl feature-04-las-meninas.jpg \
  "https://commons.wikimedia.org/wiki/Special:FilePath/Las%20Meninas%2001.jpg" \
  "Feature 4: Velázquez - Las Meninas (1656)"

dl feature-05-moneylender.jpg \
  "https://commons.wikimedia.org/wiki/Special:FilePath/Massysm%20Quentin%20%E2%80%94%20The%20Moneylender%20and%20his%20Wife%20%E2%80%94%201514.jpg" \
  "Feature 5: Matsys - The Moneylender and his Wife (1514)"

dl feature-06-pentecost.jpg \
  "https://commons.wikimedia.org/wiki/Special:FilePath/El%20Greco%20-%20The%20Pentecost%20-%20WGA10533.jpg" \
  "Feature 6: El Greco - Pentecost (c.1600)"

dl feature-07-ouroboros.png \
  "https://commons.wikimedia.org/wiki/Special:FilePath/Ouroboros.png" \
  "Feature 7: Ouroboros (Pelecanos, 1478)"

dl feature-08-air-pump.jpg \
  "https://commons.wikimedia.org/wiki/Special:FilePath/An%20Experiment%20on%20a%20Bird%20in%20an%20Air%20Pump%20by%20Joseph%20Wright%20of%20Derby%2C%201768.jpg" \
  "Feature 8: Wright of Derby - Air Pump (1768)"

dl feature-09-great-chain-of-being.png \
  "https://upload.wikimedia.org/wikipedia/commons/b/b5/Great_Chain_of_Being_2.png" \
  "Feature 9: Great Chain of Being (Valadés, 1579)"

dl feature-10-carta-marina.jpg \
  "https://commons.wikimedia.org/wiki/Special:FilePath/Carta%20Marina.jpeg" \
  "Feature 10: Carta Marina (Olaus Magnus, 1539)"

dl feature-11-william-of-ockham.jpg \
  "https://commons.wikimedia.org/wiki/Special:FilePath/William%20of%20Ockham%20-%20Logica%20-%201341.jpg" \
  "Feature 11: William of Ockham (1341 MS)"

dl feature-12-basket-of-fruit.jpg \
  "https://uploads3.wikiart.org/images/caravaggio/basket-of-fruit.jpg!HD.jpg" \
  "Feature 12: Caravaggio - Basket of Fruit (1599)"


# ─── Verification ────────────────────────────────────────────────────────────

echo ""
echo "Verifying all downloads..."
# ─── New Section I figures (Papers 5, 6½, 7) ──────────────────
dl trouvelot-orion-nebula.jpg \
  "https://commons.wikimedia.org/wiki/Special:FilePath/Trouvelot-_The_great_nebula_in_Orion_-_1875.jpg?width=1400" \
  "Paper 5: E. L. Trouvelot - The Great Nebula in Orion (1882)"

dl geertgen-nativity-night.jpg \
  "https://commons.wikimedia.org/wiki/Special:FilePath/Geertgen_tot_Sint_Jans,_The_Nativity_at_Night,_c_1490.jpg?width=1400" \
  "Paper 6.5: Geertgen tot Sint Jans - The Nativity at Night (c. 1490)"

dl rembrandt-philosopher-meditation.jpg \
  "https://commons.wikimedia.org/wiki/Special:FilePath/Rembrandt_-_The_Philosopher_in_Meditation.jpg?width=1400" \
  "Paper 7: Rembrandt - The Philosopher in Meditation (1632)"

dl hilbert-1912.jpg \
  "https://commons.wikimedia.org/wiki/Special:FilePath/Hilbert.jpg?width=1400" \
  "Paper A0: David Hilbert (1912) - public-domain portrait"

dl wmap-cmb-9yr.png \
  "https://commons.wikimedia.org/wiki/Special:FilePath/Ilc_9yr_moll4096.png?width=1400" \
  "Paper A2 sec5: WMAP nine-year CMB all-sky map (NASA, 2012)"

dl dirac-1933.jpg \
  "https://commons.wikimedia.org/wiki/Special:FilePath/Paul_Dirac,_1933.jpg?width=1400" \
  "Paper A0: Paul Dirac (1933) - public-domain portrait"

dl von-neumann-los-alamos.jpg \
  "https://commons.wikimedia.org/wiki/Special:FilePath/John_von_Neumann_Los_Alamos_identity_badge_photo.jpg?width=1400" \
  "Paper A0: John von Neumann - Los Alamos badge (US-gov, public domain)"

dl domenichino-john-evangelist.jpg \
  "https://commons.wikimedia.org/wiki/Special:FilePath/Zampieri_St_John_Evangelist.jpg?width=1400" \
  "Paper A1 sec3: Domenichino - St John the Evangelist (c.1620s)"

for f in \
  antonello-jerome-study.jpg \
  masaccio-trinity.jpg ladder-of-divine-ascent.jpg \
  bonaiuto-triumph-aquinas.jpg blake-glad-day.jpg \
  gray-anatomy-appendix.png fan-kuan-travelers.jpg \
  apianus-spheres.png flammarion-engraving.jpg melies-trip-to-moon.jpg \
  kells-chi-rho.png raphael-parnassus.jpg friedrich-wanderer.jpg \
  friedrich-abbey-oakwood.jpg \
  durer-self-portrait.jpg bayeux-comet.jpg david-death-of-socrates.jpg \
  van-eyck-mystic-lamb.jpg durer-melancholia.jpg \
  durer-praying-hands.jpg bruegel-tower-of-babel.jpg \
  rembrandt-two-old-men-disputing.jpg holbein-the-ambassadors.jpg \
  friedrich-monk-by-the-sea.jpg \
  feature-01-vermeer-balance.jpg feature-02-forge-of-vulcan.jpg feature-03-incredulity-of-thomas.jpg feature-04-las-meninas.jpg feature-05-moneylender.jpg feature-06-pentecost.jpg feature-07-ouroboros.png feature-08-air-pump.jpg feature-09-great-chain-of-being.png feature-10-carta-marina.jpg feature-11-william-of-ockham.jpg feature-12-basket-of-fruit.jpg \
  trouvelot-orion-nebula.jpg geertgen-nativity-night.jpg rembrandt-philosopher-meditation.jpg hilbert-1912.jpg wmap-cmb-9yr.png dirac-1933.jpg von-neumann-los-alamos.jpg domenichino-john-evangelist.jpg; do
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
