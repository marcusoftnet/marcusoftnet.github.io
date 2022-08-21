---
layout: post
title: Move files at regular intervals on OSX date: '2013-08-19T15:05:00.002+02:00'
author: Marcus Hammarberg
tags: -
Tools
  - Life of a consultant
modified_time: '2013-08-19T15:05:55.135+02:00' thumbnail:
http://1.bp.blogspot.com/-BxLlj7TR9Vg/UhISm_Lq0JI/AAAAAAAABmY/TNAiogmrJo8/s72-c/Screen+Shot+2013-08-19+at+14.41.50+.png
blogger_id: tag:blogger.com,1999:blog-36533086.post-7696849555794418675
blogger_orig_url: http://www.marcusoft.net/2013/08/move-files-at-regular-intervals-on-osx.html
---


<div dir="ltr" style="text-align: left;" trbidi="on">

I've been starting to use <a href="http://support.apple.com/kb/HT2488"
target="_blank">Automator</a> for some tasks that I commonly do and it's
actually quite capable although a bit convoluted and secretive.

In this post I'll describe how to "write" a little task that moves files
from one folder to another on a set schedule. I'm using this to move
photos from my DropBox-folder to my SkyDrive-folder. This is done since
I sync photos to DropBox and it fills up after awhile. And yes - I
understand that this problem will come back for SkyDrive.

Ok - here we go:



### Automating moving files 

<table class="tr-caption-container" data-cellpadding="0"
data-cellspacing="0"
style="float: right; margin-left: 1em; text-align: right;">
<colgroup>
<col style="width: 100%" />
</colgroup>
<tbody>
<tr class="odd">
<td style="text-align: center;"><a
href="http://1.bp.blogspot.com/-BxLlj7TR9Vg/UhISm_Lq0JI/AAAAAAAABmY/TNAiogmrJo8/s1600/Screen+Shot+2013-08-19+at+14.41.50+.png"
data-imageanchor="1"
style="clear: right; margin-bottom: 1em; margin-left: auto; margin-right: auto;"><img
src="http://1.bp.blogspot.com/-BxLlj7TR9Vg/UhISm_Lq0JI/AAAAAAAABmY/TNAiogmrJo8/s1600/Screen+Shot+2013-08-19+at+14.41.50+.png"
data-border="0" /></a></td>
</tr>
<tr class="even">
<td class="tr-caption" style="text-align: center;">The trigger
happy<br />
Automator robot </td>
</tr>
</tbody>
</table>

<div>

Open Automator - I still have a problem with that cute robot holding a
bazooka. I want to move files not blow them to heaven come. Well, well -
open the Automator application. 

</div>

<div>



</div>

<div>



</div>

<div>

You are now greeted with a big dialog that asks you to pick a "Type for
your document". This is a question that at least I didn't know how to
answer but you could go with Workflow or Application - both will work
for our objectives. I picked Workflow. 

</div>

#### Find the files

<div>

Now search for a couple of Actions in the search box. First we need to
find the finder items that we want to move ("Find Finder Items" is the
name of that action).  Double-click that action and it will appear in
the area to the right. 

</div>

<div>



</div>

<div>

Now you can configure where the Find Finder Items action is going to
look and based on which criteria the selection shall be done. My task
looks in the /Dropbox/Camera uploads/ folder and selects all the files
that is "not in the last 1 months". There's loads of combinations and
opportunities for the selection. 

</div>

<div>



</div>

<div>

**Watch out!** I had some trouble to get the
<a href="http://www.nickshubin.com/articles/mac/find_finder_item.html"
target="_blank">Find Finder Items action to work</a>. In the end I had
to re-index my
<a href="http://support.apple.com/kb/ht2409" target="_blank">search
index for spotlight</a>.  

</div>

#### Move the files

<div>

To move the files we need another action called: "Move Finder Items".
Search for it and doubleclick it. You can then configure where you want
the files moved to. "Which files?", you might wonder. Well the files
that you've sent to the action. It's selected with the Find Finder
items. 

</div>

<div>



</div>

<div>

When you're done your complete application looks like this:

</div>

<div>

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://4.bp.blogspot.com/-C59ead7LJrg/UhIUivOlvZI/AAAAAAAABmk/8ZDF8z8qxG4/s1600/Screen+Shot+2013-08-19+at+14.50.09+.png"
data-imageanchor="1"
style="margin-left: 1em; margin-right: 1em; text-align: center;"><img
src="http://4.bp.blogspot.com/-C59ead7LJrg/UhIUivOlvZI/AAAAAAAABmk/8ZDF8z8qxG4/s320/Screen+Shot+2013-08-19+at+14.50.09+.png"
data-border="0" width="320" height="184" /></a>

</div>

<div>

</div>

<div class="separator" style="clear: both; text-align: left;">

Save the application with a suitable name: MovePhotos.application for
example. 

</div>

</div>

### Scheduling jobs with ... iCal?

<div>

The second part of the story is to run this task on a recurring basis.
Weekly for me, but choose your poison. This is strangely enough done
with iCal. Yes - the calendar application. (You can do this at the
terminal but hey - this is the graphical guide). 

</div>

<div>



</div>

<div>

Here is how it's done:

</div>

<div>

Open iCal

Create a new calendar (File -\> New Calendar -\> On my Mac). Call it
"Scheduled applications" or something that helps you understand which
calendar it is. 

Create a new event on the day and time when you want the application to
run. For example on a Friday at 0830. 

Double click the event and set the following:

1.  Repeat - how often you want this to run. I choose weekly
2.  Calendar - set it in "Scheduled applications" so that you don't have
    to see these events.
3.  Under "Alert" chose "Open file" and then the application that you
    have created with Automator above. 
4.  Give the event a suitable name. "Move photos" for example. 

Done

### Conclusion

</div>

<div>

This actually works very nicely for me. But it took me a couple of hours
to figure out. Now you don't have to endure the same pain. And me
neither when I look again. 

</div>

</div>
