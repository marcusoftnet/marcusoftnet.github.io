---
layout: post
title: "AI Flow - a thought on throughput"
author: "Marcus Hammarberg"
date: 2026-07-12 04:00:00
tags:
  - Agile
  - Lean
  - AI
---

The world of digital product development has changed forever with the advent of AI models like Opus (that was the first to make me realize this). In fact, many other industries have also changed, but I'm going to stick with what I know.

And ever since I started to realize that code will be written by agents that instruct I immediately got a sense that we (the industry) are making age-old mistakes that we and other industries have made, fixed and now comes back to.

We are focusing a lot on the things that [rubs me the wrong way](https://www.marcusoft.net/2026/04/four-ai-trends-obstructing-flow.html); output, efficiency, velocity and productivity. None of those are bad per se but without knowing the goal, something about the value, stating effects impact etc... They become [productivity theater](https://en.wikipedia.org/wiki/Productivity_theater)

I realized that I hadn't thought this through properly and decided to write a few post on it. This is one on what throughput really means. I'll link the others here as I write them.

<!-- excerpt-end -->

Throughput is one of my goto flow-metrics; lead-time, work in process and flow efficiency are the others. I like it because it's so easy to grasp. Deceptively simple, as it turns out.

Imagine that you stand outside a factory that makes lorries. It's one of those boring big boxes with small windows at the top. You can't see inside it, but you can see the parking lot outside it. Where newly made lorries are rolled out.

At the end of the day, 6 new lorries stands on the parking lot. The throughput of that factory was 6 lorries per day, on that day. If you stand outside the factory for 100 days you can better statistics over time - but in it's essence that's it:

> Throughput in business is the rate at which a product is moved through a production process (and onward to being consumed by an end-user.)

Easy, huh? Well... not that easy it turns out. At least not if you ask Mr Goldratt.

## The Goal

[The Goal](https://www.marcusoft.net/2014/12/what-is-the-goal.html) is arguably one of the most important business novels that has ever been written. It's an exploration of the useful, but bone-dry concept of theory of constraints, set in an engaging story about a factory manager trying to save his factory, marriage and relationship with his son. It is really great! You should read that instead of this post.

I'll reuse concepts and thoughts from that book in these posts but for now let's consider only the throughput metric.

## Throughput in the eyes of Dr. Goldratt

In the book Dr Goldratt (that sneakily written himself into the story as Jonah) define _throughput_:

> Throughput is the rate at which the system generates money through sales.

Not production, but sales.

Let's go back outside the factory of lorries and see what that this definition gives us. At the end of the day 6 lorries had been produced. 3 of them were pre-ordered and immediately picked up. The throughput that day was 3. Not 6.

The other 3 lorries are inventory. Just as the 22 ones being worked on inside the factory house that you didn't see through the factory wall. Some sections mounts the tires and other makes the engine and a third group makes the drive line. But at the end of the day 6 lorries comes out of the door and 3 was sold. Throughput is 3.

Nitpicking you would say that the 3 lorries that was not sold is not WIP but finished goods waiting to be used. That distinction is easier to make in the physical product world. Speaking of...

## Digital product development

Let's move the conversation to digital product development. First let's talk about development.

### Development

Development is different from manufacturing. Development means creating something that didn't exists before - a single instance (that we hone to perfection through experimentation of different variants). Manufacturing means making many more of something. In manufacturing we don't want variability - for development that is exactly what we want; or we should buy it off the shelf instead.

Yes, that single-page CTA campaign site that you are building has never been built before. I sure hope.

Let's not get over ourselves. In most cases we are not inventing cures for deceases or solving big problems. But - the thing that we are spending time on is never built before. If you don't believe me ask yourself why we use [A/B testing](https://www.optimizely.com/field-notes/articles/how-obama-raised-60-million-by-running-a-simple-experiment); it's because we do not know what works before we have tried it on real humans. And then we are often surprised. And we tweak it to get better impact.

## What are our lorries?

What would the lorries be in our book? It's very easy to fall into the trap of thinking that this is tickets, PRs or designs. But I think that it's missing the point a bit; it's impact.

[Mike Burrows have a working definition of Done](https://blog.agendashift.com/2016/05/25/a-good-working-definition-of-done/):

> Someone's need was met.

Imagine that one of those lorries needed to be delivered to a guy called Lars. That took another two weeks and then Lars could drive it and makes deliveries. Now, [when was Lars happy](https://www.marcusoft.net/2019/09/when-was-lars-happy.html); when the lorries was produced or when he could drive it?

Now, this is NOT what Dr Goldratt meant with his definition, but in the world of digital products it makes more sense, than to wait for the next weekly subscription to come in, I think.

During the delivery time - the lorry company has not delivered the lorry. By definition. It is produced and ready, but not delivered.

In digital product development we produce a LOT of features that never becomes impact. Our tickets, PRs, builds and deployments that is never used is [truly useless](https://x.com/AgileFortune/status/1141937880870395904).

This can be depressing, but just to make a point:

1. You create the best impact map you've ever done
1. The implementation plan was amazing
1. The code was flawless. Seriously it won prices. And since you used agents it was done in 2 minutes
1. The testing was 100% coverage, automatically. And no bugs was found
1. The CI pipeline was brilliant and created a perfect package in seconds
1. The deployment went smoothly
1. No one used the feature

What was the value of that? Zero. The value is the impact and effect we create for our users. I use "users" in the wider sense since for technical work we might be the users, or auditors, or others - but the same reasoning holds.

## What is our throughput

Dr. Goldratt defines throughput as:

> Throughput is the rate at which the system generates money through sales.

In digital product development that sales comes from meeting users needs so that they can do their work; Harder, Better, Faster, Stronger. Yes - I [Daft Punk'ed you](https://www.youtube.com/watch?v=gAjR4_CbPpQ).

Hence our throughput is about _features making an impact_ for a user. Not closed tickets, PRs / second or bug reports. Closing a PR is like rolling out a lorry to the parking lot. It might be good, but if it's never bought and used it's not creating value, and hence not throughput.

A quick honesty note before I go back to counting lorries. Goldratt's throughput is strictly money — revenue through sales, minus the truly variable costs of making it. I'm going to be sloppier than that and count things: lorries per day, and later, features that made an impact. That's a common simplification among flow people, but it's still a simplification, so it's worth saying out loud. I'm using the count as a proxy for the money. And here's the thing — in digital product development, the money-through-sales figure is exactly the part you can't see. That's not me dodging the hard measurement; it's the whole problem this post is circling. The count is what's visible; the value is what's hard. Hold that thought, because it comes back.

## "But that is really hard to measure"

Yes. I know. Measuring value often is. But according to [How to measure anything](https://www.marcusoft.net/2014/12/what-ive-learned-from-how-to-measure-anything.html): `anything can be measured`.

I also think that the pure knowledge of that we know that closed PRs per day, or designs accepted, or lines of code is a good starting point to find the indicators of value that we want to see change, the change in impact that our efforts should bring.

Who knows? That our AI agents creates more output might not (always) be related to positive development of that impact.

## Summary

This was a first post on flow in the AI age. I'm using this a lot to summarize thoughts that I've had in my head for quite some time. I hope you found it useful.

In my next post I will talk about why your agents are exactly the robots from The Goal, and why that comparison breaks in the one place that matters most. And how that will tie back to throughput.

## In short

Throughput for manufacturing is the rate at which a system generates money through sales (not just production). For digital product development I propose throughput can only be measured when _someone's need was met_ - making _impact_, or at the very least when the change we made is _used by users_ (i.e. _outcome_).

That is the scope that we should measure to ensure that we capture all of the process that produce value.
