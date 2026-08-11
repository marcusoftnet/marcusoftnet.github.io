---
layout: post
title: "AI flow - it is cheap to run, not to learn"
author: "Marcus Hammarberg"
date: 2026-08-05 04:00:00
tags:
  - Agile
  - Lean
  - AI
---

![Learning is still not cheap](/img/learning_still_not_cheap.png)

Since I started to see people use AI to build digital products something has always rubbed me the wrong way. It is like we are forgetting value, outcomes or impact and just keep clapping for the output. [Token-maxing is real](https://www.viberank.app/) and I often have a hard time reaching through to people with this message, just because we are so happy that we close more (and bigger) pull requests.

Let's not forget that. Let's bring a value-obsessed, outcome measured and impact focused way of working back. Right now we are wasting the human capacity on keeping the agents busy.

I've written a few posts now on flow in the age of AI and to be honest, the other posts have been a setup to this post that is like the main idea (or itch I needed to scratch). Let me bring you up to speed with a short summary of the concepts so that you don't have to read all of the posts, and provide links back to them.


<!-- excerpt-end -->

## Setting the stage

Digital product *development* is not manufacturing. I wrote about this in the [post on throughput](https://www.marcusoft.net/2026/07/ai-flow-throughput.html) and also where I likened *development* more to [R&D and experimentation than manufacturing](https://www.marcusoft.net/2026/08/elevation-deskilling.html).

The thing that slows our productivity down is learning. We do not work best until the user has tried it out. A/B tests, short iterations, feedback early etc are all put into place to promote faster learning.

The overproduction from AI agents (are they [this age's industrial robots?](https://www.marcusoft.net/2026/08/ai-robots.html)) isn't only creating unnecessary inventory of unfinished features. The way we are using this tool now also piles work onto the likely [bottleneck in the process: the human](https://www.marcusoft.net/2026/07/ai-flow-toc.html) - their taste, validation and judgement skills.

## Manufacturing and development

We keep conflating manufacturing and development in how we manage and measure systems for them. They look alike, and in fact many of the tools and practices are the same - but the intent is fundamentally different.

In manufacturing the units we produce *are* the value, and variation is a flaw. The more the merrier - as long as we can sell them (see the [throughput post](https://www.marcusoft.net/2026/07/ai-flow-throughput.html)).

Development is the mirror image. When we build ten variants of a feature, nine of them are *supposed* to lose. We're not producing ten things of value - we're paying for nine failures to find the one that works. The variants aren't the product; they're the receipt for the information we bought. We're really just building a [single instance, honed by experimentation](https://www.marcusoft.net/2026/07/ai-flow-throughput.html) - and the pile of discarded versions isn't waste, it's the cost of the honing.

So yes, the mechanism looks identical - produce many, fast, cheap - but in manufacturing every unit is throughput, and in development nine out of ten are tuition. Which is exactly why making production cheap changes less than it looks: the value was never in making the ten, it was in knowing which one to keep.

## We're running faster - but learn at the same pace

AI made running the experiment cheap. It didn't touch the price of learning from it - that (often) still takes a real user, a real reaction, real time.

And that's exactly what rubs me the wrong way about how we use it today. I hear endless examples of design, coding or testing getting faster. I hear almost none where the end-to-end flow - the whole lead time from idea to a met need - actually got shorter. We sped up the parts that were never the bottleneck.

Because producing variants was never the hard part. Strategy, architecture, UX, deciding what to build, reading the results and making sense of them - that's still human work, and it didn't speed up just because the code arrives quicker.

## Where is the bottleneck?

In the agile community we have often said: `typing is not the constraint` and if anything I think that agentic assistance is now showing us that.

Remember from [theory of constraints](https://en.wikipedia.org/wiki/Theory_of_constraints) that each system has a bottleneck that slows down production. If we fix that then we have improved the throughput for the entire system.

If the work that AI agents are doing *was* the bottleneck then we would have seen higher throughput. In our domain - more impact for our users. But we don't. Because the bottleneck was not there, or has moved.

Flooding the bottleneck with work increase work in process (unfinished features, experiments that never ran) which slows us down. Per feature and overall. Not mentioning the strain it put on the bottleneck itself. You know? Your people... that get overworked and stressed by being the bottleneck.

An experiment you can't learn from is worse than none. Just because of the problem with overproduction. It costs attention, muddies the signal, and — worst — fakes rigor. "We ran 12 experiments" feels like diligence while producing zero decisions. Overproduction 101: effort spent producing things (experiments) that don't become throughput (decisions / learning / impact).

## Can I only learn in production?

Now, I'm pushing hard to learn in production, from real users here. But that is the longest feedback loop and the most expensive way of doing it. Or...

There are many shorter feedback loops to try out by conversations, prototyping and smaller test groups (you know - [first diamond stuff in the double diamond](https://en.wikipedia.org/wiki/Double_Diamond_(design_process_model))). These activities have also got a boost from generative AI tools.

But the promise of AI tools in all steps of the process and with the increase of speed we should see a cost reduction to make it easier and more feasible to take experiments all the way to real users in controlled experiments. Imagine not only testing UI changes, but maybe architectural changes, algorithmic variants and even complete stacks in different variants. The real promise of short iterations, agile processes etc. that now can be realized.

## Can we make decisions as fast as you can experiment?

But the question remains - can we make decisions as fast as we can experiment?

A long time ago I got assigned a team of COBOL developers. They were pointed out to me as "the bottleneck" and "we are always waiting for them". Once I got there I realized that the process had 22 (!) handoffs before the specification (pseudo-coded in Word, mind you) reached them. The change request had been in the works, on average, for 9 months before they even saw it. And, weirdest of all, their backlog was mostly empty.

They asked me to optimize the wrong thing. The decision making took *much* longer than the development.

Speeding up that COBOL team would have bought us nothing - the nine months were spent upstream, in deciding. Now swap "COBOL team" for "AI agents" and "handoffs" for "a reviewer who can't keep up," and you've got us, today. We're pouring all our new speed into the one place the work was never stuck.

## Recommendation

Nothing here is new. In the manufacturing industry this situation happened with the robotic revolution and we saw different ways of navigating it. With very different results.

The organizations that succeeded, early and continuously, managed the process for flow of value and optimized the throughput by managing their process bottleneck. Cap experiment WIP the way [Post 1 capped agent WIP](https://www.marcusoft.net/2026/07/ai-flow-toc.html): limit experiments-in-flight to what you can actually metabolize and turn into learning.

Pick the cheapest way of verifying the experiment that can kill (hello [scientific method](https://en.wikipedia.org/wiki/Scientific_method)) the idea; save prod A/B for the survivors.

Ask before generating variants: "what decision will this let me make, and can I actually read the result?" If not, you're overproducing, producing an inventory of unverified experiments and features. That is not value - that's just slowing you down.

## Summary

The (rev)evolution of agentic product development is going very fast. The changes that took the manufacturing industry decades are now happening in months. But even more reason to get it right fast too.

Ensure that the bottlenecks in your process are correctly managed. They will most likely be people. Optimized not for output but for outcome and impact for users - which is the real value (throughput in ToC terms) and flow of value.
