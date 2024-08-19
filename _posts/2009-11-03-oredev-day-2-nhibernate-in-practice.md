---
layout: post
title: ÖreDev Day 2 – NHibernate in Practice
date: 2009-11-03T16:00:00.001Z
author: Marcus Hammarberg
tags:
  - .NET
  - ÖreDev
  - NHibernate
modified_time: 2011-11-09T20:49:22.595Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-6149552882586383561
blogger_orig_url: http://www.marcusoft.net/2009/11/oredev-day-2-nhibernate-in-practice.html
---

Today’s session at ÖreDev was about NHibernate, led by [Stephen Bohlen](http://unhandled-exceptions.com/blog/index.php/about/). Stephen aimed to cover a comprehensive screencast from [Summer of NHibernate](http://www.summerofnhibernate.com) in just four hours.

Stephen’s presentation was thorough and engaging, though it felt a bit rushed. Given the depth of NHibernate, a full day would have been ideal to delve deeper. Nonetheless, the material was valuable, and I can always revisit [Summer of NHibernate](http://www.summerofnhibernate.com) for more details.

One key takeaway was a principle for TDD and unit testing: Always ask, “What can we safely assert?” The answer should be, “Only the values I’ve set in the test code.” This is especially relevant for integration tests involving databases. For example, if you write a test to find people with the first name “FIRST NAME,” you can safely assert that the returned people have the first name “FIRST NAME,” but nothing beyond that.

Overall, it was a great session, and I’m looking forward to applying these insights.
