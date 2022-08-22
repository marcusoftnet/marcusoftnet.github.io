---
layout: post
title: Who called me?
date: 2008-08-18T11:15:00.003+02:00
author: Marcus Hammarberg
tags:
  - Tools
modified_time: 2010-12-14T16:22:38.240+01:00
blogger_id: tag:blogger.com,1999:blog-36533086.post-4995703484218570116
blogger_orig_url: http://www.marcusoft.net/2008/08/who-called-me.html
---

[Here](http://www.codeproject.com/KB/dotnet/MethodName.aspx) is a
cool little code snippet with done with reflection that actually is
quite handy. Especially in a logging situation.

I tweaked the code a bit to be not "WhoCalledMe" but rather
"WhoIsTheCallerOfMe" and as such could hide most of the logging in a
base class. This is easily done by changing the row
   StackFrame stackFrame = stackTrace.GetFrame(1);

to
   StackFrame stackFrame = stackTrace.GetFrame(2);

Of course then you'll have to check that the frame in question (2)
exists.
