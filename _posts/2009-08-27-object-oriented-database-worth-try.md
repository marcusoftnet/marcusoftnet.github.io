---
layout: post
title: Object-Oriented Database – Worth a Try
date: 2009-08-27T08:35:00.001Z
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
modified_time: 2010-12-14T15:22:38.193Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-1124798564099723385
blogger_orig_url: https://www.marcusoft.net/2009/08/object-oriented-database-worth-try.html
---

I recently conducted a small experiment with an object-oriented database, [db4o](http://www.db4o.com), and I'm quite impressed.

Initially, the concept is a bit challenging to grasp since there are no tables, no [SQL](http://www.youtube.com/watch?v=p5EIrSM8dCA), and no mapping involved. Instead, you directly store your objects.

The real challenge lies in querying these objects, but the [db4o team](http://developer.db4o.com/blogs/default.aspx) has made strides in this area. For example, the current release includes full support for LINQ, providing an [excellent programming experience](http://developer.db4o.com/Resources/view.aspx/Reference/Object_Lifecycle/Querying/LINQ/Simple_Example).

Although I'm still a newbie and have some unanswered questions about [data and class definitions evolution](https://na2.salesforce.com/_ui/selfservice/pkb/PublicKnowledgeSolution/d?orgId=00D300000000PmR&id=50130000000FPoE&retURL=/sol/public/search.jsp%3Fsearch%3Ddata%2Bversioning%26orgId%3D00D300000000PmR&ps=1), it looks promising—very promising.

Just imagine it: "No more SQL. No more mapping." It's appealing, isn't it?
