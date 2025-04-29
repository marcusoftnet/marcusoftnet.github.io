---
layout: post
title: SOAP UI - a great way to do integration tests for services
date: 2008-12-10T14:39:00.001Z
author: Marcus Hammarberg
tags: null
modified_time: 2008-12-10T14:39:30.545Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-1551771198832030366
blogger_orig_url: https://www.marcusoft.net/2008/12/soap-ui-great-way-to-do-integration.html
---

Just found this [tool](http://www.soapui.org) - or actually, I've used it but missed its greatness...

[SoapUI](http://www.soapui.org) can be used to automatically generate clients to access web services. But furthermore, it can be used to [test web services](http://www.soapui.org/userguide/functional/index.html). With the tool, you can generate test requests and set up the expected responses. This is set up via a nice GUI.

The requests and responses can then be run, in sequence or one by one.

What a great way to do integration tests for a service. Just imagine - you have 100 pre-built request/response files and can run them (from the [command prompt](http://www.soapui.org/userguide/commandline/index.html) as part of your nightly build, of course).

Since not much coding is required, you can easily put [SoapUI](http://www.soapui.org) in the hands of a tester and maintain the requests/responses as checked-in files.

Now we just need to find a way to run the test against WCF services. We can always use basicHttpBinding, of course... have to think about it.
