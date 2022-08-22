---
layout: post
title: Aspects and policy injection - clean up your code
date: 2008-11-07T07:10:00.002Z
author: Marcus Hammarberg
tags:
  - Tools
  - C#
modified_time: 2010-12-14T15:23:11.109Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-7858678868465124323
blogger_orig_url: http://www.marcusoft.net/2008/11/aspect-clean-up-your-code.html
---


The other thing that really has impressed me this week was the use of
<a href="http://msdn.microsoft.com/en-us/library/cc309507.aspx"
target="_blank">policy injection</a> and
<a href="http://en.wikipedia.org/wiki/Aspect-oriented_programming"
target="_blank">aspect oriented programming</a> in our code.

I mean - you write aspects (or policies) for things like logging,
performance counters, caching and error handling and move all that stuff
into configurable policies. What is left in your code?

Pure and beautiful business code (or at least problem domain code).

It's so nice - we're cleaning up code every day in our project and I
just love to remove logging and error handling from my code and see my
business code emerge from the muddy waters of
<a href="http://en.wikipedia.org/wiki/Cross-cutting_concern"
target="_blank">"cross cutting concerns".</a>

<a href="http://www.postsharp.org/about/video/default.aspx"
target="_blank">This video</a> opened my eyes for aspects. It's for
<a href="http://www.postsharp.org/" target="_blank">PostSharp</a> which
is another framework for doing aspects, but the concepts are shown
clearly.
