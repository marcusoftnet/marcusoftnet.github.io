#!/bin/bash

# Check if the input file is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <path_to_original_post>"
    exit 1
fi

# Read the path to the markdown content from the first argument
input_file="$1"

# Make sure the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: File not found: $input_file"
    exit 1
fi

# Make a copy of the original file with the extension .org.md
cp "$input_file" "${input_file%.md}.org.md"

# Read the markdown content from the input file
content=$(<"$input_file")

# Replace HTML tags with markdown equivalent
content=$(sed 's/<\/\?div>//g' <<< "$content")
content=$(sed 's/<\/\?a[^>]*>//g' <<< "$content")
content=$(sed 's/<\/\?img[^>]*>//g' <<< "$content")

# Remove new lines in paragraphs
content=$(awk -v RS= '{$1=$1}1' <<< "$content")

# Save the modified content to the original file
echo "$content" > "$input_file"

echo "Changes applied successfully. Original content backed up to ${input_file%.md}.org.md and modified content saved to $input_file."
