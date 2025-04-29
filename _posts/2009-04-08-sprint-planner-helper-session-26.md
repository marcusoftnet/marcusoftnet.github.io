---
layout: post
title: Sprint Planner Helper – Session 26
date: 2009-04-07T20:12:00.001Z
author: Marcus Hammarberg
tags:
  - Sprint Planner Helper
modified_time: 2009-04-07T20:12:48.614Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-2791464324153723923
blogger_orig_url: https://www.marcusoft.net/2009/04/sprint-planner-helper-session-26.html
---

I’ve recently come to a realization: I’m not making as much progress as I’d like on this project. It’s not exactly flattering to acknowledge that it’s taken me about 2.5 months to reach this conclusion, but here we are.

Given that I’m on parental leave, I’ve decided to slow down the pace of this project. I don’t want to feel pressured to “produce” results—this is supposed to be a fun and relaxing endeavor. So, from now on, progress will be slower and only when it feels enjoyable.

In today’s session, I focused on identifying aggregates and creating repositories for the Sprint domain object.

Aggregates are still a bit challenging for me to fully grasp. The mainstream definition suggests they are "things that must exist together," with common examples like the Order-OrderLine relationship.

For my Sprint domain, I have a list of `SprintItems`, each with a list of `ActionItems`. It feels cumbersome to retrieve the entire structure every time I need a Sprint, so I’m considering breaking it down into aggregates. I plan to start with an aggregate consisting of Sprint, Team, and SprintItems, and another for SprintItem and ActionItems.

I’m not entirely sure if this aligns perfectly with [Domain-Driven Design (DDD)](http://en.wikipedia.org/wiki/Domain-driven_design), but it’s a starting point. My modeling is done in PowerPoint, and you can check it out in the [modeling.pptx file](http://sprintplannerhelper.codeplex.com/) on the CodePlex project page.

**PowerPointing in progress**

![Aggregates](/img/sprintplanner_aggregates.jpg)

Now that the planning is done, I’ve moved on to creating repositories for these aggregates. This mainly involves setting up inheritance and writing simple tests.

**Coding in progress**

The coding and testing took some time, but I’ve got the tests in place now. Everything is set up to start working on the UI for the sprint part of my domain. Looking forward to making some real progress here!
