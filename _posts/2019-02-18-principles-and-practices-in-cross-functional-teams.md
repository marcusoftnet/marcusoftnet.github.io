---
layout: post
title: Principles and practices, guilds and cross-functional teams
author: Marcus Hammarberg
date: 2019-02-18 18:28:48
tags:

  - Agile
 - Lean
  - Life of a consultant
---

I have been involved in many organisational changes that turn the organisation sideways. From functional departments to cross-functional teams, from projects and completing activities to continuous delivery and focus on reaching effects.

Just about always this creates some initial confusion around where decisions get made and how the old ways fit into the new. Quite often worry about chaos break out.

For example;

> Who is in charge of the overarching architecture, now that each team is deciding everything by themselves?

I realize that I've done a bad job describing how this is going to work. The other week I found myself describing this with a pretty simple model that I wanted to share.

<!-- excerpt-end -->

## Disclaimer

I'm pretty sure this is not news at all and I'm making a pale copy of something brilliant. But ... it's my copy and I'm standing by it.

## TL;DR

If you are in a hurry this is very simple, to sum up:

* Horizontal groups are responsible for principles

* Vertical groups are responsible for practices

<img style="width:100%" src="/img/PrinciplesPracticesOverview.png">

## Longer version, but still not a novel

The reason we reach for cross-functional teams is that we have seen that the functional silos we had before did not work out well when we wanted to move work through the functions fast.

<img style="width:100%" src="/img/SiloFunctions.png">

The good news of that approach is that each silo can ensure their values being addressed. For example, we can have the architects validated the solution before passing on to the coders, the security department can sign off on the solution and we can even have the regulatory demands being validated for compliance before moving on.

The bad part with this approach is that it [doesn't work](http://www.marcusoft.net/2017/11/no-waterfall-is-not-sometimes-correct-it-is-always-wrong.html), creates sub-optimal, is very slow and cannot handle change well. Also, it creates many hand-overs and culture of someone ordering something and others (downstream) fulfilling that order.

Just about all the things that we want out of a process for *developing* something. Fast feedback and the possibility to change frequently and fast.
Therefore many companies nowadays create *cross* functional teams, with responsibilities for the effect of the outcome of their work. Often they are responsible for a business capability such as order fulfilment or search or something similar. Work then can be completed within the bounds of one such team. If not we change the work to fit that structure, by breaking it down.

<img style="width:100%" src="/img/CrossFunctionalTeam.png">

The good news with this is that we now have everyone we need within the same unit, it's fast to make a decision and complete work. But foremost we can change how we work within this team in order to accommodate our situation and style.
The bad news is ... the purpose of this blog post. Because how do we now ensure that, for example, our architecture is followed, that everyone understands the security situation or that we all are keeping up to date with regulatory demands?

### Principles and practices

Well, we create what has been referred to as guilds. Cross-team groups that gather around a special interest or competence. Common examples are the testing guild, the business analyst guild, the architecture guild and hey - the agile guild.

The name guild was pioneered, in the IT-industry, by Spotify and their now very famous Spotify Model - `<rant about copying things that we don't why it existed in the first place>` that you should not copy. It worked for them, at the time, with those people and their context. Just like all the best practices. it's old practices. Look beyond and see **why** they organized like that and you might find useful stuff `</rant about copying things that we don't why it existed in the first place>`

A [guild in the olden days](https://en.wikipedia.org/wiki/Guild) was an

> association of [artisans](https://en.wikipedia.org/wiki/Artisan) or [merchants](https://en.wikipedia.org/wiki/Merchant) who oversee the practice of their craft/trade in a particular area

The guild hence was a place to learn new things, get together and decide on common ways. However, when the blacksmith, carpenter or mason got back home to their shop - the actual implementation of those ideas was up to them.

Without knowing too much I can envision the masons getting together and deciding on a   good way to build an archway to make it strong and solid. But how that was put together, the kind of bricks, the kind of mortar or the order in which the bricks were laid - was something that each mason decided on the job.
The **guild** is therefor a good analogy for what we want to accomplish in these cross-team groups; they are perfectly equipped for **making decisions on a principal level**. They have representation from all teams (in most cases) and gather around the special interest.

<img style="width:100%" src="/img/GuildsPrinciples.png">

The team representatives in the guild bring the ideas, new input and principles with them out to the individual teams where they will decide on *how* to implement the principles. The **teams decide about the practices** in other words.

<img style="width:100%" src="/img/TeamPractices.png">

## An example

The architecture guild just closed the meeting that had been awesome. Not only had it been the biggest turnout with 1-2 people per team represented, but they had finally decided on the preferred way to communicate; HTTP between bounded context service and Rabbit MQ between the micro-services within the bounded context. Easy clear and feels like a great idea.

Marcus and Anna, two developers that attended the architecture guild,  bump into each other the day after;

Marcus: So, did you get started converting your internal HTTP calls to Rabbit MQ, yet?

Anna: Oh, no. That will probably have to wait a while for us. We have many things up in the air right now. In a month or so. You guys, what did you do?

Marcus: Ah, we might not do that at all for some of our services. The Rabbit MQ support for VB6 is not that great, hehe. It's better to maintain it and then switch over as we take those old services down.
Did you notice how the guild decided a principle but the teams took responsibility for how and when that would be built? Just as it was intended. The teams know their particular situation and context best. Guided by the support and principles from the guild they could then make informed decisions on how to turn those principles into practices.

## Summary

These are just my own thoughts on how cross team questions can be handled in a cross-functional team setup like this.

It's turned out to be a simple way to explain the idea and I hope that you might find it useful too:

- Horizontal groups are responsible for principles
- Vertical groups are responsible for practices

<img style="width:100%" src="/img/PrinciplesPracticesOverview.png">
