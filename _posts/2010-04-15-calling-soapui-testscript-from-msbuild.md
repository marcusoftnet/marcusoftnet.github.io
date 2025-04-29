---
layout: post
title: Calling SOAPUi Testscript from MSBuild
date: 2010-04-14T18:31:00.001Z
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
  - MSBuild
modified_time: 2010-12-14T15:22:38.157Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-955286889235744294
blogger_orig_url: https://www.marcusoft.net/2010/04/calling-soapui-testscript-from-msbuild.html
---


Yes, I know that I have
<a href="https://www.marcusoft.net/2010/03/soapui-and-msbuild.html"
target="_blank">written about this before</a>, with several updates. But
I have now solved some issues with <a
href="https://www.marcusoft.net/2010/03/changing-endpoint-from-command-line.html"
target="_blank">setting different endpoints for different services</a>
and thought that I might need to update the MSBuild-script to be able to
call with those parameters also.

Again – the script I am starting off is written by <a
href="http://blog.goneopen.com/2010/01/msbuild-execution-of-soapui-testrunner/"
target="_blank">Todd of the Tar Pit</a>. I’ve just tweaked it to take
project property as input. That was the recommended way to change the
endpoint for one service, to set the endpoint to a projectwide
parameter.

So,
<a href="http://pastie.org/921808" target="_blank">here is what the new
MSBuild</a> targets looks like.

And <a href="http://pastie.org/919796" target="_blank">here is a
DOS-command</a> that runs the MSBuild-target TestAll with the project
property set to a endpoint.

Please note that I was running this on a 64-bit Windows 7 and got some
strange paths (Framework64) that you want to change..

You can download my complete (now updated) project
<a href="http://dl.dropbox.com/u/2408484/Marcusoft.SOAPUiDemo.zip"
target="_blank">from here</a>.
