---
layout: post
title: Sprint Planner Helper – Session 6
date: 2009-02-09T21:02:00.000Z
author: Marcus Hammarberg
tags:
  - Sprint Planner Helper
  - TDD
modified_time: 2009-02-11T21:23:54.698Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-8845363078970420054
blogger_orig_url: http://www.marcusoft.net/2009/02/sprint-planner-helper-learning.html
---


OK – I did some reading about repositories and they basically constitute
a way for the domain model to perform
<a href="http://en.wikipedia.org/wiki/Create,_read,_update_and_delete"
target="_blank">CRUD</a> operations – in a language needed by the domain
model.

In <a href="http://www.infoq.com/minibooks/domain-driven-design-quickly"
target="_blank">this great document</a> is a example and some very good
explanations on what the difference between an Entity (has an ID), Value
object (doesn’t have an ID in the model) and Aggregates (things that
consists of other things) are.

So today I’ll back up and create a repository that can retrieve the
products for a product owner – the IProductRepository. I test drive it
forward – of course.

After a while ….

Oh yeah – I love the way TDD is leading me forward. Really nice code
emerge.

I didn’t get quite as far as I hoped. I was hoping to be able to code a
bit of controller-action (hehe…) today. Well – tomorrow maybe.
