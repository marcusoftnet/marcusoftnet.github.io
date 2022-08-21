---
layout: post
title: Run as for MSI-files
date: '2008-08-07T13:56:00.001+02:00'
author: Marcus Hammarberg
tags:
  - Tools
modified_time: '2010-12-14T16:22:38.262+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-3734436501828174890
blogger_orig_url: http://www.marcusoft.net/2008/08/run-as-for-msi-files.html
---

I am
hitting them as I go along - here is another tip that is very useful.

A .<span>="blsp-spelling-error">MSI</span>-file cannot be executed under
another account then the one you're running with. There is no "Run
as..." in the right-click menu for .<span>="blsp-spelling-error">MSI</span>-file, in other words.

Here is [the solution for
Vista](http://juice.altiris.com/download/1382/msi-run-as-administrator-context-menu-for-vista)
which works very good on <span>="blsp-spelling-error">XP</span> also (I've tried). It is a
reg-file that simply adds the "Run as ..."-feature when right clicking
.<span>="blsp-spelling-error">MSI</span>-files
