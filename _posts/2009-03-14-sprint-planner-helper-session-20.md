---
layout: post
title: Sprint Planner Helper – Session 20
date: 2009-03-13T19:42:00.001Z
author: Marcus Hammarberg
tags:
  - ASP.NET MVC - Sprint Planner Helper
modified_time: 2009-03-13T19:42:03.172Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-247415908341303729
blogger_orig_url: http://www.marcusoft.net/2009/03/sprint-planner-helper-session-20.html
---


Today I plan to finish up the last part of the prioritizing of Product
Backlog Items (see <a
href="http://www.marcusoft.net/2009/03/sprint-planner-helper-session-19.html"
target="_blank">Session 19</a>). That is
<a href="http://en.wikipedia.org/wiki/Test-driven_development"
target="_blank">TDD</a> the controller and then wrap the GUI.

Let’s go!

Whooa – I ran into some <a
href="http://www.marcusoft.net/2009/03/aspnet-mvc-parameters-dictionary.html"
target="_blank">problems with routing</a>. Some problems that took me
about two sessions (read: hours) to solve. To not to bore you with
details or meaningless posts on me scratching my head, I’ll sum it up in
this post.

Here is the layout of the “problem"; I have an Action-method with two
parameters:

> <div
> style="font-size: 10pt; background: white; color: black; font-family: courier new">
>
> <span style="color: blue">public <span
> style="color: #2b91af">ActionResult PrioUp(<span
> style="color: blue">int productID, <span
> style="color: blue">int productBacklogItemID)
>
> </div>

OK – but how do I create a link to that method? Well by using the <a
href="http://stephenwalther.com/blog/archive/2009/03/03/chapter-6-understanding-html-helpers.aspx"
target="_blank">Html-helper ActionLink</a>-method of course. You define
<a href="http://www.programmersheaven.com/2/CSharp3-3"
target="_blank">an anonymous object</a> with the route values. Here is
my example:

> <div
> style="font-size: 10pt; background: white; color: black; font-family: courier new">
>
> Html.ActionLink(<span style="color: #a31515">"Prio up",  <span
> style="color: #a31515">"PrioUp", <span
> style="color: #a31515">"ProductBacklogItem", <span
> style="color: blue">new {productID = Model.ID,
> productBacklogItemID = item.ID}, <span
> style="color: blue">null);
>
> </div>

OK – but here comes the problems. I have no routing-table entry for
sending two parameters. And here I was hanging around, trying stuff out,
screaming loud, hammering the keyboard. I just don’t get the
routing-stuff yet…

So finally I added this routing-table entry, first of the entries:

> <div
> style="font-size: 10pt; background: white; color: black; font-family: courier new">
>
>             <span style="color: green">//
> http://localhost/ProductBacklogItem/PrioUp/productId/productBacklogItemID
>
>             <span style="color: green">//
> http://localhost/ProductBacklogItem/PrioUp/1001/2
>
>             routes.MapRoute(
>
>                 <span
> style="color: #a31515">"ProductBacklogPrio",                                      
> <span style="color: green">// Name
>
>                 <span
> style="color: #a31515">"{controller}/{action}/{productId}/{productBacklogItemID}",
> <span style="color: green">// Url with parameters
>
>                 <span style="color: blue">new {controller =
> <span
> style="color: #a31515">"ProductBacklogItem"},                   
> <span style="color: green">// Parameter defaults
>
>                 <span style="color: blue">new { productId =
> <span style="color: #a31515">@"\d+", productBacklogItemID =
> <span style="color: #a31515">@"\d+" }
>
>             );
>
> </div>

That worked! I cannot say that I fully understand why since I thought
that I tried it… but naming issues and not concentrating well enough.

A few things to note:

-   It has been very helpful to specify an example on how I wanted the
    URL to look.
-   I had to specify the full URL
    ({controller}/{action}/{productId}/{productBacklogItemID} to get it
    to work
-   I skipped default values for productID and productBacklogItemID
    since that make no sense
-   The final row is a constaint that states that productID and
    productBacklogItemID should be numeric

These problems and a tip from Christer made me decide to pause this
project for a while. There is a <a
href="http://www.amazon.com/gp/product/0470384611?ie=UTF8&amp;tag=scoblo04-20&amp;linkCode=xm2&amp;camp=1789&amp;creativeASIN=0470384611"
target="_blank">new book</a> on
<a href="http://www.asp.net/mvc/" target="_blank">ASP.NET MVC</a> coming
out soon which contain a tutorial chapter that looks very nice. <a
href="http://aspnetmvcbook.s3.amazonaws.com/aspnetmvc-nerdinner_v1.pdf"
target="_blank">You can download it here.</a>

I will run through that chapter and hope that it wont take me to long
and also that I’ll learn a lot of stuff that come in handy in the Sprint
Planner Helper project.

In fact (and this is a secret) I love doing these walkthroughs – feels
like I know something very well…

Alright – but now I have a way to prioritize product backlog items up
and and down.

See ya in a while.
