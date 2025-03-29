---
layout: post
title: AutoMapping with FluentNHibernate
date: 2009-09-09T07:25:00.001Z
author: Marcus Hammarberg
tags:
  - DDD
  - .NET
  - NHibernate
modified_time: 2010-12-14T15:19:35.817Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5160606586149394728
blogger_orig_url: http://www.marcusoft.net/2009/09/automapping-with-fluentnhibernate.html
---

I came across [this post by Ayende](http://ayende.com/Blog/archive/2008/12/11/fluent-nhibernate.aspx) which perfectly captures my goal for achieving persistence ignorance:

> “After that, you are done. Just create an entity in the proper place, hit the /database/create and have a *lot* of fun.”

I particularly enjoy the "fun" part of this quote! My aim is to configure conventions and then simply code the model as I desire, allowing the framework ([NHibernate](https://www.hibernate.org/343.html) in this case) to handle the storage details.

The [Fluent NHibernate](http://fluentnhibernate.org/) framework has been updated since Ayende’s post. I explored the documentation, including [AutoMapping](http://wiki.fluentnhibernate.org/Auto_mapping), [Conventions](http://wiki.fluentnhibernate.org/Conventions), [Available Conventions](http://wiki.fluentnhibernate.org/Available_conventions), and discovered [some shortcuts](http://wiki.fluentnhibernate.org/Convention_shortcut). Additionally, [this article](http://wiki.fluentnhibernate.org/show/ConvertingToNewStyleConventions) explains how to transition from the old convention style to the new one.

I've put together an updated example inspired by Ayende's post, including a feature for automatically setting cascades for OneToMany and ManyToMany relationships.

[Here is the most important part of the code](http://pastie.org/610731).

**UPDATED** [Here is the complete sample](http://dl.getdropbox.com/u/2408484/Marcusoft.FluentAutomapper.zip).

Did I mention that I LOVE Fluent NHibernate? Well, I do!
