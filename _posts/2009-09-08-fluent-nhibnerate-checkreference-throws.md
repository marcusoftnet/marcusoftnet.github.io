---
layout: post
title: Fluent NHibnerate CheckReference throws Expected
‘X’ but got ‘XProxy’
date: '2009-09-08T15:43:00.001+02:00' author:
Marcus Hammarberg
tags:
  - .NET - NHibernate
modified_time: '2010-12-14T16:19:35.818+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-1927364463858470307
blogger_orig_url: http://www.marcusoft.net/2009/09/fluent-nhibnerate-checkreference-throws.html
---


I have been playing around quite a lot with
<a href="http://fluentnhibernate.org/" target="_blank">Fluent
NHibernate</a> lately and ran into this problem a couple of times.

What happens is that when you set up a <a
href="http://wiki.fluentnhibernate.org/Persistence_specification_testing"
target="_blank">mapping test with PersistenceSpecification&lt;T&gt;</a>
that tests a reference (with CheckReference for example), an exception
is throw like this:

> System.ApplicationException: Expected ‘Marcusoft.Product' but
> got 'ProductProxy…' for Property 'Product'

This has to do with that <a href="https://www.hibernate.org/343.html"
target="_blank">NHibernate</a> creates a proxy-class and doing
Equality-test on that class. I have picked up a base class that “fix”
this problem from the Hibernating Rhinos (my god! what a name…)

You can read about it <a
href="http://dotnetslackers.com/articles/ado_net/Your-very-first-NHibernate-application-Part-2.aspx"
target="_blank">here</a> or read
<a href="http://www.pastie.org/609556" target="_blank">my code here</a>.
