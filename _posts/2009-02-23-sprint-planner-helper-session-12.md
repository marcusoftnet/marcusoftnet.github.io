---
layout: post
title: Sprint Planner Helper – Session 12
date: 2009-02-23T08:34:00.001Z
author: Marcus Hammarberg
tags:
  - ASP.NET MVC
  - Sprint Planner Helper
modified_time: 2009-02-23T08:34:41.346Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5709480760236693340
blogger_orig_url: https://www.marcusoft.net/2009/02/sprint-planner-helper-session-12.html
---

Today, I started off with some refactoring of the code from yesterday. The ASPX page had some pretty ugly code that I've now cleaned up by adding properties to the domain model.

## Progress on Product and Backlog Functionality

I began working on adding functionality for the Product and the product backlog. This immediately led to some trouble as I realized I needed a list of product owners to populate the form. This meant more test data and repositories were needed.

While Test-Driven Development (TDD) is fantastic, it doesn't solve the problem of test data. Even with a solid repository pattern, it’s still a challenge. I hope that the effort will pay off in the long run.

Since I’m alone and Abbe is sound asleep, I decided to break the [1-hour rule](https://www.marcusoft.net/2009/01/what-to-do-now-sprint-planner-helper.html) and push on a bit further.

### ASP.NET MVC Integration

ASP.NET MVC integrates smoothly with Visual Studio 2008, which is incredibly helpful. Notably, the ability to generate typed views (for list, edit, and details) and controller classes via a dialog is a huge time-saver.

This integration made me realize that the list of products might be better suited on its own view rather than being directly on the homepage. This means more work, but it’s all part of the learning process.

I was quite pleased when I managed to produce this non-working form. Time for some rest!
