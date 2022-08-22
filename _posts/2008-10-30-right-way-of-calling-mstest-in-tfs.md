---
layout: post
title: The right way of calling MSTest in a TFS build script
date: 2008-10-30T10:49:00.004+01:00
author: Marcus Hammarberg
tags:
  - TFS
  - MSBuild
  - TDD
modified_time: 2011-10-04T14:35:06.154+02:00
blogger_id: tag:blogger.com,1999:blog-36533086.post-4478037245458920181
blogger_orig_url: http://www.marcusoft.net/2008/10/right-way-of-calling-mstest-in-tfs.html
---

OK - sometimes it just to confess - I took a chance, or didn't know
what I was doing - call it what you want.

In TFS Build-scripts there are a much nicer way of calling MSTest than
the [Exec-task as I
suggested.](http://www.marcusoft.net/2008/10/how-to-run-mstest-with-publish.html)
There is already a task for it, called
[TestToolsTask.](http://msdn.microsoft.com/en-us/library/aa721750%28VS.80%29.aspx)
With this task you can much easier reach all the properties you need.
And it even contains some undocumented features such as the
[TestContainer](http://blogs.msdn.com/buckh/archive/2006/11/09/updated-version-of-new-testtoolstask.aspx)-property.

Here is my updated version on how to call the task:

>     <TestToolsTask   TestContainers="$(BinariesRoot)\Debug\Company.Service.Host.Test.Integration.dll"
>               BuildFlavor="%(ConfigurationToBuild.FlavorToBuild)"
>               Platform="%(ConfigurationToBuild.PlatformToBuild)"
>               PublishServer="$(TeamFoundationServerUrl)"
>               PublishBuild="$(BuildNumber)"
>               PathToResultsFilesRoot="$(TestResultsRoot)\..\IntegrationTestResults"
>               TeamProject="Betalningsplattformen2"
>               ContinueOnError="true" />
