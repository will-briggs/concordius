#!/bin/bash
# sync-content.sh
# Copies the latest content from the three Triptych repos into the website.
# Run this from the website/ directory before pushing to publish updates.

TRIPTYCH="../Triptych"

echo "Syncing Concordius Papers..."
rsync -av --delete "$TRIPTYCH/Concordius-Papers/" content/concordius-papers/

echo "Syncing Reasonablenessism..."
rsync -av --delete "$TRIPTYCH/Reasonablenessism/" content/reasonablenessism/

echo "Syncing Structural Readings..."
rsync -av --delete "$TRIPTYCH/Structural-Readings/" content/structural-readings/

echo "Done. Review changes with: git diff --stat"
echo "Then push with: git add -A && git commit -m 'Sync content' && git push"
