---
layout: post
title: Specification by example – the missing link?
date: 2010-04-22T18:01:00.001Z
author: Marcus Hammarberg
tags:
  - BDD
  - DDD
  - Life of a consultant
  - Kanban
  - Agile
modified_time: 2010-04-22T18:01:43.927Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-7935641062205744091
blogger_orig_url: https://www.marcusoft.net/2010/04/specification-by-example-missing-link.html
---

I’ve been thinking. That statement alone will be sure to put fear in the heart of a lot of you… But if you have continued on this far, here we go.

#### Learning programming stuff

During the last year or so I have been reading a lot. I have read stuff [on XP](http://jamesshore.com/Agile-Book/), on [good design](https://www.marcusoft.net/2009/07/parental-leave-reading.html) [DDD](http://www.amazon.com/Domain-Driven-Design-Tackling-Complexity-Software/dp/0321125215) and [TDD](https://www.marcusoft.net/2009/09/reference-work-3-tdd-by-example.html). This reading has affected me and my coding style way much more than I first thought. I simply cannot write code anymore without the test first, interface first, thinking of SOLID etc..

#### Learning lean stuff

At the same time I have change role at [Avega](http://www.avegagroup.se). I am now an AvegaCoach. This means that my time is divided between my regular (often coaching) assignments with customers and Avega and [Elevate](http://blog.avegagroup.se/elevate/). Since my fellow AvegaCoaches ([Joakim](http://blog.avegagroup.se/JoakimSunden/default.aspx) and [Christophe](http://blog.avegagroup.se/ChristopheAchouiantz/default.aspx)) and me are interested in agile and lean stuff we have focused our joint efforts on that.

This has led that I have learned a lot from them about lean and [Kanban](http://www.slideshare.net/marcusoftnet/kanbanboards). And this has expanded my understanding of Scrum and how to work agile.

#### Frustrations

But around here the frustration started to kick in. I felt that these two areas; technology and process stuff could marry in a great way. But how? And how much does the it affect each other?

Also, a specific thing that I have been really frustrated in is how to include test in an agile world. Testing are left out in planning, are left to try to keep up with development and the regression stuff will eventually kill them. So “testing sprints” are introduced, “we’re running a sprint behind the rest of the team” and other solutions like that is used to try to get around it.

Surely – this cannot be the best case? So I started read about [agile testing](http://www.agiletester.ca). I loved [the book](http://www.acceptancetesting.info/the-book/) by [Gojko Adzic](http://gojko.net/). This book introduced me to the term [agile acceptance testing and specification by example](http://www.acceptancetesting.info/).

#### The solution?

I have heard and [learned](https://www.marcusoft.net/2010/03/bdd-with-specflow-some-thoughts-after.html) quite a lot about [BDD](http://en.wikipedia.org/wiki/Behavior_Driven_Development). I knew that BDD and [“outside-in” thinking](http://en.wikipedia.org/wiki/Behavior_Driven_Development#Outside-In) can help me design my application in a maintainable way. But BDD can be applied at any level. It could be used to spec out your unit test. Another way to do [TDD](http://en.wikipedia.org/wiki/Test-driven_development) ([AAA](http://www.arrangeactassert.com/) becomes [GWT](http://blog.objectmentor.com/articles/2008/11/27/the-truth-about-bdd))

But I had missed the fact that the specifications and features should ~~could~~ be written in collaboration with customer or business analyst. This will turn the specs into **executable specifications. (**Those words still gives me the shivers. It’s so cool!)

That’s the thing! With executable specifications you have a living specification to code against, and the moment you’re done (as in [done done](http://jamesshore.com/Agile-Book/done_done.html)) with the story the specification is “magically” turned into an acceptance test.

And the specifications finally reflects what the code is doing. I can never forget a quote by a customer how very proudly showed me the folder with all the specifications (use cases in this case) and then told me:

> “And the best thing… they are almost up to date with what the system does”.

The really scary part about that is that it was actually the best I ever seen. Most documentation and specifications are a violation to the [DRY principle](http://en.wikipedia.org/wiki/Don't_repeat_yourself). But with executable specifications you’re as close as it gets.

But it doesn’t stop there: since the specification with any [current tool](http://www.specflow.org) is written in plain English you can workshop around it to get everybody's (business analysis, testing, coding, deploy etc) views on the matter. And you minimize the misconceptions by using real world examples.

And that in turn closes [the gap](http://www.acceptancetesting.info/the-book/) for me; agile testing is hard since I am still viewing testing as something separate from coding. And the same goes for specifying… But it’s not! You can do this in agile way, a little slice of functionality at the time. A way to do that is specification by example.

#### Recommended watching and reading

Read Gojko's book – [Bridging the communication gap](http://www.acceptancetesting.info/the-book/). Stop reading whatever you reading now and start reading this. It was a eye-opener for me.

Watch (~~anything you can get your hands on~~) this webcast by [Dan North.](http://www.infoq.com/presentations/bdd-dan-north) There are lots of great stuff in here on BDD and design.

I’m reading [Agile Testing](http://www.agiletester.ca) right now. That has really showed me that testing is something that any agile person (developer, tester, business analyst etc.) should care about. Or as Deming put it:

> [“Quality is everyone's responsibility.”](http://thinkexist.com/quotes/w._edwards_deming/)
