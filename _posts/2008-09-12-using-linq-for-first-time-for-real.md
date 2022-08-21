---
layout: post
title: Using LINQ for the first time, for real
date: '2008-09-12T08:01:00.001+02:00'
author: Marcus Hammarberg
tags:
  - VB.NET
  - Tools - LINQ
modified_time: '2010-12-14T16:23:30.912+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-2792568268333072682
blogger_orig_url: http://www.marcusoft.net/2008/09/using-linq-for-first-time-for-real.html
---


The <a href="http://msdn.microsoft.com/en-us/netframework/aa904594.aspx"
target="_blank">LINQ project</a> is one of those techniques that first
makes you cheer, then think about how you'll ever will use it in real
life and then not think about it.

Also it seems to be a lot of confusion about what LINQ really is. LINQ
is a number of constructs in the .NET framework to do queries over
database, XML or object. This post may clarify things a bit.

I ran into a situation where my function received a parameter, lista,
that was Generic list of MyObject. Since I was planning on sending <a
href="http://www.marcusoft.net/2008/09/how-to-pass-and-receive-associative.html"
target="_blank">associative arrays to Oracle</a> I needed each property
in MyObject in an own array.

LINQ to the fore! A LINQ-query could actually help us to produce the
arrays we need. Here is my code:
   public sub CallStoredProc(byval lista as List(Of MyObject))
       Dim ids = From obj in lista Select obj.ID

    end sub


My first LINQ. Me so proud! ;)
