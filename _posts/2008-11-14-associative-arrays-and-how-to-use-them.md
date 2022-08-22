---
layout: post
title: Associative arrays - and how to use them... wisely
date: '2008-11-14T10:46:00.002+01:00'
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
modified_time: '2010-12-14T16:23:30.899+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-5718087151947256210
blogger_orig_url: http://www.marcusoft.net/2008/11/associative-arrays-and-how-to-use-them.html
---


My questions in an <a
href="http://www.marcusoft.net/2008/11/odpnet-arraybindsize-and-size-for.html"
target="_blank">earlier post</a> was promptly answered by
<a href="http://oradim.blogspot.com/" target="_blank">Mark A
Williams</a> in a great way.

So what he say pretty much confirms what I thought. Although associative
arrays are great way to "bulk in" data to the database but when it comes
to returning data the array-way might not always be right.

Since you have to allocate memory for the array and size of each element
in the array the associative arrays are best suited for situations when
you know the size of the data that is being returned. Not that often in
my experience. In other cases you'll better off with a plain old <a
href="http://youngcow.net/doc/oracle10g/win.102/b14307/OracleDataReaderClass.htm"
target="_blank">DataReader</a>.

So now I know - thanks goes to Mark A Williams.
