#!/bin/bash

set -euo pipefail

EXCLUDE_FILE="./data/wc/exclude.json"
CURRENT_YEAR=$(date +"%Y")

echo "Generating word clouds for all years from 2006 to $CURRENT_YEAR..."
echo "Excluding words from $EXCLUDE_FILE..."

rm -f ./data/wc/wordcloud-*.json

for YEAR in $(seq 2006 "$CURRENT_YEAR"); do
  bash ./scripts/create_wordcloud_year.sh "$YEAR" "$EXCLUDE_FILE"
done

echo "✅ All word clouds generated."