---
layout: post
title: >-
  UTA058 The test engine cannot run tests in the assembly for out integration
  test
date: 2008-12-11T13:35:00.001Z
author: Marcus Hammarberg
tags: null
modified_time: 2008-12-11T13:35:07.107Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5921990269670504569
blogger_orig_url: http://www.marcusoft.net/2008/12/uta058-test-engine-cannot-run-tests-in.html
---



We have a done a MsTest-dll that contain our integration tests that is
run after each deploy to our daily build environment.

However on our new build server we ran into problems with the following
error message.

"UTA058: The test engine cannot run tests in the assembly"

OK - it seems that you need to configure .NET Framework to allow running
assemblies from network shared.

I <a
href="http://blogs.msdn.com/charles_sterling/archive/2008/06/03/the-test-engine-cannot-run-tests-in-the-assembly-tests-dll-because-the-assembly-is-not-fully-trusted-by-net-framework-security-policy.aspx"
target="_blank">found this description</a> on how to solve it
(potentially the longest URL on the net ;).

But we ran into more trouble... The .NET Framework 2.0 Configuration was
no where to be found. As it
<a href="http://blogs.msdn.com/astebner/archive/2005/12/19/505734.aspx"
target="_blank">seems</a> that tool disappears when the [.NET Framework
2.0
SDK](http://www.microsoft.com/downloads/details.aspx?FamilyID=fe6f2099-b7b4-4f47-a244-c96d69c35dec&DisplayLang=en)
is installed. Where it disappeared to is a another question that I
haven't found an answer to.

However the <a
href="http://blogs.msdn.com/charles_sterling/archive/2008/06/03/the-test-engine-cannot-run-tests-in-the-assembly-tests-dll-because-the-assembly-is-not-fully-trusted-by-net-framework-security-policy.aspx"
target="_blank">great description</a> also told us how to handle the
problem on the command prompt, with the
<a href="http://msdn.microsoft.com/en-us/library/cb6t8dtz(VS.80).aspx"
target="_blank">caspol</a>-tool.

To make a long story short - this command solved the problem on our
build machine. Good enough for us:

> caspol -machine -addgroup 1 -url
> [\\\\\[machine\]\Drops\\](file://\\%5Bmachine%5D\Drops\)* FullTrust
> -name FileW
