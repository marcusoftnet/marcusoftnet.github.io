---
layout: post
title: Find missing VB.NET documentation
date: 2007-06-25T15:15:00.000+02:00
author: Marcus Hammarberg
tags:
  - VB.NET
  - Tools
  - Visual Studio
modified_time: 2010-12-14T16:22:38.352+01:00
thumbnail: http://2.bp.blogspot.com/\_kkDJOSPNTLs/RoCpLUBiT5I/AAAAAAAAAK8/3lnzgbsdAPI/s72-c/docfinder.JPG
blogger_id: tag:blogger.com,1999:blog-36533086.post-5986658430063569109
blogger_orig_url: http://www.marcusoft.net/2007/06/find-missing-vbnet-documentation.html
---

[<img
src="http://2.bp.blogspot.com/_kkDJOSPNTLs/RoCpLUBiT5I/AAAAAAAAAK8/3lnzgbsdAPI/s400/docfinder.JPG"
id="BLOGGER_PHOTO_ID_5080246391492726674"
style="DISPLAY: block; MARGIN: 0px auto 10px; CURSOR: hand; TEXT-ALIGN: center"
data-border="0" />](http://2.bp.blogspot.com/_kkDJOSPNTLs/RoCpLUBiT5I/AAAAAAAAAK8/3lnzgbsdAPI/s1600-h/docfinder.JPG)
As frequent readers of this blog probably have
[noticed](http://marcushammarberg.blogspot.com/search/label/VB.NET), i
am not that impressed with VB.NET. Don't get me wrong it is a great
language but i think that there are a lot of improvements in Visual
Studio for C# that you are missing when you're using VB.NET.

<div>
<div>

One of those things you miss is the possibility to get warning for
missing and faulty XML comments used for documentation with for example
NDoc. I
wrote [about this
before](http://marcushammarberg.blogspot.com/2007/06/vbnet-warnings-for-xml-documentation.html)
and won't go into anymore details - but you can't get these warnings and
it sucks.




So - i have now hacked together an add-in for Visual Studio that finds
missing and empty XML comments in VB.NET. The tool reports everything
missing on all public and protected code-objects as tasks in the task
list (see picture).




For our, quite big solution (11 projects, 55 000 lines of code) it takes
about 5 seconds so it could very well be included in the normal build
from the studio.




Anyone interested in this add-in you can
have it by writing to me on *marcus (dot) hammarberg (at)
avega
(dot) se.*

</div>

</div>
