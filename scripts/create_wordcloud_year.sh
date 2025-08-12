#!/bin/bash

set -euo pipefail

YEAR="$1"
EXCLUDE_FILE="$2"
POSTS_DIR="_posts"
OUTPUT_FILE="data/wc/wordcloud-${YEAR}.json"

# Ensure output directory exists
mkdir -p "$(dirname "$OUTPUT_FILE")"

# Load exclude list into a grep pattern
EXCLUDE_PATTERN=$(jq -r '.[]' "$EXCLUDE_FILE" | tr '[:upper:]' '[:lower:]' | paste -sd '|' -)

# Find all matching markdown files
FILES=$(find "$POSTS_DIR" -type f -name "${YEAR}-*.md")

# Extract and process words
WORDS=$(cat $FILES | \
    sed -n '/^---$/,/^---$/!p' | \
    tr '[:space:][:punct:]' '\n' | \
    tr '[:upper:]' '[:lower:]' | \
    grep -E '^[a-zåäö]{3,}$' | \
    grep -vE "^($EXCLUDE_PATTERN)$" || true)

# Count word frequency and format as JSON
echo "$WORDS" | \
    sort | uniq -c | sort -nr | \
    awk '$1 >= 10 { printf "[\"%s\", %s],\n", $2, $1 }' | \
    sed '$ s/,$//' | \
    awk 'BEGIN { print "[" } { print } END { print "]" }' > "$OUTPUT_FILE"

echo "  ✅ Word cloud data saved to $OUTPUT_FILE"

exit 0
