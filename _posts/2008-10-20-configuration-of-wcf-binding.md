---
layout: post
title: Configuration of WCF-binding
date: 2008-10-20T09:13:00.001Z
author: Marcus Hammarberg
tags:
  - Programming
  - WCF
  - .NET
modified_time: 2008-10-20T09:20:16.964Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-4401615870941869968
blogger_orig_url: https://www.marcusoft.net/2008/10/configuration-of-wcf-binding.html
---

This area is (in the words of [Juval Löwy](http://www.idesign.net)) "truly vast". And as I read somewhere else most of the properties doesn't make sense to the common programmer. We (yeah, I'm one of the common ones) just want it to work.

Also, when it comes to configuring WCF services Microsoft has gone the complete opposite way from their normal way of doing things; normally Microsoft hides everything you don't need to know from you and you'll have to dig to get to the advanced things. When it comes to WCF all the possible values are shown right off - scared the living daylights of of me. Just add a reference to a WCF-service and check your client .config-file.

So what to do - well I'm sorry but you'll need to know quite a bit of information, here are some resources that I have found useful:

- The book [Programming WCF Service](http://oreilly.com/catalog/9780596526993/) (Chapter 1 and 10 on these subjects. Buy it - you'll need it!
- [Fundamentals of WCF Security](http://www.devx.com/codemag/Article/33342)
- The excellent tool for WCF-configuration in Visual Studio... (Christer Cederborg tipped me on this one, thanks). Go to Tools->WCF Service Configuration Editor and you'll get a lot of help when you configure your service and clients...
- Here is [another great introductory article](http://www.winterdom.com/weblog/2007/02/12/WCFConfigurationComplexity.aspx) to the subject

I'll try to post some examples of how to do certain things as I need to do them. Here is the first: [How to configure wsHttpBinding for no security](https://www.marcusoft.net/2008/10/wcf-config-how-to-configure.html)
