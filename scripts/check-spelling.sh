#!/bin/bash

set -e

# Check if a folder argument is passed
if [ -z "$1" ]; then
  echo "Usage: $0 <folder>"
  exit 1
fi

TARGET_FOLDER="$1"

# Check folder exists
if [ ! -d "$TARGET_FOLDER" ]; then
  echo "Error: Folder '$TARGET_FOLDER' not found."
  exit 1
fi

# Path to VS Code user settings
VSCODE_SETTINGS="$HOME/Library/Application Support/Code/User/settings.json"
if [ ! -f "$VSCODE_SETTINGS" ]; then
  echo "VS Code settings.json not found at $VSCODE_SETTINGS"
  exit 1
fi

# Extract cSpell.userWords using jq
USER_WORDS=$(grep -vE '^\s*//' "$VSCODE_SETTINGS" | jq '.["cSpell.userWords"] // []')
if [ "$USER_WORDS" == "null" ]; then
  USER_WORDS="[]"
fi

# Create temporary cspell config
TEMP_CONFIG="$(mktemp).json"
cat > "$TEMP_CONFIG" <<EOF
{
  "version": "0.2",
  "language": "en",
  "words": $USER_WORDS
}
EOF
echo "Created temporary cspell config at $TEMP_CONFIG"

# Run cspell on the target folder
npx cspell --config "$TEMP_CONFIG" "$TARGET_FOLDER/**/*"

# Clean up
rm "$TEMP_CONFIG"
echo "Temporary config deleted."
