---
layout: post
title: AddIn - problem and solutions
date: 2007-06-27T06:00:00.001Z
author: Marcus Hammarberg
tags:
  - VB.NET
  - Visual Studio
modified_time: 2010-12-14T15:19:05.559Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-6945667093817128955
blogger_orig_url: http://www.marcusoft.net/2007/06/addin-problem-and-solutions.html
---


I
ran into some problems when creating my addin. Here are the solution to
them:

1. When i used the OutputTaskItemString the items was shown in the
    Error list, but when i double clicked on them nothing happened. I
    also noticed that only the first error was shown in the
    Output-window, where all the errors was supposed to be shown.
   This was a real small but annoying problem. The strings you write to
    the output window (and to the task) needs to end with a newline.
    Quite obvious when you know it. When i changed that everything
    worked out just dandy
2. Deploying my add-in was (and maybe still is) a pain. Mostly this
    probably has to do with that my current customer has the My
    Documents-folder on a network share, but i am not sure.
   I found two good articles surrounding this:
    <http://www.codeproject.com/useritems/AddinCustomAction.asp> and
    <http://msdn2.microsoft.com/en-us/library/19dax6cz(VS.80).aspx>.

Just some updates if you ever build an add-in of this kind
