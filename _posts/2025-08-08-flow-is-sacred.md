---
layout: post
title: "Flow is sacred"
author: "Marcus Hammarberg"
date: 2025-06-12 04:00:00
tags:

- Agile
- Life of a consultant
- Lean
---

I've been writing some code this week. Well, I do most weeks, but this week I teamed up with some folks here at work. It was great fun — and actually did something pretty useful.

What struck me, though, were the blockages in the process. Some of them was even built-in. That kind of slowness was frustrating, and I think it could have been avoided.

I was lucky to work alongside [Lars Albertsson](https://www.linkedin.com/in/larsalbertsson/), learning from his vast experience at a few of the top software companies in the world. One phrase Lars kept repeating stuck with me as we set up and refined processes at [Scling](https://www.scling.com/):

> Flow is sacred — don't disturb the flow.

This simple mantra carries profound implications. Not just for you.

<!-- excerpt-end -->

Flow, in Lean thinking, describes the smooth, uninterrupted movement of value through a process. It’s the ideal state — and anything that slows flow — waste, stoppages, delays, bottlenecks — should be rooted out and removed.

When choosing how to work, we often control how flow in our process is affected. Take this example: at Scling, we did code reviews out-of-band, and approvals on pull requests weren’t mandatory to merge a feature. But passing our continuous integration (CI) pipeline was mandatory (and it was fast... ish).

WHAT?! What are you doing, man? In the words of Borat: *“It’s like giving a gun to a monkey. VERY dangerous.”*

Here’s the reasoning: sure, we need other eyes on *how* the code is written, but *what* it does — specifically whether it breaks anything — should be caught by our build pipeline. If bugs slip through, that’s a strong signal our pipeline isn’t good enough, and we need more tests and verifications.

A manual gatekeeper, like a PR approval, interrupts my flow (trust me — I’m waiting now on an approval for a one-line change in a build script). Worse — it also interrupts someone else’s workflow. Double-anti-flow move.

Or consider a failed item in a batch that throws an error and blocks the entire batch until someone fixes it. If flow is sacred, we let the other items through and flag that 1 in 4,363,225 items needs fixing. Flow is sacred for users, too.

There are other ways to tackle this — mob or pair programming means your code is always reviewed in real-time, for example. But the key mindset is this: do whatever you can to *not* break the flow.

Yes, yes — I hear you. *“In our industry, standards say we must...”* or *“That won’t work because...”* or *“We’re not allowed to...”*

But seriously — what is your flow worth? What’s the cost of me (and my two reviewers, from two different departments. Oh yes — I’ve worked there too...) waiting, blocked from moving forward? Very likely I’ll start something else, jump through hoops to keep busy (double repositories or `git worktree`, anyone?), making things more complicated and slowing flow even more.

It’s simpler to start with a straightforward mantra: *Flow is sacred.* Let everything else subordinate to that decision, and improve your process accordingly.

Most processes involving multiple people spend most of their time waiting (in my experience). This is [a separate blog post I wrote](https://www.marcusoft.net/2018/03/a-simple-diagram-on-flow-efficiency.html) — I’ll just steal the image here.

![Most of the time in a process is waiting time](/img/flowefficiency_2.jpg)

### How to Protect Your Flow

We can often do way more about these waiting times than we think. Let’s do it!

Here are a few things I’ve found helpful to keep flow sacred in your work:

- **Automate what you can.** Build fast, reliable pipelines that catch bugs early so manual gates become unnecessary or lightweight.

- **Minimize handoffs.** The more people or steps involved, the more chances for waiting. Consider pair or mob programming, or at least asynchronous reviews that don’t block merging.

- **Limit batch sizes.** Smaller batches mean less risk of blocking the entire flow when one item fails.

- **Communicate proactively.** If something does block flow, make sure the team knows quickly so it gets fixed without unnecessary delays.

- **Challenge your process often.** Ask yourself and your team: *Is this step helping flow, or hurting it?* If it hurts, what can we do differently? Perfect theme for a quick retrospective; where are we waiting the most?

Flow is not just a buzzword or a fancy Lean concept — it’s the lifeblood of productive, happy teams and satisfied users. Protect it like the sacred thing it is.
