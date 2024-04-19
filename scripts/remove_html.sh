#!/bin/bash

# Read the markdown content from a file
input_file="original_post.md"
content=$(<"$input_file")

# Make a copy of the original file with the extension .org.md
cp "$input_file" "${input_file%.md}.org.md"

# Replace HTML tags with markdown equivalent
content=$(sed 's/<\/\?div>//g' <<< "$content")
content=$(sed 's/<\/\?a[^>]*>//g' <<< "$content")
content=$(sed 's/<\/\?img[^>]*>//g' <<< "$content")

# Remove new lines in paragraphs
content=$(awk -v RS= '{$1=$1}1' <<< "$content")

# Save the modified content to the original file
echo "$content" > "$input_file"

echo "Changes applied successfully. Original content backed up to ${input_file%.md}.org.md and modified content saved to $input_file."
