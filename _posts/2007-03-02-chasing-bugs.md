---
layout: post
title: Chasing bugs
date: '2007-03-02T12:37:00.000+01:00'
author: Marcus Hammarberg
tags:
  - .NET
  - Life of a consultant
modified_time: '2007-03-02T13:03:01.751+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-3239091661353820808
blogger_orig_url: http://www.marcusoft.net/2007/03/chasing-bugs.html ---
The last two days has been spent chasing bugs in production
environment.

For non-developers this is a bit like trying to fix a broken bridge with
traffic still running, i.e. quite scary, stressful and with angry users
thinking that you can go faster.

We have now arrived to a solution on the bugs and the reflection phase
sets in. Nice...

On of the problems (non-production I'm glad to say) had to do with
ASP.NET and Javascript. The customer wanted the ENTER-button to trigger
a login-form to submit. But the page had some other parts in the form
that also submitted.

This has been troublesome to solve in ASP and ASP.NET for a long time
but with ASP.NET 2.0 there is a very nice solution to this problem, an
attribute called DefaultButton.

Here is a [nice article](http://forums.asp.net/thread/1270048.aspx)
describing how to use it.

Update: just after implementing this solution we found troubles with
Firefox-browsers... Beware! And look here for [possible
solution](http://forums.anthemdotnet.com/forums/viewtopic.php?p=1880&sid=eda1dd00645b815b120f36b9c96e7383)
