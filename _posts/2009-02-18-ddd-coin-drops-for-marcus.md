---
layout: post
title: DDD – the coin drops for Marcus
date: 2009-02-17T19:46:00.001Z
author: Marcus Hammarberg
tags:
  - DDD
  - Scrum
  - Agile - Sprint Planner Helper
modified_time: 2009-02-18T11:03:35.713Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-6314861110076624802
blogger_orig_url: http://www.marcusoft.net/2009/02/ddd-coin-drops-for-marcus.html
---


I have now tried to grasp the DDD-concept without fully “getting it”. I
must confess that I have thought: “What is the deal with this… I have
done it before”.

But today we had a most prominent guest at Elevate (the education
initiative at [Avega](http://www.avega.se)) – [Jimmy
Nilsson](http://jimmynilsson.com/).  And what he said got the coin to
drop for me.

The heading of his presentation was something like “A new era for data
access”. And the things he said that got me to understand was something
like this – not a quote but rather his reasoning:

> Traditionally we focus on the database design in application
> development. So very early we want to get the database design in
> place. “We need it to start to do code”. Since we did that design
> early in the process we often got it wrong and inherited those error
> through the process. And we are reluctant to change the database later
> on because its hard to test and overview what the change may break.
>
> In DDD we do the opposite – we start with the domain model, as far as
> we know. We prepare for change – we want it to change when we get more
> knowledge about it. We will not even use a database for quite some
> time in the project, when we have got to “know” the model through test
> and code.

Ok – that was my interpretation of Jimmy’s reasoning. But I got it –
when starting with the pure domain model you don’t need to worry how
it’s stored.
And also I understand why I liked the DDD-concept from the start. It
goes perfectly with
[SCRUM](http://en.wikipedia.org/wiki/Scrum_(development)) – you don’t
strive to do it correct from the start but rather expect and prepare for
change. I like it!

I also learned some other stuff that I will need to incorporate into my
design:

-   Aggregate – use aggregate to logically divide and group your model.
    An aggregate root is the only way into the other objects in the
    aggregate. They cannot be accessed from the outside.
-   Start modeling with what you know – I have started out with the
    first user story and find out what I can about the model in that
    story, preparing for changing it down the road.
-   Behaviors – I have not put the behaviors on my entities yet. Need to
    do that.
-   TDD is the way to go – with DDD and TDD together you get to “feel”
    the model in a more direct way than to write about it.

So that was quite a lot of information to me and to the [Sprint Planner
Project](http://www.marcusoft.net/search/label/Sprint%20Planner%20Helper).
No code today – but quite a lot of nice input.

Here’s a last one: since I only code one hour a day I often find it hard
to remember what to start with. Leave a RED test – was the very simple
and resolute tip from Jimmy.

Thank you Jimmy – for everything I take with me from your presentation.
