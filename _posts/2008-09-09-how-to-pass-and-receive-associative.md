---
layout: post
title: How to pass and receive associative arrays with
ODP.NET
date: '2008-09-09T15:45:00.004+02:00'
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
modified_time: '2010-12-14T16:23:30.927+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-8286682178645630
blogger_orig_url: http://www.marcusoft.net/2008/09/how-to-pass-and-receive-associative.html
---

"How to pass and receive associative arrays with ODP.NET" - that
question is sure to have to annoyed a lot of programmers. We have really
pulled our hair over this problem and when you search for it on the net
there is not very much helpful to be found.

We are using a feature of the ODP.NET that allows you to send arrays of
parameters to and from stored procedures in Oracle. This is called
associative arrays and is described in great detail in [this
article.](http://www.oracle.com/technology/oramag/oracle/07-jan/o17odp.html)

BUT... of course there is a but. This article doesn't describe how to
receive arrays back from a stored procedure. This is described
[here](http://download.oracle.com/docs/cd/B19306_01/win.102/b14307/featOraCommand.htm#sthref226).

The trick (and confusing part) is that the size of the output array
needs to be specified a priori (on beforehand) even for output
parameters. A bit strange but it works.
