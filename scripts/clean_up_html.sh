#!/bin/bash

# Function to convert HTML tags to markdown equivalents
convert_html_to_md() {
    sed -E '
        s/<\/?b>/\*\*/g;             # Convert <b> and </b> to **
        s/<\/?strong>/\*\*/g;        # Convert <strong> and </strong> to **
        s/<\/?i>/\*/g;               # Convert <i> and </i> to *
        s/<\/?em>/\*/g;              # Convert <em> and </em> to *
        s/<\/?h1>/#/g;               # Convert <h1> and </h1> to #
        s/<\/?h2>/##/g;              # Convert <h2> and </h2> to ##
        s/<\/?h3>/###/g;             # Convert <h3> and </h3> to ###
        s/<\/?h4>/####/g;            # Convert <h4> and </h4> to ####
        s/<\/?h5>/#####/g;           # Convert <h5> and </h5> to #####
        s/<\/?h6>/######/g;          # Convert <h6> and </h6> to ######
        s/<\/?p>//g;                 # Remove <p> and </p>
        s/<\/?br \/>//g;             # Remove <br />
    ' <<< "$1"
}

# Function to remove unnecessary line breaks
remove_unnecessary_line_breaks() {
    sed -E ':a;N;$!ba;s/\n\s*\n/\n\n/g;s/([^\n])\n([^\n])/\1 \2/g' <<< "$1"
}

# Process all markdown files in the given directory
process_files() {
    local dir=$1
    for file in "$dir"/*.md; do
        if [[ -f $file ]]; then
            echo "Processing $file..."

            # Read the content of the file
            content=$(<"$file")

            # Convert HTML tags to markdown
            content=$(convert_html_to_md "$content")

            # Remove unnecessary line breaks
            content=$(remove_unnecessary_line_breaks "$content")

            # Write the cleaned content back to the file
            echo "$content" > "$file"
        fi
    done
}

# Main script execution
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

if [[ ! -d $1 ]]; then
    echo "Error: Directory $1 does not exist."
    exit 1
fi

process_files "$1"
echo "Processing complete."
