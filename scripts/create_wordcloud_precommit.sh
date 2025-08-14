#!/bin/bash

set -euo pipefail

repo_root=$(git rev-parse --show-toplevel)
YEARS=$(git diff --cached --name-only \
    | grep '^_posts/' \
    | sed -E 's|_posts/([0-9]{4})-[0-9]{2}-[0-9]{2}.*|\1|' \
    | sort -u)

COUNT=$(echo "$YEARS" | wc -w)
echo "Regenerating wordcloud for $COUNT years"

EXCLUDE_FILE="./data/wc/exclude.json"
for YEAR in $YEARS; do
    bash ./scripts/create_wordcloud_year.sh "$YEAR" "$EXCLUDE_FILE"
done