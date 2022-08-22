---
layout: post
title: ÖreDev Day \#2 - ASP.NET MVC with Scott Allen'
date: 2009-11-03T09:13:00.007Z
author: Marcus Hammarberg
tags:
  - ÖreDev - ASP.NET MVC
modified_time: 2011-11-09T20:49:22.591Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-472327445991958099
blogger_orig_url: http://www.marcusoft.net/2009/11/oredev-day-2-aspnet-mvc-with-scott.html
---


Now we're getting into the "real stuff" or rather IT-related stuff.

<div>
</div>

<div>

I am now attending a session with [Scott
Allen](http://odetocode.com/blogs/scott/), who is a great guy by the
way, on [ASP.NET MVC](http://www.asp.net/mVC/). As readers of this blog
know I love this framework already since it got me back on understanding
web development again.

</div>

<div>
</div>

<div>

OK - since Scott is dropping god nuggets as he speak, I thought that I
put it here as we go, in no particular order;

</div>

<div>

-   When you create the "URL template" for routing you can specify
    anything you want. For example
    {controller}/{action}/{category}/{locale} would fill the category
    and local with anything passed to the URL or null if not set.
-   Learn and use [MVC Contrib](http://www.codeplex.com/MVCContrib)
-   [](http://www.codeplex.com/MVCContrib)Set the projectfile-setting
    [MvcBuildViews](http://stackoverflow.com/questions/383192/compile-views-in-asp-net-mvc)
    to get compilation errors for errors in the views. This slows builds
    down so don't use it when not needed.
-   Test your routing with [Fluent HTML Testing
    Routes](http://flux88.com/blog/fluent-route-testing-in-asp-net-mvc/)
-   Check out
    [ActionFilters](http://www.asp.net/LEARN/mvc/tutorial-14-cs.aspx) to
    be able to hook into the "events" of the action methods;
    OnActionExcecuting, OnActionExecuted etc.
-   I got a big aha-moment when Scott described the Execute-method of
    [IController](http://msdn.microsoft.com/en-us/library/dd504937(VS.100).aspx)-interface.
    Especially check out the
    [RequestContext](http://msdn.microsoft.com/en-us/library/system.web.routing.requestcontext(VS.100).aspx)
    object sent to the Execute-method, that contains
    RouteData-dictionary. There you have your route-template values...
-   I can't believe that [I've
    forgot](http://www.marcusoft.net/2009/03/updatemodel-formcollection-and-unit_5466.html)
    about
    [UpdateModel](http://davidhayden.com/blog/dave/archive/2008/09/08/ASPNETMVCUpdateModelTryUpdateModelDataBinding.aspx).
    It's a good thing - but sending the strong type is better :)
-   Build your own [HTML helper
    methods](http://www.asp.net/learn/mvc/tutorial-09-cs.aspx) for
    everything except the trivial HTML-generation. "If you ever have a
    if-statment in your view use a HTML helper" - was the exact quote.
-   The web.config in the View-folder is just to get people not to try
    to pull down your views directly.

<div>

Thank you Scott for a great overview. I link the slides here when
available.

</div>

</div>
