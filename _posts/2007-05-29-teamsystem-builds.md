---
layout: post
title: TeamSystem Builds
date: 2007-05-29T06:04:00.000Z
author: Marcus Hammarberg
tags:
  - TFS
  - MSBuild
modified_time: 2007-09-25T06:09:36.661Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-1383699674345464248
blogger_orig_url: https://www.marcusoft.net/2007/05/teamsystem-builds.html
---

I have dived into Team System and more specific the build process. It's quite hard to take in, I think, especially since the documentation is quite ... economical.

But I hope that the question marks I have will be straighten out in a couple of days. We will get assistance from a MS-guy who is coming here.

I the mean time I have found, got and compiled some links that can, hopefully contain some useful documentation stuff that I missed when i started off:

- [Microsoft own description](<http://msdn2.microsoft.com/en-us/library/ms400710(VS.80).aspx>) and [more here](<http://msdn2.microsoft.com/en-us/library/ms400688(VS.80).aspx>)
- [A list of all events that you can "override" for Team System in the msbuild project file](http://blogs.msdn.com/nagarajp/archive/2005/10/27/485980.aspx)
- [The order of which the events are fired](http://blogs.msdn.com/nagarajp/archive/2005/11/03/488876.aspx)
- [How to create a manifest-file with msbuild](http://blogs.msdn.com/echarran/archive/2006/08/09/693284.aspx)
- [How to do a ClickOnce-deployment from the msbuild-script](http://blogs.vertigosoftware.com/teamsystem/archive/2007/02/20/Incorporating_a_ClickOnce_Application_into_your_Team_Build.aspx)

The big thing to find out right now is how to incorporate a   ClickOnce-deployment in the build-script, in such a way that you get the latest version of the application automatically. I post the solution when it is found - it is probably easy, just that I don't get it...
