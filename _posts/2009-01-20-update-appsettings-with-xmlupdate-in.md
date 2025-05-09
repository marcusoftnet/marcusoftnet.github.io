---
layout: post
title: Update AppSettings with XmlUpdate in Build Scripts
date: 2009-01-20T07:00:00.001Z
author: Marcus Hammarberg
tags:
  - Life of a consultant
  - MSBuild
modified_time: 2009-01-20T07:00:15.088Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-3488066834100206897
blogger_orig_url: https://www.marcusoft.net/2009/01/update-appsettings-with-xmlupdate-in.html
---

I know I will chase this one forever if I don't put it up here...

We encountered a situation where we needed to tweak the `AppSettings` section of a configuration before running tests in the build script.

Luckily, there is a solution available. With the `XmlUpdate` task (from the [MSBuild Community Tasks](http://msbuildtasks.tigris.org/)), you can accomplish this—if you know how to write the XPath query.

Here’s how to use it (I found this [example here](http://geekswithblogs.net/paulwhitblog/archive/2006/04/11/74844.aspx)):

```xml
<XmlUpdate
    Namespace="http://schemas.microsoft.com/.NetConfiguration/v2.0"
    XmlFileName="$(SourceDir)\Core\ABSuite\ABClient\App.config"
    Xpath="//configuration/appSettings/add[@key='Main.ConnectionString']/@value"
    Value="$(DatabaseConnectionString)" />
```

Additionally, if you need to brush up on your XPath skills, check out this [XPath tutorial](http://www.zvon.org/xxl/XPathTutorial/Output/examples.html) for some great examples.
