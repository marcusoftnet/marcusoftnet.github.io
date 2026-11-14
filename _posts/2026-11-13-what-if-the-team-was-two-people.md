---
layout: post
title: "What if the team consisted of two people?"
author: "Marcus Hammarberg"
date: 2026-11-13 04:00:00
tags:
  - Agile
  - AI
  - Product mindset
---

(Blogging on Friday the 13th ... that would scare some people. Not me! Here we go...)

The focus in product development now is a lot on output and making the individual product engineer more efficient. But in most interesting products I've been involved in building the challenge is really in how we coordinate and manage many people together.

Until now this has been done in teams of 4-10 people usually. With the advent of more building power at our fingertips, that kinda breaks down. When you can hash out a new feature in hours rather than weeks, our practices doesn't make sense. Or we still use them and increase the work and contextual loads a lot.

I think there are better ways and I think those way will challenge us, our ways of working and steering. It will be awesome!

Yes this is a follow up to [What if the sprint was 1 day long?](https://www.marcusoft.net/2026/11/what-if-the-sprint-was-one-day.html)

<!-- excerpt-end -->

## Disclosure

I've been working in and with teams my entire life. A lot of the things that I'm about to present as problems are things that I have tried to get teams to do, and do well.

The world is shifting. It's scary and I'm questioning my worth and value, every other day. And (not BUT) hence I think that we, rather than double down on practices that was good at a time, dare to question and reshape them into practices that is suitable for the work we are actually doing.

## Problems

Painting the following section in a bad light. I've seen this work MUCH better, but below is a more a typical situation in most teams I've encountered.

In a team of 4-6 people we need to synchronize and keep each other up to date with what others are doing. We probably ask others for review ([interrupting their work](https://thinkinglabs.io/articles/2023/05/02/non-blocking-continuous-code-reviews-a-case-study.html)), through PRs that will not be merged until the review has passed.

The daily standup is a way for us to sharpen the focus of the team to help each other get the work done. In [the best case](https://www.marcusoft.net/2017/02/comments-on-board-practices-6.html) - many daily standups are synchronization meetings where everyone one reports what they did. Just to keep our team in the know.

Planning needs to be done to ensure that we can distribute the workload in the team, so that not a few people have loads and others have nothing to do.

A lot of our retrospectives work has to do with how we cooperate with each other and how to do that better.

The meetings we do hold involves the whole team, of course, and hence becomes both costly (6 x hourly rate / hour) and also cognitive hard (is everyone heard, I zone out when Marcus is talking).

When we report, present and demonstrate things we have built during a period of time. We summarize and prepare information to be digestible by others in short period of time. And doing that preparing takes time, and is a process where information is lost.

We have tools in place to keep track of the work we need to do. Handovers happens by one team member or stakeholder writing things in a ticket for another to (hopefully understand and) pick up.

All of these "problems" has to do with that we are doing work in bigger batches (see [earlier post](https://www.marcusoft.net/2026/11/what-if-the-sprint-was-one-day.html)) but also due to the way we have shaped our teams; bigger teams that coordinate with teams and stakeholders around them - also in bigger steps and batches.

Let's see if we can challenge these problems and what new challenges that gives us.

## Suggestion - work in pods

What if the team consisted of two people? This is out there as ideas that companies are trying. They call them Pods, so I'll use that.

2 product engineers that have agents, harness, software factories, specification driven development and all of those things ready to go in order to move really fast.

No standup is needed. Why - it's just you and me.

No ticket system is needed. We can inform on a much higher level than writing tickets. For example, which goal we are pursuing now, and how we are making progress on that goal. A [backlog as a mindmap](https://www.marcusoft.net/2016/06/backlog-and-features.html) is one way, outcome-based KPIs is another.

Retrospectives should really happen continuously. At SALT we encouraged our mobs to do a retro per day. It can be as simple as asking "What worked best today - [how do we do more of that](https://www.marcusoft.net/2023/03/my-screensavers-turn-up-the-good.html)?" or "What ate our time today - how can we do less of that?". Or we have a conversation on the way home.

Planning would probably just be a session in the morning, setting the goal for the day. Ensuring that we understand it correctly, and maybe/probably even interacting with an AI to specify and answer clarifying questions together.

In doing this we would have a finished increment of the product each day, per team. Through strong harnesses, deterministic checks and CI/CD practices the thing that each team has built will be merged and integrated. Potentially even released. This decrease the risks and hassle of bigger changes.

To further push that thinking we would use [trunk-based development](https://trunkbaseddevelopment.com/) and do away with PRs altogether. With tight cooperation in the pod we continuously review the code, design choices and decisions made.

## Challenges

All of this is very doable practically. The challenge comes in how we steer this. Paraphrasing the words of [David L. Marquet](https://www.youtube.com/watch?v=OqmdLcyES_Q) this is not hard, but we have been programmed, and have systems in place, to take Control and attract followers.If you want teams to be able to harness the power and speed of using AI to build products you instead need to give control and create leaders.

To unleash that power you will need to move the authority to the information. You pods will need to know what they are building and why, because they will make decisions about this several times an hour. Checking in with their product owner on planning and demo days is just to slow. That's a few decisions bi-weekly.

If we don't want the pods to build the wrong thing, and not to constrain their speed and power we instead need to lead by intention, so that they know as well as you what better looks like.

That's said - we should not fly blind and there's no reason to do so. Visualizing data has long been the starting point for any work where we aim to speed up the lead time. Let's do that here too.

Each pod can easily visualize where they are working the backlog and how they are progressing towards their outcome-related KPIs. Trust for product teams is created by delivering. Small increment often towards the goal is a great way to build trust.

Another challenge would be to slice the areas of work into parts that each pod can work on independently. Books has been written about this, so I will just mention that with smaller things being built and integrated more frequently we have an easier time to merge and integrate too.

## Other solutions

As I wrote this I realized that there are many other approaches that does this in one way or another.

### MobProgramming

Much of my experience comes from mob programming where a whole team is working together at the same time on the same feature. That works amazingly well and for experienced teams, just about all the things that I wrote about above comes through and the challenges has been addressed.

I think that with an AI as one of the team members the teams can be smaller and hence we can have parallel.

### Collaboration AI

### FAST Agile

### ShapeUp
