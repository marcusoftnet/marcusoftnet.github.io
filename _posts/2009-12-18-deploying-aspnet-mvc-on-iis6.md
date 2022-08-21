---
layout: post
title: Deploying ASP.NET MVC on IIS6 date: '2009-12-18T14:07:00.002+01:00'
author: Marcus Hammarberg
tags:
  - .NET -
Life of a consultant - ASP.NET MVC
modified_time: '2009-12-18T14:11:56.894+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-2528632061713184735
blogger_orig_url: http://www.marcusoft.net/2009/12/deploying-aspnet-mvc-on-iis6.html ---
OK - this seems to be a problem that [many people have run
into](http://www.google.se/search?hl=sv&q=asp.net+mvc+404&meta=). But
for IIS 6 it seems to be some additional configuration that is needed in
order to get ASP.NET MVC up and running.

First you'll need to find the version of IIS. Yes, I know, it should be
simple, but it's not... [Here is how you do
it.](http://classicasp.aspfaq.com/general/how-do-i-determine-which-version-of-iis/asp-i-m-running.html)

Then, when you know which one, and if it's IIS6 or lower (i presume...)
you can follow [along nicely in this
article](http://www.techdreams.org/microsoft/aspnet/how-to-fix-404-errors-of-aspnet-mvc-website-deployed-on-iis-6-windows-server-2003/2572-20090515/comment-page-1#comment-9012)
by <a href="http://www.techdreams.org/" class="url"
rel="external nofollow">Gopinath</a> - who saved my butt.
