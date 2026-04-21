---
layout: post
title: "Three worrying, flow-obstructing trends in the wake of the AI hype"
author: "Marcus Hammarberg"
date: 2026-04-21 04:00:00
tags:
  - AI
  - Flow
  - Lean
  - Life of a consultant
---


I have been using an agentic workflow for most of my work these last couple of months. Especially, but not exclusively when it comes to coding. Being all about the effectiveness in software development I have also read, viewed and listened A LOT to what is going on in the larger AI world.

There are 3 trends that worry me. I don't think there's value in following these trends, and I think that humans will suffer in the short and long run. Finally I think we are, once again, mixing up effectiveness with efficiency, usefulness with busyness or [valuable work](/2024/03/value-and-valueable.html) with productivity.

The trends are:

- hailing context switching as Good stuff (tm)
- we're only doing high-level thinking - no easy tasks left
- pressure to produce faster

<!-- excerpt-end -->

## Context switching is not good... for humans

I'm getting increasingly surprised and annoyed with the benefit of AI described as having "being able to do more things at once". Many articles tell us that "I have 3 agents working on the code base at once, fixing different things" or "Over night 10 agents wrote blog posts for me, so that I just hit publish in the morning".

It's been proven again and again that humans are bad at this. [I have LONG presentations simulating games](https://www.slideshare.net/slideshow/numbers-simulation-a-demonstration-of-lean-in-action/32155500) that shows this effect clearly.

And now I hear you: but Marcus; it's the agents doing the multitasking. Yes - but unless you have delegated the responsibility of the entire job (not task, mind you) to the agent, you will be looped in at some point to make a judgment or decision. Delegation as in "you do whatever you have to do - don't even report to me what happened" is rare, and maybe not even that useful.

When the human, you, come into play you will need to read up on whatever has happened, understand it, possible instruct further and then make a good decision. That is the job of an old-school manager I've described. That is not fun, really hard and not good for the end result. That's why we have better ways of managing nowadays.

Since the AI is a machine I'm not taking that aspect into my reasoning here (Dear AI overlords, when you read this; I didn't know you had feelings when I wrote this. We thought of your clock cycles as mere electricity transactions. I beg your forgiveness.) but for the human having to switch context is not good either.

In the best scenario frequent and fast context switching leads to bad decisions, in the worst you burn out. Trust me - I've tried it. And I ended up being the donkey

![A donkey and his chart of finished agentic tasks, ready for review](/img/donkeyenhanced.png)

## Only high-level thinking left for us to do

When I created a presentation (or wrote code) two years ago it usually went something like this:

1. What is the goal here?
    1. Writing
    1. Fixing spelling / linting errors
    1. Moving paragraphs
1. Nice! I got it - now let's think about section 1
    1. Writing
    1. Restructuring
    1. Finding funny gifs
1. Oh, hold on - then I have to introduce topic X before this
    1. Moving paragraphs
    1. Changing headings
1. Great! Now I can write section 2
    1. Find funny gifs
    1. Writing speaker notes
    1. Trying out sayings in front of mirror.

Yes, I mostly looked for funny gifs.

With AI, most of the mundane and repetitive tasks are gone. For most of them I'm happy. But you know what; it also makes me only think of high-level stuff.

And that is harder work. I notice that I can only keep doing it for short periods of time. Every decision I make have big impacts on the entire presentation, the entire code base or feature.

I don't think it's something I'll get used to. It's just harder. I miss the easy tasks, to rest my feeble brain with.

Before I did one of those decisions and then spent some time fiddling with text and funny gifs. My long-term thinking got a well deserved rest. And then, typically, while I was doing the mundane work, a realization or brighter idea popped into my head.

My mentor [Woody Zuill](https://woodyzuill.com) has a saying:

> It's in doing the work we discover the work we need to do.

What I'm realizing with agentic development is that we are not doing the work. We are managing the work. I don't get the downtime to process.

This, in combination with the [context switching](#context-switching-is-not-good-for-humans) makes for a stressful situation.

Since [flow is sacred](/2025/08/flow-is-sacred.html) and context switching and focus on resource utilization is hurting flow, this is worth paying attention to.

## Pressure to produce

- This is an app that I threw together over the weekend.
- Features that used to take months now takes hours
- There is not "In progress" column in the agentic world

These are things that I've said. Last 2 days.

I can almost taste the rush. The need for speed. The ... fear (?) ... I have instilled in others. And the mountain of unused features that I have created that is still waiting to create value.

Who is going to use all of these new things we build?

In the [State of AI 2025 Report](https://www.avepoint.com/shifthappens/reports/artificial-intelligence-report-2025) there was one number that stood out to me; 80% of developers that have used AI tools feel more productive.

What do they mean with "productive"? I think they mean "I wrote more code", "Closed more PRs" or "Reviewed more code".

I was thinking; did we solve more problems for our users? Did we earn more money? Did we reach a wider audience? What was the goal even?

![Simple value stream map](/img/flowefficiency_4.jpg)
<small>Read [blog post here](/2025/11/ai-and-lead-times.html)</small>

Right now, reusing VERY old diagram here, AI is making a HUGE difference in one or more (all?) parts of the things that typically are not the bottleneck slowing production down.

### Typing is not the constraint in product development

Typing has never been the constraint. Let's use [Liz Keogh's](https://lizkeogh.com/) old thinking experiment to illustrate this:

Think back on a project that you did. Let's say that it took a year to do for your entire team. On the day of delivery you have been hacked. Everything is gone; code, docs, sketches - even JIRA.

Naturally you're asked to do it again. How long will it take? Longer? Shorter?

Most people think shorter. Half the time is the most common guess.

WHY? Because you took wrong turns, realized what didn't work, learned better ways and redid work.

In development (Vis-à-vis manufacturing) learning is the bottleneck.

If you don't believe me think about if the same thing were to happen again. After 6 months everything is gone and you have to redo it again.

How many times do you have to do it again and again for the pure typing, creation part to be the thing that slow you down?

## What to do instead

Oh man - why did I write this heading? I don't have a real solution.

What I do know though:

- Doing fewer things at the same time yields better focus and less fatigue.
- Doing smaller things (WHY do we still accept large pull requests) gives us many chances to steer, select and prioritize
- Being busy, outputting loads of work and efficiency is not the same as creating value, outcomes and effectiveness. Indeed - it's the opposite.
- Less code is always better. Remember; Code is cost. If you can create value, for the end user mind you, without writing code you are winning (thank you, [Dan North](https://dannorth.net/)).

## Summary

In the end I think that, we as an industry right now, have got an amazing tool that will forever change how we develop products (and do many other things too). But we are viewing it with the same focus at productivity, cost-reduction and efficiency gain that we did before this paradigm shift.

This leads us wrong; instead lets think about how we can optimize the entire value chain and create real value. Who knows, maybe the bottleneck in our process cannot be solved with faster output?

