---
layout: post
title: How to fail a tfs-build on test failing
date: 2008-04-29T06:02:00.003Z
author: Marcus Hammarberg
tags:
  - TFS
  - MSBuild
modified_time: 2008-04-29T06:18:08.316Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-2628051183812318304
blogger_orig_url: http://www.marcusoft.net/2008/04/how-to-fail-tfs-build-on-test-failing.html
---


One thing that really surprised me was that when tests
fail in my build script the build script happily ran along after that!?
Isn't one of the ideas with <a
href="http://www.martinfowler.com/articles/continuousIntegration.html"
class="l"
onmousedown="return clk(this.href,'','','res','1','')">Continuous
Integration</a> that the build script only will emit working versions?

Well in [this article Aaron Hallberg](http://blogs.msdn.com/aaronhallberg/archive/2007/11/05/how-to-fail-a-build-when-tests-fail.aspx)
(Swedish relatives?) shows us how to handle this. What he basically does
is to check the status of the test-run and then update the status of the
complete build.

I extended his code to use the test-status-flag on the tasks that follow
the test, i.e. the publish task. This task deploys the executables
to my <span id="SPELLING_ERROR_3" class="blsp-spelling-corrected">test
server, update the documentation etc.

So now I've got my desired result which is that failing test leads to
failing the whole build.
