---
layout: post
title: "True north in Product Development"
author: "Marcus Hammarberg"
date: 2026-09-24 04:00:00
tags:
  - Agile
  - Product mindset
---

Digital product development is changing in foundational ways. Close to everything we used to “create” is very likely to be done by an agent going forward. Code, design, tickets, tests and what have you. The most likely first of those is code (as in code will not be written by humans - there I said it) so I’ll use it as an example.

My immediate feeling is one of almost dizziness over how much that changes and what we will actually do... well no one knows yet. But it will be very different from today and that has my head spinning.

To have something to hold on to I started to think about whether I could come up with some values or quality gauges that would always be the same to steer after, regardless of how the output is created.

Like this - let’s say that the agents write the code, design, test and all of that instead of you; how would you know that the created product is good? That the code is good? That the process is good?

Yes, I’m looking for outcomes that are good to steer towards, regardless of how the output is created. It's that simple. And we have probably measured most of these before, but now I'm coming at it with a different pair of eyes.

I make no claim of having a definite list here, but I felt a bit calmer after doing this and have a direction to navigate towards regardless of how my ship is propelled.

<!-- excerpt-end -->

## Overview

I thought about this in 4 dimensions:

1. **Value** - why are we doing this thing? Are we building the right thing?
1. **Flow and learning** - how we work and how that is improving over time
1. **System quality** - is the thing we put out there any good? Are we building the thing right?
1. **Code quality** - internally - is it well put together? (This is bigger than code, but I'm scoping it down a bit here)

Let's stop shortly at each and give some thought to what we could measure in each.

## Value

The value dimension is telling us if we are building the right thing. Does it help our users? Does that in turn make or save money for us? If we miss these goals all the rest is not even worth thinking about.

For example, the AI hype is obsessed with output and we have, in some instances, even bragged about how many tokens our agents have consumed. Heck - some companies are even evaluating their employees' performance with that metric. Next up - battery consumption!

Value is the opposite of that. Outcomes and effects in the world that our output could (hopefully) change for our users.

Some good questions to get us in the right mindset would be something like:

> If this was a great success - how would I see that?
> If this feature went missing - what would people miss?
> Imagine that the feature runs with full usage in a year; what business metrics have changed?

Things we might wanna measure here are:

- Are our features even used? A feature that we create that no one (including other systems) is using is truly worthless. But typically we do not track this
- Do we change the business values we wanted to change? More items in basket, more songs played, fewer returns, higher... Here I use the [Daft Punk metrics](https://www.youtube.com/watch?v=gAjR4_CbPpQ) to get me started. Something needs to be `harder, better, faster or stronger`
- Would people miss this feature if we removed it? What would they miss? How could we measure that?
- [Cost of delay](https://en.wikipedia.org/wiki/Cost_of_delay) is another, a little bit more formal way to express the intention; what would it cost us to not get this out per hour/day/week etc.

Outcomes and impact in our sphere of influence rather than in our zone of control are the things we wanna measure here.

Another way to express this is that on this level there are no more whys to ask. For all the metrics below we could ask "Why would you wanna measure that?" and the answers should eventually lead us back up here.

## Flow metrics and learning

Now we are talking. These are the metrics I've spent most time tracking and caring about. But they actually don't tell us if we are doing anything good, just how fast we are doing it. These metrics will also give us good insights on how well the engine is running and if our processes help us to learn or not.

Imagine being in the car with your kids on a long journey. After 2 hours they call out "ARE WE THERE YET?!". If you then answer "We are driving 100 km/h, the water temperature looks ok and we need to refuel (or charge) in 1 hour" you have just given them these types of metrics. And probably annoyed them. Because they wanted to know things from the [value](#value) dimension. That's what the GPS in the car shows - how we are progressing towards the goal.

But the process metrics are also important to care about since they tell us how things are going.

Luckily these metrics have been well-studied since the dawn of the Toyota Production System (TPS) and later Lean. The three (plus one) that I think are most important are:

1. **Lead time** - time from `Could you please` until `Thank you` from the viewpoint of the user of our features. All of those parts (when does it start, when does it end, what is it) are hard to decide but in the world where "In progress" is shortened we finally have a good way to track the entire lead time. Shorter lead time is better
1. **Throughput** - how many things do we get done per day, week or month. [I've written about it before, but throughput](https://www.marcusoft.net/2026/07/ai-flow-throughput.html) should really only be counted when it can be turned into value, hence things that are in the hands of the users. Higher throughput is better.
1. **Flow efficiency** - this tells us where we wait. Waiting times will be related to our process and require us to organize differently, and hence are nuggets of gold for improvement.
1. **Work in process** - work in process is important to track, but more so it's the number one lever for improvement focus. Lower work in process will expose more problems. Lower WIP also means faster flow and higher throughput.

I'm pretty sure that measuring these metrics will be a good thing regardless of how the "creation" is done. The important and powerful change is that we can now encompass the entire value chain, both diamonds in the double diamond. This means that we are less likely to try to optimize something that is [not the bottleneck](https://www.marcusoft.net/2026/07/ai-flow-toc.html).

### Learning

Learning is tricky but follows naturally as a follow-up question to these metrics. It falls somewhere between the flow metrics and the value metrics. We want to learn faster, but why really? Because we do not know what works until we have validated our hypothesis. Hence we work in short iterations doing experiments or small increments.

Suggested metrics here would be things like:

1. **Validated decisions / {time unit}** - how often do we make decisions based on data from the experiments. More is better
1. **Surprises / {time unit}** - guess the outcome and then track how many of the experiments surprised you. Reinertsen (in [The principles of product development flow](https://www.amazon.se/-/en/Donald-G-Reinertsen/dp/1935401009)) makes this argument in information-economics terms and lands on an optimal failure rate near 50%! We have seen data [from Microsoft showing that about 2/3](https://www.news.aakashg.com/p/metrics-experiments) of their experiments fail. More surprises earlier is better, because those surprises are waiting for us in production...
1. **Inconclusive rate** - the share of experiments that produced a shrug rather than a decisive answer. This is tracking defect rate in experiments. Lower is better

## System quality

System quality here refers to what we can say about the quality of the system from the outside, black-box-y, based on how the application is doing. There's even an ISO standard for these things; [ISO 25010](https://www.iso.org/standard/78176.html) if you wanna get a sticker.

We talk about how the system is behaving when we run it; correct, fast enough, reliable, secure, safe, usable.

The [DORA metrics](https://dora.dev/guides/dora-metrics/) talk about this in terms of evaluating software delivery speed and stability: deployment frequency, lead time for changes, change failure rate, and failed deployment recovery time.

Worth knowing: half of DORA (deployment frequency and lead time for changes) is really flow metrics in disguise, and the other half mostly tells us whether the system is reliable. A team can have stellar DORA numbers and still ship something slow, leaky and confusing. DORA tells you how safely you can change the system, not how good the system is.

Other things that we could measure would be incidents, recovery time, defect escapes, performance.

## Code quality

This was the first thing I thought about when going down this particular rabbit hole. My thought was; if I got a code base in my lap, how would I evaluate it without imposing my own thoughts on what is good on it.

For example; let's say that I've asked a great Rust developer to write an application. How could I know if it is good, without learning Rust?

`You can't, stupid!`, I heard someone kindly offer. But if I still wanted to I would measure things that tell me how easy the code is to change, understand, test and delete.

If the code is tricky to change, it usually means that the code base is a mess. If, when I delete a function, I have 28 other places to remove things from - it's usually a smell that is worth investigating.

The DORA metrics from above give us an outside view of this: if changes take long and often break, the code is a good suspect. Not the only one, though.

In other words, if it is risky and costly to make changes the code is not good. It's called software for a reason, it's meant to be changed (how I would love that to be my quote, but it's not, and I cannot find the source).

There are ways to measure code quality using static and dynamic code analysis but it boils down to; can I cheaply make changes to the codebase as I need to.

## Summary

After thinking through and writing about this I now feel very confident that there's a place for great engineering in an agentic world. We will move up in the value chain and probably not write the code by hand, and maybe not even consider the source code the source of truth pretty soon.

But - a great developer that uses agents to write code typically produces applications that score higher on the metrics I've outlined above, compared to a bad developer. The thing that makes this happen is still relevant and requires judgment, trade-offs, understanding and taste.

Call me back in two weeks, when I've changed my mind :)
