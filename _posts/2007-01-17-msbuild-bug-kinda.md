---
layout: post
title: MSBuild bug (kinda...)
date: 2007-01-17T08:10:00.000Z
author: Marcus Hammarberg
tags:
  - .NET
  - Visual Studio
modified_time: 2010-12-14T15:19:05.648Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-3510217219276168876
blogger_orig_url: http://www.marcusoft.net/2007/01/msbuild-bug-kinda.html
---


At the start
of this year my buildscripts ran into some serious trouble all of a
sudden. And the day after this ugly error showed it's horrible face when
I compiled the code:

"Error emitting 'System.Reflection.AssemblyVersionAttribute' attribute
-- 'The version specified '1.6.70102.1' is invalid "

What now? I know that nobody was here and changed code during the New
Years Eve, and certainly not the day after, if you know what i mean.

It proves to be a flaw (nicer way of saying bug) in the assembly version
handling of MSBuild, or actually the versioning of assemblies in
Windows:

The version numbers consists of four parts MAJOR.MINOR.BUILD.REVISION.
These are all WORDS (16-bit) and not DWORD (32-bit). That means that it
can hold numbers up to ca 65000.

A very common practice is to have the BUILD-part of the number set to a
date. And since dates are converted like so:

<div align="center">

"2007-01-01" -\> "070101" -\> 70101

<div align="left">

<div align="left">

we can clearly see that 70101 is a bigger number than 65000.

<div align="left">

<div align="left">

So here you have it - the MSBuild-version of the
Y2k-problem but rather Y2007-problem to be exact.

<div align="left">

<div align="left">

The solutions are plentiful and very innovative, for example:

- <div align="left">

   [http://forums.microsoft.com/MSDN/ShowPost.aspx?PostID=1066500&<span
    id="SPELLING_ERROR_2" class="blsp-spelling-error"
    onclick="BLOG_clickHandler(this)">SiteID=1](http://forums.microsoft.com/MSDN/ShowPost.aspx?PostID=1066500&SiteID=1)
   </div>

- <div align="left">

   [http://forums.microsoft.com/MSDN/ShowPost.aspx?PostID=940650&<span
    id="SPELLING_ERROR_3" class="blsp-spelling-error"
    onclick="BLOG_clickHandler(this)">SiteID=1](http://forums.microsoft.com/MSDN/ShowPost.aspx?PostID=940650&SiteID=1)
   </div>

But they all suffers from the flaw that you need to distribute any
solution to all the computers that ever build the solution (i.e. the
developers).

My solution is to just increment the build-number and not base it on
dates. This is not to good either but works for now
