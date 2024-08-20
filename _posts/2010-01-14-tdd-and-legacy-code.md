---
layout: post
title: TDD and legacy code
date: 2010-01-14T07:53:00.001Z
author: Marcus Hammarberg
tags:
  - .NET
  - Life of a consultant
  - Agile
  - TDD
modified_time: 2010-01-14T07:53:17.653Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-372874052836303505
blogger_orig_url: http://www.marcusoft.net/2010/01/tdd-and-legacy-code.html
---

I have been doing some presentations on [TDD](http://en.wikipedia.org/wiki/Test-driven_development) and one thing that always happens is that you get some tricky questions in the beginning of the presentation.

As you’re introducing a new concept, it of course starts very small and easy, but most people directly try to put it into their context, their normal situation.

And let’s admit it – there are not very often cases where we start off in a void, aka. a green field project. No – it’s mostly [brown field](http://igloocoder.com/archive/2007/12/23/what-is-brownfield.aspx) – there is always code that exists that needs to be handled. What’s worse – that code is not written to be tested – Not Designed for Testability.

I think this is a very interesting subject and it touches on other subjects that I’m interested in surrounding why it’s worth [“clean up your room”](http://www.hanselman.com/blog/HanselminutesPodcast145SOLIDPrinciplesWithUncleBobRobertCMartin.aspx) (as [Uncle Bob](http://blog.objectmentor.com/articles/category/uncle-bobs-blatherings) would have put it…)

There’s a lot written on this subject, most notably and my next read, [Michael Feathers](http://www.michaelfeathers.com/) [*Working Effectively with Legacy Code*](http://my.safaribooksonline.com/0131177052).

But from my good friend Calle Lindelöf, I’ve got a tip for two great articles by [David Laribee](http://msdn.microsoft.com/en-us/magazine/ee532098.aspx?sdmr=DavidLaribee&sdmi=authors). Here you go, thank you Calle:

- [9 Useful Tactics for Paying Back Technical Debt](http://msdn.microsoft.com/sv-se/magazine/ee335722(en-us).aspx)
- [Using Agile Techniques to Pay Back Technical Debt](http://msdn.microsoft.com/en-us/magazine/ee819135.aspx)
