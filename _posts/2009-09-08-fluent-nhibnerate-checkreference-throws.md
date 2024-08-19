---
layout: post
title: Fluent NHibernate CheckReference Throws Expected ‘X’ but Got ‘XProxy’
date: 2009-09-08T13:43:00.001Z
author: Marcus Hammarberg
tags:
  - .NET
  - NHibernate
modified_time: 2010-12-14T15:19:35.818Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-1927364463858470307
blogger_orig_url: http://www.marcusoft.net/2009/09/fluent-nhibnerate-checkreference-throws.html
---

Lately, I've been working extensively with [Fluent NHibernate](http://fluentnhibernate.org/) and encountered a recurring issue.

When setting up a [mapping test with `PersistenceSpecification<T>`](http://wiki.fluentnhibernate.org/Persistence_specification_testing) to test a reference (using `CheckReference`, for instance), I often get the following exception:

> `System.ApplicationException: Expected ‘Marcusoft.Product' but got 'ProductProxy…' for Property 'Product'`

This issue arises because [NHibernate](https://www.hibernate.org/343.html) generates a proxy class, which causes problems when performing equality tests on that class. To address this, I found a base class that resolves this problem, provided by the Hibernating Rhinos (what a name!).

You can read more about this solution [here](http://dotnetslackers.com/articles/ado_net/Your-very-first-NHibernate-application-Part-2.aspx) or check out my code [here](http://www.pastie.org/609556).
