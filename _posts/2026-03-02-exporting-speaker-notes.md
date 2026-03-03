---
layout: post
title: "Exporting speaker notes from presentations"
author: "Marcus Hammarberg"
date: 2026-03-02 04:00:00
tags:
  - AI
  - Life of a consultant
---


Now that we are using agents to help us with a lot of daily tasks I realize how much information I have put in speaker notes. I have books worth of information in there, due to my bad memory. I knew it would pay off, someday.

And they are really tricky to share with in an AI chat, like (we're not using [Chat GPT anymore, since this morning](https://quitgpt.org/) - right?) ... well you choose. I'm going with Claude.

Uploading some of my presentations to an agent means 50+ Mb file, when I'm really just interested in the text in my speaker notes.

Over the years I have been going back and forth between different presenting softwares and hence I have a bit of a problem getting hold of the speaker notes.

But I've solved this now. Let me share it with you. And then let me share how I have fixed all of this with a Claude Coworker skill.

<!-- excerpt-end -->

## PPTX - the common denominator

Turns out that many of these formats that I have used over the years does not have a good format to export speaker notes. The only one that does export speaker notes in a good way is Power Point. Luckily it's also the oldest and has a lot of automation capabilities.

Ok - so I need to convert my stuff to Power Point format. That is a very common way of doing it.

## Export speaker notes using Python

Python has a tool called `python-pptx` (install with `pip install python-pptx`) that can read PPTX files. And with that in hand we can write this function and get it to print our speaker notes to the console.

```python
# Requires: pip install python-pptx
import pptx
import sys

def get_notes(ppt_path):
    prs = pptx.Presentation(ppt_path)
    notes = []
    for i, slide in enumerate(prs.slides):
        note = slide.notes_slide
        if note and note.notes_text_frame.text:
            notes.append(f"Slide {i+1}:\n{note.notes_text_frame.text}\n")
    return "\n".join(notes)

if __name__ == "__main__":
    print(get_notes(sys.argv[1]))
```

Very cool - we are getting there.

## Docker

But I really hate running Python on my machine. I have never got to terms with all the `venv`, `pip`s and versions of Python.

Let's use a Docker file to back all of this into something where Python works

```dockerfile
FROM python:3.11-slim
WORKDIR /app
RUN pip install --no-cache-dir python-pptx
COPY extract_notes.py .
ENTRYPOINT ["python", "extract_notes.py"]
```

Now I can run the script without polluting my computer, with a lot of Python stuff that I never use for anything else. Nice!

## Script

To run this I need to write these commands

```bash
docker build -t pptx-notes .

docker run --rm -v "$DIR":/data pptx-notes "/data/$BASE"
```

Cool, but I will never remember that. Let's create a script, `run.sh´.

```bash
#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: ./run.sh yourfile.pptx"
  exit 1
fi

INPUT_FILE=$(realpath "$1")
DIR=$(dirname "$INPUT_FILE")
BASE=$(basename "$INPUT_FILE")

docker build -t pptx-notes .

docker run --rm \
  -v "$DIR":/data \
  pptx-notes \
  "/data/$BASE"
```

Very cool - now I can run it like this, to output the result into a text document that I can share with an AI.

```bash
bash ./run.sh ~/Downloads/Agile\ for\ real.pptx > agile_for_real_speaker_notes.txt
```

## But, AI?

Yes, obviously I wrote this tool with the help of AI.

But I could also have asked Claude CoWork to do it for me. In fact I did. But then I looked that the skills it used and I wanted to understand deeper how that would work, so tried to do it for myself. I might do the next conversion with Claude CoWork, I might use this. Now I understand the concept and approach, and have built a tool.
