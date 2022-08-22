---
layout: post
title: "Writing a script to extract pictures from Word documents"
author: "Marcus Hammarberg"
date: 2017-08-15 15:33:04
tags:
  - Life of a consultant
  - Tools
  - Programming
---

I had a problem and I noticed that I've, in the last couple of years, started to think differently about how to solve problems like these. I thought I share the solution to my problem here but also a little bit about the reasoning behind my problem solving.

The problem is easy enough to describe: I wanted to extract all the images from 20+ Word documents. I decided to write a script and share it here.

<!-- excerpt-end -->

### TL;DR - just the script

Here's the bash script that I ended up with

```bash
#!/bin/bash
rm -rf zips
mkdir zips
cp docs/*.docx zips

for file in ./zips/*.docx; do
  mv "$file" $file.zip
  unzip $file.zip 'word/media/*.jpeg' -d $file.images
  rm $file.zip
done
```

## Decisions, decisions, decisions

First of all I decided to write a scrip to do this. I did that because I want to keep my programming thinking alive and also learn something a little new (almost) every day. I *suck* at shell scripting and this seemed like a nice exercise.

The first thing I did when writing the script was to think about how I could run the script over and over again, in an easy fashion. For me that means that I kept the raw data (the Word documents in this case) in one folder and the output in another.

I've learned, the hard way, that writing any kind of code requires ~a few~ many iterations. I want to test an idea, run that part, tweak the idea and then run again. Many times a minute.

For that reason I set myself up in away that support this iteration. For that reason I clean up the output folder in the first set, like this: `rm -rf zips`.

The actual algorithm builds on the fact that Word documents (.docx format) are actually zip files. My first step is therefor to copy them to my *working* directory `zips` with the command `cp docs/*.docx zips`

Once the documents are in the working directory I need to change the extension of each file, from `.docx` to `.zip`. I found no easy way to do this with a single command, but rather ended up iterating over them.

This is accomplished with the `for` construct, and in all honesty I've never tried that before in shell scripts. The block inside `do` to `done` gets iterated for each `file` in the directory.

Renaming each file turns out to be easy inside the loop, by simply appending `.zip` to the end of the current file name `mv "$file" $file.zip`

Now that I'm already iterating I decided to unzip each directory too. For this I'm using the `unzip` command. The `word/media/*.jpeg` part means that I only unzip that folder inside the zip-archive. `-d $file.images` creates a folder with the suffix `.images` where the images are extracted too.

Finally I decided to clean up and remove the zip archive, inside the loop. That is a little bit unnecessary but why not.

## Summary

This was a fun little exercise.

* It was faster to code this up than to open and extract all images manually
* I can do this over and over. I might add more pictures to the documents later, or more documents…
* I learned some new stuff
* I got to blog about it too.
