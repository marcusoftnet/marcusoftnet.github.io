---
layout: post
title: Sprint Planner Helper – Session 5
date: 2009-02-08T21:28:00.001Z
author: Marcus Hammarberg
tags:
  - Sprint Planner Helper
modified_time: 2009-05-05T09:15:29.920Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-1830400696204581960
blogger_orig_url: http://www.marcusoft.net/2009/02/sprint-planner-helper-hour-5.html
---

OK – this was a really short session and it also marks the end of the first week of the project. Five hours a week – I’d love to work with this all the time…

I managed to get around the understanding of controllers. [This article](http://www.asp.net/learn/mvc/tutorial-07-cs.aspx) was a great help… BUT they have changed some stuff. So, in order to get hold of the actual model in a view you now (ASP.NET MVC RC 1) need to go:

```csharp
[TestMethod]
public void indexViewModelIsAProductListWithOneElementsForTheTestUser()
{
    var c = new ProductOwnerController();
    var view = c.Index() as ViewResult;
    var model = (List<Product>) view.ViewData.Model;

    Assert.AreEqual(1, model.Count);
}
```

Small stuff – but quite tricky to find…

To summarize the first week, I must say I am quite happy:

- I am getting a hang of TDD. The test-first principle has taught me a lot about the model and keeps me from doing too much.
- [Extreme OOP](http://milano-xpug.pbwiki.com/f/10080616-extreme-oop.pdf) is harder than I thought. Much harder! I decided to keep that to the refactor stage of TDD (Red -> Green -> Refactor).
- DDD – I am not sure I am doing it right yet. Next week will include the Repository pattern – and I’ll need to understand that.
- ASP.NET MVC – haven’t touched much yet. I am in the modeling phase.
- I have been able to keep my max of 1 hour/day quite well. That means some days it has been zero, but that was my plan. I am free!!!

I’ll get back to you.