#!/usr/bin/env bash
set -euo pipefail
LINT_OUTPUT=$(mktemp)
ERRS_FILE=$(mktemp)
sh ./scripts/markdown_lint.sh _posts | tee "$LINT_OUTPUT" || true
awk -F: '/_posts/ {print $1":"$2}' "$LINT_OUTPUT" | sort -u > "$ERRS_FILE"
echo "Found the following file:line entries to fix:"
cat "$ERRS_FILE"
while IFS=":" read -r file line; do
  [ -z "$file" ] && continue
  echo "\n--- Fixing $file:$line ---"
  # Remove one leading # from the specific line
  sed -i '' "${line}s/^#//" "$file"
  echo "Diff for $file:"
  git --no-pager --no-color diff -- "$file" | sed -n '1,200p' || true
done < "$ERRS_FILE"

echo "\nRe-running linter to verify fixes:" 
sh ./scripts/markdown_lint.sh _posts || true
rm -f "$LINT_OUTPUT" "$ERRS_FILE"
