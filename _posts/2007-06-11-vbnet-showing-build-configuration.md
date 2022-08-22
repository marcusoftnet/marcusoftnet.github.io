---
layout: post
title: VB.NET showing build configuration
date: 2007-06-11T08:54:00.000Z
author: Marcus Hammarberg
tags:
  - VB.NET
  - Visual Studio
modified_time: 2010-12-14T15:19:05.578Z
thumbnail: >-
  http://2.bp.blogspot.com/\_kkDJOSPNTLs/Rm0PCEBiT0I/AAAAAAAAAKU/ujrCro_mLPc/s72-c/solutionprops2.JPG
blogger_id: tag:blogger.com,1999:blog-36533086.post-1604975735963282913
blogger_orig_url: http://www.marcusoft.net/2007/06/vbnet-showing-build-configuration.html
---


[<img
src="http://2.bp.blogspot.com/_kkDJOSPNTLs/Rm0PCEBiT0I/AAAAAAAAAKU/ujrCro_mLPc/s320/solutionprops2.JPG"
id="BLOGGER_PHOTO_ID_5074728883230756674"
style="DISPLAY: block; MARGIN: 0px auto 10px; CURSOR: hand; TEXT-ALIGN: center"
data-border="0" />](http://2.bp.blogspot.com/_kkDJOSPNTLs/Rm0PCEBiT0I/AAAAAAAAAKU/ujrCro_mLPc/s1600-h/solutionprops2.JPG)

<div>

Just found a solution to something that have confused and annoyed for a
while.

</div>

<div>

In VB.NET the current configuration (Debug/Release) is not shown. This
is quite confusing if you are setting properties on a project, for
instance. Which configuration are you setting the property for?

</div>

<div>

Here is the solution; it turns out that VB.NET is hiding the
configuration for you by default. So to show them again go:
Tools-\>Options-\>Projects and Solutions-\>Show advanced build
configurations

</div>
