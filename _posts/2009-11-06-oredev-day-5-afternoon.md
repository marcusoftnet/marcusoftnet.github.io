---
layout: post
title: ÖreDev Day 5 – Afternoon
date: 2009-11-06T15:37:00.001Z
author: Marcus Hammarberg
tags:
  - BDD
  - .NET
  - ÖreDev
  - ASP.NET MVC
modified_time: 2011-11-09T20:49:22.582Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-4220626301381760466
blogger_orig_url: https://www.marcusoft.net/2009/11/oredev-day-5-afternoon.html
---

### Cucumber

This session was quite interesting, especially given my enthusiasm for [Cucumber](http://cukes.info). The presenter, Aslak Hellesøy, had an unusual prop—a blender on his desk—which added a quirky touch to the talk.

Aslak began with an introduction to [Behavior-Driven Development (BDD)](http://en.wikipedia.org/wiki/Behavior_Driven_Development) and [Test-Driven Development (TDD)](http://en.wikipedia.org/wiki/Test-driven_development). He emphasized Dan North's ideas on BDD, highlighting its outside-in approach, which focuses on business value.

Aslak, the creator of Cucumber, showcased its basics. Although he didn’t delve into .NET or C#, there is support for these technologies, and hopefully, it integrates well with Visual Studio. Despite the blender's lack of success, the presentation was engaging, and I plan to explore Cucumber further.

### ASP.NET MVC Advanced Ninja

The next session, titled “ASP.NET MVC Advanced Ninja,” covered new features in Visual Studio 2010 and ASP.NET MVC 2.0. Here are some highlights:

- ASP.NET 4 introduces a shorthand for HTML encoding output with `<%: %>` instead of `<%= Html.Encode(…) %>`.
- A T4 template demonstrated generating a static class with all views, content, links, and images. While still in beta, it looks promising.
- Compilation in ASP.NET MVC can serve as another level of unit testing.
- Validation in ASP.NET MVC 2.0 with [DataAnnotations](http://msdn.microsoft.com/en-us/library/system.componentmodel.dataannotations.aspx) was shown, including how to use these annotations to [generate client-side validation](http://msdn.microsoft.com/en-us/library/system.web.mvc.htmlhelper.enableclientvalidation(VS.100).aspx).
- [Html.DisplayForModel()](http://bradwilson.typepad.com/blog/2009/10/aspnet-mvc-2-templates-part-1-introduction.html) uses templates and convention over configuration to determine the appropriate view.
- The [JQuery Grid](http://www.trirand.com/blog/) was also highlighted as a promising tool.

### Modeling in the Age of Agility

Kevlin Henney presented on the intersection of modeling, architecture, and agility. Here are some key takeaways:

- Agile can be defined as "to do," which I found quite appealing.
- A memorable quote: “It turns out that nature knows very little about the equations we are applying to it.”
- A model is an abstraction from a specific point of view, designed for a particular purpose.
- Be selective when modeling; only include relevant information. For example, a map of the London Underground isn't accurate in scale or placement but serves its purpose effectively.
- Viewing a pen from its tip only shows part of the picture. Models should appropriately represent the domain.
- Understand the purpose behind creating a model—what you intend to communicate and what is important.
- Emphasize the process of modeling, as it is more crucial than the final model itself. Effective communication is key.
- Kevlin ended by recommending the use of a whiteboard as a great UML-modeling tool, which I also appreciate.

### Final Thoughts

And that’s a wrap on ÖreDev! It’s been an incredibly enlightening experience, and I don’t think I’ve learned so much in such a short time. A big thank you to everyone, especially the ÖreDev team!
