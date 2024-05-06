---
layout: post
title: Regular Expression for Even Number
date: 2008-11-03T07:42:00.001Z
author: Marcus Hammarberg
tags:
  - Life of a consultant
modified_time: 2008-11-03T07:42:14.820Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-3719669431473149548
blogger_orig_url: http://www.marcusoft.net/2008/11/regular-expression-for-even-number.html
---

Let me first be very clear - I'm not a [RegExp](http://en.wikipedia.org/wiki/Regular_expression)-guy. I find them quite hard to understand at times and often take refuge in .NET code.

Also, I was very surprised to not find any hits for the search of ["RegExp even numbers"](http://www.google.co.uk/search?hl=en&amp;q=regexp+even+numbers&amp;sa=X&amp;oi=revisions_inline&amp;ct=unquoted-query-link) - I thought that I would find numerous examples.

But after reading a bit [here](http://www.15seconds.com/issue/010301.htm), I learned enough to create my first naïve regular expression - a regular expression to allow only even numbers:

```text
^\d*?((0)|(2)|(4)|(6)|(8))$
```

Again, my apologies for being a newbie on this... but hey, it works.

I also found [this resource](http://www.jansfreeware.com/articles/regexpress.html) very useful for trying out my expression.

Regular expressions are very powerful, but ["with great power comes great responsibilities"...](http://www.newsfromme.com/archives/2005_10_06.html) - that is, they are often hard to understand.

Thanks, Fredrik S, for the links.