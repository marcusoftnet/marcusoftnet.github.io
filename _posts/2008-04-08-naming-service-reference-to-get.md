---
layout: post
title: Naming service reference to get namespace-like behavior
date: 2008-04-08T06:54:00.002Z
author: Marcus Hammarberg
tags:
  - SOA
  - WCF
modified_time: 2010-12-14T15:20:33.300Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-932102224134427259
blogger_orig_url: https://www.marcusoft.net/2008/04/naming-service-reference-to-get.html
---

In my current project we are accessing a legacy system using [Microsoft Transaction Integrator](http://msdn2.microsoft.com/en-us/library/ms945276.aspx). Luckily for us we don't have to write any of that stuff, that is done by another team who exposes the objects and methods in the legacy system as web services.

However - they have chosen to encapsulate each object.method as one web service. Since we will have about 50 methods to call it we be ... 50 web service references for us to keep track on.

That is not a problem if it wasn't for the name spacing. There are a lot of wsGetBusinessCodes and wsUpdateInsurance namespaces running around in our code.

Yesterday we found a "solution" to how to organize the web service references on our, the client, side - and still let the server side publish the web service how they like. The solution is quite simple;

As it turns out you can include points (".") in the name of a web service reference. This gives us an opportunity to name the service reference in a namespace-like manner. For example we use:

```vb
Dim a as TI.SystemName.ObjectName.MethodName.Class
```

When we add many references in the same way they will be organized in a nice way. Simple and powerful - that how we like it.
