---
layout: post
title: Sandcastle - revisted
date: 2007-08-29T07:55:00.000+02:00
author: Marcus Hammarberg
tags:
  - Tools
modified_time: 2010-12-14T16:22:38.322+01:00
blogger_id: tag:blogger.com,1999:blog-36533086.post-2439247928364528321
blogger_orig_url: http://www.marcusoft.net/2007/08/sandcastle-revisted.html
---

As i
[wrote
earlier](http://marcushammarberg.blogspot.com/2007/08/ndoc-is-dead-long-live-sandcastle.html)
i have tried out the CTP version of Sandcastle. And it is a CTP by which
i mean that it's not a finished product. But i looks very promising i
must say.

One of the things i miss in Sandcastle (CTP) is an easy integration with
MSBuild so that you can rebuild your documentation as part of your
continuous integration. Sandcastle in itself is a bunch of tools to be
used a the command prompt and they can (but not easy) integrated.

Luckily this has been done for us already, through some well-initiated
sources i [found an application](http://www.codeplex.com/DocProject)
that builds on top of Sandcastle (CTP), that fills the gap surrounding
MSBuild integration. I haven't have time to try it out yet but will sure
get around to it

Also - from the same source, i got an [performance
tip](http://blogs.msdn.com/sandcastle/archive/2006/08/28/727901.aspx)
that cut the document generation time from 17 to 10 min in our
application (11 projects, 85 000 lines of code, 6500 topics). Apparently
there are some link resolving going on while Sandcastle generate the
documentation. By default this is set to "MSDN" which translates to "use
the MSDN web service to resolve links". Set this to "None" for better
performance.
(Still slower than my NDoc alpha though :))
