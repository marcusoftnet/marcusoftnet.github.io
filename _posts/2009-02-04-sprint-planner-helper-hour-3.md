---
layout: post
title: Sprint Planner Helper – Session 3 date: '2009-02-03T22:25:00.001+01:00'
author: Marcus Hammarberg
tags: - Sprint
Planner Helper - C# - TDD modified_time: '2009-02-11T22:22:20.485+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-4401996462216297568
blogger_orig_url: http://www.marcusoft.net/2009/02/sprint-planner-helper-hour-3.html ---

As I reviewed my work from yesterday I quickly realized that I bit off
much to much. I only need to implement the model for the first product
backlog item which is:

> As Product Owner I can create a product backlog so that the team knows
> what is left before the product is done.  Each product backlog item
> requires at least an ID, description, priority.  Optional are story
> points (how big is this compared to other) and the possibility to
> upload a  document with additional business rules

So - true to the XP guidelines to not do more than is absolutely minimum
to solve the task at hand, I backtracked and removed a lot of the code I
wrote yesterday. I want to see where the TDD and Extreme OOP takes me.

I start each session by reviewing
<a href="http://milano-xpug.pbwiki.com/f/10080616-extreme-oop.pdf"
target="_blank">those rules</a> in order to really get them to stick.
Man - they are though ("Don’t use any classes with more than two
instance variables", gulp).

OK - so what I managed today was simply to get my model for the first
story up. Great! I am getting a hang of the TDD-ing. I have also fallen
back in love with C#. What a nice language. And the support for TDD in
Resharper is great (with the Create Field on other class helper for
example).