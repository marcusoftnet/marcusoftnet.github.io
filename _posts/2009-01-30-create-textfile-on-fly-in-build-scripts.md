---
layout: post
title: Create textfile on the fly in build scripts
date: '2009-01-30T07:49:00.001+01:00'
author: Marcus Hammarberg
tags: -
Life of a consultant - MSBuild
modified_time: '2009-01-30T07:49:02.532+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-5722330427089634050
blogger_orig_url: http://www.marcusoft.net/2009/01/create-textfile-on-fly-in-build-scripts.html
---


Yesterday we did a final touch to our build script (by we I mean "I
talked about it for five minutes, Christer did it").

We wanted to create a bat-file that installs our database in a certain
version to a certain environment. So - the information we need to be
able to do that is only know at runtime in the build-script.

From what I could remember there was a
<a href="http://msbuildtasks.tigris.org/" target="_blank">MSBuild
community task</a> for this - this was my input.

Christer then found the task
<a href="http://msdn.microsoft.com/en-us/library/ms164305.aspx"
target="_blank">WriteLinesToFile</a> and wrote the following target that
creates a bat-file as above.

> \<ItemGroup\>
>       \<CmdLine Include = "@ECHO OFF"/\>
>       \<CmdLine Include = "ECHO About to install version
> $(BuildVersion) on environment $(DeployEnv)"/\>
>       \<CmdLine Include = "SET /p passw=Enter DB password for
> $(DeployEnv): " /\>
>       \<CmdLine Include = "CALL main.bat $(DeployEnv) .
> $(BuildVersion) %passw%"/\>
>       \<CmdLine Include = "PAUSE"/\>
>     \</ItemGroup\>
>     \<WriteLinesToFile
> File="$(PublishWebSitePath)\Database\Installera\_$(DeployEnv)\_version\_$(BuildVersion).bat"
> Lines="@(CmdLine)"
> Overwrite="true"/\>
>
>  

This version will wait for a password from the user so that the 
password didn't need to be hard coded into the script.

Nice Christer - Nice!
