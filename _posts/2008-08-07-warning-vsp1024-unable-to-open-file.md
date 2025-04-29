---
layout: post
title: TESTTOOLSTASK warning VSP1024 Unable to open file file for writing.
date: 2008-08-07T05:32:00.004Z
author: Marcus Hammarberg
tags:
  - TFS
modified_time: 2010-12-14T15:20:33.256Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-6393301215503286885
blogger_orig_url: https://www.marcusoft.net/2008/08/warning-vsp1024-unable-to-open-file.html
---


This warning occurs when doing testing with MSTest and running the test under code coverage. It is related to the warning "warning VSP2013: Instrumenting this image requires it to run as a 32-bit process. The CLR header flags have been updated to reflect this."

and has confused me a lot. Especially since, when running the tests in a build script, the warning seems to come and go.

No fear; the solution is quite simple (thanks to [this excellent forum post](http://forums.microsoft.com/MSDN/ShowPost.aspx?PostID=2149662&SiteID=1)); here is what you need to do:

- Find the test configuration file you're using for the test run under code coverage. It is usually called LocalTestRun. testrunconfig and resides in the solution root.
- Open the file in a XML-editor
- Find all the CodeCoverageItem-elements change (or add) the attribute    instrumentInPlace from "**true**" to "**false**"
- Save and rerun - works like a charm

But hey, I can hear some people say, what is that instrumentInPlace-attribute? Well that's the hmmm... mmm ... eeeh - I don't know, to be honest. From [the MSDN-help](http://msdn.microsoft.com/en-us/library/ms243141.aspx) I only get confused:

"If you need to gather code coverage information while you are testing code in an assembly, you must first instrument that assembly. The process of instrumentation adds code that generates code coverage information into the assembly"

OK - I've got that. But what does "in place" means? Can anyone enlighten me? I haven't yet found a time when I need it...
