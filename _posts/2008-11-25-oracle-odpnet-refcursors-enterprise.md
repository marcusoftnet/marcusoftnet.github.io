---
layout: post
title: Oracle, ODP.NET, RefCursors, Enterprise Library
and Readers
date: '2008-11-25T10:49:00.002+01:00'
author: Marcus
Hammarberg
tags:
   - Tools
  - .NET
modified_time: '2010-12-14T16:23:30.895+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-4125820309210211075
blogger_orig_url: http://www.marcusoft.net/2008/11/oracle-odpnet-refcursors-enterprise.html
---


We have been chasing a nasty bug for a few days now. It actually has to
do with all the technologies above.

The thing is that we have a
<a href="http://www.oracle.com/" target="_blank">Oracle</a> stored
procedure that returns a <a href="http://www.oradev.com/ref_cursor.jsp"
target="_blank">RefCursor</a>. The stored procedures is actually just
doing a simple SELECT from our system value tables. We are using
<a href="http://www.codeplex.com/entlib" target="_blank">Enterprise
Library</a> to call the stored procedure. We are using the command
ExecuteReader. And here the funny business starts.

For starters the stored procedure declare an OUT RefCursor and so we are
adding a RefCursor-parameter to our
<a href="http://www.exforsys.com/tutorials/odp.net.html"
target="_blank">Oracle store procedure command object</a>. But when our
ExecuteReader is ran the command is NULL (DBNull).

Furthermore we ran into some connection problems since we had loads of
connections hanging in the database, after running our unit tests (that
made many calls to said stored procedure).

After a lot of researching we found out the following actions to solve
the problems:

-   You firstly always need to dispose readers from Enterprise Library,
    after finishing using them. My bad here - just forget about it. <a
    href="http://forums.microsoft.com/MSDN/ShowPost.aspx?PostID=352908&amp;SiteID=1"
    target="_blank">Here is a description</a> on how to do it with the
    beautiful using-construct.
-   Then you need to explicitly call Dispose on all your
    RefCursor-parameters. This is quite strange - especially since our
    code only adds the parameter to the stored procedure command and
    doesn't use it any more.
    I can only understand it as ODP.NET is converting the OUT RefCursor
    to an IDataReader.

After doing this we didn't have any problems with that the connections
wasn't released as they should.
