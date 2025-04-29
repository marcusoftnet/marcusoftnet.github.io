---
layout: post
title: Sprint Planner Helper – Session 14
date: 2009-02-24T22:35:00.001Z
author: Marcus Hammarberg
tags:
  - Sprint Planner Helper
modified_time: 2009-02-24T22:35:45.648Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-8572976544850085921
blogger_orig_url: https://www.marcusoft.net/2009/02/sprint-planner-helper-session-14.html
---

Ok – today I’ll start by creating a factory for the `Product` class. I have some issues with the factory pattern and here is my reasoning: Another class is the creator and must have access to the `NEW` method of the class to create it. Since that forces at least a protected-level on the constructor, it means that I cannot be sure that clients use the factory and not the constructor.

If I place the factory method on the class I am creating, I can ensure this. But then I am violating the [Single Responsibility Principle](http://en.wikipedia.org/wiki/Single_responsibility_principle). What to do, what to do…

For now, in TDD/XP fashion, I’ll implement the simplest solution: a static `Create` method on the class I am creating. I don’t have several different `Product` types, so it’s the same factory for all products, possibly with overloads.

Flame away, ye flamers, and give me some insight on how I should have done it.

Another problem I faced yesterday was that the product I added to my repository did not show up in the list of all products on the next page. That puzzled me for a while until I realized that, even though I am using the fake in-memory repository version, I am recreating it on each request.

So, I needed some sort of [Singleton](http://www.dofactory.com/Patterns/PatternSingleton.aspx) version of the repository to use for my application until I add support for SQL. I didn’t want to do that just yet…

This turned out to be quite tricky, but I am happy with the result – it was only a few lines of code. Now I have an in-memory repository that remembers actions until I close the application.
