---
layout: post
title: Long running debug-sessions in Visual Studio 2005
date: 2007-05-15T08:42:00.000Z
author: Marcus Hammarberg
tags:
  - Visual Studio
modified_time: 2010-12-14T15:19:05.612Z
thumbnail: >-
  http://4.bp.blogspot.com/\_kkDJOSPNTLs/Rkl1GoeKfrI/AAAAAAAAAI8/2uBiQjIj2nY/s72-c/solutionprops.JPG
blogger_id: tag:blogger.com,1999:blog-36533086.post-692377622613333906
blogger_orig_url: http://www.marcusoft.net/2007/05/long-running-debug-sessions-in-visual.html
---


<div>

I think i finally found a solution to a very annoying problem. As always
the solution (once found) was almost trivial...

</div>

<div>

Here's the problem; in many modern system architectures there are at
least one webservice involved, sometimes more than one that call each
other in sequence. When such a system is debugged in Visual Studio it
now-a-days works very fine.

</div>

<div>

But... if you have a long running debugging session (like, for example,
yesterday when i demonstrated some features for my team) the debugging
fails all of a sudden with a time-problem. The error description doesn't
point you to anything good either.

</div>

<div>

However - some colleagues of mine showed me the possiblity to start
several projects at once when debugging. Right-click the solution in
Visual Studio 2005 and choose properties. Then go Common Properties -\>
<span id="SPELLING_ERROR_0" class="blsp-spelling-corrected">Start
up projects. Here you can choose which projects to start when you
debug your solution. Select to start the web service (s) and any other
projects (the client for example) under Multiple Start up
projects as shown below:

</div>

<img
src="http://4.bp.blogspot.com/_kkDJOSPNTLs/Rkl1GoeKfrI/AAAAAAAAAI8/2uBiQjIj2nY/s320/solutionprops.JPG"
id="BLOGGER_PHOTO_ID_5064708012758433458"
style="DISPLAY: block; MARGIN: 0px auto 10px; CURSOR: hand; TEXT-ALIGN: center"
data-border="0" />

<div>

This will start the projects each time you start the project.

</div>

<div>

This also solves the problem of the web service not being started
when you are debugging into it. Very annoying and very easy to forget...

</div>
