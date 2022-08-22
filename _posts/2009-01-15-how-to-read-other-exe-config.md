---
layout: post
title: How to read other exe's config
date: 2009-01-15T13:02:00.001+01:00
author: Marcus Hammarberg
tags:
  - .NET

  - TDD
modified_time: 2009-01-15T13:02:13.292+01:00
blogger_id: tag:blogger.com,1999:blog-36533086.post-6709170915116823756
blogger_orig_url: http://www.marcusoft.net/2009/01/how-to-read-other-exe-config.html ---

When we're doing integration tests we need to find some settings from
the exe (yes, we're batching some stuff - I am sorry ;)) that we are
testing.

Instead of copying it into the test app.config I discovered a way to
read another exe's configuration - <a
href="http://msdn.microsoft.com/en-us/library/system.configuration.configurationmanager.openmappedexeconfiguration.aspx"
target="_blank">OpenMappedExeConfiguration</a>.

Very useful if a tad ... ugly maybe.
