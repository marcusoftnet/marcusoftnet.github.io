---
layout: post
title: "Faster feedback and its implications"
author: "Marcus Hammarberg"
date: 2026-06-01 04:00:00
tags:
  - AI
  - Flow
  - Lean
  - Life of a consultant
---

I have been thinking a lot about faster feedback my entire life. In short, this is one of the drivers behind just about anything related to agile software development, product-led development.

Changing our ways of working to enable faster flow is the guiding star for continuous improvement in Lean, the grandmother of agile principles. Over the years we, the software development community, have implemented all kinds of changes to get feedback faster in software development. Off the top of my head — sprints, standups, continuous integration, pair programming, TDD and TCR are all examples of practices that give us feedback faster and faster.

Interesting enough — we seem to have forgotten most of this, so far, in the AI code generation revolution and just been focused on creating a lot of code.

But don't worry — what is good for a human is good for the AI too, as it turns out. We can, and will rediscover this soon.

<!-- excerpt-end -->

## So what was, and is, the actual constraint?

Before we get excited about speed, it's worth asking: what were we actually limited by in the first place?

Communication, understanding, and building the right thing were typically the main bottlenecks. In short — learning. This is illustrated beautifully by Liz Keogh's thought experiment:

> Imagine that you have built a product for a year. When you are about to push it live, there's an earthquake (or EMP-pulse or what-have-you) and everything you did is gone.
>
> Nothing is left; no code, no docs, no data — nothing.
>
> So you are asked to redo that same app again.
>
> How long will it take you now? Why? What did you spend time on the first time?

Typically people say it takes half the time. Why? Because now we have a much better understanding of what we are actually building — we avoid mistakes, wrong turns, misunderstandings. Learning is the constraint.

(Yes, there's always a wise-ass in the back of the room who says it takes the same amount of time since the users have changed their mind — which just makes the point clearer.)

## SMED — and why speed of output isn't the win

This weekend I spun up an agent team that generated a whole application for me, with my preferences code-wise, without me touching the code once. Touch time for me was a total of about an hour — including ~~writing~~ generating the agents and their harnesses.

It's genuinely impressive. It reminds me of one of the more well-known improvements made in Toyota's factories — [SMED (Single-minute exchange of die)](https://en.wikipedia.org/wiki/Single-minute_exchange_of_die).

Toyota wanted to build Just-in-Time with little work in process. When someone orders a Corolla, you build one Corolla from start to finish. No warehouses, no stock — pure value flow.

That nirvana-state was blocked by the fact that in the 40s and 50s, car parts were stamped out by a huge die. Changing the die for another type of car took 2–8 hours. Toyota started improving that process until they got it down to 180 seconds. That took about 30 years.

Now, 180 seconds compared to 8 hours is not *better*. It's a game changer.

But — and here's the thing Toyota understood clearly — the win wasn't just speed. It was that faster changeover enabled a completely different *way of working*. Smaller batches. Faster feedback. Less waste.

The same applies here. We haven't won because we can generate more code faster. We've won a new *opportunity*, a game changer, really. IF, capital IF, we set things up to **learn** faster.

## Harness the value with harnesses

Which brings us back to feedback loops.

If you want to get the actual value out of AI agents writing your code, you should think long and hard about how those loops are set up. When do you find out they had faulty assumptions? After it's built — or before they start?

Spec-driven development is one way to make assumptions explicit and shorten the feedback loop. The newer term [Harness-engineering](https://martinfowler.com/articles/harness-engineering.html) is all about putting guard-rails and constraints in place that give agents feedback *as they build* — feedback that keeps the code aligned with your guidelines, your design decisions, and the actual goal of the product. Not just building the thing right, but building the right thing.

There are variants of this where you put agents in a perpetual loop and correct them as they go — [Ralph Loops](https://github.com/snarktank/ralph) and [Gas Town](https://steve-yegge.medium.com/welcome-to-gas-town-4f25ee16dd04) take that approach.

But I feel right at home with the harness approach, because it reminds me of what we tried to do with humans. When you start writing these instruction files, you'll notice that you've written or read this before — in great onboarding documentation of well-maintained applications, for example.

And that gives me a warm and fuzzy feeling. Because it means that striving for faster feedback is still a good guiding star to follow.

For humans and agents alike.
