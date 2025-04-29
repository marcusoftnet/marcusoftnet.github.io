---
layout: post
title: System.BadImageFormatException Could not load file or assembly
  System.Data.SQLite
date: 2010-02-11T07:02:00.001Z
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
  - NHibernate
modified_time: 2010-12-14T15:22:38.164Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-3325711529846229433
blogger_orig_url: https://www.marcusoft.net/2010/02/systembadimageformatexception-could-not.html
---


I ran into this problem when I tried to re-open a <a
href="https://www.marcusoft.net/2009/09/automapping-with-fluentnhibernate.html"
target="_blank">solution I did a while back</a> when labbing with Fluent
<a href="https://www.hibernate.org/343.html"
target="_blank">NHibernate</a> and SQLite.

Behind the cryptic error message lies and easy solution; I was running
the 32-bit version of the SQLite-driver and runtime. That' doesn’t fly
on my Windows 7 64-bit machine.

Here is a more <a
href="http://www.bennymichielsen.be/post/2009/10/12/Using-SQLite-in-64-bit-NET-environments.aspx"
target="_blank">through description</a> and here is a link to
<a href="http://sourceforge.net/projects/sqlite-dotnet2/files/"
target="_blank">the latest version of SQLite</a> that will get you all
the version (32 and 64 bits) of the SQLite.
