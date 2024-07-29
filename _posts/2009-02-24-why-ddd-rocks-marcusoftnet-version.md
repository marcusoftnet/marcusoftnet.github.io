---
layout: post
title: Why DDD Rocks – The Marcusoft.net Version
date: 2009-02-23T20:43:00.001Z
author: Marcus Hammarberg
tags:
  - DDD
  - Life of a consultant
  - ASP.NET MVC
  - TDD
modified_time: 2009-02-23T20:43:54.324Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-4192933904487220024
blogger_orig_url: http://www.marcusoft.net/2009/02/why-ddd-rocks-marcusoftnet-version.html
---

Today I had a very interesting conversation with a colleague and friend. He is very accomplished in matters concerning [Application Lifecycle Management](http://en.wikipedia.org/wiki/Application_Lifecycle_Management) (ALM). The more we talked about that and the things I am learning with the [Sprint Planner Helper](Sprint%20Planner%20Helper) (TDD, DDD, and ASP.NET MVC), the more I am convinced that I am on the right track. It’s the way to go – especially if you want to be agile.

Just take my experience with this project. I have now coded for some time (about 15 hours) without having to lock down to a database design and data access strategy. Not even near – I am working out the model. I am even planning to handle the database stuff at the very end.

You could choose to view the data access strategy and database as a “necessary evil.” I know I will need one to persist my data, but I will do as little with it as possible. Hopefully, I'll generate it or leave it to people better suited to fine-tune a database.

The same goes for the UI – I am by no means a GUI designer. So, I know I will need a good UI, but I’ll leave it as it is right now (with as little work as possible for me) and maybe let someone else look at it later.

So, what am I doing, you might ask? I am focusing on the real stuff – the Domain and its problems. I’m trying to keep it in a state that will hold for future changes.

Get on the DDD train – it’s good for you! And for your code…
