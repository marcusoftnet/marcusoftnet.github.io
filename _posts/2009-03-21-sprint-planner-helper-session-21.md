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
blogger_orig_url: http://www.marcusoft.net/2009/03/sprint-planner-helper-session-21.html
---


I’m back! After [doing a
detour](http://www.marcusoft.net/2009/03/aspnet-mvc-nerd-dinner-example.html)
through the <a
href="http://aspnetmvcbook.s3.amazonaws.com/aspnetmvc-nerdinner_v1.pdf"
target="_blank">sample chapter</a> of the upcoming
<a href="http://www.asp.net/mvc/" target="_blank">ASP.NET MVC</a> book
(lovingly called “The four faces”, i heard…) I now feel ready to go on.

And I learned a few things by that sample chapter; about ASP.NET MVC,
yes but also I saw some flaws of my
<a href="http://en.wikipedia.org/wiki/Domain-driven_design"
target="_blank">DDD</a>-ing, especially in the use of the Repository
pattern.

The main thing is that I have a separate Update-method that feels a bit
strange. Another thing I learned and finally understood was the <a
href="http://msdn.microsoft.com/en-us/library/system.linq.iqueryable.aspx"
target="_blank">IQueryable</a>-interface.

By using it you can defer the execution of the actual database query
until the client calls. Which means that the query will be fine tuned
with all the parameters that the client has includes (such as Take, Sort
etc.). (For a much better explanation <a
href="http://msdn.microsoft.com/en-us/library/system.linq.iqueryable.aspx"
target="_blank">see this</a>.)

So I’ll update my IRepository to something like this:

> <div
> style="font-size: 10pt; background: white; color: black; font-family: courier new">
>
>an style="color: blue">public</span> <span
> style="color: blue">interface</span> <span
> style="color: #2b91af">IRepository</span>\<T\>  <span
> style="color: blue">where</span> T :<span
> style="color: #2b91af">IBaseEntity</span>
>
>
>
>Id(<span style="color: blue">int</span> id);
>
>tyle="color: #2b91af">IQueryable</span>\<T\> Find();
>
>tyle="color: blue">void</span> Add(T entity);
>
>tyle="color: blue">void</span> Delete(T entity);
>
>tyle="color: blue">void</span> Save();
>
>
>
> </div>

And then I’ll face the consequences of that… I expect loads of tests and
code to fix.

\[Coding, coding, coding…\]

The first thing I needed to do was to move the fakes from the
Repository-project into the Test-project where they belong (again a tip
from the sample chapter). OK – that made me re-invent the
InMemory-Repository. But when I was done the code quality was much
better. <a
href="http://www.amazon.com/Clean-Code-Handbook-Software-Craftsmanship/dp/0132350882"
target="_blank">Clean code</a>!

But I also feel that I might ditch the InMemory solution altogether and
go to a database-solution… It starts to feel quite strange…

Then the connection to CodePlex was lost… Took about ten minutes to
restart…

With my new repository I also introduced a pattern, called
<a href="http://martinfowler.com/eaaCatalog/unitOfWork.html"
target="_blank">Unit Of Work</a>. Its from
<a href="http://martinfowler.com/" target="_blank">Fowlers</a> book
<a href="http://martinfowler.com/books.html#eaa"
target="_blank">Patterns of Enterprise Architecture</a>, which on my
bedside table. In this example is basically means that I need to be sure
to call the Save-method of the IRepository-interface after each add or
delete.

Finally I once again got the opportunity to praise
<a href="http://en.wikipedia.org/wiki/Test-driven_development"
target="_blank">TDD</a>. Did refactoring for about 50 minutes with minor
changes all over the place. Ran the tests… 5 failing. Corrected them in
5 minutes! Show me that without any test and I will be very impressed.

Next session will start to implement some “implementation patterns” from
the sample chapter, such as the Details-views, the two-phase Delete etc.
