---
layout: post
title: More about generic web services
date: 2006-11-14T07:09:00.000Z
author: Marcus Hammarberg
tags:
  - .NET
  - Visual Studio
modified_time: 2010-12-14T15:19:05.660Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-1225927400840922867
blogger_orig_url: https://www.marcusoft.net/2006/11/more-about-generic-webservces.html
---

I've looked further down the documentation ([this chapter in fact](http://beta.blogger.com/Generic)) and found some more, very interesting stuff on generics that make my solution with delegates a bit clumsy and non-elegant. When declare a generic class or method the type parameter can be limited to what types it can take using constraints. So in my solution the row:

```c#
public static TWebService CreateWebService(string WebServiceURL) where TWebService : SoapHttpClientProtocol
```

means that `TWebService` must be of SoapHttpClientProtocol type.

However I ran into a bit of confusion when I wanted to instantiate `TWebService`. The compiler was not happy when I wrote:

```c#
// This won't compile
TWebService t = new TWebService();
```

That is until I discovered another constraint - the Constructor Constraint. By using this constraint you can constrain the types that is allowed to types with an empty (parameterless) constructor. And that will allow you to instantiate `TWebService` and the compiler will find the right constructor at runtime.

So here's the syntax:

```c#
public static TWebService CreateWebService(string WebServiceURL) where TWebService : SoapHttpClientProtocol, new()
{
  // This will be ok
  TWebService t = new TWebService();
}
```

Much nicer code without the previous delegate solution.
