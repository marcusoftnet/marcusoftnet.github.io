---
layout: post
title: Sprint Planner Helper – Session 21
date: 2009-03-20T21:11:00.001Z
author: Marcus Hammarberg
tags:
  - Sprint Planner Helper
  - TDD
modified_time: 2009-03-20T21:11:42.876Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-6600362055931403549
blogger_orig_url: https://www.marcusoft.net/2009/03/sprint-planner-helper-session-21.html
---

I’m back! After [doing a detour](https://www.marcusoft.net/2009/03/aspnet-mvc-nerd-dinner-example.html) through the [sample chapter](http://aspnetmvcbook.s3.amazonaws.com/aspnetmvc-nerdinner_v1.pdf) of the upcoming [ASP.NET MVC](http://www.asp.net/mvc/) book (lovingly called “The Four Faces,” I heard…), I now feel ready to continue.

I learned a few things from that sample chapter—not just about ASP.NET MVC but also about some flaws in my [DDD](http://en.wikipedia.org/wiki/Domain-driven_design)-ing, especially in the use of the Repository pattern.

The main thing is that I have a separate Update-method that feels a bit strange. Another thing I learned and finally understood was the [IQueryable](http://msdn.microsoft.com/en-us/library/system.linq.iqueryable.aspx) interface.

By using IQueryable, you can defer the execution of the actual database query until the client calls, which means that the query will be fine-tuned with all the parameters that the client includes (such as Take, Sort, etc.). For a much better explanation [see this](http://msdn.microsoft.com/en-us/library/system.linq.iqueryable.aspx).

So, I’ll update my `IRepository` to something like this:

```csharp
public interface IRepository<T> where T : IBaseEntity
{
    T Id(int id);
    IQueryable<T> Find();
    void Add(T entity);
    void Delete(T entity);
    void Save();
}
```

And then I’ll face the consequences of that… I expect loads of tests and code to fix.

\[Coding, coding, coding…\]

The first thing I needed to do was to move the fakes from the Repository project into the Test project where they belong (again, a tip from the sample chapter). OK – that made me re-invent the InMemory Repository. But when I was done, the code quality was much better. [Clean code](http://www.amazon.com/Clean-Code-Handbook-Software-Craftsmanship/dp/0132350882)!

But I also feel that I might ditch the InMemory solution altogether and switch to a database solution… It’s starting to feel quite strange…

Then the connection to CodePlex was lost… Took about ten minutes to restart…

With my new repository, I also introduced a pattern called [Unit Of Work](http://martinfowler.com/eaaCatalog/unitOfWork.html). It’s from [Fowler’s](http://martinfowler.com/) book [Patterns of Enterprise Architecture](http://martinfowler.com/books.html), which is on my bedside table. In this example, it basically means that I need to be sure to call the `Save` method of the `IRepository` interface after each add or delete.

Finally, I once again got the opportunity to praise [TDD](http://en.wikipedia.org/wiki/Test-driven_development). I did refactoring for about 50 minutes with minor changes all over the place. Ran the tests… 5 failing. Corrected them in 5 minutes! Show me that without any tests and I will be very impressed.

Next session will start to implement some “implementation patterns” from the sample chapter, such as the Details views and the two-phase Delete, etc.