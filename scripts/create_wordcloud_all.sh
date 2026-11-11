#!/bin/bash

set -euo pipefail

EXCLUDE_FILE="./data/wc/exclude.json"
CURRENT_YEAR=$(date +"%Y")

echo "Generating word clouds for all years from 2006 to '$CURRENT_YEAR'..."
echo "Excluding words from '$EXCLUDE_FILE'..."

rm -f ./data/wc/wordcloud-*.json
echo "💥 Removed all word cloud files"

for YEAR in $(seq 2006 "$CURRENT_YEAR"); do
  bash ./scripts/create_wordcloud_year.sh "$YEAR" "$EXCLUDE_FILE"
done

echo "✅ All yearly word clouds generated."

echo "Combining all word clouds into a single file..."
jq -c -s --slurpfile stopwords ./data/wc/exclude.json '
  [ .[][]                                 # flatten all arrays from all files
    | select(. as $pair | ($stopwords[0] | index($pair[0])) | not) # filter out stop words
  ]
  | group_by(.[0])                        # same word from different years...
  | map([.[0][0], (map(.[1]) | add)])     # ...gets its counts summed
  | sort_by(.[1]) | reverse               # sort by count descending
  | .[0:300]                              # take top 300 words
' ./data/wc/wordcloud-*.json > ./data/wc/wordcloud-all.json

echo "✅ All combine word cloud generated."