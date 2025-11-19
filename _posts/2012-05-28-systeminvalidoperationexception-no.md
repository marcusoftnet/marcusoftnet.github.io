---
layout: post
title: System.InvalidOperationException No automation provider available MsTest and
  FluentAutomation
date: 2012-05-28T14:08:00.001Z
author: Marcus Hammarberg
tags:
  - .NET
  - Life of a consultant
  - C#
modified_time: 2012-05-28T14:08:22.349Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-2846331516279827243
blogger_orig_url: https://www.marcusoft.net/2012/05/systeminvalidoperationexception-no.html
---

We’ve run into a little issue with <a href="http://fluent.stirno.com/blog/" target="_blank">FluentAutomation</a> and using MsTest at my current client. I’ve <a href="https://www.marcusoft.net/2012/05/specflow-page-objects-and.html" target="_blank">blogged about the setup before</a> but then I used <a href="http://www.nunit.org/" target="_blank">NUnit</a> and everything worked just fine. With MsTest… we had some problems. The first was an exception that was thrown to us like above:

```text
System.InvalidOperationException: No automation provider available
````

It was a quite awhile since I’ve used MsTest and I’ve forgot about some of it’s quirks. With the combined help of <a href="http://hakanforss.wordpress.com/" target="_blank">Håkan Forss</a> and <a href="http://www.hugohaggmark.com/" target="_blank">Hugo Häggmark</a> I managed to get this to work.

Scroll to the end for the short version, by the way.

The first thing that I had forgot was that MsTest uses a Visual Studio project template of it’s own. You cannot use the Windows Class Library template, but rather should use the Test project (under the Test-category).

Once that was out of the way – we hit the error message above. To solve that we started to try to understand why. It turns out that FluentAutomation uses some sort of dependency resolver internally (it’s <a href="https://github.com/grumpydev/TinyIoC" target="_blank">TinyIoC</a> btw) and after reading through the FluentAutomation source I realized that the dependency wasn’t resolved properly. It couldn’t find a implementation of the needed interface.

About here Håkan reminded me of that MsTest actually is copying all the files it uses to run into a separate TestResults folder. This is a bit strange but quite handy as you then can move that folder to a server and run the tests there, or maybe rerun the tests exactly as it was at a certain time of execution.

But in our case the dependency resolver didn’t find the implementation for a needed interface. Presumably because it didn’t find the dll’s in the folder it executed in – TestResults.

One thing that not many people know is that you can instruct MsTest about which files it should deploy to the TestResults folder. This is done by opening the Local.testsettings file and go the the Deployment-tab. Here you can;

- Enable file deployment
- Tell MsTest which files and folders to deploy.

So first we did that. We told MsTest to deploy all of the files in the <a href="http://www.nuget.org" target="_blank">NuGet</a> packages folder to the TestResults-folder. And it worked!

But there’s a much easier way! When you install FluentAutomation via NuGet all the needed references will have it’s CopyLocal-attribute set to True per default. And MsTest will automatically deploy all the CopyLocal = true files when deployment is enabled. Thanks Hugo for that tip.

So we simply checked the Enable deployment checkbox and it worked!

### Summary

Bah – that was way to long winding. Here’s the short version on how to get MsTest to work with FluentAutomation. From scratch:

Create a new test project (select the Test project template under Test category of project)

```text
Install FluentAutomation via NuGet;
Install-Package FluentAutomation.SeleniumWebDriver
```

Double click the `Local.testsettings` file and go to the Deployment-tab.

- Check the Enable Deployment checkbox
- Click Apply and Close
- Be amazed that the dialog didn’t have a OK-button…

Run the test,
<a href="http://fluent.stirno.com/docs/" target="_blank">for example
this</a>. Beware of any browser automation gotchas. <a
href="https://www.marcusoft.net/2012/05/specflow-page-objects-and.html"
target="_blank">See this post</a>

It should now work!

Hope this help.
