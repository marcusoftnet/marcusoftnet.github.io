#!/bin/bash

# Usage: bash lint-all.sh _posts

if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

TARGET_DIR="$1"
FIX_FLAG="$2"

# echo "Linting Markdown files in directory: $TARGET_DIR"

npx --yes markdownlint-cli --config ./.markdownlint.json $TARGET_DIR $FIX_FLAG

STATUS=$?

if [ $STATUS -ne 0 ]; then
  echo "❌ Markdown linting failed."
else
  echo "✅ No markdown linting issues found in $TARGET_DIR."
fi

exit $STATUS
