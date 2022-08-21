---
layout: post
title: SOAP UI - a great way to do integration tests
for services
date: '2008-12-10T15:39:00.001+01:00'
author: Marcus
Hammarberg
tags:
modified_time: '2008-12-10T15:39:30.545+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-1551771198832030366
blogger_orig_url: http://www.marcusoft.net/2008/12/soap-ui-great-way-to-do-integration.html
---


Just found this
<a href="http://www.soapui.org" target="_blank">tool</a> - or actually
I've used but missed it's greatness...

The <a href="http://www.soapui.org" target="_blank">SoapUI</a> can be
used to automatically generate clients to access web services. But
furthermore it can be used to
<a href="http://www.soapui.org/userguide/functional/index.html"
target="_blank">test web services</a>. With the tool you can generate
test request and setup the expected response. This is setup via a nice
GUI.

The requests and responses can then be run, in sequence or one by one.

What a great way to do integration tests for a service. Just imagine -
you have 100 pre-built request/response-files and just run them (from
the <a href="http://www.soapui.org/userguide/commandline/index.html"
target="_blank">command prompt</a> as part of you nightly build of
course).

Since not much coding skills are required you can easily put the
<a href="http://www.soapui.org" target="_blank">SoapUI</a>  in the hands
of a tester and maintain the requests/responses as checked in files.

Now we just need to find a way to run the test against WCF services. We
can always use basicHttpBinding of course... have to think about it.
