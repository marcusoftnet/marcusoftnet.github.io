---
layout: post
title: ASP.NET MVC "The parameters dictionary contains
a null entry for parameter”
date: '2009-03-12T20:40:00.001+01:00'
author: Marcus Hammarberg
tags:
  - ASP.NET MVC
modified_time: '2009-03-13T19:30:59.600+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-815186232609530962
blogger_orig_url: http://www.marcusoft.net/2009/03/aspnet-mvc-parameters-dictionary.html
---


This (The parameters dictionary contains a null entry for parameter)
exception was thrown at me and confused me for a while.

If you ever encounter it I can almost guarantee that you have a <a
href="http://weblogs.asp.net/scottgu/archive/2007/12/03/asp-net-mvc-framework-part-2-url-routing.aspx"
target="_blank">Routing</a>-issue.  That is the way the
<a href="http://www.asp.net/mvc/" target="_blank">ASP.NET MVC</a>
framework is figuring out which controller and which method to invoke.

In my case I had a controller action method that required two parameter
but my <a href="http://www.asp.net/learn/mvc/tutorial-05-cs.aspx"
target="_blank">routing table</a> only allowed for one.

<a href="http://www.asp.net/learn/mvc/tutorial-23-cs.aspx"
target="_blank">Here is a description</a> on how to add your own, custom
route rules.

And also here is a great tool to understand and <a
href="http://haacked.com/archive/2008/03/13/url-routing-debugger.aspx"
target="_blank">debug your routing</a>-table entries.

Finally – this
<a href="http://www.asp.net/learn/mvc-videos/video-356.aspx"
target="_blank">webcast</a> contains a discussion about how to change
routes.

<div class="blogger-post-footer">

<img
src="http://res1.blogblog.com/tracker/36533086-815186232609530962.gif?l=www.marcusoft.net"
width="1" height="1" />

</div>
