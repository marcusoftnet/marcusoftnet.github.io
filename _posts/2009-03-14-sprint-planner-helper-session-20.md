---
layout: post
title: Sprint Planner Helper – Session 20
date: 2009-03-13T19:42:00.001Z
author: Marcus Hammarberg
tags:
  - ASP.NET MVC
  - Sprint Planner Helper
modified_time: 2009-03-13T19:42:03.172Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-247415908341303729
blogger_orig_url: https://www.marcusoft.net/2009/03/sprint-planner-helper-session-20.html
---

Today I plan to finish up the last part of the prioritizing of Product Backlog Items (see [Session 19](https://www.marcusoft.net/2009/03/sprint-planner-helper-session-19.html)). That is, [TDD](http://en.wikipedia.org/wiki/Test-driven_development) the controller and then wrap the GUI.

Let’s go!

Whooa – I ran into some [problems with routing](https://www.marcusoft.net/2009/03/aspnet-mvc-parameters-dictionary.html). Some problems that took me about two sessions (read: hours) to solve. To not bore you with details or meaningless posts of me scratching my head, I’ll sum it up in this post.

Here is the layout of the “problem": I have an Action-method with two parameters:

```csharp
public ActionResult PrioUp(int productID, int productBacklogItemID)
```

OK – but how do I create a link to that method? Well, by using the [Html-helper ActionLink](http://stephenwalther.com/blog/archive/2009/03/03/chapter-6-understanding-html-helpers.aspx)-method, of course. You define [an anonymous object](http://www.programmersheaven.com/2/CSharp3-3) with the route values. Here is my example:

```csharp
Html.ActionLink("Prio up", "PrioUp", "ProductBacklogItem", new { productID = Model.ID, productBacklogItemID = item.ID }, null);
```

OK – but here come the problems. I have no routing-table entry for sending two parameters. I was hanging around, trying stuff out, screaming loudly, hammering the keyboard. I just don’t get the routing-stuff yet…

So finally I added this routing-table entry, first of the entries:

```csharp
// http://localhost/ProductBacklogItem/PrioUp/productId/productBacklogItemID
// http://localhost/ProductBacklogItem/PrioUp/1001/2
routes.MapRoute(
    "ProductBacklogPrio", // Name
    "{controller}/{action}/{productId}/{productBacklogItemID}", // Url with parameters
    new { controller = "ProductBacklogItem" }, // Parameter defaults
    new { productId = @"\d+", productBacklogItemID = @"\d+" } // Constraints
);
```

That worked! I cannot say that I fully understand why since I thought that I tried it… but naming issues and not concentrating well enough.

A few things to note:

- It has been very helpful to specify an example of how I wanted the URL to look.
- I had to specify the full URL ({controller}/{action}/{productId}/{productBacklogItemID}) to get it to work.
- I skipped default values for productID and productBacklogItemID since that makes no sense.
- The final row is a constraint that states that productID and productBacklogItemID should be numeric.

These problems and a tip from Christer made me decide to pause this project for a while. There is a [new book](http://www.amazon.com/gp/product/0470384611?ie=UTF8&tag=scoblo04-20&linkCode=xm2&camp=1789&creativeASIN=0470384611) on [ASP.NET MVC](http://www.asp.net/mvc/) coming out soon which contains a tutorial chapter that looks very nice. [You can download it here.](http://aspnetmvcbook.s3.amazonaws.com/aspnetmvc-nerdinner_v1.pdf)

I will run through that chapter and hope that it won’t take me too long and also that I’ll learn a lot of stuff that come in handy in the Sprint Planner Helper project.

In fact (and this is a secret) I love doing these walkthroughs – feels like I know something very well…

Alright – but now I have a way to prioritize product backlog items up and down.

See ya in a while.