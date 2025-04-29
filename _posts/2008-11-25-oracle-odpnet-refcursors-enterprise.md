---
layout: post
title: Oracle, ODP.NET, RefCursors, Enterprise Library and Readers
date: 2008-11-25T09:49:00.002Z
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
modified_time: 2010-12-14T15:23:30.895Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-4125820309210211075
blogger_orig_url: https://www.marcusoft.net/2008/11/oracle-odpnet-refcursors-enterprise.html
---

We have been chasing a nasty bug for a few days now. It actually has to do with all the technologies above.

The thing is that we have a [Oracle](http://www.oracle.com/) stored procedure that returns a [RefCursor](http://www.oradev.com/ref_cursor.jsp). The stored procedure is actually just doing a simple SELECT from our system value tables. We are using [Enterprise Library](http://www.codeplex.com/entlib) to call the stored procedure. We are using the command `ExecuteReader`. And here the funny business starts.

For starters, the stored procedure declares an OUT RefCursor, so we are adding a RefCursor parameter to our [Oracle stored procedure command object](http://www.exforsys.com/tutorials/odp.net.html). But when our `ExecuteReader` is run, the command is NULL (`DBNull`).

Furthermore, we ran into some connection problems since we had loads of connections hanging in the database after running our unit tests (that made many calls to said stored procedure).

After a lot of researching, we found the following actions to solve the problems:

- You always need to dispose of readers from Enterprise Library after finishing using them. My bad here - I just forgot about it. [Here is a description](http://forums.microsoft.com/MSDN/ShowPost.aspx?PostID=352908&SiteID=1) on how to do it with the beautiful `using` construct.
- You need to explicitly call `Dispose` on all your RefCursor parameters. This is quite strange, especially since our code only adds the parameter to the stored procedure command and doesn't use it anymore. I can only understand it as ODP.NET is converting the OUT RefCursor to an `IDataReader`.

After doing this, we didn't have any problems with the connections not being released as they should.
