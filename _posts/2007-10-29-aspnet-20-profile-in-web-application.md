---
layout: post
title: Asp.Net 2.0 Profile in Web Application Projects
date: 2007-10-29T09:34:00.000Z
author: Marcus Hammarberg
tags:
  - Life of a consultant
  - Visual Studio
modified_time: 2010-12-14T15:19:05.517Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5749312230854668126
blogger_orig_url: https://www.marcusoft.net/2007/10/aspnet-20-profile-in-web-application.html
---

It has been a while since I coded web (not longing to much, I can say) and during this time a lot of development has happened of course. One of the great new features in ASP.NET 2.0 is the membership and profile handling which gives you easy access to store and get values that is has to do with the current user - a bit like settings in Windows programming.

A good introduction example can be [found here](http://www.odetocode.com/Articles/440.aspx).

However there is a problem in the different project models. When Visual Studio 2005 was released Microsoft did an attempt to solve the "i want to place my files for web projects wherever I want"-problem, and came up with the Web Site-project type. It sucks!

That project type doesn't contain a project file and has a completely different compilation model, so it no good in most professional development projects. To do a build script for that kind of project is nigh on impossible...

So a new project type was released - Web Application Project. It is good! So good in fact that after Visual Studio SP1 - the web site project cannot be chosen and the Web Application project template is the only one left.

To bad that, in the progress, some features was removed - for example the automatically generation of a Profile-class to get easy access to the Profile-values in web.config.

Here is a add-in that gives you that feature back - [ASP.NET WebProfile Generator](http://www.codeplex.com/WebProfile). It will (they have promised) work in the next version of Visual Studio.
