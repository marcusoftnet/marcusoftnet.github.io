---
layout: post
title: Oracle, ODP.NET, TFS Build and running tests under service account
date: 2008-10-24T11:51:00.002Z
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
modified_time: 2010-12-14T15:23:30.906Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-6282787406161895821
blogger_orig_url: http://www.marcusoft.net/2008/10/oracle-odpnet-tfs-build-and-running.html
---

We have for several days now been chasing a bug for a couple of days now. Very, very annoying...

Here is how it goes:

We have a unit test on that calls a stored procedure in Oracle, using [ODP.NET](http://www.oracle.com/technology/tech/windows/odpnet/index.html). On our local machine (and also on the test server) everything works fine. But when the build script is running the unit test, an out-parameter of the DATE-datatype was always returned as NULL.

This was so strange since it's the same code against the same database instance. The difference was that it was another account, the TFS Build Service Account, that was running the tests.

The solution was to configure the regional settings for the TFS Build Service Account to use Swedish (in our case) Regional Settings as the default user profile.

**[UPDATED]** That checkbox should be checked!

So good to solve this. Thanks to the anonymous "client dude" that helped us solve this on his way to lunch...
