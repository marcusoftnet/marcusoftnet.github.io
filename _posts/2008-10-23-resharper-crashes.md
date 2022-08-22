---
layout: post
title: ReSharper crashes
date: 2008-10-23T11:07:00.001+02:00
author: Marcus Hammarberg
tags:
  - TFS -
MSBuild
modified_time: 2010-12-14T16:21:03.989+01:00
blogger_id: tag:blogger.com,1999:blog-36533086.post-1497074953926190551
blogger_orig_url: http://www.marcusoft.net/2008/10/resharper-crashes.html ---

First and foremost- I love
<a href="http://www.jetbrains.com/resharper/" target="_blank">Resharper
(4.0)</a>, but I think that some small flaws are still there and does
bad things...

Two things are at the top of my list (in all honesty I must admit that I
can't be 100% sure that ReSharper has to do with this but both of them
has occurred after I've installed ReSharper):

-   ASPX-pages are very, very slow to load in design-mode. It can take
    about a minute to switch from the html-code to the design-view
-   The Build supervisor (you know, the view where you stare at the
    progress of the build, keep your fingers crossed and hopes for only
    green dots...) crashes very frequently.

I have reported these bugs to ReSharper and hope that a fix will be
available to fix this. I still love Resharper though.

Oh yeah - that's right - I found that the
<a href="http://www.devbiz.com/teamplain/" target="_blank">TFS Web
Access</a> has some great view of the build progress in the browser,
where Resharper cannot touch it. So I created a link there which works
great:

> <http://%5BTSFWebAccessServer%5D/UI/Pages/Build/Explorer.aspx?pid=%5ByourProjectID>\]
