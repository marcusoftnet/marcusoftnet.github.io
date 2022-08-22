---
layout: post
title: Specification by example – the missing link?
date: '2010-04-22T20:01:00.001+02:00'
author: Marcus Hammarberg
tags:
  - BDD - DDD
  - Life of a consultant

  - Kanban
  - crum

  - Agile
modified_time: '2010-04-22T20:01:43.927+02:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-7935641062205744091
blogger_orig_url: http://www.marcusoft.net/2010/04/specification-by-example-missing-link.html
---


I’ve been thinking. That statement alone will be sure to put fear in the
heart of a lot of you… But if you have continued on this far, here we
go.

#### Learning programming stuff

During the last year or so I have been reading a lot. I have read stuff
<a href="http://jamesshore.com/Agile-Book/" target="_blank">on XP</a>,
on
<a href="http://www.marcusoft.net/2009/07/parental-leave-reading.html"
target="_blank">good design</a> <a
href="http://www.amazon.com/Domain-Driven-Design-Tackling-Complexity-Software/dp/0321125215"
target="_blank">DDD</a> and <a
href="http://www.marcusoft.net/2009/09/reference-work-3-tdd-by-example.html"
target="_blank">TDD</a>. This reading has affected me and my coding
style way much more than I first thought. I simply cannot write code
anymore without the test first, interface first, thinking of SOLID etc..

#### Learning lean stuff

At the same time I have change role at
<a href="http://www.avegagroup.se" target="_blank">Avega</a>. I am now
an AvegaCoach. This means that my time is divided between my regular
(often coaching) assignments with customers and Avega and
<a href="http://blog.avegagroup.se/elevate/" target="_blank">Elevate</a>.
Since my fellow AvegaCoaches
(<a href="http://blog.avegagroup.se/JoakimSunden/default.aspx"
target="_blank">Joakim</a> and
<a href="http://blog.avegagroup.se/ChristopheAchouiantz/default.aspx"
target="_blank">Christophe</a>) and me are interested in agile and lean
stuff we have focused our joint efforts on that.

This has led that I have learned a lot from them about lean and
<a href="http://www.slideshare.net/marcusoftnet/kanbanboards"
target="_blank">Kanban</a>. And this has expanded my understanding of
Scrum and how to work agile.

#### Frustrations

But around here the frustration started to kick in. I felt that these
two areas; technology and process stuff could marry in a great way. But
how? And how much does the it affect each other?

Also, a specific thing that I have been really frustrated in is how to
include test in an agile world. Testing are left out in planning, are
left to try to keep up with development and the regression stuff will
eventually kill them. So “testing sprints” are introduced, “we’re
running a sprint behind the rest of the team” and other solutions like
that is used to try to get around it.

Surely – this cannot be the best case? So I started read about
<a href="http://www.agiletester.ca/" target="_blank">agile testing</a>.
I loved <a href="http://www.acceptancetesting.info/the-book/"
target="_blank">the book</a> by
<a href="http://gojko.net/" target="_blank">Gjoko Adzic</a>. This book
introduced me to the term
<a href="http://www.acceptancetesting.info/" target="_blank">agile
acceptance testing and specification by example</a>.

#### The solution?

I have heard and <a
href="http://www.marcusoft.net/2010/03/bdd-with-specflow-some-thoughts-after.html"
target="_blank">learned</a> quite a lot about
<a href="http://en.wikipedia.org/wiki/Behavior_Driven_Development"
target="_blank">BDD</a>. I knew that BDD and <a
href="http://en.wikipedia.org/wiki/Behavior_Driven_Development#Outside-In"
target="_blank">“outside-in” thinking</a> can help me design my
application in a maintainable way. But BDD can be applied at any level.
It could be used to spec out your unit test. Another way to do
<a href="http://en.wikipedia.org/wiki/Test-driven_development"
target="_blank">TDD</a>
(<a href="http://www.arrangeactassert.com/" target="_blank">AAA</a>
becomes <a
href="http://blog.objectmentor.com/articles/2008/11/27/the-truth-about-bdd"
target="_blank">GWT</a>)

But I had missed the fact that the specifications and features should
~~could~~ be written in collaboration with customer or business
analysists. This will turn the specs into **executable specifications.
(**Those words still gives me the shivers. It’s so cool!)

That’s the thing! With executable specifications you have a living
specification to code against, and the moment you’re done (as in
<a href="http://jamesshore.com/Agile-Book/done_done.html"
target="_blank">done done</a>) with the story the specification is
“magically” turned into an acceptance test.

And the specifications finally reflects what the code is doing. I can
never forget a quote by a customer how very proudly showed me the folder
with all the specifications (use cases in this case) and then told me:

> “And the best thing… they are almost up to date with what the system
> does”.

The really scary part about that is that it was actually the best I ever
seen. Most documentation and specifications are a violation to the
<a href="http://en.wikipedia.org/wiki/Don&#39;t_repeat_yourself"
target="_blank">DRY principle</a>. But with executable specifications
you’re as close as it gets.

But it doesn’t stop there: since the specification with any
<a href="http://www.specflow.org" target="_blank">current tool</a> is
written in plain English you can workshop around it to get everybody's
(business analysis, testing, coding, deploy etc) views on the matter.
And you minimize the misconceptions by using real world examples.

And that in turn closes
<a href="http://www.acceptancetesting.info/the-book/"
target="_blank">the gap</a> for me; agile testing is hard since I am
still viewing testing as something separate from coding. And the same
goes for specifying… But it’s not! You can do this in agile way, a
little slice of functionality at the time. A way to do that is
specification by example.

#### Recommended watching and reading

Read Gojkos book – <a href="http://www.acceptancetesting.info/the-book/"
target="_blank">Bridging the communication gap</a>. Stop reading
whatever you reading now and start reading this. It was a eye-opener for
me.

Watch (~~anything you can get your hands on~~) this webcast by
<a href="http://www.infoq.com/presentations/bdd-dan-north"
target="_blank">Dan North.</a> There are lots of great stuff in here on
BDD and design.

I’m reading
<a href="http://www.agiletester.ca/" target="_blank">Agile Testing</a>
right now. That has really showed me that testing is something that any
agile person (developer, tester, business analysist etc.) should care
about. Or as Deming put it:

> <a href="http://thinkexist.com/quotes/w._edwards_deming/"
> target="_blank">“Quality is everyone's responsibility.”</a>
