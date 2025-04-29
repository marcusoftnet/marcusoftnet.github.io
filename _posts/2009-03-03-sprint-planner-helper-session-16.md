---
layout: post
title: Sprint Planner Helper – Session 16
date: 2009-03-03T10:50:00.001Z
author: Marcus Hammarberg
tags:
  - DDD
  - Sprint Planner Helper
modified_time: 2009-03-04T08:31:36.506Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-8188991577348770009
blogger_orig_url: https://www.marcusoft.net/2009/03/sprint-planner-helper-session-16.html
---

I am now almost ready with the first user story of my own backlog.

> 1. As a user, I can create a product that describes the product and the product owner so that the purpose of the product is known.
>
> Each product has a product backlog that describes what is left to do.
>
> Each product backlog item requires at least a Number (1.2.1), description, and initial priority.
>
> Other properties are story points (how big is this compared to others) and a document with additional business rules.

The one thing that is left is to be able to create new backlog items.

My GUI for editing a product right now looks like this:

![edit a product](/img/sprintplanner_editaproduct)

As I said before, I will not put too much effort into the design of the GUI, but I have noticed that the [MVC-pattern](http://en.wikipedia.org/wiki/Model-view-controller) opens up for GUI-design decisions to be changed later on. I mean – there is a product backlog item create action that can be outputted as a pop-dialog, on its own page, via AJAX/Flash, or …

That is a really nice feature.

Come to think of it – this is one of the main principles of [DDD](http://en.wikipedia.org/wiki/Domain-driven_design). You are given the freedom to choose (and change) how to solve issues when the time is right. This goes for all ends of the application design; the database and the GUI, for example. The important stuff (i.e., the model) is what you need to worry about.

OK – on to the code! Let's write some simple tests…

I brushed on some [extension methods](http://msdn.microsoft.com/en-us/library/bb383977.aspx) today. They are cool but a bit messy since they don’t belong in the class they are extending… I am not sure if I like them or not.

I came as far as I could to create the form for creating new product backlog items. Tomorrow I will save them.

PS. Passed 100 unit tests today. Yeah!
