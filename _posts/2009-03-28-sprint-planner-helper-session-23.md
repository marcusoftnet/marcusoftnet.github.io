---
layout: post
title: Sprint Planner Helper – Session 23
date: 2009-03-28T09:03:00.001Z
author: Marcus Hammarberg
tags:
  - ASP.NET MVC - Sprint Planner Helper
modified_time: 2009-03-28T10:33:16.918Z
thumbnail: >-
  http://lh3.ggpht.com/\_TI0jeIedRFk/Sc386snnzWI/AAAAAAAAAD4/toypsj9vSI4/s72-c/ruleviolations_thumb.jpg?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-5407234746616999180
blogger_orig_url: http://www.marcusoft.net/2009/03/sprint-planner-helper-session-23.html
---


This has been the longest of my sessions so far and by far. It has
actually stretched over 4 separate “hours” and almost a week since my
schedule has been busy with other stuff.

It had to do with me getting stuck on a thing the ASP.NET MVC framework
that I didn’t get. This was related to the way the framework binds the
data in the view to the values posted, and the UpdateModel method etc.

To make a long story short I have
<a href="http://forums.asp.net/t/1402763.aspx" target="_blank">posted an
item</a> in the
<a href="http://forums.asp.net/1146.aspx" target="_blank">MVC-forum</a>,
and got some truly great feedback from Alberto. I recommend you
<a href="http://forums.asp.net/t/1402763.aspx" target="_blank">reading
it.</a> Go on. Do it now.

Ok – from all this I learned some very useful lessons;

-   the most important was to use a separate ViewModel. That is – create
    classes that are streamlined to fit the view that the controller is
    exposing.
-   you can do some pretty funky stuff with the naming conventions in
    the view. For example: if you do this in the view:
    Html.TextBox("Product.Name", Model.Product.Name) will
    and then call UpdateModel(), the Product-property will get new-ed
    and the Name-value set.

My goal with this session was to continue the use of the
IsValid/GetRuleViolations-pattern from [Session
22](http://www.marcusoft.net/2009/03/sprint-planner-helper-session-22.html).

But that broke down pretty fast – and I got to learn this pattern
instead. I’ll take that any day! Much better knowledge. But I’ll get
back to it – shortly.

**\[UPDATED\]
**I managed to nail the ValidationSummary-stuff… Here is a picture of
it:

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/Sc386snnzWI/AAAAAAAAAD4/toypsj9vSI4/ruleviolations_thumb.jpg?imgmax=800"
title="ruleviolations"
style="border-right: 0px; border-top: 0px; display: block; float: none; margin-left: auto; border-left: 0px; margin-right: auto; border-bottom: 0px"
data-border="0" width="193" height="244" alt="ruleviolations" />](http://lh5.ggpht.com/_TI0jeIedRFk/Sc3859hkEgI/AAAAAAAAAD0/zuSO8bunTxU/s1600-h/ruleviolations%5B2%5D.jpg)

I have also pondered over me spending to much time in the MVC-trenches.
If I re-read my [initial
intentions](http://www.marcusoft.net/2009/01/what-to-do-now-sprint-planner-helper.html)
this is a <a href="http://en.wikipedia.org/wiki/Domain-driven_design"
target="_blank">DDD</a>-learning project (as well as
<a href="http://en.wikipedia.org/wiki/Test-driven_development"
target="_blank">TDD</a> and
<a href="http://www.asp.net/mvc/" target="_blank">ASP.NET MVC</a>). But
I feel that the DDD-ing has been sidestepped for a while.

I guess that it has to do with that the ASP.NET MVC is a framework that
you need to learn how to get your way around. These thing takes time and
can stop you in your tracks.

DDD on the other hand is a bunch of design patterns and a mindset – that
can take considerable time to master but is often quite easy to get up
and running with. 

I’ll try to get back to the DDD-part of this in next session. I had to
leave to test that doesn’t work so I’ll have to fix that first. but
then…
