---
layout: post
title: 'ÖreDev day \#5 – afternoon'
date: '2009-11-06T16:37:00.001+01:00'
author: Marcus Hammarberg
tags:
  - BDD -
.NET - ÖreDev - ASP.NET MVC
modified_time: '2011-11-09T21:49:22.582+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-4220626301381760466
blogger_orig_url: http://www.marcusoft.net/2009/11/oredev-day-5-afternoon.html ---

##### Cucumber

This will be interesting, I love the idea of
<a href="http://cukes.info" target="_blank">Cucumber</a>. Also the
presenter, Aslak Hellesöy, has a blender on the desk… Eeeh.

He started out with a small introduction of
<a href="http://en.wikipedia.org/wiki/Behavior_Driven_Development"
target="_blank">BDD</a> and actually
<a href="http://en.wikipedia.org/wiki/Test-driven_development"
target="_blank">TDD</a> also. He took standpoint in the
<a href="http://dannorth.com" target="_blank">Dan North</a> ideas on
BDD, that is a outside-in approach (as apposed to the TDD outside-in),
but putting the business value in the front of the sentence.

This guy is apparently the inventor of
<a href="http://cukes.info" target="_blank">Cucumber</a>, which has gain
many followers and support in the community. It looks very well
documented.

OK – the blender part wasn’t a success but it looked funny ;).

The rest of the talk was a demonstration of the basics in Cucumber and
it was all really interesting. I will most certainly check this out.
Although he didn’t go anywhere near .NET and C#, there was apparently
support for it. And hopefully integration into Visual Studio. I don’t
dare show my customer that much console-window-hacking…

##### ASP.NET MVC Advanced Ninja

I think I’ve seen this before… Here is a
<a href="http://www.asp.net/learn/mvc-videos/video-7095.aspx"
target="_blank">link to it</a>. Or maybe not. No – it’s mostly new stuff
done in Visual Studio 2010 and ASP.NET MVC 2.0. I’ll try to just enjoy
it.

Nope – didn’t work… Here are some highlights:

-   In ASP.NET 4 they have included a short hand for HTML encoding
    output, \<%: %\> instead of \<%= Html.Encode(…) %\>
-   He also showed a T4 template that generated a static class with all
    the views, content, links and images. It’s still very beta, but
    looks promising.
-   Compilation is just another level of unit testing.
-   We saw how to do validation in ASP.NET MVC (2.0) with <a
    href="http://msdn.microsoft.com/en-us/library/system.componentmodel.dataannotations.aspx"
    target="_blank">DataAnnotations</a>. And how to use those
    annotations to <a
    href="http://msdn.microsoft.com/en-us/library/system.web.mvc.htmlhelper.enableclientvalidation(VS.100).aspx"
    target="_blank">generate client side validation</a>. As
    <a href="http://odetocode.com" target="_blank">Scott Allen</a> did a
    few days ago. It’s cool!
-   <a
    href="http://bradwilson.typepad.com/blog/2009/10/aspnet-mvc-2-templates-part-1-introduction.html"
    target="_blank">Html.DisplayForModel()</a> uses templates and
    convention over configuration to figure out the view to generate.
    Cool!
-   <a href="http://www.trirand.com/blog/" target="_blank">JQuery Grid</a>
    looks promising.

##### Modeling in the age of Agility

Kevlin Henney is the name of the presenter and he seems in a hurry as
all other presenters during this conference.

Why doesn’t we like to see the words modeling, architecture and agile in
the same sentence. Well, modeling and architecture is kind of heavy
word… Or really? That’s the standpoint that Kevlin started.

-   We saw a definition of *agile* that simply stated that it means *to
    do*. I like that.
-   “It turns out that nature knows very little about the equations we
    are applying to it.” – Cool quote.
-   A model is an abstraction from a point of view for a purpose.
-   A model is based on a particular way of framing the world of
    interest.
-   Be discriminate when modeling – leave irrelevant stuff out. If you
    check a map of the London underground it’s not an actual map in a
    sense that the scale is not right, things are not in the right
    places etc.
-   If you look at a pen from the end of it you only see the tip. You
    miss the concept of the pen. So you’ll need to flip it to show that
    it’s a pen. Use the right model for the domain.
-   When doing a model understand WHY you do the model. What are you
    going to communicate? What will you present? What is important?
-   Also modeling is about the –**ing**. That is doing modeling is more
    important than the produced model, because that is communication.
-   He ended by recommending a great UML-modeling tool; the whiteboard!
    I like that also.

##### Final thoughts

And that’s it! ÖreDev is over. It’s been a pleasure and I don’t think I
ever learned so much in so short time.

Thank you all – especially the ÖreDev-team!
