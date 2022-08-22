---
layout: post
title: TDD and legacy code
date: 2010-01-14T08:53:00.001+01:00
author: Marcus Hammarberg
tags:
  - .NET
  - Life of a consultant
  - Agile
  - TDD
modified_time: 2010-01-14T08:53:17.653+01:00
blogger_id: tag:blogger.com,1999:blog-36533086.post-372874052836303505
blogger_orig_url: http://www.marcusoft.net/2010/01/tdd-and-legacy-code.html ---

I have been doing some presentations on
<a href="http://en.wikipedia.org/wiki/Test-driven_development"
target="_blank">TDD</a> and one thing that always happen is that you get
some tricky questions in the beginning of the presentation.

As you’re introducing a new concept it of course starts very small and
easy but most people directly try to put into their context, their
normal situation.

And let’s admit it – there not very often we start off in a void, aka. a
green field project. No – it’s mostly <a
href="http://igloocoder.com/archive/2007/12/23/what-is-brownfield.aspx"
target="_blank">brown field</a> - there is always code that exists that
needs to be handled. What’s worse – that code is not written to be
tested – Not Designed for Testability.

I think this is a very interesting subject and it touches on other
subjects that I’m interesting on surrounding why it’s worth <a
href="http://www.hanselman.com/blog/HanselminutesPodcast145SOLIDPrinciplesWithUncleBobRobertCMartin.aspx"
target="_blank">“clean up your room”</a> (as <a
href="http://blog.objectmentor.com/articles/category/uncle-bobs-blatherings"
target="_blank">Uncle Bob</a> would have put it…)

There’s a lot written on this subject, most notable and my next read,
<a href="http://www.michaelfeathers.com/" target="_blank">Michael
Feathers</a> <a href="http://my.safaribooksonline.com/0131177052"
target="_blank">Working Effectively with Legacy Code</a>.

But from my good friend Calle Lindelöf I’ve got a tip for two great
articles by <a
href="http://msdn.microsoft.com/en-us/magazine/ee532098.aspx?sdmr=DavidLaribee&amp;sdmi=authors"
target="_blank">David Laribee</a>. Here you go, thank you Calle:

-   <a href="http://msdn.microsoft.com/sv-se/magazine/ee335722(en-us).aspx"
    target="_blank">9 Useful Tactics for Paying Back Technical Debt</a>
-   <a href="http://msdn.microsoft.com/en-us/magazine/ee819135.aspx"
    target="_blank">Using Agile Techniques to Pay Back Technical Debt</a>
