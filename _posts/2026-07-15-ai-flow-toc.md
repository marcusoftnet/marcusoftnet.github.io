---
layout: post
title: "AI Flow - theory of constraints"
author: "Marcus Hammarberg"
date: 2026-07-15 04:00:00
tags:
  - Agile
  - Lean
  - AI
---

AI is arguably one of the biggest paradigm shifts in the digital product development industry ever. Even if it stopped right now with Fable 5, we still would have changed so much that the before feel like a distant past. `Writing the code by hand? Please...`

A discussion with a friend, that works in manufacturing industry, made me reflect over this paradigm shift. It reminds me a lot about the advent of industrial robots in the manufacturing industry. This was 1970-80 circa and these robots was also perceived as something that would make "ALL WORKERS REDUNDANT" and visions of fully automated factories was envisioned.

Early on the outcome was hard to forecast too; the industry robots did a lot of the manual work that humans used to do and did it much more reliable and better than humans. Also - the human interaction was now higher up in the value chain; instructing and verifying for the most part.

Hold on to that analogy, because it's going to be very useful - right up until the moment it breaks. And it breaks in exactly the place that matters most. More on that further down.

I thought about this some more and then realized that we, in the product development industry, are right now making a lot of the initial mistakes and dream about futures that the tool might now deliver on.

I wanted to write a bit about that, [theory of constraints](https://en.wikipedia.org/wiki/Theory_of_constraints) and [The Goal](https://www.marcusoft.net/2014/12/what-is-the-goal.html)

<!-- excerpt-end -->

## Productivity, robots and the goal

Yes, I'm back to The Goal, a great business novel by Dr. Eliyahu Goldratt from the 80ies. In this book our hero, Alex Rogo, gets thrown into a leadership position of a failing factory. And he is very surprised, because the factory has invested heavily in and are utilizing robots a lot. All the robots are working and every part of the value chain looks good, but still the factory is failing.

To come to terms with this conundrum he calls an old professor "Jonah" (Dr. Goldratt to you and me) and ask for help. His question cuts to the point:

> Is your plant more productive?

To which Alex responds (I'm shortening this A LOT):

> Yes, we are very efficient and utilize the robots perfectly.

They then unpack that local efficiency without throughput is not really productivity. Productivity needs to be measured against a ... ta-ta-ta-TAAA! ... _The Goal_ of the factory.

> Productivity is the act of bringing a company closer to its goal. Every action that brings a company closer to its goal is productive. Every action that does not bring a company closer to its goal is not productive.

(Side note to myself and you: in [my post on throughput](https://www.marcusoft.net/2026/07/ai-flow-throughput.html) I grumbled about "productivity" as one of the words that rubs me the wrong way. Turns out I was grumbling about a _counterfeit_ i.e. fake productivity. This is the real thing, and it's the whole game.)

So productivity isn't a number you compute. It's movement towards the goal. And Goldratt gives us three measurements to see whether we're actually moving:

* **Throughput** — the rate at which the system generates money through sales
* **Inventory** — money currently tied up in things you intend to sell
* **Operating expense** — money spent turning inventory into throughput

You want throughput going up, inventory going down and operating expense going down. That's it. Simple... in manufacturing. But useful if you could translate them to digital product development.

## We are doing the same mistake with AI

This is one of the places where I think we are messing up right now in our use of AI agents for development. We focus a lot about creating features, closing PRs, running tests, even deployed versions of the app... but that is not true Throughput (in the sense of the Goal). In fact, it's just increasing inventory. We are _over producing_ features - a deadly sin in agile, Lean and Theory of Constraints.

[Throughput (see previous post)](https://www.marcusoft.net/2026/07/ai-flow-throughput.html) for digital development is features that meet a real user's need - what I called _impact_ last time. And yes, I'm still deliberately raising Goldratt's bar from "sold" to "need met", because that's what makes sense for digital products.

We are mistaking activity for throughput.

## The three measurements - for digital product development

Let's take those three measurements and see what they are for digital product development.

* **[Throughput](https://www.marcusoft.net/2026/07/ai-flow-throughput.html)** - features that meet a user's need. Not closed tickets. Not PRs per second. But outcome and impact.
* **Inventory** - things we've built that aren't meeting a need yet. And here it's worth splitting in two:
  * there's the _work in process_ kind - code an AI generated that we haven't reviewed or validated yet
  * and there's the _finished goods_ kind - features we shipped that nobody uses. Both are inventory. In the words of [Woody Zuill; `truly useless`](https://x.com/AgileFortune/status/1141937880870395904).
* **Operating expense** - human attention spent converting inventory into throughput. And token cost - although that is probably orders of magnitude lower than the human attention time. My guess, but in my experience; with an AI agent coding, the agents are mostly waiting for your input. Especially true if you run multiple agents. More on that later - but we are the bottleneck.

And we are still measuring _output_ rather than moving up the ladder and measuring what matters. The _outcome_ (meeting someone's need) can, if we are lucky, become _impact_ on the user's world (organization bottom-line, joy etc.). Read more about these different focus in my friend [Christophe's awesome post](https://blog.crisp.se/2019/10/16/christopheachouiantz/output-vs-outcome-vs-impact).

But knowing that _why_ do we still measure the output rung? We know that we should climb up a rung or two to measure the important stuff... Because it's easier, faster and cheaper than to measure _outcome_ or _impact_. AI didn't invent that laziness - it just made the cheap rung ten times cheaper to climb, so we climb it ten times as often.

## Where the robot analogy breaks

Here's the place I promised you the analogy would break.

In manufacturing the rungs of that ladder are welded (literally sometimes) together and out in the open. The output _is_ the outcome - a finished lorry is a finished lorry - and you can literally watch the customer drive it off the lot. Unsold lorries sit in the parking lot glaring at you. Inventory is visible, and it's a rebuke.

In digital product development the rungs are loosely coupled and invisible. It's hard to even know which change made the difference in outcome for a user, and an unused feature doesn't sit in a parking lot where you can see it. It hides. [Code is cost, as Dan Terhorst-North puts it](https://youtu.be/4Y0tOi7QWqM?si=rvTaF28Dt5iSvLD9&t=232) - and Goldratt would call our unused features inventory. I'd go further: they're a _compounding_ liability. More to maintain, a bigger security surface, more cognitive load, forever.

So it's the same mechanical mistake as the factory - but in the one domain where the mistake is hardest to see and most expensive to keep. Nasty combination. And it's exactly why the robot analogy is so tempting and so dangerous at the same time.

## Theory of Constraints

Theory of constraints is a management paradigm that, through the help of [five focusing steps](https://en.wikipedia.org/wiki/Theory_of_constraints), helps us to identify and manage the bottleneck that is hindering throughput the most right now.

The five focusing steps are, [straight out of Wikipedia](https://en.wikipedia.org/wiki/Theory_of_constraints):

1. Identify the system's constraint(s).
1. Decide how to exploit the system's constraint(s).
1. Subordinate everything else to the above decision.
1. Elevate the system's constraint(s).
1. Warning! If in the previous steps a constraint has been broken, go back to step 1, but do not allow inertia to cause a system's constraint.

If there was no bottleneck then software development features would be in production the moment you thought of them. It might feel like that with an AI, but it is not like that. Why? Because there's a bottleneck in the system.

We have often claimed that coding is not the bottleneck, and before AI it was easy to think so. It might even have been the bottleneck in some regards, but I would bet that was rarely the case.

Yearly releases (yes - I worked in that org, less than 2 years ago), 22 layers of decisions before developers wrote code (worked there too, 6 years ago) or just the simple "no releases on Fridays" are examples of process that place the bottleneck somewhere else than in writing the code.

But we spent A LOT of time trying to improve speed in the non-bottleneck. Borrowing an image from a [blog post from 2018](https://www.marcusoft.net/2018/03/a-simple-diagram-on-flow-efficiency.html) to illustrate the point:

![Flow efficiency](https://www.marcusoft.net/img/flowefficiency_4.jpg)

Now with AI this should be even clearer. Think about it like this; if AI is making us 10x faster we should see 10x more outcome. Do we?

No - we don't. Because we optimized the non-bottleneck. Or the bottleneck has moved in the AI world. So where did it go?

## Friction was the hidden gate

Before AI agents, the friction of a human writing the code gave us an accidental validation gate. In fact, there are great methods for estimating that build on this; this feature will take you 6 weeks to build - do you want to invest that much in it? (See [Shape Up, which has a lot of great content on this approach](https://basecamp.com/shapeup)).

Now, AI removes a lot of that friction and we can write a lot of code in a short period of time. Writing the actual code is NOT the bottleneck now (but my guess is that it wasn't before either).

The problem is that the accidental validation gate is gone too. Anything can be built fast, but we still need to learn and understand what we _should_ build and release. What gives the _outcome_ we want?

And since the building is now faster, the learning needs to be faster too.

Also - the agents are faster than you. Which means that...

## Humans (work) are the constraint

If you've ever used more than one agent working on a task, you have most likely experienced the [AI Vampire Effect](https://steve-yegge.medium.com/the-ai-vampire-eda6e4f07163) coined by Steve Yegge.

In my words and experience, this is where you feel like the agents are chasing you - with questions, things to review, or by just being finished and asking for more work. The tool is waiting for you.

And, let's make it clear, keeping the agent busy is not a goal in itself. Ensuring that the feature that gives _outcome_ and _impact_ flows without interruption towards done - that is a goal.

Right now we are overproducing in the steps upstream of the bottleneck. This is not only creating a long queue, it's building inventory. Remember the lorries in the parking lot? Same thing - except ours are invisible.

When the human is the bottleneck it gets even worse, because switching context is hard for us. It takes time, it's mentally draining, and it makes us make more mistakes.

## The five focusing steps on our overloaded human constraint

Ok - let's say the bottleneck is the human. And you really should not assume that; you should measure it. But I'm going to use that example here or my blogging is for nothing...

Let's apply the five focusing steps here:

1. **Identify the constraint** - we've done that. It's me. The human that the agents are waiting for.
1. **Exploit it** - which basically means I'm only doing bottleneck work. Ok - I try to.
1. **SUBORDINATE everything else to it.** This is where the non-bottleneck parts of the process change their behaviour to the fact that the bottleneck is somewhere else. More below.
1. **Elevate the bottleneck** - get more humans to review. Slow and expensive to implement, often.
1. **Repeat** from 1 and find the new bottleneck.

If we are going to subordinate the agents' work to the fact that the reviewing and validating human is the bottleneck - what does that mean?

It means we should let the agents give us top quality work that we can review **WHEN** we have capacity to review it. Not doing as much work as possible with several agents. Not starting two additional tickets just because I was waiting for one agent.

It might not mean always having only one agent going. But fewer is better.

This is reducing work in process (WIP) for agent-driven work, down to the human constraint of validation.

## Recommendations

First of all - make sure you measure throughput (which for digital software development is _outcome_ or _impact_) - not _output_. Yes, it's harder. But it's what matters. And at the very least, express which _outcome_ values you're here to improve. Even without measuring them yet, it will be useful for anyone on your team.

Find your constraint - what is holding throughput back in _your_ process? I'm guessing it's the validation. But it could equally well be the earlier stages like business decisions, discovery or design. I don't know. Do you? Show me the data. If not - why are you optimizing a potential non-bottleneck? Do not make me show [the ugly graph again](https://www.marcusoft.net/img/flowefficiency_4.jpg).

Track the lead time of the entire process and the throughput of the _outcome_ to find the bottleneck. Then improve both by putting a WIP limit on the system, so that it is not overproducing work that increases inventory and slows down the flow.

Subordinate agent pace to the human constraint, not the reverse. Just because agents _can_ do a lot of work doesn't mean we get more things done. Remember the robots.

Protect the constraint, and point AI _at_ the constraint to elevate it - not at the part that was never slow in the first place.
