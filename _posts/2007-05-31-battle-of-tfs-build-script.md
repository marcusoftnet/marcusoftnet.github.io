---
layout: post
title: Battle of the TFS build script
date: '2007-05-31T08:59:00.000+02:00'
author: Marcus Hammarberg
tags: - TFS -
MSBuild - Visual Studio
modified_time: '2010-12-14T16:19:05.589+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-900809608655174297
blogger_orig_url: http://www.marcusoft.net/2007/05/battle-of-tfs-build-script.html
---

I
have under the last days trying to get our build script to work....

What we are trying to do is simple <span>="blsp-spelling-corrected">enough</span>, but i can't understand
how to use the build mechanism in Team System to do what i want... We
want to do the following:

-   Compile all projects
-   Update some <span>config</span>-files
-   Run <span>VSTS</span>-tests
-   Publish a <span>ClickOnce</span>-application and deploy
    it to a "latest version" folder
-   Generate documentation

It's the <span>="blsp-spelling-error">ClickOnce</span>-part that's not working and
<span id="SPELLING_ERROR_5" class="blsp-spelling-corrected">I've</span>
got an confirmation from Microsoft that what we want to do not is
supported by default in <span>="blsp-spelling-error">VSTS</span>. You need some third part
products.

I think i am a solution in the tracks but there is still some things
left. I'll post a solution when (if???) i find it.

In my research so far i have had great use of the following <span
id="SPELLING_ERROR_7" class="blsp-spelling-corrected">resources</span>:

-   <http://blogs.vertigosoftware.com/teamsystem/default.aspx>
-   <http://blogs.msdn.com/gautamg/archive/2006/01/04/509146.aspx>
-   <http://blogs.msdn.com/echarran/archive/2006/08/09/693284.aspx>
