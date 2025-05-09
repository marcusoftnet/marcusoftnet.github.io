---
layout: post
title: Long running debug-sessions in Visual Studio 2005
date: 2007-05-15T08:42:00.000Z
author: Marcus Hammarberg
tags:
  - Visual Studio
modified_time: 2010-12-14T15:19:05.612Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-692377622613333906
blogger_orig_url: https://www.marcusoft.net/2007/05/long-running-debug-sessions-in-visual.html
---

I think I finally found a solution to a very annoying problem. As always the solution (once found) was almost trivial...

Here's the problem; in many modern system architectures there are at least one web service involved, sometimes more than one that call each other in sequence. When such a system is debugged in Visual Studio it now-a-days works very fine.

But... if you have a long running debugging session (like, for example, yesterday when I demonstrated some features for my team) the debugging fails all of a sudden with a time-problem. The error description doesn't point you to anything good either.

I think i finally found a solution to a very annoying problem. As always the solution (once found) was almost trivial...

However - some colleagues of mine showed me the possibility to start several projects at once when debugging. Right-click the solution in Visual Studio 2005 and choose properties. Then go `Common Properties -> Startup projects`. Here you can choose which projects to start when you debug your solution. Select to start the web service (s) and any other
projects (the client for example) under Multiple Start up projects as shown below:

Here's the problem; in many modern system architectures there are at least one web service involved, sometimes more than one that call each other in sequence. When such a system is debugged in Visual Studio it now-a-days works very fine.

But... if you have a long running debugging session (like, for example, yesterday when i demonstrated some features for my team) the debugging fails all of a sudden with a time-problem. The error description doesn't point you to anything good either.

However - some colleagues of mine showed me the possibility to start several projects at once when debugging. Right-click the solution in Visual Studio 2005 and choose properties. Then go Common Properties - Start up projects. Here you can choose which projects to start when you debug your solution. Select to start the web service (s) and any other projects (the client for example) under Multiple Start up projects as shown below:

This will start the projects each time you start the project.

This also solves the problem of the web service not being started when you are debugging into it. Very annoying and very easy to forget...
