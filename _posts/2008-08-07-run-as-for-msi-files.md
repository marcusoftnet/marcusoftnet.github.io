---
layout: post
title: Run as for MSI-files
date: 2008-08-07T11:56:00.001Z
author: Marcus Hammarberg
tags:
  - Tools
modified_time: 2010-12-14T15:22:38.262Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-3734436501828174890
blogger_orig_url: https://www.marcusoft.net/2008/08/run-as-for-msi-files.html
---

I am
hitting them as I go along - here is another tip that is very useful.

A .MSI-file cannot be executed under
another account then the one you're running with. There is no "Run
as..." in the right-click menu for .MSI-file, in other words.

Here is [the solution for
Vista](http://juice.altiris.com/download/1382/msi-run-as-administrator-context-menu-for-vista)
which works very good on XP also (I've tried). It is a
reg-file that simply adds the "Run as ..."-feature when right clicking
.MSI-files
