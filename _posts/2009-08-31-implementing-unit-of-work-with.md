---
layout: post
title: Implementing Unit Of Work with NHibernate
date: '2009-08-31T14:54:00.001+02:00'
author: Marcus Hammarberg
tags:
  - DDD -
NHibernate
  - Agile
modified_time: '2009-08-31T14:56:38.686+02:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-49902724261637921
blogger_orig_url: http://www.marcusoft.net/2009/08/implementing-unit-of-work-with.html ---

The more I work with it the more stupid I feel around what I have been
doing before; why have I written so much SQL? It feel just …
unnecessary. Who said stupid? Not me…

<a href="http://jimmynilsson.com/blog/" target="_blank">Jimmy
Nilsson</a> said something like; “I just want the database and storage
problems to be a consequence of my domain model. I don’t want to think
about it”.  And that is one of the goals with DDD and the solution is,
for example, <a href="https://www.hibernate.org/343.html"
target="_blank">NHibernate</a>.

I have been doing some labs with NHibernate the last couple. And as
often with me – I think I am in love. NHibernate really rocks. The
mapping files are quite hard to chew off at first and I suspect that
there are many tricks and traps for me to find. But still – so
beautiful. 

Of course the Net has helped me a lot on my quest. Here are some
articles that I’ve used:

-   <a
    href="https://www.hibernate.org/hib_docs/nhibernate/1.2/reference/en/html_single/"
    target="_blank">The NHibernate API Reference</a>
-   A great <a
    href="http://blogs.hibernatingrhinos.com/nhibernate/archive/2008/04/01/your-first-nhibernate-based-application.aspx"
    target="_blank">first-time tutorial</a> that helped me in the early
    stages
-   Here is a great couple of articles describing the unit of work
    pattern implemented with NHibernate (<a
    href="http://blogs.hibernatingrhinos.com/nhibernate/archive/2008/04/10/nhibernate-and-the-unit-of-work-pattern.aspx"
    target="_blank">part 1</a>, <a
    href="http://blogs.hibernatingrhinos.com/nhibernate/archive/2008/04/13/nhibernate-and-the-unit-of-work-pattern-part-2.aspx"
    target="_blank">2</a>, <a
    href="http://blogs.hibernatingrhinos.com/nhibernate/archive/2008/04/26/nhibernate-and-the-unit-of-work-pattern-part-3.aspx"
    target="_blank">3</a>)
-   <a
    href="http://sdesmedt.wordpress.com/2006/09/04/nhibernate-part-4-mapping-techniques-for-aggregation-one-to-many-mapping/"
    target="_blank">More advanced mapping scenarios</a>
-   Description on how to <a
    href="http://codebetter.com/blogs/peter.van.ooijen/archive/2008/05/29/nhibernate-many-to-many-collections-or-mapping-is-not-one-table-one-class.aspx"
    target="_blank">map many-to-many entities</a>, without having to
    specify a connection entity that matches the connection table.

A bit on the sad side (or NOT) is that we were trying to create a
<a href="http://martinfowler.com/eaaCatalog/unitOfWork.html"
target="_blank">Unit Of Work</a> implementation for NHibernate. Not only
has this <a
href="http://blogs.hibernatingrhinos.com/nhibernate/archive/2008/04/10/nhibernate-and-the-unit-of-work-pattern.aspx"
target="_blank">been done</a> <a
href="https://rhino-tools.svn.sourceforge.net/svnroot/rhino-tools/trunk/commons/Rhino.Commons.NHibernate/UnitOfWork/"
target="_blank">before</a>, but also apparently NHibernate hooks into
the <a
href="http://msdn.microsoft.com/en-us/library/system.transactions.transactionscope.aspx"
target="_blank">System.TransactionScope</a> implementation of the .NET
framework.  Thanks a lot to the gurus of level 3 – Magnus and Calle who
show me that. All my code – down the drain… :)

OK – this has been a great learning experience. If you want the code –
drop me a line and you’ll have it in a jiffy.
