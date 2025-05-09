---
layout: post
title: Save some space - limit the number of old test results
date: 2009-02-02T21:27:00.001Z
author: Marcus Hammarberg
tags:
  - TDD
modified_time: 2010-12-14T15:20:33.223Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-9179550461340282787
blogger_orig_url: https://www.marcusoft.net/2009/02/save-some-space-limit-number-of-old.html
---

Found an option that really saves some space for TDD:ers in Visual Studio. The test results folder can be limited to a certain number of test runs. That would really have helped me at my latest project where my Test Result folder was several GB.

Go to **Tools** → **Options** → **Test Tools** → **Test Execution**.

When you first exceed that number, you'll be warned that folders will be deleted - thank you very much!
