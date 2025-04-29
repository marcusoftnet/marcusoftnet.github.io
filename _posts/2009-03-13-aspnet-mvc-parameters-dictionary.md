---
layout: post
title: ASP.NET MVC "The parameters dictionary contains a null entry for parameter”
date: 2009-03-12T19:40:00.001Z
author: Marcus Hammarberg
tags:
  - ASP.NET MVC
modified_time: 2009-03-13T18:30:59.600Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-815186232609530962
blogger_orig_url: https://www.marcusoft.net/2009/03/aspnet-mvc-parameters-dictionary.html
---

This (`The parameters dictionary contains a null entry for parameter`) exception was thrown at me and confused me for a while.

If you ever encounter it I can [almost guarantee that you have a Routing-issue](http://weblogs.asp.net/scottgu/archive/2007/12/03/asp-net-mvc-framework-part-2-url-routing.aspx). That is the way the ASP.NET MVC framework is figuring out which controller and which method to invoke.

In my case I had a controller action method that required two parameters but my routing table only allowed for one.

Here is a description on how to add your own, custom route rules.

And also here is a [great tool to understand](http://haacked.com/archive/2008/03/13/url-routing-debugger.aspx) and debug your routing-table entries.

Finally – [this webcast contains a discussion](http://www.asp.net/learn/mvc-videos/video-356.aspx) about how to change routes.
