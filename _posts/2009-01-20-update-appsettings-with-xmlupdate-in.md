---
layout: post
title: Update AppSettings with XmlUpdate in build
scripts
date: '2009-01-20T08:00:00.001+01:00'
author: Marcus Hammarberg
tags:
  - Life of a consultant
  - MSBuild
modified_time: '2009-01-20T08:00:15.088+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-3488066834100206897
blogger_orig_url: http://www.marcusoft.net/2009/01/update-appsettings-with-xmlupdate-in.html
---


I know I will chase this one for ever if I don't put it up here...

We ran into a situation where we needed to tweak the AppSettings-section
of an configuration before tests in the build script.

Luckily there is help to be found. With the XmlUpdate-task (in the
<a href="http://msbuildtasks.tigris.org/" target="_blank">MSBuild
Community Tasks</a>) this can be accomplished. IF you know how to write
the XPath-query.

Here is how (found it <a
href="http://geekswithblogs.net/paulwhitblog/archive/2006/04/11/74844.aspx"
target="_blank">here</a>):

> \<XmlUpdate
>    Namespace="<http://schemas.microsoft.com/.NetConfiguration/v2.0>"
>    XmlFileName="$(SourceDir)\Core\ABSuite\ABClient\App.config"
>   
> **Xpath="//configuration/appSettings/add\[@key='Main.ConnectionString'\]/@value"**
>    Value="$(DatabaseConnectionString)"
>   /\>

Also here is a great site to pick up some
<a href="http://www.zvon.org/xxl/XPathTutorial/Output/examples.html"
target="_blank">XPath-skills</a>.
