---
layout: post
title: Could not find file
'Microsoft.Windows.CommonLanguageRuntime error for testprojects
date: '2008-02-26T07:39:00.004+01:00'
author: Marcus Hammarberg
tags:
  - Life of a consultant
   - Visual Studio
modified_time: '2010-12-14T16:19:05.488+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-336550589709812727
blogger_orig_url: http://www.marcusoft.net/2008/02/could-not-find-file-microsoftwindowscom.html
---

We have encountered a quite annoying bug when creating a <span
id="SPELLING_ERROR_0" class="blsp-spelling-corrected">test
project</span> that references a Windows application. The Windows
application have been deployed via <span>="blsp-spelling-error">ClickOnce</span> and that when the <span
id="SPELLING_ERROR_2" class="blsp-spelling-error">testproject</span>
stopped compiling.

In the test project we got the "Could not find file
'Microsoft.Windows.CommonLanguageRuntime" error message on <span
id="SPELLING_ERROR_3"
class="blsp-spelling-corrected">compilation</span>.

Here is an article describing that problem:
<http://support.microsoft.com/kb/907757>. No very good solution though.
I'll post out solution in a while.

The solution seems to be to set a reference to the .exe instead of the
projectfile. However we ran into some trouble with that also - a better
solution is on it's way...
