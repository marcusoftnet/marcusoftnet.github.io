---
layout: post
title: "Git hooks to keep my blog clean"
author: "Marcus Hammarberg"
date: 2025-05-12 04:00:00
tags:
 - Marcus private
 - Programming
---

As I wrote in the [last post](https://www.marcusoft.net/2025/04/spell-checker-in-folders.html) I've created a little script that spell checks all my blog posts. That was about 3000+ spelling mistakes.

And I then created a similar script to lint the markdown on all blog posts. Another 1250 warnings and errors.

Now that I've cleaned that up - I never want to do that again.

No - rather I would like to check for problems every time I make a change. Preferably just before I check stuff into Git.

Turns out - there's a built-in Git-tool for that.

Let me show you how I put these things together to make a guarded check-in that don't allow spelling or linting errors to be committed into the repository.

<!-- excerpt-end -->

## Markdown linting

The markdown linting is another script that I put in the `scripts` folder of [this repository](https://github.com/marcusoftnet/marcusoftnet.github.io). It looks like this, not the way that I return the error code of the linting through `STATUS=$?` and `exit $STATUS`. This will become important later on.

```bash
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
  echo "✅ No markdown linting issues found."
fi

exit $STATUS
```

## Git hooks

Each local git installation resides in the `.git` folder. Inside that folder there's a `hooks` directory which are bash scripts that will be run at certain points in the life cycle of changes to git. For example `.git/hooks/pre-commit` runs just before each commit. This is the one we want.

Notice that there's a `.git/hooks/pre-commit.sample` to take inspiration from.

## Pre-commit script

I want my script to first check spelling (of all 1240+ blog posts) and then do markdown linting. If both of those are good I want to allow the commit.

This can be accomplished with the following script:

```bash
#!/usr/bin/env bash

# Run spelling check
bash ./scripts/check-spelling.sh _posts
SPELL_STATUS=$?

# Run markdown lint
bash ./scripts/markdown-lint.sh _posts --fix
LINT_STATUS=$?

# Check results
if [ $SPELL_STATUS -ne 0 ] || [ $LINT_STATUS -ne 0 ]; then
  echo "Pre-commit checks failed."
  [ $SPELL_STATUS -ne 0 ] && echo "❌ Spelling check failed"
  [ $LINT_STATUS -ne 0 ] && echo "❌ Markdown linting failed"
  exit 1
fi

echo "✅ All pre-commit checks passed."
exit 0

```

Here you can see how the exit code from the sub-scripts become important and I store them in `$SPELL_STATUS` and `$LINT_STATUS` respectively.

## Link to script in repo

Having a script in `.git/hooks/pre-commit` means that the script is local to only you. This can be useful but sharing the goodness is better.

Let's create the `pre-commit`-script inside the repository at `/scripts/git-hooks/pre-commit` for example and then make a link to the `.git/hooks/pre-commit`:

```bash
ln -s ../../scripts/git-hooks/pre-commit .git/hooks/pre-commit
```

Notice that the `../../` are need to get back to the root from the `.git/hooks`-directory.

Now you need to make the script executable in the `.git/hooks/` directory.

```bash
chmod +x scripts/git-hooks/pre-commit
```

## Do

And then I did a commit, to see the linting and spell-checker run. If it fails the commit is not added, and once the checks pass without errors your commit is made.

```bash
git add -A && git commit -m "Fixes a weird sentence"
✅ No spelling issues found.
✅ No markdown linting issues found.
✅ All pre-commit checks passed.
[main cc942bf] Fixes a weird sentence
 1 file changed, 1 insertion(+), 1 deletion(-)
```

Beautiful.
