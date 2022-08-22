---
layout: post
title: Sprint Planner Helper – Session 16
date: 2009-03-03T10:50:00.001Z
author: Marcus Hammarberg
tags:
  - DDD
  - Sprint Planner Helper
modified_time: 2009-03-04T08:31:36.506Z
thumbnail: >-
  http://lh6.ggpht.com/\_TI0jeIedRFk/Sa0LYLIAuFI/AAAAAAAAADg/twDyhMfi4gc/s72-c/edit%20a%20product_thumb%5B1%5D.jpg?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-8188991577348770009
blogger_orig_url: http://www.marcusoft.net/2009/03/sprint-planner-helper-session-16.html
---



I am now almost ready with the first user story of my own backlog.

> 1\. As user I can create a product that describes the product and the
> product owner so that the purpose of the product is known.
>
> Each product has a product backlog that describes what is left to do.
>
> Each product backlog item requires at least an Number(1.2.1),
> description, initial priority.
>
> Other properties are story points (how big is this compared to other)
> and a document with additional business rules.

The one thing that is left is to be able to create new backlog items.

My GUI for editing a product right now looks like this:

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/Sa0LYLIAuFI/AAAAAAAAADg/twDyhMfi4gc/edit%20a%20product_thumb%5B1%5D.jpg?imgmax=800"
title="edit a product"
style="border-top-width: 0px; display: inline; border-left-width: 0px; border-bottom-width: 0px; border-right-width: 0px"
data-border="0" width="244" height="307" alt="edit a product" />](http://lh4.ggpht.com/_TI0jeIedRFk/Sa0LXJyuBzI/AAAAAAAAADc/Mr9OUo8Y3IA/s1600-h/edit%20a%20product%5B3%5D.jpg)

and as I said before I will not put to much effort into the design of
the GUI, but I have noticed that the
<a href="http://en.wikipedia.org/wiki/Model-view-controller"
target="_blank">MVC-pattern</a> opens up for GUI-design decisions to be
change later on. I mean – there is a product backlog item create action
that can be outputted as a pop-dialog or on a own page or via AJAX/Flash
or …

That is a really nice feature.

Come to think of it – this is one of the main thing of
<a href="http://en.wikipedia.org/wiki/Domain-driven_design"
target="_blank">DDD</a>. You are given the freedom to choose (and
change) how to solve when the time is right. This goes for all the ends
of the application design; the database and the GUI for example.
The important stuff (ie. the model) is what you need to worry about.

OK – on to the code! Lets write some simple test…

I brushed on some
<a href="http://msdn.microsoft.com/en-us/library/bb383977.aspx"
target="_blank">extension methods</a> today. They are cool but a bit
messy since they don’t belong in the class they are extending… I am not
sure if I like them or not.

I came as far as I could create the form for creating new product
backlog items. Tomorrow I will save them.

PS. Passed 100 unit tests today. Yeah!
