#!/bin/bash

# Check if the path argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <path_to_directory>"
    exit 1
fi

# Validate if the directory exists
if [ ! -d "$1" ]; then
    echo "Error: Directory not found: $1"
    exit 1
fi

# Run the Docker command
docker build -t marcusoftnet .
docker run --rm --volume="$1:/usr/src/app" -it marcusoftnet jekyll build
