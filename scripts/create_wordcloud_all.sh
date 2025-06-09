#!/bin/bash

set -euo pipefail

EXCLUDE_FILE="$1"
CURRENT_YEAR=$(date +"%Y")

rm ./data/wc/wordcloud-*.json

for YEAR in $(seq 2006 "$CURRENT_YEAR"); do
  bash ./scripts/create_wordcloud_year.sh "$YEAR" "$EXCLUDE_FILE"
done

echo "✅ All word clouds generated."