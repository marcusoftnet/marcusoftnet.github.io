---
layout: post
title: Battle of the TFS build script
date: 2007-05-31T06:59:00.000Z
author: Marcus Hammarberg
tags:
  - TFS
  - MSBuild
  - Visual Studio
modified_time: 2010-12-14T15:19:05.589Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-900809608655174297
blogger_orig_url: http://www.marcusoft.net/2007/05/battle-of-tfs-build-script.html
---

I
have under the last days trying to get our build script to work....

What we are trying to do is simple enough, but I can't understand
how to use the build mechanism in Team System to do what I want... We
want to do the following:

- Compile all projects
- Update some config-files
- Run VSTS-tests
- Publish a ClickOnce-application and deploy
  it to a "latest version" folder
- Generate documentation

It's the ClickOnce-part that's not working and
<span id="SPELLING_ERROR_5" class="blsp-spelling-corrected">I've
got an confirmation from Microsoft that what we want to do not is
supported by default in VSTS. You need some third part
products.

I think I am a solution in the tracks but there is still some things
left. I'll post a solution when (if???) I find it.

In my research so far I have had great use of the following resources:

- <http://blogs.vertigosoftware.com/teamsystem/default.aspx>
- <http://blogs.msdn.com/gautamg/archive/2006/01/04/509146.aspx>
- <http://blogs.msdn.com/echarran/archive/2006/08/09/693284.aspx>
