---
layout: post
title: ODP.NET - ArrayBindSize and Size for PLSQLAssociativeArrays
date: 2008-11-13T09:58:00.003Z
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
modified_time: 2010-12-14T15:23:30.903Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5487802933639404013
blogger_orig_url: https://www.marcusoft.net/2008/11/odpnet-arraybindsize-and-size-for.html
---

I have [written](https://www.marcusoft.net/2008/09/how-to-pass-and-receive-associative.html) about this before but I'll make a short recap since it has to do with some quite interesting stuff in Oracle.

With [ODP.NET](http://www.oracle.com/technology/tech/windows/odpnet/index.html) you can harness the full power of Oracle's features such as, for example, using [Associative Arrays](http://en.wikipedia.org/wiki/Associative_array) to bulk stuff into the database. We are using this feature in my current application since it will handle big loads.

OK - so far so good. I cannot understand two things and we have now involved the full brainpower of the team and still are scratching our heads. It actually boils down to two properties on the [OracleParameter](http://youngcow.net/doc/oracle10g/win.102/b14307/OracleParameterClass.htm)-class; Size and ArrayBindSize.

- The [Size](http://youngcow.net/doc/oracle10g/win.102/b14307/OracleParameterClass.htm#i1012269)-property should be (in the case of using associative arrays) set to the number of elements in the array. The strange thing though is that the value of the property must be set for **output**-parameters. I mean - how do you know how much that is returned? In some cases you can know but far from all.
- That is strange but the thing that leaves us hanging is the [ArrayBindSize](http://youngcow.net/doc/oracle10g/win.102/b14307/OracleParameterClass.htm#i1011933)-property. It specifies the size of each element in the array and must be set for variable-length element types. But, again, what about the output-variables? How should you know this?

We're at a standstill right now... I have set the Size-property according to the number of elements after asking my DB-guy "Which is the most number that ever will get returned in this parameter. Ever. It will break if you return more than that, you know" - doesn't feel very secure.

For array bind size, I'm hardcoding in 200 right now, for my output parameters. Since I cannot know the maximum element size returned, I don't know what else to do.

We are investigating this as we speak so I am looking forward to answering this post in a few ... days or so.
