---
layout: post
title: Get current user name and with VB.NET
date: 2007-06-27T08:02:00.000Z
author: Marcus Hammarberg
tags:
  - VB.NET
  - .NET
modified_time: 2007-06-27T08:04:55.065Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-2278764567005500198
blogger_orig_url: http://www.marcusoft.net/2007/06/get-current-user-name-and-with-vbnet.html
---

I searched a while for this, actually... which is strange
since all I wanted to do is to find the current user name and the
current user domain.

It's dead simple with the following lines:
`Dim userName As String = System.Environment.UserNameDim userDomain As String = System.Environment.UserDomainName`
So if you ever look for how to find the information about the current
user - here it is
