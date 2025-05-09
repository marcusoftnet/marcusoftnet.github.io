---
layout: post
title: WCF Self-hosting and configuration
date: 2008-10-23T08:51:00.002Z
author: Marcus Hammarberg
tags:
  - .NET
  - WCF
modified_time: 2009-01-12T06:59:40.503Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-6303362849898349646
blogger_orig_url: https://www.marcusoft.net/2008/10/wcf-self-hosting-and-configuration.html
---

One of the really cool features of WCF is the possibility to be able to change binding in the config... Of course the transport need to be supported by the host. For example you can't use TCP/IP transport in a web-site hosted service.

So - you'll have to create the host by yourself - self hosting. However there are some nasty configuration to be done in order to get the service to work. Otherwise you'll get this error message:

> HTTP could not register URL [http://+:[yourport]](http://+:%5Byourport%5D)

[Here is an article](http://msdn.microsoft.com/en-us/library/ms733768.aspx) from Microsoft describing how to get it to work. And here is [another article](http://blogs.msdn.com/paulwh/archive/2007/05/04/addressaccessdeniedexception-http-could-not-register-url-http-8080.aspx) describing how to solve it
