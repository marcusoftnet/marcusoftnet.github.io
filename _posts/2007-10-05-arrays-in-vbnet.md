---
layout: post
title: Declaring arrays in VB.NET
date: 2007-10-05T08:15:00.001Z
author: Marcus Hammarberg
tags:
  - VB.NET
  - Life of a consultant
modified_time: 2008-04-09T08:37:06.367Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-6662162005482306882
blogger_orig_url: https://www.marcusoft.net/2007/10/arrays-in-vbnet.html
---

OK - this is driving me mad. Arrays in VB.NET really, really annoys me. Here is a short list on how to work with arrays, in my example an array of strings.

1. Declaring an new empty array: `Dim arr() as String = {}` or (this is where the pain begins...why is there a choice?) `Dim arr as String() = {}`
2. Declaring an array with three elements: `Dim arr(2) as String`
3. Declaring an array with two elements and initializing the values `Dim arr as String() = {"Element 1", "Element 2"}`. So - again the pain of VB.NET comes from the urge to want to help us all the time. Why, oh why, are there several ways of doing one thing?

I will sure get back to this post a lot because I forget how this is done every time - much thanks to the "helpfulness" of VB.NET
