---
layout: post
title: Bad Request/Underlying connection was closed problem solved
date: 2007-05-31T13:05:00.000Z
author: Marcus Hammarberg
tags:
  - VB.NET
  - Visual Studio
modified_time: 2011-10-03T10:30:40.580Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-4851332309945351177
blogger_orig_url: http://www.marcusoft.net/2007/05/bad-requestunderlying-connection-was.html
---

In our project we have had great problems when debugging web
services in Visual Studio. For about half of the the request on of two
exceptions has been thrown:

- System.Net.WebException: The request failed with HTTP status 400:
    Bad Request.
- System.Net.Sockets.SocketException: The underlying connection was
    closed

After some looking into i found a solution and it was (as ever) quite
easy. You simply have to set credentials on the web service as
follows:
`Dim m_wsService wsSystemName.SystemNameService = New wsSystemName.SystemNameServicem_wsService.Credentials = System.Net.CredentialCache.DefaultNetworkCredentialsm_wsService.PreAuthenticate = True`
I have not observed this problem in C# so i presume that it is VB.NET
related... or i might just be bad.
