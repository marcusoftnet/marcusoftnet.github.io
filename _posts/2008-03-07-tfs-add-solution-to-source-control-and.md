---
layout: post
title: TFS, Add solution to Source Control and some trouble along the way
date: 2008-03-07T07:29:00.005Z
author: Marcus Hammarberg
tags:
  - TFS
modified_time: 2010-12-14T15:20:33.322Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-7752698837169987400
blogger_orig_url: https://www.marcusoft.net/2008/03/tfs-add-solution-to-source-control-and.html
---

OK - this is a question that keeps coming back to me. Again and again.

When you add a solution to Source Control in Team Foundation Server (TFS) for the first time there are several ways with their respectively pros and cons. This is how I do it:

1. ith Source Control - create a folder hierarchy that is applicable for your project. Say for example `[ProjectName][SolutionName][Branch]`. For example `$\SakDotNet\BrevMallar\Main`
2. Now open the solution in Visual Studio
3. Right-click the solution and choose Add Solution to Source control... (Note! If you don't see that choice in the menu see below)
4. Source Control and Add file(s) for any additional files that not is included in the solution (or was missed by the way...)

Well - the simplest case is easy enough but if something goes wrong (as it just now did for me) there are some troubles that needs to be solved.

Just now for example I added my solution on a folder "too low" forming the path $\SakDotNet\BrevMallar\Main\Main to the .sln-file which of course is not what I want. So I did an Undo Checkout of everything but lo and behold when I tried to repeat the steps above the Add Solution to Source control did not appear. Why?

For some reason the connection to Source Control is included in the proj-files and the solution-files. To remove this dependency go:

1. Open the solution in Visual Studio
2. Select the solution file
3. Do File-\>Source control-\>Change Source Control.
4. Open the dialog box choose Unbind for all the projects
5. Now you can choose Add solution to Source control again according to the steps above
