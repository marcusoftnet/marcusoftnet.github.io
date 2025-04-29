---
layout: post
title: Calling Sandcastle with response file
date: 2008-11-17T09:41:00.001Z
author: Marcus Hammarberg
tags:
  - Life of a consultant
  - MSBuild
modified_time: 2011-10-04T12:36:14.999Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-3106344506540062585
blogger_orig_url: https://www.marcusoft.net/2008/11/calling-sandcastle-with-response-file.html
---

I've been generating documentation from our XML-comments with [Sandcastle](http://www.codeplex.com/Sandcastle) for quite some time now. It has worked alright but there were some stuff that really annoyed me, I thought that I had to put up with it. But this is the beauty of my line of work comes into play... all of a sudden we've got a new team member. Christer Cederborg from Avega (of course) - a great guy and very knowledgeable in things like build scripts and other. And you get to learn from each other. This is why I am in this business - sharing and knowing. OK - Christer told me that you can use something called a response file to send commands to [Sandcastle](http://www.codeplex.com/Sandcastle). The response file is in fact just the parameters you would send to [Sandcastle](http://www.codeplex.com/Sandcastle) the command line, but in a file. This made us go around the use of [.shfb](http://www.codeplex.com/SHFB)-files.

[Sandcastle Help File Builder](http://www.codeplex.com/SHFB) is certainly a great tool when you generate the documentation manually but is sucks when it comes to incorporating it into a build script. You cannot use wildcards or relative paths in .shfb-files which complicate things in a major way. I actually created two separate file, one for local developer use and one for our build script. They were of course almost always out of sync... But with the use of a response file you can set all the commands you need to [Sandcastle](http://www.codeplex.com/Sandcastle) and get the same result.

Here is a short extract from our response file:

```text
-assembly=SystemName.*.dll, SystemName.*.xml
-dependency=Microsoft.Practices*
-dependency=System.Dependency*
-VisibleItems="InheritedMembers, InheritedFrameworkMembers, Protected, SealedProtected"
-ShowMissingParams=true
-ShowMissingRemarks=false
-ShowMissingReturns=true
```

And here is how to call [Sandcastle](http://www.codeplex.com/Sandcastle) in MsBuild with the use of the response file:

```xml
<PropertyGroup>
    <!-- Sandcastle parameters -->
    <SandCastleExePath>C:\Program Files\EWSoftware\Sandcastle Help File Builder\SandcastleBuilderConsole.exe</SandCastleExePath>
    <SandCastleOuputLocation>$(DropLocation)\SystemDokumentation\Tjanster\</SandCastleOuputLocation>
    <SandCastleWorkingDir>$(CurrentSolutionRoot)\SandCastleWorkingDir\</SandCastleWorkingDir>
    <SandCastleResponseFile>$(CurrentSolutionRoot)\Solution Items\Documentation\SystemName.SandCastleSettings.txt</SandCastleResponseFile>
</PropertyGroup>

<Target Name="GenerateDocumentation" Condition="'$(Documentation)' == 'true'">
    <!-- Clean directories -->
    <RemoveDir Directories="$(SandCastleOuputLocation)" />
    <MakeDir Directories="$(SandCastleOuputLocation)" />
    <RemoveDir Directories="$(SandCastleWorkingDir)" />
    <MakeDir Directories="$(SandCastleWorkingDir)" />
    <!-- Create the documentation with call to Sandcastle with the parameters of the response-file -->
    <Exec WorkingDirectory="$(OutDir)"
        Command="&quot;$(SandCastleExePath)&quot; @&quot;$(SandCastleResponseFile)&quot; -workingpath=&quot;$(SandCastleWorkingDir)&quot; -outputPath=&quot;$(SandCastleOuputLocation)&quot;" />
    <!-- Clean working directory -->
    <RemoveDir Directories="$(SandCastleWorkingDir)" />
</Target>
```
