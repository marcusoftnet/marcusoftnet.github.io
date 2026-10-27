---
layout: post
title: "The return of the waterfall?"
author: "Marcus Hammarberg"
date: 2026-10-27 04:00:00
tags:
  - Agile
  - Product mindset
---

> I believe in this concept, but the implementation above is risky and invites failure

![Waterfall paper, page 2](/img/waterfallpaperpage2.png)

This is a line, on page 2, from the 1970-ies paper that defined Waterfall model (although named like that in the paper). It is, if you continue to read on, "risky and invites failure" because things pops up that might change what we thought earlier. To my understanding the author, Dr Winston Royce spent the rest, not only the paper but career trying to explain that people misread his first diagram as something good.

<!-- excerpt-end -->

In the words of Woody Zuill "It is in doing the work we discover the work we need to do".

My own take is that we are in the product development business, not product manufacturing. Manufacturing for software is copying the binaries. Bom - we made another. We are not doing that in digital product development. We are building things that didn't exist before we started.

That requires another approach and for a long time an iterative and incremental way to build small chunks of working software with frequent checks with the people using the software was the best way of doing it.

## Along came an agentic factory

And then AI came. And we saw the speed (and cost) of writing specs, code and tests go down. A lot. And we forgot about the waterfall thinking. Now we decide on the specifications up-front, have the agent write 60 pages of PRDs, 100s (407 is my record) of user stories (that we read and review, right) before pushing the "Build" button.

And I'm left thinking - is this a bad thing? I honestly don't know. I know that waterfall didn't work for humans, that was proven in the 70-80ies and then we spent all of agile's life time to do it better and differently.

If I, as a Scrum master, had asked a Product Owner to review 407 stories before the team build them - I would have been thrown out. Rightly so - that's neither incremental and not iteratively either.

But is it bad for agents?

An agent can read ALL of the documentation before every decision and make good use of it in each it's decision.

The problem is that me, the human, still cannot keep all of that in my head. I have an increasingly hard time to keep up and ultimately understand and remember what was decided.

## The bottleneck moved

[Every factory has a constraint](https://www.marcusoft.net/2026/07/ai-flow-toc.html), and everything upstream of it is just a way to build a pile. Make the oven twice as fast when the bottleneck is the one person who ices the cakes, and you don’t get twice the cakes. You'll get a big pile of stale cakes that the icing station didn't get to.

That’s what happened. Writing specs, code and tests used to be the slow part. Now it’s the cheap part. The slow part is me: understanding what was decided, checking it’s what we need, and putting it in front of someone who’ll tell me it’s wrong.

So 407 user stories isn’t speed. It’s inventory in front of the new bottleneck. The Lean answer hasn’t changed: don’t feed the constraint more than it can process. Limit the work in progress. Let the agent stop when the review queue is full.

## Why

Iterating was never about the cost of writing code. It was about the cost of being wrong. Big blocks of work hide risk, uncertainty and misunderstandings, and the only way to find them is to put something in front of someone and watch.

None of that changed. What changed is the price of each attempt.

So what do we do with cheap building?

Two things comes to my mind:

* Take bigger steps where the feedback is automatic. If an agent can check its own work with tests, types and executable specs, it can run further before a human looks. Let it.

* Keep steps small where the feedback and bottleneck is you. My brain didn’t get a 10x upgrade. (Heck I'm old, right now I'm only doing downgrading I presume...) If I can’t hold 407 stories in my head, I can’t tell whether the thing built from them is the thing we need. The limiting factor is now human comprehension, not typing speed.

The question is the old one: where is the queue now? It used to sit in front of the developers. Now it sits in front of me, as a pile of specs waiting for review.

Royce wrote that he believed in the concept, but that the implementation was risky and invites failure. I’d say the same about the 60-page PRD: sound idea, risky way to do it. So write the next small thing, build it, show it to someone, and let the agent do the typing.

Smaller steps, easier review, less risk, faster feedback - that's still viable.
