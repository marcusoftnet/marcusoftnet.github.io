---
layout: post
title: Test NHibnernate mappings with Fluent
NHibnernate
date: '2009-09-03T15:21:00.001+02:00'
author: Marcus
Hammarberg
tags:
   - Tools - NHibernate - Agile
modified_time: '2010-12-14T16:22:38.192+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-3155308461422640762
blogger_orig_url: http://www.marcusoft.net/2009/09/test-nhibnernate-mappings-with-fluent.html
---


After a couple of days in the Fluent-world I am taking to it as a fish
to water.

One of the features that I am tried out and really think will be helpful
is the ability to <a
href="http://wiki.fluentnhibernate.org/Persistence_specification_testing"
target="_blank">test your mappings</a>. Especially nice is that you in
your tests can switch to a in-memory database (with
<a href="http://www.sqlite.org/" target="_blank">SQLite</a>) so that
your test run faster, and without having to setup a database.

I found a good introduction to
<a href="https://www.hibernate.org/343.html"
target="_blank">NHibernate</a> and
<a href="http://fluentnhibernate.org/" target="_blank">Fluent
NHibernate</a> by the
<a href="http://blogs.hibernatingrhinos.com" target="_blank">Hibernating
Rhino</a> Gabriel Schenker that also introduces mapping testing. Read it
<a
href="http://dotnetslackers.com/articles/ado_net/Your-very-first-NHibernate-application-Part-1.aspx"
target="_blank">here</a> (part <a
href="http://dotnetslackers.com/articles/ado_net/Your-very-first-NHibernate-application-Part-1.aspx"
target="_blank">1</a>, <a
href="http://dotnetslackers.com/articles/ado_net/Your-very-first-NHibernate-application-Part-2.aspx"
target="_blank">2</a> and <a
href="http://dotnetslackers.com/articles/ado_net/Your-very-first-NHibernate-application-Part-3.aspx"
target="_blank">3</a>).

Love this quote by the way: “*if you continue to implement your own data
access code you are stealing (money) from your customer*”
