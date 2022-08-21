---
layout: post
title: "Comments on common board practices - Focus on the work - not the workers"
author: "Marcus Hammarberg"
date: 2017-02-28 15:13:13
tags:
 - Agile
 - Kanban
 - Scrum
---

Many daily stand up meetings follow the patterns originally from Scrum - that is we ask each individual what they did yesterday, what they are going to do today and if anything is blocking them.

This is a nice sentiment but misalign our focus.

Because making sure that people are busy is not important… at least not compared to making work flow.

There's an easy way to change our focus, at least in our morning meetings.

{% include boardpractice-posts.md %}

<!-- excerpt-end -->

# Introduction

I've actually lost a gig by once answering "Yes" to the question:

> Are you the one that goes around telling the teams that it's not important that they are busy?

Because I did say that. And it's not important.

I don't think that most people thinks too much about this but the [3 questions (™)](https://www.agilealliance.org/glossary/three-qs/) actually puts a lot of focus on the individual. But, as with most things in this series, we have just picked these practices up and run with them.

It's nice and everything, to let people speak in each meeting, but that's not why we are here. We are here to get small pieces of functionality into production fast, so that we can learn and change faster.

## Why do I comment on this?

By keeping our focus on the people instead of the work ([on the runners instead of the baton as LeanKit](https://leankit.com/blog/2015/05/business-flow-watch-baton-not-runner/) puts it in this brilliant article) we are not being true to the ground principles of lean.

### Lean

Lean has, in [This is Lean](http://www.thisislean.com/), been described as striking a balance between resource efficiency (aka resource utilisation) and flow efficiency (aka effectiveness). I've written about that before and will not repeat the description here. But I'll give you the awesome picture here. Not by me - Per Åhlström and Niclas Modig are the authors.

<img border="0" src="/img/thisIsLean.png" height="298" width="320">

Basically - we are trying to reach an optimal balance between resource utilisation and flow efficiency by focusing on getting our work flow faster.

Therefore I find the focus on the people in the group leading us to the wrong discussions, improvements and generally focus. Indeed one of my pet peeves is the question that many, inexperienced, Scrum masters (™ ® ©) asks right after everyone has answered the three questions:

> Right! So does everyone has something to do now then? No one without work?

Well… maybe that is not that bad. I don't know where I've heard the exact quote quote but ([more here](http://www.everydaykanban.com/2012/07/27/slack-is-not-a-dirty-word-how-slack-can-improve-your-products/)):

> Without slack there cannot be improvement

Also, as [Niclas Modig reasoned last LeanKanban Central Europe](https://www.lkce16.eu/speakers/niklas-modig/); imagine a place where we have 100% resource utilisation. Everyone are doing great things all the time. This is the place where no innovation can happen, also you  just created a context with 0% customer focus.

### Agile manifesto

Finally, leaving the lean stuff behind, I think that focus on the workers rather than the work violates at least two of the [principles behind the agile manifesto](http://agilemanifesto.org/principles.html). Here are the two I'm thinking of:

* Simplicity--the art of maximizing the amount of work not done--is essential.
* Working software is the primary measure of progress.

Going around the team making sure that everyone is busy goes straight against those two ideas. We are *not* focusing on getting working software out the door - we are focusing on keeping people busy. Remember the, all-too-common Scrum Master question above.

Also, we are not focusing on doing the least amount of work to get the feature functional. That would be letting the team collaborate tightly and not care too much about how busy people are.

## What to fix/do instead?

Ok - enough with the theories and rants. Let's do something about this situation.

Well the first part is to actually recognise and understand the difference between the two perspectives; resource busyness and flow effectiveness. That's the hard part.

The easy part is to simply stop going through the members of the team each morning and instead enumerate the work on the board.

For each item on the board (see [Walk the board from right to left](http://www.marcusoft.net/2017/02/comments-on-board-practices-7.html) on tips on how to run the morning meeting) just point to it and read the description out, then ask the team something like:

* Anything that's hindering this from flowing today?
* This one - anything we all need to know about this?
* What about this - [what's hindering this to be in production today?](http://codebetter.com/marcushammarberg/2013/08/13/some-tools-for-improved-focus-improve-teamwork-and-faster-delivery/)

You come up with better suitable questions that me I'm sure, but notice how these questions focus on the *work* and if the *work* is blocked or flowing.

I've found that this also speeds up the morning meetings quite a bit, so don't be worried if it is over sooner than you think.

### Big teams - big boards

A couple of times I've been in really big teams (40+ people) - which is not awesome but with this shift in focus you could make it work. Here's two tip that have worked for me in those cases.

#### Focus on anomalies

First of all, and this is a great tip in itself, don't linger on work that is behaving as it should. Instead spend your precious meeting time on things the matter and needs your attention; things that deviate from what our normal flow:

* Work that has no avatar on it - this will *not* flow today
* Columns above our [WIP limit](http://www.marcusoft.net/2017/02/comments-on-board-practices-5.html)
* [Blocked items](http://www.marcusoft.net/2017/02/comments-on-board-practices.html)
* People hogging more than one item, or with their avatar on more than one place
* etc

If it turns out that you have missed an anomaly, you have a great opportunity for improvement of your visualisation. How can we make sure that these anomalies stands out on our board so that we don't miss it again.

#### Focus on problem solving

In the morning meeting keep the focus on solving problems that help the work to flow further. I've many times found this pattern of conversation useful to keep our focus in the meeting:

* **Morning meeting leader**: What about this item - any problems?
* **Team member 1**: Yes - I don't know how to get around problem X.
* **Morning meeting leader**: Who do you need to solve this?
* **Team member 1**: I could probably get it to work if I get to sit down with team member 2 and 4.
* **Morning meeting leader**: 2 and 4 - can you do that right after this meeting?

There's no use that we all wait around for these three people to talk about this in the meeting (unless that discussion is interesting for everyone). The morning meeting is to help our work to flow - not neccerssary to solve the problems in the meeting.

### Avoiding the "report to boss"-pitfall

One very common pattern that occurs when you start going through work rather than the workers is that you immediately get the "reporting to manager" vibe in the meeting.

This can easily be remedied by changing *daily driver* each morning. We just create a list with all members on the team and put a little marker to who will be the person pointing to tasks and facilitating the meeting the next morning.

This helps us to all feel involved and takes away the feeling that we are reporting *to* someone.

# Summary

In your morning meetings don't ask each person the *three question* about their busyness. Instead focus on, talk about and help the work to flow through the process.

This is easily accomplished by simply enumerating the tickets you are currently working with on your board and talking about the status for each, and what is blocking it.

If you liked this post there's more posts on the topic below

{% include boardpractice-posts.md %}