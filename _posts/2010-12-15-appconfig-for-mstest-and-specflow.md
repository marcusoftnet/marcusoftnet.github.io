---
layout: post
title: App.config for SpecFlow using MsTest
date: 2010-12-15T08:33:00.001Z
author: Marcus Hammarberg
tags:
  - .NET
  - SpecFlow
modified_time: 2010-12-15T11:51:20.454Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5961012444005971982
blogger_orig_url: http://www.marcusoft.net/2010/12/appconfig-for-mstest-and-specflow.html
---


Every time I need to configure MsTest to work with
<a href="http://www.specflow.org" target="_blank">SpecFlow</a> I forget
the syntax of it... Especially the first part...

The fact that it took me about 30 min to write this post is evidence
enough that I should not spend any more on this. Here is my reference:

``` brush:
<?xml version="1.0" encoding="utf-8" ?>
<configuration>
  <configSections>
    <section name="specFlow" type="TechTalk.SpecFlow.Configuration.ConfigurationSectionHandler, TechTalk.SpecFlow"/>
  </configSections>
 <specFlow>
    <unitTestProvider name="MsTest" />
  </specFlow>
</configuration>
```

Also there is some additional config setting that you might want to
tweak. Here is a complete version with default values:

``` brush:
<?xml version="1.0" encoding="utf-8" ?>
<configuration>
  <configSections>
    <section name="specFlow" type="TechTalk.SpecFlow.Configuration.ConfigurationSectionHandler, TechTalk.SpecFlow"/>
  </configSections>
 <specFlow>
    <trace traceSuccessfulSteps="true" traceTimings="false" minTracedDuration="0:0:0.1"/>
  </specFlow>
</configuration>
```
