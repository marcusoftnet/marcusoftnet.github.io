---
layout: post
title: Associative arrays - and how to use them... wisely
date: 2008-11-14T09:46:00.002Z
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
modified_time: 2010-12-14T15:23:30.899Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5718087151947256210
blogger_orig_url: https://www.marcusoft.net/2008/11/associative-arrays-and-how-to-use-them.html
---

My questions in an [earlier post](https://www.marcusoft.net/2008/11/odpnet-arraybindsize-and-size-for.html) were promptly answered by [Mark A Williams](http://oradim.blogspot.com/) in a great way.

So what he says pretty much confirms what I thought. Although associative arrays are a great way to "bulk in" data to the database, when it comes to returning data, the array-way might not always be right.

Since you have to allocate memory for the array and size of each element in the array, associative arrays are best suited for situations when you know the size of the data that is being returned. Not that often in my experience. In other cases, you'll be better off with a plain old [DataReader](http://youngcow.net/doc/oracle10g/win.102/b14307/OracleDataReaderClass.htm).

So now I know - thanks goes to Mark A Williams.
