---
layout: post
title: Export all images from a Word (.doc) document
... and rename them
date: 2013-07-29T10:50:00.001+02:00
author: Marcus Hammarberg
tags:
  - Tools
  - Life of a consultant
modified_time: 2013-07-29T10:50:31.650+02:00
thumbnail: http://1.bp.blogspot.com/-B2MKCS6z8U8/UfYsaPJa9_I/AAAAAAAABjs/0WLSFog_0ig/s72-c/Screen+Shot+2013-07-29+at+10.48.11+.png
blogger_id: tag:blogger.com,1999:blog-36533086.post-7497639516539350498
blogger_orig_url: http://www.marcusoft.net/2013/07/export-all-images-from-word-doc.html
---



<div dir="ltr" style="text-align: left;" trbidi="on">

During the summer I was handed a delicate task for
<a href="http://bit.ly/theKanbanBook" target="_blank">the book</a>: "...
and also, if you could hand us all the images in the book, thank you
very much. Oh yeah, if you could name them CH01_01.png, CH01_02.png etc
it would be great."

<div>
</div>

<div>

Yes I felt a bit like:

</div>

<div class="separator" style="clear: both; text-align: center;">

</div>

<div>

<div>
</div>

<div>

Since Kanban In Action now have 13 chapters in different .doc-files I
immediately realized two things:

</div>

<div>

-   Marcus - your are stupid for not tracking these images somewhere
-   This is to big to do manually

<div>

This post describes how I did. It took me about 2 hours all together.

</div>

<div>
### Export all files in a Word document

</div>

<div>

The chapters are written in .doc formats (for some reason), but I seem
to recall that the newer format .docx in reality is just a
<a href="http://en.wikipedia.org/wiki/Zip_(file_format)"
target="_blank">zip-file</a>. Maybe, just maybe, that could help me. 

</div>

<div>

1.  I "Save as..."'ed the file to .docx.
2.  Then I renamed the file to .zip and extracted the archive to a
    folder. 
3.  Low and behold; in the \[Name of your word
    document\]/word/media-folder all the images were listed. In the
    order they appeared in the document. 

<div>

The only downside, if you could call it that, was that the files were
named: image1.png, image2.png etc. That was the task up next:

</div>

</div>

### Renaming a lot of files (on OSX)

<div>

I now had all the files from all the documents, in separate folders.
That amounted to about 300 pictures. Yeah -
<a href="http://bit.ly/theKanbanBook" target="_blank">Kanban in
Action</a> is graphic-heavy!

</div>

<div>
</div>

<div>

300 pictures is way more than I care to rename by hand. Remember that
they wanted each file to be named <span
style="font-family: Courier New, Courier, monospace;">\[chapter
number\]\_\[sequence number in chapter\].png. <span
style="font-family: inherit;">I then found <a
href="http://answers.oreilly.com/topic/2619-renaming-multiple-files-in-mac-os-x/"
target="_blank">this awesome video</a> that shows how to do that with
Automator. 

</div>

<div>

<span style="font-family: inherit;">


</div>

<div>

<span style="font-family: inherit;">Here are the steps I ended up
using:

</div>

<div>

1.  Start Automator
2.  Choose New-\>Application
3.  Search for "Rename Finder Items" and click OK
4.  Select "Don't add" in the dialog that ask you if you want to create
    copies of the file. I didn't since I wanted to rename them
5.  In the drop down select "Replace text" and do your replacement
    settings. Here are my example:
    <div class="separator" style="clear: both; text-align: center;">
   <a
    href="http://1.bp.blogspot.com/-B2MKCS6z8U8/UfYsaPJa9_I/AAAAAAAABjs/0WLSFog_0ig/s1600/Screen+Shot+2013-07-29+at+10.48.11+.png"
    data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
    src="http://1.bp.blogspot.com/-B2MKCS6z8U8/UfYsaPJa9_I/AAAAAAAABjs/0WLSFog_0ig/s320/Screen+Shot+2013-07-29+at+10.48.11+.png"
    data-border="0" width="320" height="142" /></a>
   </div>
6.  Save the application to a wellknown place, for example the desktop.

<div>

You have now created a little renamer application. To it you can drag
the files you want to rename and ... presto - they will be ranamed. 

</div>

</div>

<div>

<span style="font-family: inherit;">


</div>

</div>

</div>

</div>
