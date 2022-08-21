---
layout: post
title: Oracle, ODP.NET, TFS Build and running tests
under service account
date: '2008-10-24T13:51:00.002+02:00' author:
Marcus Hammarberg
tags:
   - Tools
  - .NET
modified_time: '2010-12-14T16:23:30.906+01:00' thumbnail:
http://lh4.ggpht.com/\_kkDJOSPNTLs/SS6fx-hOzaI/AAAAAAAAAYw/EQ8PqS_WLSI/s72-c/installning%5B4%5D_thumb%5B5%5D.jpg?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-6282787406161895821
blogger_orig_url: http://www.marcusoft.net/2008/10/oracle-odpnet-tfs-build-and-running.html
---


We have for several days now been chasing a bug for a couple of days
now. Very, very annoying...

Here is how it goes:

We have a unit test on that calls an stored procedure in Oracle, using
<a
href="http://www.oracle.com/technology/tech/windows/odpnet/index.html"
target="_blank">ODP.NET</a>. On our local machine (and also on the test
server) everything works fine. But when the build script is running the
unit test, a out-parameter of the DATE-datatype was always returned as
NULL.

This was so strange since it's the same code against the same database
instance. The difference was that is was another account, the TFS Build
Service Account, that was running the tests.

The solution was to configure the regional settings for TFS Build
Service Account to use Swedish (in our case) Regional Settings as the
default user profile.

[<img
src="http://lh4.ggpht.com/_kkDJOSPNTLs/SS6fx-hOzaI/AAAAAAAAAYw/EQ8PqS_WLSI/installning%5B4%5D_thumb%5B5%5D.jpg?imgmax=800"
style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
data-border="0" width="407" height="482" alt="installning[4]" />](http://lh6.ggpht.com/_kkDJOSPNTLs/SS6fwh85vCI/AAAAAAAAAYs/IRDZStjoDQc/s1600-h/installning%5B4%5D%5B7%5D.jpg)

**\[UPDATED\]
**That checkbox should be checked!

So good to solve this. Thanks to the anonymous "client dude" that helped
us solve this on his way to lunch...
