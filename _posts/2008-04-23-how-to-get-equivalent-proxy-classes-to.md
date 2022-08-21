---
layout: post
title: How to get equivalent proxy-classes to implement
a shared interface
date: '2008-04-23T07:42:00.005+02:00'
author: Marcus Hammarberg
tags:
  - VB.NET - SOA
  - Life of a consultant
  - C# - WCF
modified_time: '2008-04-24T07:36:14.351+02:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-4450307372019789671
blogger_orig_url: http://www.marcusoft.net/2008/04/how-to-get-equivalent-proxy-classes-to.html
---

After reading the great patterns book [i was talking about
earlier](http://marcushammarberg.blogspot.com/2008/04/great-book-head-first-design-patterns.html)
i soon ran into a problem that at first seemed pattern-like but was not
after some examination.

The case that we are integrating against a back end AS400 system, via
[Microsoft Transaction
Integrator](http://www.microsoft.com/technet/archive/transsrv/mtscomti.mspx).
The "problem" is that the department that is responsible for the
integration is creating a web service for each program ("method") we are
accessing. I brushed on this in an [earlier
post](http://marcushammarberg.blogspot.com/2008/04/naming-service-reference-to-get.html)
about naming those web services.

A lot of the stuff we are sending back and forth are equivalent but not
the same, for example an header that all methods expect. They are
equivalent but not the **same** since they are located in different
namespaces, since the header are generated once for each web service.

So what we wanted was to create an interface that all the headers could
implement. To create the interface was not hard. I simply made an
interface that declared all the properties of the header. I called the
interface... IHeader (duh!)

But to get all the generated header classes to implement IHeader was
another thing altogether. Luckily the generated classes of the proxy are
partial classes. So we created another partial class with the same name,
in the same namespace. That partial class implemented our new
interface.

Now we just had on big obstacle to get over; implementing the interface.
Implementing interfaces in VB.NET is explicit. That mean that we
explicitly had to code the call the underlying implementation, in our
partial class, to get the whole thing to work. We are counting on ca
40-50 methods and web service so that would be all lot of dumb code.

Even more stupid is that all the code already is "implemented" since we
know that all our header classes has the properties declared by the
interface. So we had to do the whole thing in C#, which supports
implicit interface implementation (whoa - fancy phase alert). So nice!

The whole thing collapses to a single line of code (excluding
namespacestuff). Here is an example:
   namespace LF.Tjanster.Sak.DataAccess.TI.Migg.ListData.HamtaVerksamheter
    {
        public partial class WS_Migg_Header : IHeader { }
    }

<div>

I don't know if this is a pattern but is sure is nice. By using partial
classes and implicit interface implementation (again? I'll switch to
writing books soon...) we solved a quite hard problem in a very nice
way.

</div>

<div>

</div>

<div>

Now we can treat the headers uniformly by passing an interface instead
of an implementation (["Classes are dead.](http://www.qi4j.org/) [Long
live
interfaces"](http://www.qi4j.org/images/18.22f90280115a3439d1a80002328/classes-are-dead.gif)).

</div>

<div>


And we'll probably use the same trick for exception handling, and
logging, and ...

</div>
