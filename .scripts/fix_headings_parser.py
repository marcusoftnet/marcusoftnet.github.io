#!/usr/bin/env python3
import re
import sys
from pathlib import Path
import subprocess

posts = Path('_posts')
md_files = sorted(posts.glob('*.md'))
changed_files = []
for f in md_files:
    s = f.read_text(encoding='utf-8')
    lines = s.splitlines()
    new_lines = []
    last_level = 0
    changed = False
    for i, line in enumerate(lines, start=1):
        m = re.match(r'^(#{1,6})\s', line)
        if m:
            level = len(m.group(1))
            if level > last_level + 1:
                # decrement one '#'
                new_level = level - 1
                new_line = '#' * new_level + line[level:]
                new_lines.append(new_line)
                changed = True
                last_level = new_level
            else:
                new_lines.append(line)
                last_level = level
        else:
            new_lines.append(line)
    if changed:
        old = s
        new = '\n'.join(new_lines) + ("\n" if s.endswith('\n') else "")
        f.write_text(new, encoding='utf-8')
        changed_files.append(f)
        # show git diff
        try:
            diff = subprocess.check_output(['git','--no-pager','--no-color','diff','--',str(f)], text=True)
            print(f"\n--- Diff for {f} ---\n{diff}")
        except subprocess.CalledProcessError:
            print(f"Edited {f}")

# Re-run linter
print('\nRe-running linter:')
subprocess.call(['npx','--yes','markdownlint-cli','--config','./.markdownlint.json','_posts'])

if not changed_files:
    print('No files changed')
else:
    print('\nFiles changed:')
    for f in changed_files:
        print('-', f)
