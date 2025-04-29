---
layout: post
title: Find missing VB.NET documentation
date: 2007-06-25T13:15:00.000Z
author: Marcus Hammarberg
tags:
  - VB.NET
  - Tools
  - Visual Studio
modified_time: 2010-12-14T15:22:38.352Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5986658430063569109
blogger_orig_url: https://www.marcusoft.net/2007/06/find-missing-vbnet-documentation.html
---

As frequent readers of this blog probably have [noticed](http://marcushammarberg.blogspot.com/search/label/VB.NET), I am not that impressed with VB.NET. Don't get me wrong it is a great language but I think that there are a lot of improvements in Visual Studio for C# that you are missing when you're using VB.NET.

One of those things you miss is the possibility to get warning for missing and faulty XML comments used for documentation with for example NDoc. I wrote [about this before](http://marcushammarberg.blogspot.com/2007/06/vbnet-warnings-for-xml-documentation.html) and won't go into anymore details - but you can't get these warnings and it sucks.
So - I have now hacked together an add-in for Visual Studio that finds missing and empty XML comments in VB.NET. The tool reports everything missing on all public and protected code-objects as tasks in the task list (see picture).

For our, quite big solution (11 projects, 55 000 lines of code) it takes about 5 seconds so it could very well be included in the normal build from the studio.

Anyone interested in this add-in you can have it by writing to me on `marcus (dot) hammarberg (at) avega (dot) se.`
