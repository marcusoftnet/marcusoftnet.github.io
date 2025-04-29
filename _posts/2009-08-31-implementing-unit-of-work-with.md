---
layout: post
title: Implementing Unit Of Work with NHibernate
date: 2009-08-31T12:54:00.001Z
author: Marcus Hammarberg
tags:
  - DDD
  - NHibernate
  - Agile
modified_time: 2009-08-31T12:56:38.686Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-49902724261637921
blogger_orig_url: https://www.marcusoft.net/2009/08/implementing-unit-of-work-with.html
---

The more I work with NHibernate, the more I question why I wrote so much SQL in the past. It feels... unnecessary. Who said "stupid"? Not me...

[Jimmy Nilsson](http://jimmynilsson.com/blog/) once said, “I just want the database and storage problems to be a consequence of my domain model. I don’t want to think about it.” This aligns with one of the goals of Domain-Driven Design (DDD), and NHibernate is a key tool in achieving this.

I’ve been experimenting with NHibernate recently, and I’m genuinely impressed. While the mapping files can be complex initially and there are many tricks and traps to navigate, NHibernate is truly powerful.

Here are some resources that have been particularly helpful in my journey:

- [The NHibernate API Reference](https://www.hibernate.org/hib_docs/nhibernate/1.2/reference/en/html_single/)
- A [great tutorial](http://blogs.hibernatingrhinos.com/nhibernate/archive/2008/04/01/your-first-nhibernate-based-application.aspx) for getting started
- A series of articles on implementing the Unit of Work pattern with NHibernate: [Part 1](http://blogs.hibernatingrhinos.com/nhibernate/archive/2008/04/10/nhibernate-and-the-unit-of-work-pattern.aspx), [Part 2](http://blogs.hibernatingrhinos.com/nhibernate/archive/2008/04/13/nhibernate-and-the-unit-of-work-pattern-part-2.aspx), [Part 3](http://blogs.hibernatingrhinos.com/nhibernate/archive/2008/04/26/nhibernate-and-the-unit-of-work-pattern-part-3.aspx)
- [Advanced mapping scenarios](http://sdesmedt.wordpress.com/2006/09/04/nhibernate-part-4-mapping-techniques-for-aggregation-one-to-many-mapping/)
- [Mapping many-to-many entities](http://codebetter.com/blogs/peter.van.ooijen/archive/2008/05/29/nhibernate-many-to-many-collections-or-mapping-is-not-one-table-one-class.aspx) without requiring a connection entity

Interestingly, we initially attempted to create our own Unit of Work implementation for NHibernate. However, it turns out that NHibernate integrates with the [.NET System.TransactionScope](http://msdn.microsoft.com/en-us/library/system.transactions.transactionscope.aspx). Thanks to Magnus and Calle for pointing that out—my code is now obsolete!

This has been a fantastic learning experience. If you want to see the code, just drop me a line and I’ll send it over in no time.
