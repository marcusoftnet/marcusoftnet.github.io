---
layout: post
title: Booting from a VHD in Windows 7
date: 2009-08-12T08:35:00.002Z
author: Marcus Hammarberg
tags:
  - Tools
  - Life of a consultant
modified_time: 2010-12-14T15:22:38.195Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-7385064068883905711
blogger_orig_url: http://www.marcusoft.net/2009/08/booting-from-vhd-in-windows-7.html
---


OK – I have been playing around for a while with my
<a href="http://www.microsoft.com/windows/windows-7/"
target="_blank">Windows 7</a> and up to now I love it! It even got my
old <a
href="http://tbn1.google.com/images?q=tbn:uMf9EXIHxwjx2M:http://laptoplogic.com/data/resources/images/31/laptop.jpg"
target="_blank">Dell Precision M70</a> (4 years old and as many kilos)
to look good again.

I am also trying to setup a lab environment for Visual Studio 2010 and
TFS Server 2010 and found this <a
href="http://channel9.msdn.com/shows/10-4/10-4-Episode-20-Downloading-and-Installing-Visual-Studio-2010-Beta-1/"
target="_blank">great video</a> and introduction on how to do that.

However, since my system is slow and low on memory, it doesn’t play to
well with running the whole thing (Windows 2008 Server, SQL Server 2008,
TFS Server 2010 and Visual Studio 2010) in
<a href="http://www.microsoft.com/windows/virtual-pc/"
target="_blank">Virtual PC</a>.

So I was very happy when I found <a
href="http://www.hanselman.com/blog/LessVirtualMoreMachineWindows7AndTheMagicOfBootToVHD.aspx"
target="_blank">this post</a> from
<a href="http://www.hanselman.com/" target="_blank">Scott Hanselman</a>.
Here is an <a
href="http://blogs.msdn.com/mikekol/archive/2009/05/14/the-virtualization-nation-podcast-episode-3-want-to-boot-a-physical-computer-from-a-vhd.aspx"
target="_blank">excellent video</a> that shows you how it’s done.

In short there is now support to boot from a VHD (Virtual Hard Drive)
and even to create a VHD-file from an ISO…

Cool! Really cool!

**\[UPDATED\]
<span class="Apple-style-span" style="font-weight: normal">Brrr... that
was harder than I first thought. But with <a
href="http://www.hanselman.com/blog/StepByStepTurningAWindows7DVDOrISOIntoABootableVHDVirtualMachine.aspx"
target="_blank">some help from mr Hanselman</a> again, and by
downloading loads and loads of GBs (Windows 7 AIK, I never thought that
I would download such things ...) I finally got it to work. By the way,
here is my command line:**

> cscript wim2vhd.wsf /wim:C:\VHDs\VS2010\2008Server\sources\install.wim
> /sku:SERVERENTERPRISE /vhd:C:\VHDs\VS2010\vs2010beta.vhd
