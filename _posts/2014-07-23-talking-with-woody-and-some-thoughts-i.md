---
layout: post
title: Some thoughts I got after talking with Woody Zuil
date: 2014-07-23T02:01:00.003Z
author: Marcus Hammarberg
tags:
  - Lean
  - Specification by example
  - Agile
  - Indonesia
modified_time: 2014-07-23T02:04:52.337Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-215032983026844550
blogger_orig_url: http://www.marcusoft.net/2014/07/talking-with-woody-and-some-thoughts-i.html
---


Yesterday I had the good fortune to have a chat with
<a href="https://twitter.com/WoodyZuill" target="_blank">Woody Zuill</a>
over Skype. I was a really nice hour that just flew by, where we
exchanged stories, ideas and had a few laughs.

Let me, as a side note, just say that I love that; just exchanging
stories with people. I **always** learn new stuff and quite often
stories from my own experience pop back into my memory.
This is the best part of conferences - meeting, interacting with others.
That's what I miss the most, being a little sidestepped here in
Indonesia. Praise the Lord for Skype and Twitter... ah well for the
Internet too (although I'm not entirely sure He had any hands-on action
on either of those inventions).

I just thought I summarise some of the things that I took away with me
from our conversation.


### It was never about the estimates, really


#### Tell me what you want, what you really really want! I wanna wanna wanna ... an estimate?

Woody is the man behind
<a href="http://zuill.us/WoodyZuill/category/estimating/"
target="_blank">#NoEstimates</a> among other things. This has proven a
**highly** controversial topic and I have from time to time refrained
from talking about it... out of fear or at least tiredness of being
bashed about this on Twitter and elsewhere.

A few things to note about \#NoEstimates, only speaking from my own
experience, that I think sometimes are missed:

I never heard about a customer, you know the guy who are paying our
bills, thanking anyone for the awesome estimate. We (think we) need them
to do our work, but that also mean that we can change that. Since it's
nothing that the customer wants we could do less of that and more of the
things that the customer do wants.


#### Processes are always only "best so far"

<div style="text-align: left;">

Secondly, this goes for *anything* we do. The customer doesn't want
requirements, plans, standups, tests or even the code. The customer
wants a problem solved. All the things we are doing to solve the problem
for the customer is just "best so far" and we should change it as soon
as we are creative enough to look outside our current understanding.

<div style="text-align: left;">

For some, me included, looking beyond our current ways and practices is very hard to do. That's one of the reasons I always react with doubt and question introduced to new concepts. I'm a programmer so this list is a bit skewed, but this is my exact words or thoughts when I heard about some concepts that I now have come to appreciate:


- WHAT?! Two people at one keyboard. That's just stupid! (Pair programming)
- Meeting every morning? Shouldn't agile mean less meetings?   (Standups)
- Writing the test **before** the code? That super hard to do, and it will produce a lot of test code that just testing the code (TDD)
- Dependency Injection is just for computer science researchers. I'm coding here - I don't need that (brrr totally true I'm afraid)
- Open source?! But we need someone to take responsibility for the maintain of the code we're using
- Javascript is just for designers. It make things twirl and beep (Ouch, that's also true, I'm afraid)
- Mob programming?! This is just wrong - all of the team in the same room. With one keyboard!
- Chaos monkey - why on earth would you write a program that is *causing* problems. We need stable IT here. Who did that? (Netflix dudes, the biggest infrastructure/application on the planet)


I could go on and on but I've probably bored you already. You probably
are much better to assimilate new ideas. Two things that I'm proud of
myself for: I'm faster to go from "WHAT?!" to "ok, this might be
something" nowadays - and I recognise many of the things that I say
about new ideas, as things that people say to me when I introduce
them.

I think that one of the biggest reasons that \#noEstimates is so
sensitive is that we're trying to change one piece that we find so
fundamental in how we do work that it's a given. It's how it's done -
how else could we \[fill in your reason here\].

Which brings me to 3


#### It was never about the estimates

No. It was about becoming better solving customer problems. It could
have been \#noRequirements \#noCode \#noDevelopers or what have you.

I often point to Toyota but since they came up with much of the things
that we're into right now... well I like them. One of the things that I
really think they've got right is around their vision. It's not about
selling the most cars in the world, or being the most sought after
employer. It's about their process and goes something like this:
"One piece continuous flow"
meaning that from the time someone orders the car only value adding
activities are done, just in time, with no inventory and no waiting
times.

WHAT?! But that's ... oh, sorry. There I went again.

The thing is: it's not about getting there - it's about the journey.
"One piece, continuous flow" is a compass pointing towards a wonderful
state we probably never will reach. But we (ah, well Toyota's 1.3
million employees) thinks that in trying to reach that goal we question
the things that we are doing today and try to improve them for the
better.

"But if we're going to run this factory without inventory... that means
that we need to have lorries coming into the factory gates with new
material ever 15 seconds" - this happens in a Scania factory in Brazil.
It took them a long time to get there, but they keep pushing for
better.
"But we're going to deploy 50-100 times a day... that means that we
totally need to change the way we build, test, deploy and verify our
code" - this happens at many of the largest sites around the world
today
"But if we're going to run without estimates ... that means that we have
to totally change how we plan, write requirements, interact with the
development team, do budgets and even get certified/approved for
governmental funding" - Yes. Still, this happens at many famous agile
shops today. Pick up the Specification by example book, or check out Dan
Norths talk on Embracing Uncertainty for example. Dan has worked for a
big bank doing this... Bank of.. Bank of... yeah, that's right Bank of
America. But it only, only works there. Or does it?

Let's leave the \#noEstimates for now - it's so scary to even talk
about. I see pitch forks and torches out on the street...


### ((((DO SOMETHING!) SMALL) USEFUL) NOW!)

The above LISP (?) function is defined by
<a href="http://www.bobbemer.com/" target="_blank">Bob Bemer</a> and I
love it. Woody said something that got me thinking of that quote in our
conversation: "I don't care much about the order of the backlog or pay
much attention in if we're doing the most important thing"

WHAT?! But ... now it's getting old right?
I've spent SO much time prioritising backlog, checking that we're doing
the most important thing. This provoked me!

But the point here according to me is that if you do something small
often it doesn't really matter that it's the most important thing.

If you push things into production 2 times a year it's of course
 *super* important that you're doing the most important thing. But if
you're (like my last two gigs) push things 10-20 times a day, it's not
as important.

Doing things that small require a totally different way of working
though, but consider how much we have changed in how we do software
development since agile came into existence. TDD, Pair programming,
meetings, source control, micro services, etc. etc. It's "totally
different way of working" (quote from Marcus Hammarberg, about 5 seconds
ago).

Maybe we can become better if we try to let that spill over in how we
test, how we write requirements, how we plan, how we est ... (nearly did
it again. Walk away Marcus. Don't look them in the eyes and just walk.
A. way.), even how we do business.


### Go concrete early and adjust

On of the things that I've come to appreciate and try to live by in the
last couple of years, when it comes to code, is to try to  become
concrete earlier.

This all comes from something that
<a href="http://gojko.net/" target="_blank">Gojko Adzic</a> used to say
(<a href="http://www.specificationbyexample.com/" target="_blank">in his
book</a>?): the first time the specification is concrete is when the
code is written.

This is in the relation to specifications and code where we make our
shared understanding concrete by writing executable specifications and
implementing the fully fledge feature in small increments so that we
could try them and validate our learning earlier.

I like this very much and as I've have had this in my head for so long I
have started to try to apply in other areas as well; how do we make an
new organisational structure concrete earlier? Can we do simulations or
dry runs, walking around and pretend that we're in the new organisation
and see how it would play out? Could we implement it in just a small
part of the whole organisation?

I think there's a great meta-learning here trying to become more
concrete earlier. What should we change in the current way we are
working in order to let our ideas become concrete earlier?

Finally under this heading I was reminded about a story from
<a href="http://www.avegagroup.se/" target="_blank">Avega</a>, a
consultancy I worked for a couple of years back. We sent a team (not
including me) to a programming contest.

The task at hand was to write a little program that went around a
playing field and collected "gold". The team with the most gold after 3
hours won. There was a set HTTP API that you called  in order to move
your "robot" around the playing field. When you had 10 golds in your bag
the robot needed to go back home and empty his bag before he could go
out again. This was the point where you could update your program too.

Our team won. They crushed the others. But they didn't won because they
wrote the most nifty gold-finding algoritm. The won because they
iterated fastest. Here's what they did:

First they created the simplest thing that could possible move the guy
around. It was one of the team members (Joakim Sundén I think) that used
the WASD-keys to move the "robot". So it was not even a robot.

As the first version was created Joakim started to go around collect
gold, manually. In doing so he didn't only just started to collect gold,
he also fed back ideas to the programmers

- "Guys, the server is lagging. Maybe we should make sure we get a
    response before the next command. They are queued up now and I run
    over the edge"
- "You know what would be great? If our guy could remember where he
    was when he had to go back home. He could then automatically replay
    those steps to get back to the same location"
- and more like that

The team worked on the new features in two groups and the feature
(either one) that was completed first was deployed at the next round.

Every feature was created in the simple possible manner first (remember
this still wasn't a robot), wasting no time on the playing field, where
Joakim was collecting gold.

If my memory serves me right it was not until the last round that the
robot did automatic picking of gold. By then the winners where already
clear; Team Avega had won. Also the other 3 teams aimed to implement an
automated robot:

- 1 didn't finish at all - 0 gold
- the other two was significantly slower to produce their first
    version on the playing field. Since that was their first version it
    had some severe bugs that slowed them down significantly. Hence much
    less gold than our team.

Team Avega won because they iterated faster and deployed something
valuable faster. They did not build what *the specification* (game
instructions) said, but took the aim of the game and use that as their
inspiration to become better than even they thought they could be.

And in the process inspired me.


### Constraints are great to produce innovation

Real short on this; I've blogged about
<a href="http://www.marcusoft.net/2013/01/on-constraints.html"
target="_blank">constraints before.</a> But when you listen to the
history of Woody you here constraints come into play again and again:

- "I couldn't afford to study full time, so I had to learn on the job
    meaning that I always pushed myself a little bit more"
- "Learning to program I only had 1 hour to spend each day and I
    needed to build stuff for myself so I ..."
- "My firm couldn't make big investments so we had to take on jobs
    that showed that we could finance the purchase expensive equipment
    before we went to the bank"

That only strengthen my thesis; with constraints comes innovation. The
worst thing that could happen to a project, team or company is to have
to much resources. I've worked in placed with too much money - disaster
follow both in morale, quality and customer focus.

If you are in such company - add artificial constraints. This is
essentially what WIP limits and sprint lengths are. And when they feel
comfortable - lower them. This will push you further and further towards
a better future.

Maybe even better than you can imagine now.
Imagine that.
Imagine wonderful.


### PS

Woody often announces that he has time available to chat. Don't miss
that opportunity - who knows what kind of thoughts a chat with a very
experience agile fellow like Woody Zuill might trigger in you.

Thanks a lot for the inspiration Woody - looking forward to the next
time.
DS
