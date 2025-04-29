---
layout: post
title: Testing ASP.NET MVC Application with Session State
date: 2009-11-17T20:25:00.001Z
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
  - ASP.NET MVC
modified_time: 2010-12-14T15:22:38.176Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-8355701805675040507
blogger_orig_url: https://www.marcusoft.net/2009/11/testing-aspnet-mvc-application-with.html
---

I encountered issues when trying to use session state in an [ASP.NET MVC](http://www.asp.net/mVC/) application, especially while writing unit tests for an action method that interacted with the session object.

Fortunately, I discovered [MVC Contrib](http://www.codeplex.com/MVCContrib), which offers a range of useful tools. The [TestHelper](http://mvccontrib.codeplex.com/wikipage?title=TestHelper&amp;referringTitle=Documentation) from MVC Contrib was exactly what I needed to resolve this issue.

Installation took just a few minutes, and I was up and running again quickly. Highly recommended!
