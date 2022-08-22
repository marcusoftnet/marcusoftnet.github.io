---
layout: post
title: VSTS bug... or is it?
date: 2007-05-10T05:41:00.000Z
author: Marcus Hammarberg
tags:
  - Life of a consultant
  - TFS
  - Visual Studio
modified_time: 2010-12-14T15:19:05.616Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5387902116615166560
blogger_orig_url: http://www.marcusoft.net/2007/05/vsts-bug-or-is-it.html
---


In my
current project we are using Visual Studio Team System (VSTS) which i
mostly like. But there have been some confusion and frustration
concerning the Source Control part of it.

Let me already here say that this might (indications of this exists) be
a misunderstanding of the concepts from my part. But i was very confused
to find that when a file is checked out it doesn't automatically get the
latest version of the file down to my disc. In my book this is the
essence of how Source Control systems works.

More confusion arose when i found out that this is [by
design](http://blogs.msdn.com/buckh/archive/2005/08/20/454140.aspx)...
and that you can't [turn it
off.](http://myvstsblog.com/archive/2007/03/25/Get-Latest-on-Checkout-_2D00_-now-and-in-the-future.aspx)
I think this is very strange. When a do a Check Out i of course want the
latest version of the file.

However it turns out that this confuses my team at lot and we have now
found a
[plug-in](http://blogs.microsoft.co.il/files/folders/leon/entry10828.aspx)
for Visual Studio that [automatically get the latest
version](http://blogs.microsoft.co.il/blogs/srlteam/archive/2007/03/24/TFS-GetLatest-version-on-check_2D00_out-Add_2D00_In.aspx)
of a file you are checking out.
