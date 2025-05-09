---
layout: post
title: Sending parameters to msbuild in TFS
date: 2008-04-10T06:28:00.009Z
author: Marcus Hammarberg
tags:
  - TFS
  - MSBuild
modified_time: 2008-04-10T10:36:33.778Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5196648005050045479
blogger_orig_url: https://www.marcusoft.net/2008/04/sending-parameters-to-msbuild-in-tfs.html
---

The build process in Team Foundation Server is the one part where you still miss some stuff. Although it is much better in TFS 2008 than in TFS 2005 it is still quite cumbersome to handle.

The way you start off with a wizard and then almost always need to go into the .proj-file to do updates is also confusing. Most people don't want to be fiddling around with the nitty-gritty details of a MSBuild-script - it is not pretty.

These, and other reasons, has led many of the projects that I am involved in to create a lot of build scripts - and some of them is not need. Like, for example, you shouldn't be needing a separate build script to deploy to a certain environment, or the deploy part should not have to get and rebuild the sources.

The solution to this is of course to send and handle parameter in your build script. This post is a short introduction to how to do this.

## Parameters in MSBuild-scripts

A MSBuild-script can be started without the assistance of the TFS, of course. For example on the commandline (msbuild.exe). And besides the actual .proj-file the msbuild-engine is going to run through you can send a lot (and I mean a lot) of switches and stuff.

One of them is /p which is a list of parameters (separated by commas) that the script can act on. The parameter becomes a standard property in the build script. So if the build script is started like this:

```bash
msbuild.exe /p:Marcus=12
build.proj
```

it can be reached in the build script like this:

```xml
<Message Text="Marcus has the value:$(Marcus)" /\>
<Target Name="CreateDocumentationWhichTakesALongTime" Condition="$(Marcus)=='12'"\>
```

## Parameters to TFS Builds

But how do you get parameters send to the build script that is run inside TFS?

Well if you are running TFS 2008 you can send additional parameters in the dialog for Queueing new builds - the textbox is called MSBuild command-line arguments (duh!). In this box you give your arguments with the /p-switch;

```text
/p:Marcus=12
```

If you want a certain parameter to go with the build script each and every time you build you can do so via the .rsp-file that is located in the same folder as the build, in Source Control. Here you can add your own custom parameters but also some standard parameters. More on this can be found [here](http://weblogs.asp.net/dmckinstry/archive/2006/07/16/Hints-for-expediting-Team-Build-script-development.aspx).
