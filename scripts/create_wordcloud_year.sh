#!/bin/bash
set -euo pipefail

YEAR="$1"
EXCLUDE_FILE="$2"
POSTS_DIR="_posts"
OUTPUT_FILE="data/wc/wordcloud-${YEAR}.json"

# Ensure output directory exists
mkdir -p "$(dirname "$OUTPUT_FILE")"

echo "  ⏳ Creating word cloud for year: '$YEAR'"

# Check that the exclude file exists
if [ ! -f "$EXCLUDE_FILE" ]; then
  echo "❌ Exclude file does not exist: $EXCLUDE_FILE"
  exit 1
fi

# One-pipeline jq-only wordcloud extraction
find "$POSTS_DIR" -type f -name "${YEAR}-*.md" -exec cat {} + | \
  sed -n '/^---\r*$/,/^---\r*$/!p' | \
  jq -R -s --slurpfile exclude "$EXCLUDE_FILE" "
    split(\"\n\")                                                 # split input into lines
    | map(gsub(\"\r\$\";\"\"))                                    # remove trailing CR
    | map(select(length > 0))                                     # remove empty lines
    | map(gsub(\"\u2019\";\"'\"))                                 # replace smart apostrophes with straight ones
    | map(gsub(\"[^a-zA-ZåäöÅÄÖ']+\";\" \"))                      # replace non-letter chars with spaces
    | map(split(\" \"))                                           # split each line into words
    | flatten                                                     # flatten 2D array into a single array of words
    | map(ascii_downcase)                                         # lowercase everything
    | map(select(test(\"^[a-zåäö]{3,}$\")))                       # remove short words (<3 letters)
    | map(select(. as \$w | (\$exclude[0] | map(ascii_downcase) | index(\$w) | not)))  # remove stop words
    | group_by(.)                                                 # group identical words
    | map([.[0], length])                                         # count occurrences
    | sort_by(.[1]) | reverse                                     # sort by frequency, descending
    | .[0:250]                                                    # take top 250
  " -c > "$OUTPUT_FILE"

echo "  ✅ Word cloud data saved to '$OUTPUT_FILE'"
