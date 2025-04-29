---
layout: post
title: Create Text File on the Fly in Build Scripts
date: 2009-01-30T06:49:00.001Z
author: Marcus Hammarberg
tags:
  - Life of a consultant
  - MSBuild
modified_time: 2009-01-30T06:49:02.532Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5722330427089634050
blogger_orig_url: https://www.marcusoft.net/2009/01/create-textfile-on-fly-in-build-scripts.html
---

Yesterday, we made a final touch to our build script (by "we" I mean "I talked about it for five minutes, Christer did it").

We needed to create a `.bat` file that installs our database for a specific version and environment. The necessary information is only known at runtime in the build script.

I remembered there was an [MSBuild community task](http://msbuildtasks.tigris.org/) for this purpose, and Christer found the task [WriteLinesToFile](http://msdn.microsoft.com/en-us/library/ms164305.aspx). He then wrote the following target to create the `.bat` file:

```xml
<ItemGroup>
  <CmdLine Include="@ECHO OFF"/>
  <CmdLine Include="ECHO About to install version $(BuildVersion) on environment $(DeployEnv)"/>
  <CmdLine Include="SET /p passw=Enter DB password for $(DeployEnv): "/>
  <CmdLine Include="CALL main.bat $(DeployEnv) . $(BuildVersion) %passw%"/>
  <CmdLine Include="PAUSE"/>
</ItemGroup>
<WriteLinesToFile
  File="$(PublishWebSitePath)\Database\Installera_$(DeployEnv)_version_$(BuildVersion).bat"
  Lines="@(CmdLine)"
  Overwrite="true"/>
```

This script will prompt the user for a password so that it doesn't need to be hard-coded into the script.

Nice job, Christer—nicely done!