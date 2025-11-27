---
layout: post
title: "Some thoughts on lead time in the age of AI"
author: "Marcus Hammarberg"
date: 2025-11-27 04:00:00
tags:
  - Lean
  - Flow
  - AI
---

Over and over I see that in the paradigm shift we are in now, the good old practices keep resurfacing. For example: doing BDD and TDD turns out to be a good idea even if the code is written much faster—and often not by you. Or having a solid understanding of how to create a good, well‑structured engineered application is more important now than ever.

There are more things, but I'll get to that at the end.

In this post I wanted to share some thoughts about lead time that I cannot get out of my head. Let's go back to the beginning by me sharing the simplest diagram I can think of, presented here in my handwriting from 2018, first shown in a [blog post on flow efficiency](https://www.marcusoft.net/2018/03/a-simple-diagram-on-flow-efficiency.html).

<!-- excerpt-end -->

![Flow of Work](/img/flowefficiency_2.jpg)

This is a very crude version of a [value stream map](https://en.wikipedia.org/wiki/Value_stream_mapping), but I've always found it useful. Even just presenting it like above is typically enough to get people's attention.

A few things that we need to point out, because sometimes I do a poor job of explaining it:

1. This is the lifetime of a single feature. The work or waiting is when the **feature** is waiting for someone to work on it. This diagram follows the *work*, not the *workers*.
1. Obviously (but also problematically) I've seldom met anyone who puts their feet up when faced with a waiting time. Instead we start a new thing. That soon gets blocked like the first feature, so we start yet another thing. Then the first thing comes back and requires our attention. And then also—what about the second thing; could you take a look at it now? More things going on at the same time will actually hurt the focus and flow of the original feature. But it’s a totally reasonable way to behave—I would probably do the same.

With that out of the way—let's do some math-y things. There's a metric known as flow efficiency that is interesting to observe. It's the `time we work` divided by the `total time` to complete the work (feature in this case).

You might be surprised to know that for most processes (that have not been optimized for flow) the flow efficiency is... 10–15%. Only 48 minutes of actual work is done on something that took 8 hours before it was delivered.

The time from "Could you please" to "Thank you" is known as lead time. It's not until we are done with the entire feature that our [customer is happy](https://www.marcusoft.net/2019/09/when-was-lars-happy).

## Improving output – original observation

My original post observed that we spend a lot of time improving the speed with which we work, trying to do things faster. Which is a worthy goal, but we are not really making a huge impact on the overall time to complete the work.

![HUGE Improvement in output](/img/flowefficiency_4.jpg)

See?! Totally amazing—we cut that step to 1/5 of the original. But it barely matters for the overall lead time. Also note: since we didn't do anything about the waiting times, the flow efficiency is actually worse. We wait more of the total time.

Instead we need to do something about those pesky waiting times, which is a different story altogether. That requires us to work differently (for example, consider using mob programming where all the waiting times are obliterated, as well as some of the working stages) and also steer differently.

For example: one of the things we wait for could be related to getting approval from a stakeholder, or even getting input on what we should build. To remove that waiting time we need the team to know what to build and own the feature so that they can approve things themselves.

## Improved output – in the age of AI

Earlier when I talked about this, I sometimes had a hard time coming up with how we could move faster in some areas. Better refactoring tools? Someone who types faster? Automated tests?

With the advent of the AI tools we can now see that not only some of the parts of the value chain can produce output much faster, but all of them. Design, writing requirements, coding, testing—there's AI everywhere. And all of it helps us work faster. We get the output faster.

![AI helps us in many steps - with output](/img/flowefficiency_7.jpg)

Which means that the flow efficiency is even worse than before. Now 99.4% (<= Marcus makes numbers up to prove a point) of a feature's lifetime is spent waiting.

## Disclaimer

I'm the first to admit that there might be entire steps that are now redundant in some AI scenarios. Maybe we can have the AI do the code review for us and fix the problems while we do something else. Maybe the design can be translated to React components automatically. But we are not there yet. At the time of writing.

## What to do instead?

The waiting time in the lifetime of a feature is often related to how we have organized and structured the value flow. Things like our team setup, cadence, and ceremonies for planning and review. This means that in order to address the bulk of the waiting time we need to focus our attention on the things around the people doing the work—our operating model, if you will.

And it should be clear that more checks, more tollgates, and more manual intervention will not harness the improved speed in the output steps.

Instead we need to lean in, even more, to some of the values we talked a lot about in the early agile days; things like empowerment, trust, and steering with outcomes and goals rather than tasks and plans. (See—that thing from earlier in the post came back. Told you.)

I have a lot to say about this, but we are packing it up into something a bit more digestible, so I'll just leave you with a few core beliefs that I think will be increasingly important in the age of AI:

* Empowered teams that are allowed to move at their own pace toward goals.
* Teams that are trusted to do the right thing, trusted to get help when needed, and trusted to find the information they need to do the right thing.
* Radical transparency so that anyone in the organization can pull the information when needed.
* Organizations aligned not on plans and milestones, but on outcomes with priorities and shared definitions of success.
* Cross‑organization collaboration built in from the start, where dependencies between teams are managed to support flow of value rather than utilization of resources.
* Continuous improvements of our process on all levels. No more best practices—just good‑enough‑for‑now practices that we use until we find a better way. Like tomorrow.

## Summary

Strap in everyone. This will be another interesting paradigm shift.

Improving the speed of work (output) will soon make the problems in our flow (waiting times etc.) very clear.

This cannot be solved with AI, but needs to be solved by unlocking the true potential of every team and individual and giving them room to be awesome.

Get on the Trust‑train—it's a great ride.
