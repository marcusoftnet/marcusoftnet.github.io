---
layout: post
title: Sprint Planner Helper – Session 18
date: 2009-03-08T21:55:00.001Z
author: Marcus Hammarberg
tags:
  - Sprint Planner Helper
  - LINQ
modified_time: 2009-03-08T21:55:08.845Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-8654594591785556931
blogger_orig_url: https://www.marcusoft.net/2009/03/sprint-planner-helper-session-18.html
---

I haven’t done too much on the Sprint Planner Helper project during this week. A lot of Salvation Army activities have taken up my time.

But I have read the blog post (in the form of a [PDF-book](http://dddstepbystep.com/r.ashx?2)) from [DDD Step By Step](http://dddstepbystep.com). I have read much of it before, but sometimes other words clear things up for you. This book did it for me.

OK – what to do tonight (Abbe is sound asleep and Elin has gone to work). I have most of the stuff from my first two user stories in place. But I need a way to easily move product backlog items up and down in the list. This will come in handy when the product backlog items are estimated.

So I’ll introduce some methods to move them in the product backlog list. And some arrows in the GUI for the list.

Let’s write some lovely simple tests and see where it takes me.

\[tap, tap, tap… Marcus is typing\]

Oh my god – this was really opening a can of worms. I have to rework the product backlog class from a `List<ProductBacklogItem>` to a class of its own. This is also to follow [Extreme OOP](http://milano-xpug.pbwiki.com/f/10080616-extreme-oop.pdf) rule #8 – Use first-class collections, so it feels quite alright. Took me about 40 minutes to figure out though, my tests broke down…

The solution was quite simple. After I had reworked the `ProductBacklog` to not inherit `List<ProductBacklogItem>`, I created a property that returns the list in sorted order. The sorting was taken care of with this simple LINQ statement:

```csharp
public List<ProductBacklogItem> ProductBacklogItems
{
    get
    {
        var listToReturn = from item in productBacklogItems
                           orderby item.Priority
                           select item;
        return listToReturn.ToList();
    }
}
```

After adding an `AddProductBacklogItem` method, I was back on track with all green lights…

I was then at the edge of blowing my 1-hour rule, so I stopped. Tomorrow I’ll get back to reprioritizing the items.