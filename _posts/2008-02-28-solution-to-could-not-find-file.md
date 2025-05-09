---
layout: post
title: Solution to the "Could not find file 'Microsoft.Windows.CommonLanguageRuntime error" for test projects
date: 2008-02-28T10:13:00.004Z
author: Marcus Hammarberg
tags:
  - VB.NET
  - Visual Studio
modified_time: 2010-12-14T15:19:05.484Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-1635528158320792969
blogger_orig_url: https://www.marcusoft.net/2008/02/solution-to-could-not-find-file.html
---

Here is the solution to my previous posting [Could not find file 'Microsoft.Windows.CommonLanguageRuntime error for test projects](https://www.marcusoft.net/2008/02/could-not-find-file-microsoftwindowscom.html).

As always it is simple when you know how. You simply uncheck the Enable ClickOnce security settings-checkbox under Projects -> Properties -> Security.

A better solution is the extract the code that is to be tested to an own project, but I'll use the above for now. We're only using ClickOnce for testing environments.
