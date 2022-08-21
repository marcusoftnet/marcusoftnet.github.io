---
layout: post
title: Sprint Planner Helper – Session 15 date: '2009-03-01T22:13:00.001+01:00'
author: Marcus Hammarberg
tags: -
ASP.NET MVC - Sprint Planner Helper - TDD
modified_time: '2009-05-05T11:25:13.029+02:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-3480546717605318518
blogger_orig_url: http://www.marcusoft.net/2009/03/sprint-planner-helper-session-15.html
---


I don’t think I ever been doing system development in a nicer place – I
am right now in <a href="http://www.hitta.se/LargeMap.aspx?var=Hyppeln"
target="_blank">Hyppeln</a> in the Gothenburg archipelago. The weather
is most wonderful and we have actually been sitting out for coffee and
even managed to do some barbecue…

OK – I am pressing on with the Edit controller action for the Product.
Ran <a
href="http://www.marcusoft.net/2009/03/aspnet-mvc-running-transformation-error.html"
target="_blank">into a bug</a> of the
<a href="http://www.asp.net/mvc/" target="_blank">ASP.NET MVC</a>
framework I think. The first one I see – pretty good for a RC…

I think that I have missed some part of the TDD-ing with that I haven’t
been good at “testing my boundaries” (a Code Smell from <a
href="http://www.amazon.com/Clean-Code-Handbook-Software-Craftsmanship/dp/0132350882"
target="_blank">Clean Code by Robert C. Martin</a>). When I read it I
didn’t fully understand it but as I am beginning to understand the
TDD-ways I realized that for most cases that is to write tests for the
NULL-values also. I guess that you could go to the other extreme and
write test for the highest possible value but I cannot see the great use
of that. NULL values are always good to test for so I think I will
incorporate that into my TDD rhythm, and maybe even start with it.

Today I have worked with the Edit (update) and Delete-actions. I have
implemented them in the view and the controller, still with a very
simple UI.

I actually got the Product Backlog Items in a usercontrol also. Found
the really nice <a
href="http://devlicio.us/blogs/derik_whittaker/archive/2008/11/24/renderpartial-vs-renderaction.aspx"
target="_blank">RenderPartial</a>-method that renders a user control in
a view.

I have a great feeling of “i have done this before” when doing the UI.
It feel likes good old ASP.OLD done right. And a bit like
<a href="http://www.avdf.com/oct98/art_id003.html" target="_blank">Web
Classes</a> (IIS Applications in VB6 back in the days). I like it!
