---
layout: post
title: Get Rid of Your XML – Go Fluent NHibernate
date: 2009-08-31T20:40:00.001Z
author: Marcus Hammarberg
tags:
  - .NET
  - NHibernate
modified_time: 2009-08-31T20:40:17.280Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-2355742159307873703
blogger_orig_url: http://www.marcusoft.net/2009/08/get-rid-of-your-xml-go-fluent.html
---

After a brief experience with [NHibernate](https://www.hibernate.org/343.html), I quickly realized that managing XML files for mapping instructions can lead to several issues. XML files lack compile-time checking and can create discrepancies between code and configuration.

The solution? [Fluent NHibernate](http://fluentnhibernate.org/). This library allows you to define mappings in code using a [fluent interface](http://en.wikipedia.org/wiki/Fluent_interface), eliminating the need for XML configuration.

I recently explored their starter example and was impressed. The approach is intuitive and offers features that feel almost magical, such as [auto-mapping](http://wiki.fluentnhibernate.org/Auto_mapping). It aligns well with the idea of [“letting the storage issues be a consequence of the domain model”](http://www.marcusoft.net/2009/08/implementing-unit-of-work-with.html).
