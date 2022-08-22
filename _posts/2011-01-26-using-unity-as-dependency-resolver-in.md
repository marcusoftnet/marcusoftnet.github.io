---
layout: post
title: Using Unity as dependency resolver in ASP.NET MVC 3
date: '2011-01-25T20:37:00.001+01:00'
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
  - ASP.NET MVC
modified_time: '2011-01-25T20:44:16.939+01:00'
thumbnail: http://lh5.ggpht.com/\_TI0jeIedRFk/TT8mpyamHvI/AAAAAAAAAx8/WJhDqtxDLXg/s72-c/ninject%20dependcy%20resolving%20in%20asp.net%20mvc_thumb%5B1%5D.jpg?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-178841900667357474
blogger_orig_url: http://www.marcusoft.net/2011/01/using-unity-as-dependency-resolver-in.html
---


There have been a lot of improvements and additions to [dependency
resolving](http://bradwilson.typepad.com/blog/2010/07/service-location-pt1-introduction.html)
in <a href="http://www.asp.net/mVC/" target="_blank">ASP.NET MVC</a> 3.
Even in areas that you first didn’t think about (dependency injection in
views) at first.

OK – after [my last
post](http://www.marcusoft.net/2011/01/kanbanboards-iiiputting-on-web.html),
in which I’m using [Ninject](http://ninject.org/) (with the cool
website) I got the questions if it can be done with
[Unity](http://unity.codeplex.com/). Of course it does. This post shows
how.

I’m using Ninject because of the super-slick integration with ASP.NET
MVC 3 via [NuGet](http://nuget.org/). It gives my a “correct” and easy
to start with solution. The main part in this found in this App_Start
static file, that is run before any other code with the Web Activator
mechanism:

[<img
src="http://lh5.ggpht.com/_TI0jeIedRFk/TT8mpyamHvI/AAAAAAAAAx8/WJhDqtxDLXg/ninject%20dependcy%20resolving%20in%20asp.net%20mvc_thumb%5B1%5D.jpg?imgmax=800"
title="ninject dependcy resolving in asp.net mvc"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="520" height="270"
alt="ninject dependcy resolving in asp.net mvc" />](http://lh5.ggpht.com/_TI0jeIedRFk/TT8mpcPcDnI/AAAAAAAAAx4/zR_GuFY_3YA/s1600-h/ninject%20dependcy%20resolving%20in%20asp.net%20mvc%5B3%5D.jpg)

And converting that to Unity would be something like this:

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TT8oEAVmxdI/AAAAAAAAAyU/oD7LgMcATaI/unity%20dependency%20resolving%20in%20asp.net%20mvc_thumb%5B3%5D.jpg?imgmax=800"
title="unity dependency resolving in asp.net mvc"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="499" height="270"
alt="unity dependency resolving in asp.net mvc" />](http://lh4.ggpht.com/_TI0jeIedRFk/TT8oDggmGfI/AAAAAAAAAyQ/6mdAuImT3fM/s1600-h/unity%20dependency%20resolving%20in%20asp.net%20mvc%5B9%5D.jpg)

Yup – actually that’s all it’s too it. For a while there I was "worried”
that I would have to implement a ServiceLocator (line 22 above). That’s
not to hard since just the IDependencyResolver interface that is needed
to be implemented (2 methods). But I just so happens that Unity
implemented that for me already with the
[UnityServiceLocator](http://msdn.microsoft.com/en-us/library/microsoft.practices.unity.unityservicelocator(v=pandp.20).aspx).

Actually I can now easily switch between the two dependency injection
frameworks (why you want to do that I don’t know, but it’s cool), by
simply commenting out the Web Activator attribute at the top of the
class:

> ``` brush:
> [assembly: WebActivator.PreApplicationStartMethod(typeof(Web.AppStart_Unity), "Start")]
> ```

So there you have it. Another area where ASP.NET MVC 3 is easier than
you think.
