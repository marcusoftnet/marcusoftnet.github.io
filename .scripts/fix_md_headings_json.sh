#!/usr/bin/env bash
set -euo pipefail
TMP=$(mktemp)
# get JSON output
npx --yes markdownlint-cli --config ./.markdownlint.json --json _posts > "$TMP" || true
# parse file:line pairs using node
PAIRS=$(node -e 'const fs=require("fs"); const s=fs.readFileSync(0,"utf8"); if(!s.trim()){process.exit(0);} const arr=JSON.parse(s); arr.forEach(e=>console.log(e.fileName+":"+e.lineNumber));' < "$TMP")
if [ -z "$PAIRS" ]; then
  echo "No MD001 errors found (no file:line pairs)."
  rm -f "$TMP"
  # still run linter to show status
  npx --yes markdownlint-cli --config ./.markdownlint.json _posts || true
  exit 0
fi
# dedupe and iterate
printf "%s\n" "$PAIRS" | sort -u > "$TMP.pairs"
cat "$TMP.pairs"
while IFS=":" read -r file line; do
  [ -z "$file" ] && continue
  echo "\n--- Fixing $file:$line ---"
  sed -i '' "${line}s/^#//" "$file"
  echo "Diff for $file:"
  git --no-pager --no-color diff -- "$file" | sed -n '1,200p' || true
done < "$TMP.pairs"

echo "\nRe-running linter to verify fixes:" 
npx --yes markdownlint-cli --config ./.markdownlint.json _posts || true
rm -f "$TMP" "$TMP.pairs"
