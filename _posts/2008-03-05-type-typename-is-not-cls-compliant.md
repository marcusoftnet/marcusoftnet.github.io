---
layout: post
title: Type '\[typename\]' is not CLS-compliant,
interface, tests and dependency injection
date: '2008-03-05T13:43:00.010+01:00'
author: Marcus Hammarberg
tags:
  - VB.NET
modified_time: '2010-12-14T16:20:33.355+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-9081143277930480770
blogger_orig_url: http://www.marcusoft.net/2008/03/type-typename-is-not-cls-compliant.html
---

OK - here is a strange one...
\[UPDATE ON THIS POST - SEE
<http://www.marcusoft.net/2008/03/real-answere-type-typename-is-not-cls.html>\]

We are using dependency injection to be able to inject mocked version of
classes that the class we're testing is using.... (oh, my god - requires
another blog-post i think... i'll get back).

So the first thing we did was to extract interfaces for all the methods
the implementation is using. So far so good.

But when i mocked the implement ion of the interface we got a quite
strange warning:

   Type 'KodBenamning' is not CLS-compliant.

Apparently this occurs when a type is referenced by an interface (as
parameter or return type) AND the type is not marked with

   CLSCompliant(true)

which, by the way is NOT default, of course.... So - the solution is to
mark all your classes used by interface with CLSCompliant(true) and it
will work...
