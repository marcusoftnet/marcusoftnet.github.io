---
layout: post
title: Show current file in solution
date: 2008-03-05T11:52:00.005Z
author: Marcus Hammarberg
tags:
  - VB.NET
modified_time: 2010-12-14T15:20:33.358Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-3325496387399004688
blogger_orig_url: http://www.marcusoft.net/2008/03/show-current-file-in-solution.html
---

Ooooh - so nice. And so easy now when I know how to do it...

When you get large solutions and there are loads and loads of files in the Solution Explorer you'll sometimes (often, in my case) get confused on where you are...

I [organize my projects in Solution Folders](http://marcushammarberg.blogspot.com/2006/11/well-structured-projects-in-visual.html) but still get quite hard to follow, especially when you are the co-driver...

But it turns out to be easy to solve. There is a setting in the Options-dialog of the Studio (both 2005 and 2008, luckily) that is called Track Active item in Solution Explorer. When this is checked the file you currently is watching is found and highlighted the Solution Explorer which greatly reduces confusion on where you are.

The setting is found under `Tools->Options->Project and Solutions->General->Track Active item in Solution Explorer`
