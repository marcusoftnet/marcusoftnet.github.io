---
layout: post
title: ASP.NET MVC, StructureMap, and … TDD?
date: 2010-01-28T08:26:00.003Z
author: Marcus Hammarberg
tags:
  - BDD
  - .NET
  - NHibernate
  - ASP.NET MVC
  - Agile
  - TDD
modified_time: 2010-12-14T15:19:35.814Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-8081588236115919566
blogger_orig_url: http://www.marcusoft.net/2010/01/aspnet-mvc-structuremap-and-tdd.html
---

I've been experimenting with **ASP.NET MVC** and **StructureMap** (an IOC container), and the integration has been quite smooth. For guidance on combining StructureMap with ASP.NET MVC, check out [Elija Manor's blog post](http://elijahmanor.com/webdevdotnet/post/Using-StructureMap-with-ASPNET-MVC-MVC-Contrib.aspx). Be cautious of the [favicon issue](http://haacked.com/archive/2008/07/14/make-routing-ignore-requests-for-a-file-extension.aspx).

I'm also using **NHibernate** and **Fluent NHibernate** for a cleaner configuration compared to XML. If you need to set specific properties in Fluent NHibernate, this [Stack Overflow thread](http://stackoverflow.com/questions/968730/how-to-set-a-configuration-property-when-using-fluent-nhibernate) provides a helpful example. Additionally, the [TekPub NHibernate series](http://tekpub.com/view/nhibernate/1) and [Kona project examples](http://github.com/robconery/Kona/blob/master/Kona.Web/) are great resources.

Now, onto the topic of **TDD**. While I appreciate TDD as my preferred coding method, I'm grappling with its application at a higher level. For example, how do I decide when to introduce a repository or an IOC container, and should I TDD the IOC code?

I’ve sought advice from the [Swedish ALT.NET group](http://groups.google.se/group/sweden-altnet/browse_thread/thread/748166ff04f8c511) and found that **BDD** and the concept of a [Walking Skeleton](http://alistair.cockburn.us/Walking+skeleton) might offer solutions. BDD helps address broader design concerns, while TDD focuses on lower-level details.

My current approach is to start with a simple design (MVC + repositories + IOC), establish a basic functional/integration test to verify core functionality, and then use TDD to refine and enhance the design. This way, you build a functional skeleton that can be fleshed out with TDD as development progresses.
