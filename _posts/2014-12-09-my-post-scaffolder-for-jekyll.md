---
layout: post
title: "My post scaffolder for Jekyll"
author: "Marcus Hammarberg"
date: 2014-12-09 08:09:13
tags:
  - Tools
---

I've just started to use [Jekyll](http://jekyllrb.com) as my blogging engine. It's mostly nice but I'm getting used to a new tool. And maybe actually the lack of tools since it's just markdown and git.

One of the things that I found early to be a stumbling block was to create a new post. Since I'm still fresh to the structure of the YAML front-matter, I found myself copying and pasting, missing and misunderstanding.

So I looked for a post generator and found [this gist](https://gist.github.com/kabrooski/6107707) that is used, at the command line, to scaffold up the structure of a new blog post.

Let me show you how I tweaked it and a problem that I ran into, being a newbie.

## Tweaking the script

I'm very much a newbie in bash script files so bear with me and please enlighten me if this can be better.

First of all, I changed the constants at the top to my settings:

- I'm always using Sublime so the editor becomes: `editor=sublime`
- My layout, template for the posts, is called post and my director for posts is also standard so I left those.
- I added a new constant for author `author="Marcus Hammarberg"`

Jekyll has something called categories and something called tags. I cannot really tell them apart but I'm using tags on my blog. So I went through the script and replaced "category(ies)" with "tag(s)".

Tags go in the front matter and should be listed one tag per line, each line starting with a dash ("-"). This caused me some problems and I had to do some hair pulling and scratching of cheek to get it to work.

Here's the gist (pun intended) of it:

```bash
#!/bin/bash

## <... script code here ...>

tags=""
read -p "Tags: " tags

if [ ! -z "$tags" ]; then
  echo "tags:" >> $filename
  echo "- ${tags//,/\\n-}" | sed 's/^-//g' >> $filename
fi
```

- On line 98, we issue the `read -p "Tags: " tags` command that prompts the user with a "Tags:" prompt and stores whatever they enter into the tags variable.
- The `if` statement on line 99 checks if any tags were created.
- Lines 100 to 103 is where the magic happens. This is where we write the tags to the file.

  - Line 101 writes the first part, notice how the line *doesn't* end with a quotation. This is how you do newlines in a string on OSX.
  - Lines 102-103 use the `sed` command to look through the `$tags` variable, replacing commas `,` with a newline and a dash `-`. Again, notice the newline trickery.
  - The final part of line 103 just writes it out to the `$filename`.

## Using the script

When I first used the script I was a bit surprised because I thought that you just executed the script at the prompt. Apparently, you have to send it to the bash command. Like this:

```bash
bash scaffold_post "A post title"
```

Once you execute the script, it will ask you for tags. Separate them with a comma as you remember and a nice post will be scaffolded for you. It will even open in Sublime (or whatever editor you have configured) and look something like this.

Thank you [Daara Shaw](https://gist.github.com/kabrooski) for that great gist. Helped me a lot!
