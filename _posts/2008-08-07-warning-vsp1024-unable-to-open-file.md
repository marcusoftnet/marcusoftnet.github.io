---
layout: post
title: 'TESTTOOLSTASK : warning VSP1024: Unable to open
file ''file'' for writing.'
date: '2008-08-07T07:32:00.004+02:00'
author: Marcus Hammarberg
tags: - TFS
modified_time: '2010-12-14T16:20:33.256+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-6393301215503286885
blogger_orig_url: http://www.marcusoft.net/2008/08/warning-vsp1024-unable-to-open-file.html
---

This warning occurs when doing testing with <span
id="SPELLING_ERROR_0" class="blsp-spelling-error">MSTest</span> and
running the test under code coverage. It is related to the warning
"<span style="font-family:courier new;">warning <span
id="SPELLING_ERROR_1" class="blsp-spelling-error">VSP</span>2013:
Instrumenting this image requires it to run as a 32-bit process. The
<span id="SPELLING_ERROR_2" class="blsp-spelling-error">CLR</span>
header flags have been updated to reflect this.</span>"

and has confused me a lot. Especially since, when running the tests in a
build script, the warning seems to come and go.

No fear; the solution is quite simple (thanks to [this excellent forum
post](http://forums.microsoft.com/MSDN/ShowPost.aspx?PostID=2149662&SiteID=1));
here is what you need to do:

-   Find the test configuration file <span id="SPELLING_ERROR_3"
    class="blsp-spelling-corrected">you're</span> using for the test run
    under code coverage. It is <span id="SPELLING_ERROR_4"
    class="blsp-spelling-corrected">usually</span> called <span
    style="font-family:courier new;"><span id="SPELLING_ERROR_5"
    class="blsp-spelling-error">LocalTestRun</span>.<span
    id="SPELLING_ERROR_6"
    class="blsp-spelling-error">testrunconfig</span></span> and resides
    in the solution root.
-   Open the file in a XML-editor
-   Find all the <span style="font-family:courier new;"><span
    id="SPELLING_ERROR_7"
    class="blsp-spelling-error">CodeCoverageItem</span></span>-elements
    change (or add) the attribute
    <span style="font-family:courier new;"><span id="SPELLING_ERROR_8"
    class="blsp-spelling-error">instrumentInPlace</span></span> from
    "**true**" to "**false**"
-   Save and rerun - works like a charm

But hey, I can hear some people say, what is that <span
style="font-family:courier new;"><span>="blsp-spelling-error">instrumentInPlace</span></span>-attribute?
Well that's the <span>="blsp-spelling-error">hmrpf</span>... <span>="blsp-spelling-error">mmm</span> ... <span>="blsp-spelling-error">eeeh</span> - I don't know, to be honest.
From [the <span>="blsp-spelling-error">MSDN</span>-help](http://msdn.microsoft.com/en-us/library/ms243141.aspx)
I only get confused:

"If you need to gather code coverage information while you are testing
code in an assembly, you must first instrument that assembly. The
process of instrumentation adds code that generates code coverage
information into the assembly"

OK - I've got that. But what does "in place" means? Can anyone enlighten
me? I haven't yet found a time when I need it...
