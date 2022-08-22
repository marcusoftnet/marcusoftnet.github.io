---
layout: post
title: Testing ASP.NET MVC application with Session state
date: 2009-11-17T20:25:00.001Z
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
  - ASP.NET MVC
modified_time: 2010-12-14T15:22:38.176Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-8355701805675040507
blogger_orig_url: http://www.marcusoft.net/2009/11/testing-aspnet-mvc-application-with.html
---


I ran into trouble when I tried to use Session-state in an
<a href="http://www.asp.net/mVC/" target="_blank">ASP.NET MVC</a>
application.

The hit came when I tried to write a unit test for the Action-method
that stored stuff in the Session-object.

For a short while I found myself pondering that, but then I ran home to
mummy – <a href="http://www.codeplex.com/MVCContrib" target="_blank">MVC
Contrib</a>. My God – they have much useful in there.

The thing that save me this time was the <a
href="http://mvccontrib.codeplex.com/wikipage?title=TestHelper&amp;referringTitle=Documentation"
target="_blank">TestHelper</a>, that solved exactly my problem.

Installed in three minutes and up and running again in five. Great!
