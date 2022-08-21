---
layout: post
title: Sprint Planner Helper – Session 12
date: '2009-02-23T09:34:00.001+01:00'
author: Marcus Hammarberg
tags:
  - ASP.NET MVC - Sprint Planner Helper
modified_time: '2009-02-23T09:34:41.346+01:00'
thumbnail: http://lh4.ggpht.com/\_TI0jeIedRFk/SaJfoHGR2YI/AAAAAAAAACg/5JmVOrq7qbc/s72-c/product_thumb.jpg?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-5709480760236693340
blogger_orig_url: http://www.marcusoft.net/2009/02/sprint-planner-helper-session-12.html
---


Today I started off with some refactoring of the things I did yesterday.
It was some pretty ugly code in the aspx-page which now is improved with
some properties in the domain model.

I also started the actual adding functionality of the Product and the
product backlog. This immediately got me into trouble since I need a
list of product owners in order to fill out the form… More test data and
repositories.

TDD is great – but it doesn’t solve the problem with testdata. It’s hard
work – even with the great repository pattern. I hope (and guess) that
this pays off.

Since I am alone and Abbe is sound asleep I’ll break the [1 hour
rule](http://www.marcusoft.net/2009/01/what-to-do-now-sprint-planner-helper.html)
and continue a bit further.

There are some great help in the way that [ASP.NET
MVC](http://weblogs.asp.net/scottgu/archive/2009/01/27/asp-net-mvc-1-0-release-candidate-now-available.aspx)
integrates into Visual Studio 2008. Most notably the way you can
generate typed views (for list, edit and details!) and controller
classes via a dialog. Me likey!

Got me to realize that the list of products probably lives best on a
view of it’s own and not directly on the first page.
Hmmm – more work. This is learning…

I was quite happy when I could produce this non-working form. Now sleep!

[<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/SaJfoHGR2YI/AAAAAAAAACg/5JmVOrq7qbc/product_thumb.jpg?imgmax=800"
title="product"
style="border-right: 0px; border-top: 0px; display: inline; border-left: 0px; border-bottom: 0px"
data-border="0" width="181" height="244" alt="product" />](http://lh4.ggpht.com/_TI0jeIedRFk/SaJfnvX_adI/AAAAAAAAACc/GilPCbYw3wk/s1600-h/product%5B2%5D.jpg)
