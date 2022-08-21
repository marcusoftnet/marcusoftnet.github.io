---
layout: post
title: Regular Expression for even number
date: '2008-11-03T08:42:00.001+01:00'
author: Marcus Hammarberg
tags:
  - Life of a consultant

modified_time: '2008-11-03T08:42:14.820+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-3719669431473149548
blogger_orig_url: http://www.marcusoft.net/2008/11/regular-expression-for-even-number.html
---


Let me first be very clear - I'm not a
<a href="http://en.wikipedia.org/wiki/Regular_expression"
target="_blank">RegExp</a>-guy. I find them quite hard to understand at
times and often take my refuge to the .NET-code.

Also I was very surprised to not find any hits for the search of <a
href="http://www.google.co.uk/search?hl=en&amp;q=regexp+even+numbers&amp;sa=X&amp;oi=revisions_inline&amp;ct=unquoted-query-link"
target="_blank">"RegExp even numbers"</a> - I thought that I would find
numerous examples.

But after reading a bit at
<a href="http://www.15seconds.com/issue/010301.htm" target="_blank">this
place</a> I learned enough to create my first own, naïve regular
expression - a regular expression to allow only even numbers:

> **^\d\*?((0)\|(2)\|(4)\|(6)\|(8))$** 

Again - my apologies for being a newbie on this... but hey it works.

I also found
<a href="http://www.jansfreeware.com/articles/regexpress.html"
target="_blank">this resource</a> very useful for trying my expression
out.

Regular Expressions are very powerful but
<a href="http://www.newsfromme.com/archives/2005_10_06.html"
target="_blank">"with great powers comes great responsibilities"...</a>
that is they are often hard to understand.

Thanks Fredrik S for the links.
