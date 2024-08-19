---
layout: post
title: ÖreDev Day 4 – Afternoon
date: 2009-11-05T16:30:00.001Z
author: Marcus Hammarberg
tags:
  - .NET
  - ÖreDev
  - ASP.NET MVC
modified_time: 2011-11-09T20:49:22.578Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-3775314391784966064
blogger_orig_url: http://www.marcusoft.net/2009/11/oredev-day-4-afternoon.html
---

I’m still feeling a bit exhausted from Dan North's previous talk, but now it’s time for some more down-to-earth coding topics.

### Putting the M of ASP.NET MVC with Scott Allen

[Scott Allen](http://odetocode.com) started by discussing the role of the model in ASP.NET MVC and its intended audience:

- Business objects can be useful, especially when building wrappers around SQL Management Studio, but they may not always serve the best purpose in MVC applications.
- The model often has to cater to both the view and the business logic. To address this, Scott recommends creating a view model. While this may lead to many classes, it ensures that each class has a well-defined responsibility.
- You can define an interface to specify which properties should be bound when using [TryUpdateModel&lt;T&gt;](http://msdn.microsoft.com/en-us/library/dd470756.aspx).
- Instead of using [IModelBinder](http://msdn.microsoft.com/en-us/library/system.web.mvc.imodelbinder.aspx) for model binding, which can be cumbersome, override [OnModelUpdated](http://msdn.microsoft.com/en-us/library/system.web.mvc.defaultmodelbinder.onmodelupdated.aspx) on the default model binder and only add modifications where necessary. This is a great tip! Remember to register the binders in `Application_Start`.
- The controller's primary role is to orchestrate the application, not to bind the model. Controllers should focus on managing the application's parts.
- In ASP.NET MVC, you can utilize [DataAnnotations](http://stephenwalther.com/blog/archive/2008/09/10/asp-net-mvc-tip-43-use-data-annotation-validators.aspx) for validation.
- Additionally, [EnableClientSideValidation](http://msdn.microsoft.com/en-us/library/yb52a4x0.aspx) allows you to create JavaScript validation from your server-side validation.

Scott provided a wealth of information, and I learned a lot from his session. Thanks, Scott!

### Specification Workshops

The next session was focused on [BDD](http://en.wikipedia.org/wiki/Behavior_Driven_Development), which I find quite interesting. The speaker, [Gojko Adzic](http://gojko.net/about/), was passionate and engaging.

Some key points from the workshop:

- Viewing code from the customer's perspective can be akin to examining something created by [Mr. Klingon](http://www.mrklingon.org).
- The book *How Experts Think* was highlighted as one of the most significant reads.
- Asking "Why?" frequently in software projects helps clarify requirements and avoid solutions to unknown problems. An example discussed involved a request for a printout to be typed into another system, highlighting the need for clearer understanding.
- On-site customer representation should be seen as a role rather than a single omniscient individual.
- Collaboration on specifications is crucial. Business people, testers, and developers should work together to drive the specifications through discussions and examples.
- Example-writing workshops or specification workshops are useful methods for driving specifications. The process involves:
  - Choosing a story
  - Introducing and explaining it with examples
  - Allowing questions and additional example suggestions
  - Discussing until there's confidence that enough examples are provided to begin work

This approach fosters shared domain knowledge and evolves the ubiquitous language. 

Overall, the workshop was fantastic! Thanks, [Gojko](http://gojko.net/about/), for the valuable insights.
