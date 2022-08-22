---
layout: post
title: DDD – what’s the deal?
date: 2009-05-18T17:12:00.001Z
author: Marcus Hammarberg
tags:
  - DDD
modified_time: 2009-05-18T17:27:37.595Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-4714403665752490331
blogger_orig_url: http://www.marcusoft.net/2009/05/ddd-whats-deal.html
---



After doing <a href="http://en.wikipedia.org/wiki/Domain-driven_design"
target="_blank">DDD</a> (on a very basic level) for sometime now, I now
realize that I could benefit with some sort of sum up. Often when I
reach this point I quickly realize that many people has tread this paths
before and that I’m reinventing the wheel…
Well, in that case I do it for me. I like my wheels or at least my way
of understanding them…

So here is my take on what the deal with DDD is (i hope that it will
change over time but here is how I see it today):

I think first that the whole idea of DDD can be divided into two aspects
(actually <a href="http://blog.avegagroup.se/JoakimSunden/default.aspx"
target="_blank">Jocke</a> pointed me in this way but i like it):

-   first code - a bunch of design patterns that help you produce great
    object-oriented, testable software
-   then the implications on the way you can do software projects.

For the code part there is not much to add, or rather not much that
could fit here. But what I mean is that to do DDD is “simply” to apply
the patterns
<a href="http://www.martinfowler.com/eaaCatalog/domainModel.html"
target="_blank">Domain Model</a>, <a
href="http://blogs.hibernatingrhinos.com/nhibernate/archive/2008/10/08/the-repository-pattern.aspx"
target="_blank">repository</a>,
<a href="http://www.lostechies.com/blogs/15611.aspx"
target="_blank">aggregate</a>, <a
href="http://stochastyk.blogspot.com/2008/05/domain-services-in-domain-driven-design.html"
target="_blank">services</a>,
<a href="http://www.dofactory.com/Patterns/PatternAbstract.aspx"
target="_blank">factories</a> and
<a href="http://en.wikipedia.org/wiki/Domain-driven_design"
target="_blank">more</a>.

It can be quite a challenge to grasp all these patterns and put them
into use at once, so I recommend a some
<a href="http://www.amazon.com/exec/obidos/ASIN/0321268202"
target="_blank">reading</a>, that will set your mind into DDD-mode and
most of the patterns will fall into place by themselves. Or you can grab
hold of
<a href="http://www.marcusoft.net/2009/05/sarp-architecture.html"
target="_blank">an example architecture</a> and build from that.

The other part of the story is the way that setting your brain into
DDD-mode will change the way you can be agile in your project. The main
idea (<a
href="http://www.marcusoft.net/2009/02/ddd-coin-drops-for-marcus.html"
target="_blank">as I founded out</a>, and <a
href="http://www.marcusoft.net/2009/02/why-ddd-rocks-marcusoftnet-version.html"
target="_blank">here</a>) is of course to focus on the model and let
implementation details such as database integration, technology or even
GUI be of secondary importance. Of course you cannot take in the
complete universe of your problem at once so doing a small part of it
and letting that evolve with time is a recommended approach.
<a href="http://jimmynilsson.com/blog/posts/CCC.pdf" target="_blank">See
this</a> from
<a href="http://jimmynilsson.com/blog/" target="_blank">Jimmy
Nilsson</a>.

This approach lend itself very well to do in the form of for example
<a href="http://en.wikipedia.org/wiki/User_story" target="_blank">user
stories</a> and
<a href="http://en.wikipedia.org/wiki/Test-driven_development"
target="_blank">TDD</a>. In this way you only need to focus on the part
of the model that the user story is about. The next user story might
tell us more about the same part of the domain model, but we don’t care
now. The tests will assure us that we’re not breaking anything that
already works as we progress.

So by doing DDD you automatically get a step-by-step evolving
architecture and also a very good way to use an agile approach in the
project.

With <a href="http://en.wikipedia.org/wiki/Behavior_Driven_Development"
target="_blank">BDD</a> (a subject I know very little about) you can
even go further and get specifications that you verify with tests. But
that is out of knowledge.
