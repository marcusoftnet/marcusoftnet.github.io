---
layout: post
title: ÖreDev day 4 – morning
date: 2009-11-05T11:45:00.001Z
author: Marcus Hammarberg
tags:
  - DDD
  - .NET
  - ÖreDev
  - Agile
modified_time: 2011-11-09T20:49:22.586Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-4549561414632747159
blogger_orig_url: http://www.marcusoft.net/2009/11/oredev-day-4-morning.html
---


We’re of to a brand new day. Feel well rested although last night was
quite late…

##### Keynote: What drives design?

This can be very interesting, if focus on the last two D in any
\[x\]DD-technique (TDD, BDD etc). I’ll make a summary in the end.

This was a interesting historical overview to start with. Pretty cool
that our industry is so young that the people who “started it all” are
still not that old. Cool to hear about their troubles and stumbling on
their way to greatness.

<a href="http://www.wirfs-brock.com/" target="_blank">Rebecca
Wirfs-Brock</a> talked a lot about the <a
href="http://acronyms.thefreedictionary.com/Responsibility-Driven+Design"
target="_blank">RDD (responsibility driven design)</a> and the patterns
behind it. Then said compared it to other DD-techniques, such
<a href="http://en.wikipedia.org/wiki/Test-driven_development"
target="_blank">TDD</a>,
<a href="http://en.wikipedia.org/wiki/Behavior_Driven_Development"
target="_blank">BDD</a>,
<a href="http://en.wikipedia.org/wiki/Feature_Driven_Development"
target="_blank">FDD</a> and
<a href="http://en.wikipedia.org/wiki/Domain-driven_design"
target="_blank">DDD</a> and so forth.

##### Making the sausage

Now this should be interesting if by no other reason because of the
speakers; <a href="http://dannorth.net/" target="_blank">Dan North</a>,
<a href="http://www.nealford.com/" target="_blank">Neal Ford</a>,
<a href="http://thinkrelevance.com/" target="_blank">Stuart Halloway</a>
and <a href="http://tyler.officialopinion.com/" target="_blank">Tyler
Jennings</a>. They are going to talk about BDD in something called
<a href="http://clojure.org/" target="_blank">Clojure</a>. It promise to
be great!

It was a bit disappointing in a strange way; it’s was great but I had a
hard time keeping up with their ideas. But after a while I get it but
not well enough to re-loop it here. Sorry.

<a href="http://en.wikipedia.org/wiki/Functional_programming"
target="_blank">Functional languages</a> are strange in itself and four
functional programmers running through code they wrote a late night…
You can probably understand my confusion.

##### Test-Driven Web UI Development

<a href="http://blog.scottbellware.com/" target="_blank">Scott
Bellware</a> is doing this. It’s the first time I’ll hear him, except in
the local pub…

The talk was about lessons learned on trying to bridge the gap between
testers and (TDD-)developers in an agile team.

Here are some random stuff that I picked up:

- <a href="http://seleniumhq.org/projects/ide/"
    target="_blank">Selenium</a> looks like a cool UI-automation testing
    framework. It free!
- Selenium can actually generate test-code in a programming language
    of your choice. Beware that the tests are just a starting point –
    not the full blown test suite to use for ever and ever…
- As programmers we shouldn’t do things that decreases productivity
    for the testers. It’s the whole teams productivity that counts.
- The tests should describe the product not the implementation.
- Good BDD-tests should be like a Table of Contents in a book. You
    don’t want to go into details if not needed.
- Pair programming with a tester and a developer may be a way to find
    issues really quick. But I think a good, solid understanding of the
    test framework is needed.

I learned some about of Ruby and some on automating tests. I liked it
but we didn’t reach all the way, sadly. James Bach had some comments
that I would have loved to heard more around.
