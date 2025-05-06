---
layout: post
title: Know where you step–generate a step definition report with SpecFlow
date: 2010-12-16T21:12:00.002Z
author: Marcus Hammarberg
tags:
  - BDD
  - Tools
  - .NET
  - SpecFlow
modified_time: 2010-12-16T21:14:19.582Z
thumbnail: /img/step_definition_example_report.png
blogger_id: tag:blogger.com,1999:blog-36533086.post-3594256389110553732
blogger_orig_url: https://www.marcusoft.net/2010/12/know-where-you-stepgenerate-step.html
---

In my [recent ventures](https://www.marcusoft.net/2010/12/specflowexe-and-mstest.html) into DOS-country and the [SpecFlow](http://www.specflow.org/).exe I noticed one last flag or subcommand that the SpecFlow.exe accepts; StepDefinitionReport. This subcommand will go through all your features and see which step definitions are called, how many times they are called and also if there is any step definitions that isn’t called at all. OK – that sounds real good, but for the life for me I [couldn’t get it to work](http://groups.google.com/group/specflow/browse_thread/thread/b155ed8f56b23c11/37889ab6ec087f3c#37889ab6ec087f3c).

But since the source is open and available from [gitHub.com](https://github.com/techtalk/SpecFlow) I simply pulled a version down and tried to debug the code. And before long I found the solution. SpecFlow (now 2010-12-16) uses .NET framework 3.5, but my specifications were written using .NET 4.0. There are some reflection going on inside the step definition report code and that doesn’t work very well (loading assemblies from different framework versions).

OK – I simply change the .NET framework to 4.0 and compiled myself a local version and tried the command against that version. And ... it worked! Here is the command I used:

```bat
SpecFlow.exe stepDefinitionReport Specs\Specs.csproj
```

That produces a report as follows:

![step definition example report](/img/step_definition_example_report.png)

The report could be very useful I think especially if you have a large project with loads of steps.

I updated [my code and pushed it here.](https://github.com/marcusoftnet/Demo-Reporting-with-MsTest)
