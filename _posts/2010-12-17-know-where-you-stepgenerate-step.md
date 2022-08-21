---
layout: post
title: Know where you step–generate a step definition
report with SpecFlow
date: '2010-12-16T22:12:00.002+01:00'
author: Marcus Hammarberg
tags:
  - BDD
  - Tools
  - .NET - SpecFlow
modified_time: '2010-12-16T22:14:19.582+01:00'
thumbnail: http://3.bp.blogspot.com/\_TI0jeIedRFk/TQqBIsralMI/AAAAAAAAAqQ/sd0c8q_VuaU/s72-c/step+definition+example+report.png
blogger_id: tag:blogger.com,1999:blog-36533086.post-3594256389110553732
blogger_orig_url: http://www.marcusoft.net/2010/12/know-where-you-stepgenerate-step.html
---

In my
<a href="http://www.marcusoft.net/2010/12/specflowexe-and-mstest.html"
target="_blank">recent ventures</a> into DOS-country and the
<a href="http://www.specflow.org/" target="_blank">SpecFlow</a>.exe I
noticed one last flag or subcommand that the SpecFlow.exe accepts;
stepdefinitionreport.
This subcommand will go through all your features and see which step
definitions are called, how many times they are called and also if there
is any step definitions that isn’t called at all.
OK – that sounds real good, but for the life for me I <a
href="http://groups.google.com/group/specflow/browse_thread/thread/b155ed8f56b23c11/37889ab6ec087f3c#37889ab6ec087f3c"
target="_blank">couldn’t get it to work</a>. But since the source is
open and available from <a href="https://github.com/techtalk/SpecFlow"
target="_blank">gitHub.com</a> I simply pulled a version down and tried
to debug the code.
And before long I found the solution. SpecFlow (now 2010-12-16) uses
.NET framework 3.5, but my specifications were written using .NET 4.0.
There are some reflection going on inside the step definition report
code and that doesn’t work very well (loading assemblies from different
framework versions).
OK – I simply change the .NET framework to 4.0 and compiled myself a
local version and tried the command against that version. And ... it
worked!
Here is the command I used:

> ``` brush:
> SpecFlow.exe stepdefinitionreport Specs\Specs.csproj
> ```


That produces a report as follows:


<div class="separator" style="clear: both; text-align: center;">

<a
href="http://3.bp.blogspot.com/_TI0jeIedRFk/TQqBIsralMI/AAAAAAAAAqQ/sd0c8q_VuaU/s1600/step+definition+example+report.png"
data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
src="http://3.bp.blogspot.com/_TI0jeIedRFk/TQqBIsralMI/AAAAAAAAAqQ/sd0c8q_VuaU/s320/step+definition+example+report.png"
data-border="0" width="320" height="203" /></a>

</div>



The report could be very useful I think especially if you have a large
project with loads of steps.

I updated
<a href="https://github.com/marcusoftnet/Demo-Reporting-with-MsTest"
target="_blank">my code and pushed it here.</a>
