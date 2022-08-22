---
layout: post
title: Theory of constraints and Specification by example
date: 2011-05-27T18:41:00.001Z
author: Marcus Hammarberg
tags:
  - BDD
  - Kanban
  - Agile
modified_time: 2011-10-20T12:58:46.684Z
thumbnail: >-
  http://lh6.ggpht.com/-P5qnRhrhJ-4/Td_wWwDj1vI/AAAAAAAAA_c/7Eg93tbpZy0/s72-c/wlEmoticon-smile%25255B2%25255D.png?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-5183569694525573431
blogger_orig_url: http://www.marcusoft.net/2011/05/specification-by-example-and-theory-of.html
---

Since the first time I heard about
<a href="http://specificationbyexample.com/"
target="_blank">Specification by example</a> (or
<a href="http://en.wikipedia.org/wiki/Behavior_Driven_Development"
target="_blank">BDD</a> if you like) I have had this nagging feeling
that it fits like a glove with Lean thinking and the theories
surrounding those ideas, but I haven’t been able to figure out how or
why.
Today I had some time to think hard about that and I think I found a
connection. The connection I saw was how
<a href="http://en.wikipedia.org/wiki/Theory_of_Constraints"
target="_blank">theory of constraints</a> can be applied with the use of
Specification by example to the system development process itself. In
this blog post I’ll try to explain what I mean by that.

#### Standing on the shoulders of giants

This blog post is merely formulating my thoughts on this, or laying the
puzzle from a lot of different pieces that other people have supplied.
There are even people who supplied the complete picture, so I won’t
(probably) say anything that haven’t been said before. But just
formulating it was very rewarding for me. My giants are names like
<a href="http://www.blogger.com/www.dannorth.net" target="_blank">Dan
North</a>, <a href="http://en.wikipedia.org/wiki/Eliyahu_M._Goldratt"
target="_blank">Elijah Goldratt</a> and
<a href="http://gojko.net/" target="_blank">Gojko Adzic</a> to mention a
few.

### Theory of Constraints

About a year ago I read the magnificent <a
href="http://www.amazon.com/Goal-Process-Ongoing-Improvement/dp/0884271781"
target="_blank">The Goal by Elijah Goldratt</a>. In this book Mr.
Goldratt formulates (and describes in an very entertaining way) his
<a href="http://en.wikipedia.org/wiki/Theory_of_Constraints"
target="_blank">Theory of Constraints</a>. Very briefly that theory
states that every system has at least one bottleneck that is slowing the
rest of the system down. If not they system could produce any output in
an instant or unrestricted.
From that we learn that any improvement you do to the bottleneck is an
improvement for the whole system. And hence to improve other parts of
the system is wasteful since the bottleneck still will hold the system
as a whole back.
Here is a short example of this;

> Imagine a plant, Marcusoft Welded Steelplates, that manufactures a
> very special kind of steel plate with gadgets welded to it (Yes, the
> demand is not to big for this I know, but we’re a leading player <img
> src="http://lh6.ggpht.com/-P5qnRhrhJ-4/Td_wWwDj1vI/AAAAAAAAA_c/7Eg93tbpZy0/wlEmoticon-smile%25255B2%25255D.png?imgmax=800"
> class="wlEmoticon wlEmoticon-smile"
> style="border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none;"
> alt="Smile" />). This is done by an array of machines that transforms
> the raw material into the welded steel plates that Marcusoft Welded
> Steelplates are famous for.
> Here is how the plant is organized today:
>
> 1. The plant receives the raw steel plates and the first machine cut
>     it into roughly the right shape
> 2. The second machine welds parts to the plate
> 3. The third machine paints the steel plate in the colors the
>     customer wants
> 4. The final machine removes excess material that might not be
>     needed, rough corners and things sticking out etc.
>
> However the plant soon run into problems. The raw material is not very
> consistent in shape and form. From time to other the paint machine
> (step 3 above) simply cannot fit the steel plate; sometimes it’s too
> wide, sometime to thick and sometimes just too heavy. So material that
> has been cut and welded is thrown away since the paint machine cannot
> handle it.
> To resolve this bottleneck we first want to exploit the bottleneck to
> it’s full capacity. That is (in this simplified example) only feed it
> material that it can handled.
> The obvious solution here is to move the final step into the front and
> cut the plate into the exact right shape, form and weight right from
> the start.

Ok that situation was not too hard to spot and resolve. But what about
system development? Can theory of constraint be applied there, and to
what use?

### Theory of constraint in system development

What would you say is the most common bottleneck in system development
projects? Right now you probably guessing on requirements, test or
development (it’s sure to not be your part, right? <img
src="http://lh6.ggpht.com/-P5qnRhrhJ-4/Td_wWwDj1vI/AAAAAAAAA_c/7Eg93tbpZy0/wlEmoticon-smile%25255B2%25255D.png?imgmax=800"
class="wlEmoticon wlEmoticon-smile"
style="border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none;"
alt="Smile" />) and I have done that for quite some time as well. But I
think that the bottleneck is somewhere else. Somewhere more ... subtle
maybe.
Do this thought experiment for yourself (thanks to <a
href="http://skillsmatter.com/expert-profile/agile-testing/elizabeth-keogh"
target="_blank">Liz Keogh</a> from whom I picked it up first):

> Think back on the last project that you were in. Imagine that the day
> you arrived to deliver the software to the customer there’s been an
> earthquake; the building, servers, documentation, whiteboards and code
> – everything is gone. Engulfed by a sinkhole!
> The only think that is left (thank God!) is your team! The exact same
> people are still around.
> How long would you think that it will take you to do the whole thing
> over again?

You’re probably guessing 25-50% of the time here?

> Why?

> \- Errr – because we will know what we’ll need to do this time
> around.
>
> - We can avoid any pitfalls we’ve made already

Because system development is a knowledge creating process. When you
start you don’t know a lot of things; how is the system going to work,
will it be hard to make, what will be hard, what will be our biggest
challenges. Nobody knows what the goal is – not even the customer.
It’s actually worse; we don’t even know what we don’t know. Dan North
calls this second level ignorance and has written some great stuff about
it <a
href="http://dannorth.net/2010/08/30/introducing-deliberate-discovery/"
target="_blank">here, in what he call Deliberate Discovery</a>.

> **Our bottleneck is our ignorance about the things we don’t yet
> know.**

So it’s not about testing being the bottleneck, or bad specifications or
crappy code – it’s the fact that we don’t know which problems we’re
going to run into.
That’s not because our whole industry is ignorant – it’s the very nature
of system development. Often we try to compare developing system with
manufacturing in the industry but that’s not fair. Manufacturing 10
000’s of cars of the same brand is something completely different than
creating the prototype and specifications that all the other cars are
built from.

### <a href="http://specificationbyexample.com/"

target="_blank">Specification by example</a>

The idea with specification by example is that you specify the system
you’re about to build in examples that describes how the system is
expected to behave. These examples (or acceptance criteria) is then used
to verify that the system meets the expectation of the system.
Preferable this is done by getting together with the team (analytics,
customer, developer, testers, operations etc.) and write down the
acceptance criteria for a feature, to the best of our knowledge.
In doing so you can discuss about the behavior of the system before it’s
implemented. The examples are great specifications to code against using
an outside-in approach. They can be automated with tools such as
Cucumber and
<a href="http://www.specflow.org/" target="_blank">SpecFlow</a> to
assist automated testing of the feature.
Finally the specification is an excellent way to show the current state
of the system. The examples become a living documentation that shows
what the system is capable of.

### Using Specification by example to exploit the ignorance bottleneck in system development projects

If ignorance is our bottleneck we know (from theory of constraint) that
it’s the ignorance we want to tackle, we want to solve that before other
optimizations are tried.
This ignorance can become apparent in any stage of the development
process (analysis, development, testing and even operations). Or rather
we can find problems in any of these stages.
But as this (finding problems) creates waste, where- and when-ever its
found, we want to find the problems as early as possible and try to do
something about it as soon as possible. Just like Marcusoft Welded
Steelplates above, when they moved the final machine into the front of
the process.
Gathering your team (with all roles present) and discussing examples or
scenarios on how a feature is going to be used, is a great way to try to
do something about our ignorance of the problems we’re going to run
into. Doing this before the feature is analyzed, implemented, tested or
deployed reduce the waste that reworking the feature creates.

### Conclusion

When this is written down I realize even more that I simply re-states
what other already have said. But this was in my words, and I learned a
lot from just formulating the words for this.
I even think that Dan North have phrased the sentence that I want to
conclude with:

> It’s no <a
> href="http://en.wikipedia.org/wiki/History_of_software_engineering#1985_to_1989:_No_silver_bullet"
> target="_blank">silver bullet</a> – but it’s a good start!

And the silver bullet is not a tool or a process that you buy into. It’s
simply us recognizing that we don’t know the problems we’re going to run
into and try to do something about it. This is done by getting together
and talking about the system in examples that shows details on how the
system is meant to be used.
Or, if you like theory of constraints, by exploiting the bottleneck of
system development – our ignorance of the things we don’t know.
