---
layout: post
title: >-
  Error message "Could not load file or assembly
  'Microsoft.VisualStudio.Enterprise.ASPNetHelper" when deploying
date: 2008-04-04T07:41:00.001Z
author: Marcus Hammarberg
tags:
  - .NET
  - WCF
modified_time: 2010-12-14T15:20:33.304Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5549454053387136368
blogger_orig_url: http://www.marcusoft.net/2008/04/error-message-not-load-file-or-assembly.html
---


When we deployed our latest WCF-service we ran into this error message:
Could not load file or assembly
'Microsoft.VisualStudio.Enterprise.ASPNetHelper'.

Apparently this has to do with Visual Studio inserting stuff into the
web.config (or app.config) when you ran a test under code coverage. From
my goggling I find that other actions in Visual Studio might insert this
also.

<a href="http://forums.asp.net/t/1032717.aspx" target="_blank">Here</a>
is a short posting describing the problem.

Be sure to "clean" the web.config-file that is promoted to your testing
and production environments.
