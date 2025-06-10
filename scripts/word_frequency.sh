#!/bin/bash

# Usage: ./wordcloud-filter.sh _posts/

# Check for directory argument
if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

INPUT_DIR="$1"

find "$INPUT_DIR" -type f -name '*' -exec cat {} + | \
  tr '[:upper:]' '[:lower:]' | \
  tr -c '[:alnum:]' '[\n*]' | \
  grep -E '.{3,}' | \
  sort | \
  uniq -c | \
  awk '$1 > 1000' | \
  sort -nr > word_freq.txt


