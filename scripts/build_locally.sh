#!/bin/bash
set -euo pipefail

IMAGE_NAME=jekyll-blog-local

# Build the Docker image from scripts directory
SCRIPT_DIR="$(dirname "$0")"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

cd "$PROJECT_ROOT"

echo "Building Docker image for Jekyll site..."
docker build -f scripts/Dockerfile -t $IMAGE_NAME --build-arg GEMFILE_DIR=scripts .
echo "✅ Docker image $IMAGE_NAME built successfully."

echo "Building Jekyll site..."
docker run --rm -v "$PROJECT_ROOT":/srv/jekyll -v "$PROJECT_ROOT/_site":/srv/jekyll/_site $IMAGE_NAME jekyll build

echo "✅ Jekyll site built in ./_site"

open "http://localhost:4000" &
docker run --rm -p 4000:4000 $IMAGE_NAME
