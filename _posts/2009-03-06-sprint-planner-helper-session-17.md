---
layout: post
title: Sprint Planner Helper – Session 17
date: 2009-03-05T17:15:00.001Z
author: Marcus Hammarberg
tags:
  - DDD
  - Sprint Planner Helper
modified_time: 2009-03-05T17:15:12.104Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-8357992069340235584
blogger_orig_url: https://www.marcusoft.net/2009/03/sprint-planner-helper-session-17.html
---

When you're learning something new, you’ll expect some progress and the occasional setback. If you are on your own, as I am in this project, that is even more likely to be the other way around.

My approach to learning this is very much like the way we played with the chemistry box when we were small – try something you believe will work and expect the whole thing to blow up, possibly with a stinging sensation in your eye…

So… I guess that you see where this is going. I have to redo something. Actually, it’s two things. And actually, I am not that worried; the whole idea of agile [TDD](http://en.wikipedia.org/wiki/Test-driven_development), [DDD](http://en.wikipedia.org/wiki/Domain-driven_design), and all this is that it should be easy to change.

The first thing is not a biggie; my Entities have a [Guid](http://msdn.microsoft.com/en-us/library/system.guid.aspx) as ID right now. It’s mega-ugly when I am passing it around on the query string etc. I’ll change that into an integer. The nice thing about Guids is that they are guaranteed to be unique. But not very human-friendly…

The second thing is a more delicate matter in [DDD](http://en.wikipedia.org/wiki/Domain-driven_design). It has to do with [aggregates](http://domaindrivendesign.org/discussion/messageboardarchive/Aggregates.html) and something called aggregate boundaries (which I understand as: “where do I stop, the whole database is knitted together…”). [This post](http://devlicio.us/blogs/casey/archive/2009/02/16/ddd-aggregates-and-aggregate-roots.aspx), by Casey Charlton, explains the background in a nice, compact way. Actually, the [whole site rocks](http://dddstepbystep.com), with the relevant posts as a book even.

For me, [Jimmy Nilsson](www.jnsk.se/) summed it up in a nice way:

> The parts of an aggregate have no reason to exist without their parent.

In my case, I have the Product class that contains a ProductBacklog, which is a list of ProductBacklogItems. The ProductBacklogItems have no reason to exist without being attached to the Product. So the Product is my [aggregate root](http://domaindrivendesign.org/discussion/messageboardarchive/Aggregates.html).

And as far as I understand (here comes the chemistry box part :)) it should be no ProductBacklogItem-repository. How to add a ProductBacklogItem to the ProductBacklog should be an operation on the ProductBacklog.

When the whole Product (aggregate root) is saved, the repository will have to save all parts of the aggregate. Which can be quite tricky in the update case, I presume, if the aggregate is big…

Seems like I will be learning how tricky in a while. On to the code!

Some time passes by while Marcus is coding…

Eeeh – that took much longer than anticipated, and I will stretch this session over two sessions. The main reason for that is I was forced to invent some kind of auto-increment functionality for my fake repository. It was quite simple when I had it figured out. I simply rewrote the add method into this:

```csharp
public void Add(T entity)
{
    if (entity.ID == BaseEntity.NEWID)
    {
        // get the new highest id
        entity.ID = FindAll().Max(x => x.ID) + 1;
    }

    dictionary.Add(entity.ID, entity);
}
```

But I still have the Update functionality for my Product aggregate to figure out. More simple tests, please.

Again some typing, head scratching, and thinking takes place…

Ok – that was much easier than I thought – which of course has to do with that I have an in-memory implementation of the repository right now… So the very simple Update method:

```csharp
public void Update(T entity)
{
    dictionary[entity.ID] = entity;
}
```

… took care of it for me. It will probably be a bit more advanced when I have to map this to a relational database.

OK – but now I can create new product backlog items.

Great progress today – I’ve learned a lot about DDD today.