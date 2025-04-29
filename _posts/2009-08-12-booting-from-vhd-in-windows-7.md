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
blogger_orig_url: https://www.marcusoft.net/2009/08/booting-from-vhd-in-windows-7.html
---

OK – I have been playing around for a while with my [Windows 7](http://www.microsoft.com/windows/windows-7/) and up to now I love it! It even got my old [Dell Precision M70](http://tbn1.google.com/images?q=tbn:uMf9EXIHxwjx2M:http://laptoplogic.com/data/resources/images/31/laptop.jpg) (4 years old and as many kilos) to look good again.

I am also trying to set up a lab environment for Visual Studio 2010 and TFS Server 2010 and found this [great video](http://channel9.msdn.com/shows/10-4/10-4-Episode-20-Downloading-and-Installing-Visual-Studio-2010-Beta-1/) and introduction on how to do that.

However, since my system is slow and low on memory, it doesn’t play too well with running the whole thing (Windows 2008 Server, SQL Server 2008, TFS Server 2010, and Visual Studio 2010) in [Virtual PC](http://www.microsoft.com/windows/virtual-pc/).

So I was very happy when I found [this post](http://www.hanselman.com/blog/LessVirtualMoreMachineWindows7AndTheMagicOfBootToVHD.aspx) from [Scott Hanselman](http://www.hanselman.com/). Here is an [excellent video](http://blogs.msdn.com/mikekol/archive/2009/05/14/the-virtualization-nation-podcast-episode-3-want-to-boot-a-physical-computer-from-a-vhd.aspx) that shows you how it’s done.

In short, there is now support to boot from a VHD (Virtual Hard Drive) and even to create a VHD file from an ISO… Cool! Really cool!

**[UPDATED]**

Brrr... that was harder than I first thought. But with [some help from Mr. Hanselman](http://www.hanselman.com/blog/StepByStepTurningAWindows7DVDOrISOIntoABootableVHDVirtualMachine.aspx) again, and by downloading loads and loads of GBs (Windows 7 AIK, I never thought that I would download such things ...), I finally got it to work. By the way, here is my command line:

```bash
cscript wim2vhd.wsf /wim:C:\VHDs\VS2010\2008Server\sources\install.wim /sku:SERVERENTERPRISE /vhd:C:\VHDs\VS2010\vs2010beta.vhd
```
