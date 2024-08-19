---
layout: post
title: Sprint Planner Helper – Session 22
date: 2009-03-22T20:43:00.001Z
author: Marcus Hammarberg
tags:
  - Sprint Planner Helper
modified_time: 2009-03-22T20:50:09.625Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-6644721424555041710
blogger_orig_url: http://www.marcusoft.net/2009/03/sprint-planner-helper-session-22.html
---

I have had some serious thoughts on what to do next in my project. On one hand, I want to update the way I am doing the GUI for the product and product backlog. Right now I am warm and learning a lot about [ASP.NET MVC](http://www.asp.net/mvc/) so it feels quite good to continue there.

On the other hand, this is first and foremost a [DDD](http://en.wikipedia.org/wiki/Domain-driven_design)-learning experience, and I have got stuck for a while in the ASP.NET MVC trench.

And finally, since I only have one hour, either way will take me on a detour from the other track. What to do?

After some serious consideration, I decided to spend today’s session on a DDD thing I ran into in the walkthrough. I want to implement the “IsValid and GetRuleValidations” pattern and include it in my `BaseRepository` `Save` method.

That will be enough for today – I think.

[Coding with lots of simple tests takes place here]

Yeah – I liked that. Now I have a foundation for validation in place. I even added the validation rules for the `Product`, `ProductOwner`, and `ProductBacklogItem`.

Good progress today.
