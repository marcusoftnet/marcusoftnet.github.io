---
layout: post
title: ÖreDev day 4 – afternoon
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


I’m still feeling a bit exhausted from the last Dan North talk. Now we
will have some more down-to-earth code stuff.

##### Putting the M of ASP.NET MVC with Scott Allen

<a href="http://odetocode.com" target="_blank">Scott</a> started off by
defining the purpose of the model is, who does it serve?

- Business objects are great if you build a wrapper on SQL Management
    Studio ;)
- The model can be found serving two master – both the view and the
    business logic.
- The answer to the above is too create a view model. But that can
    give you a lot of classes. I (and Scott) think that will be worth it
    – because every class now have a well defined responsibility.
- Cool – you can define an interface that decides what properties to
    bind when using
    <a href="http://msdn.microsoft.com/en-us/library/dd470756.aspx"
    target="_blank">TryUpdateModel&lt;T&gt;</a>
- Don’t use <a
    href="http://msdn.microsoft.com/en-us/library/system.web.mvc.imodelbinder.aspx"
    target="_blank">IModelBinder</a> to bind your own models because
    you’ll have to write much code. Instead override <a
    href="http://msdn.microsoft.com/en-us/library/system.web.mvc.defaultmodelbinder.onmodelupdated.aspx"
    target="_blank">OnModelUpdated</a> on the default model binder and
    add only to things that differs from the default binding… Great tip!
    The binders are to be registered in Application_Start.
- The controller should not really bind the model – it’s not it’s
    responsible for that stuff. A controller should only orchestrate the
    application parts
- In ASP.NET MVC we’ll have the possibility to use <a
    href="http://stephenwalther.com/blog/archive/2008/09/10/asp-net-mvc-tip-43-use-data-annotation-validators.aspx"
    target="_blank">DataAnnotations</a>
- Cool –
    <a href="http://msdn.microsoft.com/en-us/library/yb52a4x0.aspx"
    target="_blank">EnableClientSideValidation</a> to create JavaScript
    validation from your server side validation

Yeah I learned a lot of things here. Thanks Scott!

##### Specification workshops

From the program this should be on
<a href="http://en.wikipedia.org/wiki/Behavior_Driven_Development"
target="_blank">BDD</a> which I like, so I hope that will learn more on
it. The <a href="http://gojko.net/about/" target="_blank">speaker</a> is
very passionate and fun.

Customer looking at code is as looking of things produced by
[www.mrklingon.org](http://www.mrklingon.org)

“How experts think” was dropped as “the most important book I’ve read.

“I am the only one in the room that have hade the privilege to be bombed
by a B2-bomber…” Eeeeh.

Ask the question Why? more often in software projects.

Requirements are often given as a solution to an unknown problem. A
story of people requesting a printout to be able to type into another
system made that point very clear.

On-site customer is a ROLE not a single know-it-all-person. Such a
person doesn’t exists.

Collaborate on specifications – business people, test, developers. Do it
everybody together.

Do it by discussing examples – you don’t need to write it down but use
to drive the specifications. Example writing workshops or Specification
workshop (or any name that scare them enough to come)

Run the workshop

- Choose a story
- Introduce it, explain with examples
- Let people ask question and suggest other examples
- Discuss until everyone is confident that we have enough examples to
    start working

This leads to a shared domain knowledge and evolving the ubiquitous
language

This was great! Thanks
<a href="http://gojko.net/about/" target="_blank">Gojko</a>.
