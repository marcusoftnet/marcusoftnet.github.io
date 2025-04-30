---
layout: post
title: Export all images from a Word (.doc) document .. and rename them
date: 2013-07-29T08:50:00.001Z
author: Marcus Hammarberg
tags:
  - Tools
  - Life of a consultant
modified_time: 2013-07-29T08:50:31.650Z
thumbnail: /img/Screen+Shot+2013-07-29+at+10.48.11+.png
blogger_id: tag:blogger.com,1999:blog-36533086.post-7497639516539350498
blogger_orig_url: https://www.marcusoft.net/2013/07/export-all-images-from-word-doc.html
---

## Export all images from a Word (.doc) document .. and rename them

During the summer, I faced a challenging task for [the book](http://bit.ly/theKanbanBook): "...and also, if you could hand us all the images in the book, thank you very much. Oh yeah, if you could name them CH01_01.png, CH01_02.png, etc., it would be great."

Yes, I felt a bit overwhelmed.

Since *Kanban In Action* now spans 13 chapters in different .doc files, I immediately realized two things:

- Marcus, you're foolish for not tracking these images somewhere.
- This is too massive to handle manually.

This post details how I tackled the problem. It took me about 2 hours in total.

### Export all files in a Word document

The chapters are written in .doc format (for some reason), but I remembered that the newer format .docx is essentially just a [zip-file](http://en.wikipedia.org/wiki/Zip_(file_format)). Maybe, just maybe, that could help me.

1. I saved the file as .docx.
2. Then I renamed the file to .zip and extracted the archive to a folder.
3. Lo and behold; in the \[Name of your Word document\]/word/media-folder, all the images were listed, in the order they appeared in the document.

The only downside, if you could call it that, was that the files were named: image1.png, image2.png, etc. That was the next task:

### Renaming a lot of files (on macOS)

I now had all the files from all the documents, in separate folders. That amounted to about 300 pictures. Yeah - *Kanban in Action* is graphic-heavy!

Renaming 300 pictures by hand was out of the question. Remember, they wanted each file to be named \[chapter number\]\_\[sequence number in chapter\].png. So, I found [this awesome video](http://answers.oreilly.com/topic/2619-renaming-multiple-files-in-mac-os-x/) that shows how to do that with Automator.

Here are the steps I followed:

1. Start Automator.
2. Choose New -> Application.
3. Search for "Rename Finder Items" and click OK.
4. Select "Don't add" in the dialog that asks if you want to create copies of the file. I didn't since I wanted to rename them.
5. In the drop-down, select "Replace text" and set up your replacement settings. Here's my example:

6. Save the application to a well-known place, for example, the desktop.

You have now created a little rename:er application. To it, you can drag the files you want to rename and ... presto - they will be renamed.
