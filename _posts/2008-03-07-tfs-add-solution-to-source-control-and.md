---
layout: post
title: TFS, Add solution to Source Control and some trouble along the way
date: '2008-03-07T08:29:00.005+01:00'
author: Marcus Hammarberg
tags:
  - TFS
modified_time: '2010-12-14T16:20:33.322+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-7752698837169987400
blogger_orig_url: http://www.marcusoft.net/2008/03/tfs-add-solution-to-source-control-and.html
---

OK - this is a question that keeps coming back to me. Again and
again.

When you add a solution to Source Control in Team Foundation Server
(TFS) for the first time there are several ways with their respectively
pros and cons. This is how i do it:

1. ith Source Control - create a folder hiearchy that is applicable
    for your project. Say for example <span
    style="font-family:courier new;">$\\\[ProjectName\]\\\[SolutionName\]\\\[Branch\].
    For example <span
    style="font-family:courier new;">$\SakDotNet\BrevMallar\Main
2. ow open the solution in Visual Studio
3. igh-click the solution and choose Add Solution to Source
    control...
    (Note! If you don't see that choice in the menu see below)
4. se Source Control and Add file(s) for any additional files that not
    is included in the solution (or was missed by the way...)

Well - the simplest case is easy enough but if something goes wrong (as
it just now did for me) there are some troubles that needs to be solved.

Just now for example i added my solution on a folder "too low" forming
the path $\SakDotNet\BrevMallar\Main\Main
to the .sln-file which of course is not what i want. So i did an
Undo Checkout of everything but lo and behold when i tried to repeat the
steps above the Add Solution to Source control did not appear. Why?

For some reason the connection to Source Control is included in the
proj-files and the solution-files. To remove this dependency go:

1. pen the solution in Visual Studio
2. elect the solution file
3. o File-\>Source control-\>Change Source Control.
4. n the dialog box choose Unbind for all the projects
5. ow you can choose Add solution to Source control again according to
    the steps above
