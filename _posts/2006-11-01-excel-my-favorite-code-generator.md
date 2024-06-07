---
layout: post
title: Excel - my favorite code generator
date: 2006-11-01T07:39:00.000Z
author: Marcus Hammarberg
tags:
  - Tools
  - Life of a consultant
modified_time: 2010-12-14T15:22:38.398Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-3263601739160012005
blogger_orig_url: http://www.marcusoft.net/2006/11/excel-my-favorite-code-generator.html
---

I have spent the main part of the last two days compiling
SQL-statements with Excel, and it's actually quite good at it.

With the string functions (concatenate, substring, find and the usual
suspects) you can create SQL-statements for a large number of rows quite
simply.

I have a large number of strings that need to be manipulated (done with
replace) and then all these string needs to be sent to a stored
procedure. This stored procedure call is created by concatenating the
string from the manipulated column with the SQL-statement to make the
call.

When all of this is done it's just a matter of filling the columns.
Works like charm.

Then I needed about 2 hours to muster the strength to run the script,
but that's another story
