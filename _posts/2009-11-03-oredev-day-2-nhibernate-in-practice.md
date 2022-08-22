---
layout: post
title: 'ÖreDev day 2 – NHibernate in practice'
date: '2009-11-03T17:00:00.001+01:00'
author: Marcus Hammarberg
tags:
  - .NET
  - ÖreDev
  - NHibernate
modified_time: '2011-11-09T21:49:22.595+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-6149552882586383561
blogger_orig_url: http://www.marcusoft.net/2009/11/oredev-day-2-nhibernate-in-practice.html
---


Now it’s <a href="https://www.hibernate.org/343.html"
target="_blank">NHibernate</a> with
<a href="http://unhandled-exceptions.com/blog/index.php/about/"
target="_blank">Stephen Bohlen</a>, who is aiming to cramming in all
(kinda…) of the screencast on
[www.summerofnhibernate.com](http://www.summerofnhibernate.com) in 4
hours.

I think I’ll just sit back and try to learn this, because this guy is
probably paid by the word :)

OK – closing in on the end. I really enjoyed this presentation but it
would have benefitted from being longer, a whole day. It felt a bit
rushed and we didn’t get as far as I would have reached. Although the
material covered was great and well presented. And now I always have the
[www.summerofnhibernate.com](http://www.summerofnhibernate.com) to run
back to.

I learned something about TDD and unit tests. Always ask:

> “What can we safely assert?”

And the answer should be:

> “Only the values I’ve set in the test code”

This is especially useful doing “unit tests” against the database (ie.
integration tests).

If you write a test that searches for people with first name equal
“FIRST NAME”, the only thing you safely can check that returned people
contains is that first name equal “FIRST NAME”.
