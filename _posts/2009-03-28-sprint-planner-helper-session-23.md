---
layout: post
title: Sprint Planner Helper – Session 23
date: 2009-03-28T09:03:00.001Z
author: Marcus Hammarberg
tags:
  - ASP.NET MVC - Sprint Planner Helper
modified_time: 2009-03-28T10:33:16.918Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5407234746616999180
blogger_orig_url: http://www.marcusoft.net/2009/03/sprint-planner-helper-session-23.html
---

This has been the longest session of my project so far, spanning over four separate hours and nearly a week. My schedule was packed with other commitments, but I made significant progress.

The main challenge was grappling with some ASP.NET MVC framework issues related to data binding in views and the `UpdateModel` method. To cut a long story short, I encountered difficulties and reached out for help on the [MVC-forum](http://forums.asp.net/1146.aspx). I received excellent feedback from Alberto, which you can read in my [forum post](http://forums.asp.net/t/1402763.aspx).

Here are some key takeaways from this session:

- **Use a Separate ViewModel:** It’s crucial to create view-specific classes that streamline data handling between views and controllers.
- **Naming Conventions in Views:** For example, using `Html.TextBox("Product.Name", Model.Product.Name)` in the view and calling `UpdateModel()` will correctly populate the `Product` property with the new `Name` value.

My goal was to continue using the IsValid/GetRuleViolations pattern from [Session 22](http://www.marcusoft.net/2009/03/sprint-planner-helper-session-22.html), but I ended up learning a more effective approach instead. 

**[UPDATED]**
I managed to resolve the ValidationSummary issue, as shown in the picture below:

![Validation Summary](/img/ruleviolations.jpg)

I've also been reflecting on spending too much time on the MVC specifics. According to my [initial intentions](http://www.marcusoft.net/2009/01/what-to-do-now-sprint-planner-helper.html), this project was meant to be a learning experience in [Domain-Driven Design (DDD)](http://en.wikipedia.org/wiki/Domain-driven_design), [Test-Driven Development (TDD)](http://en.wikipedia.org/wiki/Test-driven_development), and [ASP.NET MVC](http://www.asp.net/mvc/). However, I feel that DDD has taken a backseat recently.

It seems that while ASP.NET MVC requires a lot of time to master due to its framework complexities, DDD is more about design patterns and mindset, which can be easier to start with but challenging to master. 

I plan to refocus on the DDD aspects in the next session. For now, I need to fix some issues with the testing that didn’t work out as planned. Stay tuned!
