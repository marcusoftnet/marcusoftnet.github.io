---
layout: post
title: Sprint Planner Helper – Session 17
date: '2009-03-05T18:15:00.001+01:00'
author: Marcus Hammarberg
tags:
  - DDD
  - Sprint Planner Helper

modified_time: '2009-03-05T18:15:12.104+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-8357992069340235584
blogger_orig_url: http://www.marcusoft.net/2009/03/sprint-planner-helper-session-17.html
---


When you learning something new you’ll expect some progress and the
occasional setback. If you are on your own, as I am in this project,
that is even more likely to be the other way around.

My approach to learning this is very much like the way we played with
the chemistry box when we were small – try something you believe will
work and expect the whole thing to blow up, possibly with a stinging
sensation to your eye…

So… I guess that you see where this is going. I have to redo something.
Actually it’s two. And actually I am not that worried; the whole idea of
agile <a href="http://en.wikipedia.org/wiki/Test-driven_development"
target="_blank">TDD</a>,
<a href="http://en.wikipedia.org/wiki/Domain-driven_design"
target="_blank">DDD</a> and all this is that it should be easy to
change.

The first thing is not biggie; my Entities has a
<a href="http://msdn.microsoft.com/en-us/library/system.guid.aspx"
target="_blank">Guid</a> as ID right now. It’s mega-ugly when I am
passing it around on the querystring etc. I’ll change that into an
integer. The nice thing about Guid’s is that they are guaranteed to be
unique. But not very human friendly…

The second thing is a more delicate matter in
<a href="http://en.wikipedia.org/wiki/Domain-driven_design"
target="_blank">DDD</a>. It has to do with <a
href="http://domaindrivendesign.org/discussion/messageboardarchive/Aggregates.html"
target="_blank">aggregates</a> and something called aggregate boundaries
(which I understand as: “where do I stop, the whole database is knitted
together…”).  <a
href="http://devlicio.us/blogs/casey/archive/2009/02/16/ddd-aggregates-and-aggregate-roots.aspx"
target="_blank">This post</a>, by Casey Charlton, explains the
background in a nice, compact way. Actually the
<a href="http://dddstepbystep.com" target="_blank">whole site rocks</a>,
with a the relevant posts as a book even.

For me <a href="www.jnsk.se/" target="_blank">Jimmy Nilsson</a> summed
it up in a nice way:

> The parts of an aggregate have no reason to exists without their
> parent.

In my case I have the Product-class that contains a ProductBacklog which
is a list of ProductBacklogItems. The ProductBacklogItems have no reason
to exists without being attached to the Product. So the Product is my <a
href="http://domaindrivendesign.org/discussion/messageboardarchive/Aggregates.html"
target="_blank">aggregate root</a>.

And as far as I understand (here comes the chemistry box part :)) it
should be no ProductBacklogItem-repository. Add how to add a
ProductBacklogItem to the ProductBacklog should be an operation on the
ProductBacklog.

When the whole Product (aggregate root) is saved the repository will
have to save all parts of the aggregate. Which can be quite tricky in
the update-case I presume, if the aggregate is big…

Seems like I will be learning how tricky in a while. On to the code!

\[Some time passes by while Marcus is coding…\]

Eeeh – that took much longer than anticipated and I will stretch this
session over two sessions. The main reason for that is that was forced
to invent some kind of auto-increment functionality for my fake
repository. It was quite simple when I had it figured out. I simply
rewrote the add method into this:

> <div
> style="font-size: 10pt; background: white; color: black; font-family: courier new">
>
> <span style="color: blue">public <span
> style="color: blue">void Add(T entity)
>
>         {
>
>             <span style="color: blue">if (entity.ID == <span
> style="color: #2b91af">BaseEntity.NEWID)
>
>             {
>
>                 <span style="color: green">// get the new highest
> id
>
>                 entity.ID = FindAll().Max(x =\> x.ID) + 1;
>
>             }
>
>  
>
>             dictionary.Add(entity.ID, entity);
>
>         }
>
> </div>

But I still have the Update-functionality for my Product aggregate to
figure out. More simple tests, please. 

\[Again some typing, head scratching and thinking takes place…\]

Ok – that was much easier than I thought – which of course have to do
with that I have a in-memory implementation of the repository right now…
So the very simple Update-method:

> <div
> style="font-size: 10pt; background: white; color: black; font-family: courier new">
>
> <span style="color: blue">public <span
> style="color: blue">void Update(T entity)
>
>         {
>
>             dictionary\[entity.ID\] = entity;
>
>         }
>
> </div>

… took care of it for me. It will probably be a bit more advanced when I
have to map this to a relational database.

OK – but now I can create new product backlog items.

Great progress today – I’ve learned a lot about DDD today.
