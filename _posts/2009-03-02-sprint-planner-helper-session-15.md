---
layout: post
title: Sprint Planner Helper – Session 15
date: 2009-03-01T21:13:00.001Z
author: Marcus Hammarberg
tags:
  - ASP.NET MVC
  - Sprint Planner Helper
  - TDD
modified_time: 2009-05-05T09:25:13.029Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-3480546717605318518
blogger_orig_url: https://www.marcusoft.net/2009/03/sprint-planner-helper-session-15.html
---

I don’t think I have ever been doing system development in a nicer place – I am right now in [Hyppeln](http://www.hitta.se/LargeMap.aspx?var=Hyppeln) in the Gothenburg archipelago. The weather is wonderful, and we have actually been sitting out for coffee and even managed to do some barbecue…

OK – I am pressing on with the Edit controller action for the Product. I ran into a [bug](https://www.marcusoft.net/2009/03/aspnet-mvc-running-transformation-error.html) in the [ASP.NET MVC](http://www.asp.net/mvc/) framework, which is the first one I have seen – pretty good for a Release Candidate…

I think that I have missed some part of the TDD process by not being good at “testing my boundaries” (a Code Smell from [Clean Code by Robert C. Martin](http://www.amazon.com/Clean-Code-Handbook-Software-Craftsmanship/dp/0132350882)). When I first read it, I didn’t fully understand it, but as I am beginning to grasp the TDD approach, I realized that for most cases this means writing tests for NULL values as well. You could go to the other extreme and write tests for the highest possible values, but I don’t see much use in that. NULL values are always worth testing, so I think I will incorporate that into my TDD rhythm and maybe even start with it.

Today, I have worked on the Edit (update) and Delete actions. I have implemented them in both the view and the controller, still with a very simple UI.

I also managed to get the Product Backlog Items into a user control. I found the really nice [RenderPartial](http://devlicio.us/blogs/derik_whittaker/archive/2008/11/24/renderpartial-vs-renderaction.aspx) method that renders a user control in a view.

I have a great feeling of “I have done this before” when working on the UI. It feels like good old ASP.OLD done right and a bit like [Web Classes](http://www.avdf.com/oct98/art_id003.html) (IIS Applications in VB6 back in the days). I like it!
