---
layout: post
title: DDD – what’s the deal?
date: 2009-05-18T17:12:00.001Z
author: Marcus Hammarberg
tags:
  - DDD
modified_time: 2009-05-18T17:27:37.595Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-4714403665752490331
blogger_orig_url: https://www.marcusoft.net/2009/05/ddd-whats-deal.html
---

After doing [DDD](http://en.wikipedia.org/wiki/Domain-driven_design) (on a very basic level) for some time now, I now realize that I could benefit from some sort of sum up. Often when I reach this point, I quickly realize that many people have tread these paths before and that I’m reinventing the wheel… Well, in that case, I do it for me. I like my wheels or at least my way of understanding them…

So here is my take on what the deal with DDD is (I hope that it will change over time but here is how I see it today):

I think first that the whole idea of DDD can be divided into two aspects (actually [Jocke](http://blog.avegagroup.se/JoakimSunden/default.aspx) pointed me in this way but I like it):

- First code - a bunch of design patterns that help you produce great object-oriented, testable software.
- Then the implications on the way you can do software projects.

For the code part, there is not much to add, or rather not much that could fit here. But what I mean is that to do DDD is “simply” to apply the patterns [Domain Model](http://www.martinfowler.com/eaaCatalog/domainModel.html), [repository](http://blogs.hibernatingrhinos.com/nhibernate/archive/2008/10/08/the-repository-pattern.aspx), [aggregate](http://www.lostechies.com/blogs/15611.aspx), [services](http://stochastyk.blogspot.com/2008/05/domain-services-in-domain-driven-design.html), [factories](http://www.dofactory.com/Patterns/PatternAbstract.aspx), and [more](http://en.wikipedia.org/wiki/Domain-driven_design).

It can be quite a challenge to grasp all these patterns and put them into use at once, so I recommend some [reading](http://www.amazon.com/exec/obidos/ASIN/0321268202) that will set your mind into DDD-mode, and most of the patterns will fall into place by themselves. Or you can grab hold of [an example architecture](https://www.marcusoft.net/2009/05/sarp-architecture.html) and build from that.

The other part of the story is the way that setting your brain into DDD-mode will change the way you can be agile in your project. The main idea ([as I found out](https://www.marcusoft.net/2009/02/ddd-coin-drops-for-marcus.html), and [here](https://www.marcusoft.net/2009/02/why-ddd-rocks-marcusoftnet-version.html)) is of course to focus on the model and let implementation details such as database integration, technology, or even GUI be of secondary importance. Of course, you cannot take in the complete universe of your problem at once, so doing a small part of it and letting that evolve with time is a recommended approach. [See this](http://jimmynilsson.com/blog/posts/CCC.pdf) from [Jimmy Nilsson](http://jimmynilsson.com/blog/).

This approach lends itself very well to doing, for example, [user stories](http://en.wikipedia.org/wiki/User_story) and [TDD](http://en.wikipedia.org/wiki/Test-driven_development). In this way, you only need to focus on the part of the model that the user story is about. The next user story might tell us more about the same part of the domain model, but we don’t care now. The tests will assure us that we’re not breaking anything that already works as we progress.

So by doing DDD, you automatically get a step-by-step evolving architecture and also a very good way to use an agile approach in the project.

With [BDD](http://en.wikipedia.org/wiki/Behavior_Driven_Development) (a subject I know very little about), you can even go further and get specifications that you verify with tests. But that is out of my knowledge.
