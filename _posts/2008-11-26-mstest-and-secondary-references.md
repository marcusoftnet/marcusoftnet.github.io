---
layout: post
title: MSTest and secondary references
date: 2008-11-26T16:05:00.001+01:00
author: Marcus Hammarberg
tags:
  - MSBuild
modified_time: 2010-12-14T16:20:33.231+01:00
blogger_id: tag:blogger.com,1999:blog-36533086.post-7988372363087173666
blogger_orig_url: http://www.marcusoft.net/2008/11/mstest-and-secondary-references.html
---


We've just solved a tricky thing in our project. We still don't get what
is happening under the covers but now we've got it to work.

When we ran our unit tests (99% code coverage have I mentioned that :))
in the Visual Studio IDE everything was green and nice. However when the
tests were run in our build script they failed with some strange
reference problem. The same thing happened if we ran the test local via
MSTest.exe.

OK - we then found the <a
href="http://social.msdn.microsoft.com/Forums/en-US/vststest/thread/aa7f7567-faba-4589-b0ae-fe8d2c831c7a/%20"
target="_blank">following post</a> that showed us the same behavior. The
solution is to in the .testrunconfig-file for the test configure
DeploymentItems that points to any additional reference you need for
your test to run.

Via the Test-\>Edit Test Run Configuration-menu item you can easily add
files and folders.
