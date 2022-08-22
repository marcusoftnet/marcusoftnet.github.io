---
layout: post
title: Run Explorer as another account
date: 2008-08-28T07:44:00.003Z
author: Marcus Hammarberg
tags:
  - Tools
  - Life of a consultant
modified_time: 2010-12-14T15:22:38.233Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-2313698324357646882
blogger_orig_url: http://www.marcusoft.net/2008/08/run-explorer-as-another-account.html
---


Here is a thing that is really annoying, and the solution.

When you're not allowed administrative rights on your computer with your
standard account you often need to run certain programs under another
account. This works fine, with a simple right click and choosing Run
As... ([even for
MSI-files](http://www.marcusoft.net/2008/08/run-as-for-msi-files.html)).

But for some reason the Explorer.exe cannot be started this way. This is
how to make it work:

- Create a .bat-file on your desktop (or where you want it)

- Enter the following line into it:
       runas /user:[your domain]\[your account] "C:\Program Files\Internet Explorer\iexplore.exe"

- Save the bat-file

- Double-click the bat-file and provide the password for your account
    when asked

- This will start Internet Explorer. Enter C:\\ as the URL
