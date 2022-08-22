---
layout: post
title: Sprint Planner Helper – Session 24
date: 2009-03-30T19:32:00.001Z
author: Marcus Hammarberg
tags:
  - Sprint Planner Helper
modified_time: 2009-03-30T19:33:34.857Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-3273761672659892156
blogger_orig_url: http://www.marcusoft.net/2009/03/sprint-planner-helper-session-24.html
---


My detour for learning
<a href="http://www.asp.net/mvc/" target="_blank">ASP.NET MVC</a> is
coming to an end. I cannot say that I fully know the framework but I
have a much better understanding of it now and that will hopefully help
me keep the tempo up.

I have a few things left (such as editing product backlog items)
surrounding the product. But I will leave them for later. I am so long
back to the <a href="http://en.wikipedia.org/wiki/Domain-driven_design"
target="_blank">DDD</a> that this project also is aiming to learn me.

The third item of my user stories is a biggie and it concerns Sprints –
the main object of my domain model.

> 3\. As user I can create a sprint that represent a sprint in which
> some items of the product backlog is to be realized.
>
> The sprint has a goal description and a start, stop and demo-date and
> the team members with availability (in %), absent hours and focus
> factor (in %).
>
> The sprint also contains a sprint backlog which initially contains a
> sprint backlog item for each product backlog item selected.
>
> The sprint backlog contains summarized values for total number of
> hours and story points.

I’ll start by making some simple tests to get to know the model. That’s
probably what I have time for today

Unleash the code-fingers!

OK – I’m getting quite used to not managing the things that I think I
will… I have now
<a href="http://en.wikipedia.org/wiki/Test-driven_development"
target="_blank">TDD</a>’ed all the parts of an sprint (Team Members,
Actions, SprintBacklogItems etc) – but not the actual SprintObject. I’ll
get to that next.

Very good progress today. Doing TDD is such a good way to “get to know”
your objects. I would love to do it in pairs in a real project – or even
in a group to get the whole team to know the core of the domain object.
