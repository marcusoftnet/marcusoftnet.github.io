---
layout: post
title: Custom Tool Warning Cannot Import wsdl portType
date: 2009-01-12T14:10:00.001Z
author: Marcus Hammarberg
tags:
  - .NET
  - Life of a consultant
  - WCF
modified_time: 2009-01-12T14:11:43.467Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-1861622144976994737
blogger_orig_url: http://www.marcusoft.net/2009/01/custom-tool-warning-cannot-import.html
---

I chased this bug for a while and got increasingly frustrated. Here’s what happened: I updated a WCF Service Reference and encountered the error (or actually a warning) in the Error List of Visual Studio. Additionally, the `Reference.vb` file was completely empty.

After some experimentation and frustration (why do I always try things myself before searching for a solution?), I decided to look online. Fortunately, I found the answer quickly.

[Travis Spencer's blog](http://travisspencer.com/blog/2007/11/approaches-to-defining-fault-c.html) provided a solution. Although the title and description of the post were quite different, the solution was what I needed.

In the "Configure Service Reference" dialog box, there is an option called "Reuse types in referenced assemblies." This option is a bit vague in its purpose—essentially, it means the tool attempts to download the assemblies that the service is referencing.

To solve the issue, you don’t need to fully understand this setting. Simply uncheck the "Reuse types in referenced assemblies" box and regenerate the reference. This should resolve the problem!

![Service Reference Settings Dialog Box](http://www.travisspencer.com/stash/blog_images/Service_Reference_Settings_Dialog_Box.gif)
