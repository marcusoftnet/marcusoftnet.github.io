---
layout: post
title: Exclude generated code from code coverage result
in Team System
date: '2008-04-25T09:53:00.004+02:00'
author: Marcus
Hammarberg
tags:
  - VB.NET - TFS
modified_time: '2010-12-14T16:20:33.294+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-7137896854594876672
blogger_orig_url: http://www.marcusoft.net/2008/04/removing-mysettings-from-code-coverage.html
---

One thing that have irritated me with the code coverage tool in
Visual Studio 2005-8 is that you can't exclude things from the code
coverage result.

For example - in VB.NET the MySettings-class is generated for each
assembly that is created. The code in it is automatically generated and
you shouldn't change it (it even says so in a comment from the tool...).
However it is counted when the code coverage result is calculated.

The same thing applies for proxy-classes to web services for example.

This gives an incorrect picture on how much of *your* code that is
tested. But now I've found an attribute that might help:

   <debuggernonusercode()>

This attribute tells the compiler that the code that is decorated with
the attribute is not written by the user and should not be step into
during debugging sessions. So when the testing tool encounters the
attribute it will simply not "count" the rows with the attribute.

Works like a charm. Watch out though - since the attribute applies for
debugging also you will not be able to step into the code. For the
examples I've counted (MySetting and proxy classes) that is normally not
a problem, but if you need to you might want to reconsider.

[Here](http://richardsbraindump.blogspot.com/2007/12/how-to-exclude-method-from-code.html)
is the article that pointed me the right way.
