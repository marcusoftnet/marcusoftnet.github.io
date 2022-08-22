---
layout: post
title: SOAPUi and MSBuild
date: 2010-03-03T12:24:00.002Z
author: Marcus Hammarberg
tags:
  - .NET
  - MSBuild
  - WCF
modified_time: 2010-03-30T19:45:57.670Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-486361330278550150
blogger_orig_url: http://www.marcusoft.net/2010/03/soapui-and-msbuild.html
---


After my <a
href="http://www.marcusoft.net/2010/03/soapui-and-testing-wcf-services-how-i.html"
target="_blank">last post</a> I cannot withhold you from this nugget.
It’s a guy (Todd) that have created some <a
href="http://blog.goneopen.com/2010/01/msbuild-execution-of-soapui-testrunner/"
target="_blank">MSBuild targets to call SOAPUi</a> from a build
script.
I am about to try it out… I’ll get back to you if I run into problems.

**\[UPDATED\]**
Yup - it worked! Great! Thanks Todd.

Still have some issues in that the [switch
/endpoint](http://www.soapui.org/userguide/commandline/testcaserunner.html)
will override all the endpoints in the SOAPUi project... But I'm on
it...

**\[UPDATED AGAIN\]**

<a
href="http://www.marcusoft.net/2010/03/changing-endpoint-from-command-line.html"
target="_blank">See this</a> on how to solve the endpoint problem.
