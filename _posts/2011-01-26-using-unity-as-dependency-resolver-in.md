---
layout: post
title: Using Unity as Dependency Resolver in ASP.NET MVC 3
date: 2011-01-25T19:37:00.001Z
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
  - ASP.NET MVC
modified_time: 2011-01-25T19:44:16.939Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-178841900667357474
blogger_orig_url: http://www.marcusoft.net/2011/01/using-unity-as-dependency-resolver-in.html
---

There have been a lot of improvements and additions to [dependency resolving](http://bradwilson.typepad.com/blog/2010/07/service-location-pt1-introduction.html) in [ASP.NET MVC](http://www.asp.net/mVC/) 3. Even in areas that you first didn’t think about (dependency injection in views) at first.

OK – after [my last post](http://www.marcusoft.net/2011/01/kanbanboards-iiiputting-on-web.html), in which I’m using [Ninject](http://ninject.org/) (with the cool website) I got the questions if it can be done with [Unity](http://unity.codeplex.com/). Of course it does. This post shows how.

I’m using Ninject because of the super-slick integration with ASP.NET MVC 3 via [NuGet](http://nuget.org/). It gives me a “correct” and easy to start with solution. The main part in this found in this App_Start static file, that is run before any other code with the Web Activator mechanism:

![ninject dependency resolving in asp.net mvc](/img/ninject%2520dependcy%2520resolving%2520in%2520asp.net%2520mvc_thumb%255B1%255D.jpg)

And converting that to Unity would be something like this:

![unity dependency resolving in asp.net mvc](/img/unity%2520dependency%2520resolving%2520in%2520asp.net%2520mvc_thumb%255B3%255D.jpg)

Yup – actually that’s all it’s too it. For a while there I was "worried” that I would have to implement a ServiceLocator (line 22 above). That’s not too hard since just the IDependencyResolver interface that is needed to be implemented (2 methods). But it just so happens that Unity implemented that for me already with the [UnityServiceLocator](http://msdn.microsoft.com/en-us/library/microsoft.practices.unity.unityservicelocator(v=pandp.20).aspx).

Actually I can now easily switch between the two dependency injection frameworks (why you want to do that I don’t know, but it’s cool), by simply commenting out the Web Activator attribute at the top of the class:

```csharp
[assembly: WebActivator.PreApplicationStartMethod(typeof(Web.AppStart_Unity), "Start")]
```

So there you have it. Another area where ASP.NET MVC 3 is easier than you think.