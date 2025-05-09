---
layout: post
title: Using LINQ for the first time, for real
date: 2008-09-12T06:01:00.001Z
author: Marcus Hammarberg
tags:
  - VB.NET
  - Tools
  - LINQ
modified_time: 2010-12-14T15:23:30.912Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-2792568268333072682
blogger_orig_url: https://www.marcusoft.net/2008/09/using-linq-for-first-time-for-real.html
---

The [LINQ project](http://msdn.microsoft.com/en-us/netframework/aa904594.aspx) is one of those techniques that first makes you cheer, then think about how you'll ever will use it in real life and then not think about it.

Also it seems to be a lot of confusion about what LINQ really is. LINQ is a number of constructs in the .NET framework to do queries over database, XML or object. This post may clarify things a bit.

I ran into a situation where my function received a parameter, lista, that was Generic list of MyObject. Since I was planning on sending [associative arrays to Oracle](https://www.marcusoft.net/2008/09/how-to-pass-and-receive-associative.html) I needed each property in MyObject in an own array.

LINQ to the fore! A LINQ-query could actually help us to produce the arrays we need. Here is my code:

```vb
public sub CallStoredProc(ByVal lista as List(Of MyObject))
   Dim ids = From obj in lista Select obj.ID
end sub
```

My first LINQ. Me so proud! ;)
