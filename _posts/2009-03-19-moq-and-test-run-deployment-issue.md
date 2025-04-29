---
layout: post
title: MOQ and the Test Run deployment issue - The location of the file or directory problem
date: 2009-03-19T12:44:00.001Z
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
  - Life of a consultant
  - TDD
modified_time: 2010-12-14T15:22:38.199Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-8292620657830390019
blogger_orig_url: https://www.marcusoft.net/2009/03/moq-and-test-run-deployment-issue.html
---

The [NerdDinner](http://weblogs.asp.net/scottgu/archive/2009/03/10/free-asp-net-mvc-ebook-tutorial.aspx) example uses the [MOQ-framework](http://code.google.com/p/moq/) for mocking some authentication mechanism.

This framework is new to me and when I downloaded it (one dll – great stuff!) I immediately ran into the "Test Run deployment issue: The location of the file or directory" – exception.

Here is a [great article explaining](http://thepursuitofalife.com/test-run-deployment-issue-in-vsts/) how to solve it. I needed to restart Visual Studio to get it to "take" – but then it worked great.
