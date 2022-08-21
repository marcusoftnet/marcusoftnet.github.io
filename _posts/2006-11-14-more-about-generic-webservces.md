---
layout: post
title: More about generic webservces
date: '2006-11-14T08:09:00.000+01:00'
author: Marcus Hammarberg
tags:
  - .NET -
Visual Studio
modified_time: '2010-12-14T16:19:05.660+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-1225927400840922867
blogger_orig_url: http://www.marcusoft.net/2006/11/more-about-generic-webservces.html ---
I've looked further down the documentation ([this chapter in
fact](http://beta.blogger.com/Generic)) and found some more, very
interesting stuff on generics that make my solution with delegates a bit
clumsy and non-elegant.
When declare a generic class or method the type parameter can be limited
to what types it can take using constraints. So in my solution the
row:

<span style="font-family:courier new;font-size:85%;">public static
TWebService CreateWebService(string WebServiceURL)
where TWebService : SoapHttpClientProtocol</span>

means that TWebService must be of SoapHttpClientProtocol type.

However i ran into a bit of confusion when i wanted to instantiate
TWebService. The compiler was not happy when i wrote:
<span style="font-family:courier new;font-size:85%;">
// This won't compile
TWebService t = new TWebService(); </span>

That is until i discovered another constraint - the Constructor
Constraint. By using this constraint you can constrain the types that is
allowed to types with an empty (parameterless) constructor. And that
will allow you to instantiate TWebService and the compiler will find the
right constructor at runtime.

So here's the syntax:

<span style="font-family:courier new;font-size:85%;">public static
TWebService CreateWebService(string WebServiceURL)
where TWebService : SoapHttpClientProtocol, new()
{
// This will be ok
TWebService t = new TWebService();
}</span>

Much nicer code without the previous delegate solution.
