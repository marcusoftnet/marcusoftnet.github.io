---
layout: post
title: "Spell checking all my blog posts"
author: "Marcus Hammarberg"
date: 2025-04-23 04:00:00
tags:
 - Marcus private
 - Programming
---

In the `_posts` directory of this blog I have 1247 posts... Some of them are not very good or readable since they are WAY dated - I wrote the first in 2006. During these years I have also used a number of different tools and ways to write the blog (starting with [Blogger](https://www.blogger.com/) way back when). Much have changed. With the tooling and with me.

One concrete example is that in my code editor now, I have instant and brilliant spell checking. I'm using [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker) which seems to be the default choice for many.

It's great but work on one file at the time. I wanted it to work on all my files at the same time. Let me show you how I made that work.

<!-- excerpt-end -->

Turns out Code Spell Checker has a CLI through [CSpell](https://cspell.org/) which can be downloaded as a [NPM module](https://www.npmjs.com/package/cspell) and running that is pretty straight forward:

```bash
npx cspell _posts/**;
```

And that would have been the end of the post unless ... it didn't use my "user defined words" that I have collected over years of usage.

When Code Spell Checker is installed it stores it configuration in the `settings.json` file of VS Code. It is, in my case, stored in `~/Library/Application Support/Code/User/settings.json`.

In that file I have a LONG list of user defined words. It looks like this;

```json
"cSpell.userWords": [
    "aaaaactually",
    ...
 ]
```

I wanted `cspell` to use this list. That is possible by just copying the word array and add it to a configuration file that can be passed to `cspell` using the `--config` flag. But that will not fly - I want to use the updated array of words, so that if I add a new word to the `cSpell.userWords` it will be used the next time I run `npx cspell`.

This required some bash-fiddling but it was quite fun. I used [`jq`](https://jqlang.org/) to extract the `cSpell.userWords` array and then create a `cspell` configuration file in my temp directory.

First I put the path to the VS Code `settings.json` file in a variable:

```bash
VSCODE_SETTINGS="$HOME/Library/Application Support/Code/User/settings.json"
if [ ! -f "$VSCODE_SETTINGS" ]; then
  echo "VS Code settings.json not found at $VSCODE_SETTINGS"
  exit 1
fi
```

And then I look in that file for the `cSpell.userWords` and get them into another variable:

```bash
USER_WORDS=$(grep -vE '^\s*//' "$VSCODE_SETTINGS" | jq '.["cSpell.userWords"] // []')
if [ "$USER_WORDS" == "null" ]; then
  USER_WORDS="[]"
fi
```

I can now create a `cspell` config in the temp directory. Here I found out that it was important that this file used the extension `.json` or it would not work.

```bash
TEMP_CONFIG="$(mktemp).json"
cat > "$TEMP_CONFIG" <<EOF
{
  "version": "0.2",
  "language": "en",
  "words": $USER_WORDS
}
EOF
echo "Created temporary cspell config at $TEMP_CONFIG"
```

With all that in place I can now call `cspell`. I'm using `npx` to do so, which will download the tool for me if I'm running it for the first time.

```bash
npx cspell --config "$TEMP_CONFIG" "$TARGET_FOLDER/**/*"
```

I can run the script using `sh scripts/check-spelling.sh _posts` or pipe the result into a file like this `sh scripts/check-spelling.sh _posts > spelling-results.txt 2>&1`.

The complete script is [found here](https://github.com/marcusoftnet/marcusoftnet.github.io/blob/main/scripts/check-spelling.sh) and includes some housekeeping and log statements.

Now I just have to fix the 3261 spelling errors, before I start to look into the markdown linting rules in the same thing.

(No there's no working `--fix` flag for the `cspell` cli tool installed with `npx`.)
