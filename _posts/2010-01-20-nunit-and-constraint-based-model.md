---
layout: post
title: NUnit and the constraint based model
date: '2010-01-20T11:01:00.001+01:00'
author: Marcus Hammarberg
tags:
  - Tools
  - .NET - TDD
modified_time: '2010-12-14T16:22:38.169+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-7963168812570339592
blogger_orig_url: http://www.marcusoft.net/2010/01/nunit-and-constraint-based-model.html
---


At the
<a href="http://blog.avegagroup.se/elevate/" target="_blank">Elevate</a>
presentation <a
href="http://blog.avegagroup.se/Elevate/archive/2010/01/19/c-3.0-och-4.0-solid-och-den-funktionella-revolutionen.aspx"
target="_blank">yesterday</a> I learned a lot about C#3/4 by Magnus
Lidbom.

But as a side-effect I also picked up a nifty syntax for NUnit
assertions. It’s called
<a href="http://www.nunit.org/index.php?p=constraintModel&amp;r=2.5.3"
target="_blank">Constraint-based Assertion Model</a> and has been around
since NUnit 2.4. Which shows that I am a slow adopter… Sad.

OK – what’s the deal with it? It gives you a almost fluent interface to
assertions. Here is an example on how to do a simple assertion in the
old style:

And here is the same assertion in the Constraint-based version:

Now read it out loud; Assert… That … i … is equal to 10. Nice, isn’t it?
I like that a lot.
