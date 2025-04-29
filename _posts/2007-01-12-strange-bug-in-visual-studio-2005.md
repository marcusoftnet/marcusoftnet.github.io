---
layout: post
title: Bug in Visual Studio 2005
date: 2007-01-12T11:35:00.000Z
author: Marcus Hammarberg
tags:
  - .NET
  - Visual Studio
modified_time: 2010-12-14T15:19:05.651Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-1255301533495986662
blogger_orig_url: http://www.marcusoft.net/2007/01/strange-bug-in-visual-studio-2005.html
---

Just started to do some serious development with Windows Forms in
Visual Studio 2005. A bug showed it's ugly face. Here is how it goes:

In your windows application project you create some usercontrols. They
appear in the toolbox for you to use in all your forms. Everbody is
happy!

But when you put your windows application project into a [solution
folder](http://marcushammarberg.blogspot.com/2006/11/well-structured-projects-in-visual.html)
this doesn't work anymore... This is [confirmed by
Microsoft](https://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=144156)
and not corrected with Visual Studio 2005 SP1.

There are some suggestions for
[workarounds](https://connect.microsoft.com/VisualStudio/feedback/Workaround.aspx?FeedbackID=144156)
and the one that I tried was to add toolbox items by referencing the
output of my windows application. But then I got another problem, a
warning something like:
"The type \[usercontrol\] in '\[my output\]' conflicts with the imported
type \[usercontrol\] in '\[my output\]'"

So - the solution to this problem was to suppress this warning (0436) in
the application configuration (Properties-\>Build-tab-\>Errors and
warnings).

It's not nice but it works and it's far better than to have all your
projects in the root of your solution.
