---
layout: post
title: Aspects and Policy Injection - Clean Up Your Code
date: 2008-11-07T07:10:00.002Z
author: Marcus Hammarberg
tags:
  - Tools
  - C#
modified_time: 2010-12-14T15:23:11.109Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-7858678868465124323
blogger_orig_url: http://www.marcusoft.net/2008/11/aspect-clean-up-your-code.html
---

The other thing that really impressed me this week was the use of [policy injection](http://msdn.microsoft.com/en-us/library/cc309507.aspx) and [aspect-oriented programming](http://en.wikipedia.org/wiki/Aspect-oriented_programming) in our code.

I mean, you write aspects (or policies) for things like logging, performance counters, caching, and error handling, and move all that stuff into configurable policies. What is left in your code?

Pure and beautiful business code (or at least problem domain code).

It's so nice - we're cleaning up code every day in our project, and I just love to remove logging and error handling from my code and see my business code emerge from the muddy waters of ["cross-cutting concerns"](http://en.wikipedia.org/wiki/Cross-cutting_concern).

[This video](http://www.postsharp.org/about/video/default.aspx) opened my eyes to aspects. It's for [PostSharp](http://www.postsharp.org/), which is another framework for doing aspects, but the concepts are shown clearly.
