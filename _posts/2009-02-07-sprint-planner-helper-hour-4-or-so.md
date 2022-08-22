---
layout: post
title: Sprint Planner Helper – Session 4
date: 2009-02-06T21:44:00.001Z
author: Marcus Hammarberg
tags:
  - ASP.NET MVC - Sprint Planner Helper
modified_time: 2009-02-11T21:22:54.710Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-4465697743984495476
blogger_orig_url: http://www.marcusoft.net/2009/02/sprint-planner-helper-hour-4-or-so.html
---


OK – I have been doing some thinking and model crunching and found out
that still is chewing of to much. There was no really good starting
point for me. Finally it struck me: The product manages one or more
product each with exactly one product backlog.

So the Product Owner need to be able to create a “Product” and see a
list of all products that he manages. I added that requirement to my
product backlog and started with that…

Also this introduces the need for roles in my application … but I think
that the ASP.NET MVC RC1 has taken care of that for me. At least some of
the test tells that story with the possibility to add users. I hope to
use the membership and roles in ASP.NET. But that is a later story.

I found out one thing about TDD – make your test run fast and you’d run
them more often. I am running all my test every fifth minute now.

Not very good today – I got stuck on not understanding controls. I’ll do
some checking up on that I try to get further next hour.
