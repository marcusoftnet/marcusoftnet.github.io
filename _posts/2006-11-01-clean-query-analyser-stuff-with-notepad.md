---
layout: post
title: Clean Query analyser stuff with Notepad
date: 2006-11-01T07:49:00.000Z
author: Marcus Hammarberg
tags:
  - Tools
  - Life of a consultant
modified_time: 2010-12-14T15:22:38.393Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-8019320609808138538
blogger_orig_url: http://www.marcusoft.net/2006/11/clean-query-analyser-stuff-with-notepad.html
---


Just another great utility that everybody has at their disposal...

Quite often you will need the columns from a Query Analyser result for
further handling, to put as header in Excel or to use in another query.
The sad part is that they are not easily captured, if you get the result
as a grid you can't reach them and if you get the result as text they
are separated with spaces to the length of the content of each column.

So this is my street/no fuss solution - it might be faster ways of doing
this will SQL but this is one way.

1. Execute the SQL-statement you want the columns for and return the
    result as text
2. Select and copy the header row
3. Paste the header row into a Notepad-document
4. Search for space (" ") and replace with two commas (,,)
5. When done do another search for two commas and replace with one
    comma
6. Repeat step 5 until only one comma exits
7. There you go - the columns separated with commas

As i read this i see that it's quite a lot of steps, but hey you also
get to watch some interesting search/replace-execution in Notepad.
Always something.
