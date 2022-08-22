---
layout: post
title: AutoMapping with FluentNHibernate
date: 2009-09-09T07:25:00.001Z
author: Marcus Hammarberg
tags:
  - DDD
  - .NET - NHibernate
modified_time: 2010-12-14T15:19:35.817Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5160606586149394728
blogger_orig_url: http://www.marcusoft.net/2009/09/automapping-with-fluentnhibernate.html
---


I ran across <a
href="http://ayende.com/Blog/archive/2008/12/11/fluent-nhibernate.aspx"
target="_blank">this post by Ayende</a> and it pretty much sums up where
I want to reach with my persistence ignorance efforts:

> “After that, you are done. Just create an entity in the proper place,
> hit the /database/create and have a *lot* of fun.”

I of course like the fun-part of the quote the most. :) But seriously –
that what I want to reach – to configure my conventions. And then simply
code the model as I want it and let the framework
(<a href="https://www.hibernate.org/343.html"
target="_blank">NHibernate</a> in this case) figure out how to store it.

Well, as it seems, the
<a href="http://fluentnhibernate.org/" target="_blank">Fluent
NHibernate</a> framework has been updated since the Ayende post. So I’ve
<a href="http://wiki.fluentnhibernate.org/Auto_mapping"
target="_blank">read</a>, and
<a href="http://wiki.fluentnhibernate.org/Conventions"
target="_blank">read</a>, and
<a href="http://wiki.fluentnhibernate.org/Available_conventions"
target="_blank">read</a> and discovered
<a href="http://wiki.fluentnhibernate.org/Convention_shortcut"
target="_blank">some shortcuts</a>. By the way – here is an article on
how to <a
href="http://wiki.fluentnhibernate.org/show/ConvertingToNewStyleConventions"
target="_blank">make the transition</a> from the “old” convention-style
into the new.

I have put together an updated sample for what
<a href="http://www.ayende.com/" target="_blank">Ayende</a> did in that
post above. I also added a feature to be able to automatically set
cascades for OneToMany- and ManyToMany-relationships.

<a href="http://pastie.org/610731" target="_blank">Here is the most
important parts</a> of the code.

**\[UPDATED\]
**<a
href="http://dl.getdropbox.com/u/2408484/Marcusoft.FluentAutomapper.zip"
target="_blank">Here is</a> the complete sample.

Did I mention that I LOVE Fluent NHibernate? Well I do!
