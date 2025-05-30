---
layout: post
title: Sprint Planner Helper – Session 1
date: 2009-02-01T21:11:00.001Z
author: Marcus Hammarberg
tags:
  - Sprint Planner Helper
modified_time: 2009-02-11T21:20:46.906Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-3916968531467618756
blogger_orig_url: https://www.marcusoft.net/2009/02/sprint-planner-helper-day-1.html
---

I started off very pure and true to the noble principles of TDD and Extreme OOP. Actually, I did decide on a few naming conventions first: the name of the product is Sprint Planner Helper and it will reside in the namespace `Marcusoft.SprintPlannerHelper`. I also created four projects like this (idea stolen from [ASP.NET MVC Storefront](http://www.asp.net/learn/mvc-videos/#MVCStorefrontStarterKit)):

- `Marcusoft.SprintPlannerHelper.Models` - my domain model
- `Marcusoft.SprintPlannerHelper.Service` - any services needed for the model, such as database access and so on
- `Marcusoft.SprintPlannerHelper.Web` - the ASP.NET MVC Web Application
- `Marcusoft.SprintPlannerHelper.Test` - the unit tests of the application

Then I removed all the `Class1.cs` from all the projects that defaulted them to me. At this point, I realized that I was missing [Visual Studio 2008 Power Commands](http://code.msdn.microsoft.com/PowerCommands) and [Resharper](http://www.jetbrains.com/resharper/) at the computer I was using. Had to download them - you can live without them. The 1 hour/day is burning up fast in the beginning.

Finally, I could review my product backlog and create my first test: `aNewlyCreatedProductOwnerHasEmptyName`. This is my first time doing pure TDD, and I must say it was quite exciting. It didn't compile, of course. So I created a class in my Model-project called `ProductOwner`. At first, I thought I would have a hard time getting the test to fail, but it did (:D). The name property is initialized to `null`. I implemented a constructor that took care of that - and YEAH, my first test.

I was quite surprised to find 27 other tests in my solution. Those were tests for the controllers created for me by the ASP.NET MVC project template. I ran them all - they worked, but I didn't check them out for now.

My hour is up - great progress today. We're off to a flying start with one TDD iteration (RED-GREEN-REFACTOR) done...
