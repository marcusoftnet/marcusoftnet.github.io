---
layout: post
title: Sprint Planner Helper – Session 14
date: '2009-02-24T23:35:00.001+01:00'
author: Marcus Hammarberg
tags: - Sprint
Planner Helper
modified_time: '2009-02-24T23:35:45.648+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-8572976544850085921
blogger_orig_url: http://www.marcusoft.net/2009/02/sprint-planner-helper-session-14.html
---


Ok – today I’ll start by making a factory for the product class. I have
some issues with the factory patterns and here is my reasoning; another
class is the creator and must hence have access to the NEW-method of the
class to create. Since that forces at least protected-level on the
constructor it means that I cannot be sure that the clients uses the
factory and not the constructor.

If I however place the factory method on the class I am creating – I
can. But then I am violating the
<a href="http://en.wikipedia.org/wiki/Single_responsibility_principle"
target="_blank">Single Responsibility Principle</a>.  What to do, what
to do…

For now – in TDD/XP-fashion – I’ll do the simplest. A static
Create-method on the class I am creating. I don’t have several different
Products so it’s the same factory for all products, possible with
overloads.

Flame away – ye flamers… and give me some insight in how I should have
done.

Anyhow – that should give me some work...

Another problem that I was faced with yesterday was that the product I
added to my repository did not show up in the list of all products in
the repository on the next page. That puzzled me for a while until I
realized that; Even though I am using the fake in-memory repository
version I am recreating it on each request.

So I need some sort of
<a href="http://www.dofactory.com/Patterns/PatternSingleton.aspx"
target="_blank">Singleton</a>-version of the Repository to use for my
application until I add support for SQL. I don’t want to do that just
yet…

That turned out to be quite tricky but I am happy with the result – that
was only a few lines of code… And now I have a repository, in-memory
that remembers actions, until I close the application.
