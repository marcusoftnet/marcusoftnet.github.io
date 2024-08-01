---
layout: post
title: Well structured projects in Visual Studio 2005
date: 2006-11-07T06:31:00.000Z
author: Marcus Hammarberg
tags:
  - .NET
  - Visual Studio
modified_time: 2010-12-14T15:19:05.667Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5231053951955942248
blogger_orig_url: http://www.marcusoft.net/2006/11/well-structured-projects-in-visual.html
---

[![Project Structure Example 2](/img/project2.jpg)


[![Project Structure Example 1](/img/project1.jpg)

This might be an obvious thing for some, but I have missed its full potential for a while. And thank you, Stefan, for pointing it out to me.

There is a new feature in Visual Studio 2005 called Solution Folders. These are only a structural feature and do not affect the namespace or naming of the items within them. The primary use for Solution Folders was probably to hold things common to the whole solution, like snk files, build scripts, etc.

But another very nice feature is the ability to structure projects within the solution. Say that you have a number of projects (see top pictures to the left). Often, you will only be working in one project at a time, and it can be quite hard to get an overview of them. By simply introducing some solution folders, I've got an ordered view of my projects, in the calling order of the architecture (see top picture to the right). And nothing has changed in the naming of my folder.

The solution folder structure is saved completely within the solution file (.sln) and doesn't reflect the file system.

A solution folder is created by right-clicking anywhere on the solution file and then choosing Add → New Solution Folder. The projects are added by simply dragging them to the folder.

A final note: if a folder is added within a project, the folder name will become part of the namespace of the items in the folder. This can, of course, also be handy, but the difference needs to be understood.
