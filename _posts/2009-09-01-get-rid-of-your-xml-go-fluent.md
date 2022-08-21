---
layout: post
title: Get rid of your xml – go Fluent NHibernate
date: '2009-08-31T22:40:00.001+02:00'
author: Marcus Hammarberg
tags:
  - .NET -
NHibernate
modified_time: '2009-08-31T22:40:17.280+02:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-2355742159307873703
blogger_orig_url: http://www.marcusoft.net/2009/08/get-rid-of-your-xml-go-fluent.html ---

After my very short experience with
<a href="https://www.hibernate.org/343.html"
target="_blank">NHibernate</a> I have already come to realize that lots
of problems can arise from and in the XML-files that contains the actual
mapping instructions.

Just the fact that they are XML gives you the classical problem of no
compile-time checking and the possibility of calling things differently
in the code and configuration.

Well, here is the solution;
<a href="http://fluentnhibernate.org/" target="_blank">Fluent
NHibernate</a>. Their solution is simple – do it in code, in a
<a href="http://en.wikipedia.org/wiki/Fluent_interface"
target="_blank">fluent interface-style</a>.

I just ran through their starter example and I like it. A lot. And some
of it is <a href="http://wiki.fluentnhibernate.org/Auto_mapping"
target="_blank">almost magic</a>. A good way to <a
href="http://www.marcusoft.net/2009/08/implementing-unit-of-work-with.html"
target="_blank">“let the storage issues be a consequence of the domain
model”</a>
