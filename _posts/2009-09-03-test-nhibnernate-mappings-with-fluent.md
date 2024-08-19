---
layout: post
title: Test NHibernate Mappings with Fluent NHibernate
date: 2009-09-03T13:21:00.001Z
author: Marcus Hammarberg
tags:
  - Tools
  - NHibernate
  - Agile
modified_time: 2010-12-14T15:22:38.192Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-3155308461422640762
blogger_orig_url: http://www.marcusoft.net/2009/09/test-nhibnernate-mappings-with-fluent.html
---

After spending a few days working with Fluent NHibernate, I’m finding it to be a fantastic tool. One feature that stands out is the ability to [test your mappings](http://wiki.fluentnhibernate.org/Persistence_specification_testing). This feature is especially useful as it allows you to switch to an in-memory database, such as [SQLite](http://www.sqlite.org/), which speeds up your tests and eliminates the need for a complex database setup.

For a solid introduction to [NHibernate](https://www.hibernate.org/343.html) and [Fluent NHibernate](http://fluentnhibernate.org/), check out the articles by [Gabriel Schenker](http://blogs.hibernatingrhinos.com) from Hibernating Rhinos. These articles cover mapping testing and are available [here](http://dotnetslackers.com/articles/ado_net/Your-very-first-NHibernate-application-Part-1.aspx) (Part [1](http://dotnetslackers.com/articles/ado_net/Your-very-first-NHibernate-application-Part-1.aspx), [2](http://dotnetslackers.com/articles/ado_net/Your-very-first-NHibernate-application-Part-2.aspx), and [3](http://dotnetslackers.com/articles/ado_net/Your-very-first-NHibernate-application-Part-3.aspx)).

And I love this quote: "*If you continue to implement your own data access code, you are stealing (money) from your customer*."
