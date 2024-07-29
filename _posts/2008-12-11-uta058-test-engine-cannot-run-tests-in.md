---
layout: post
title: UTA058 The test engine cannot run tests in the assembly for our integration test
date: 2008-12-11T13:35:00.001Z
author: Marcus Hammarberg
tags: null
modified_time: 2008-12-11T13:35:07.107Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5921990269670504569
blogger_orig_url: http://www.marcusoft.net/2008/12/uta058-test-engine-cannot-run-tests-in.html
---

We have a MsTest DLL that contains our integration tests, which is run after each deploy to our daily build environment.

However, on our new build server, we ran into problems with the following error message:

> "UTA058: The test engine cannot run tests in the assembly"

It seems that you need to configure the .NET Framework to allow running assemblies from network shares.

I [found this description](http://blogs.msdn.com/charles_sterling/archive/2008/06/03/the-test-engine-cannot-run-tests-in-the-assembly-tests-dll-because-the-assembly-is-not-fully-trusted-by-net-framework-security-policy.aspx) on how to solve it (potentially the longest URL on the net ;)).

But we ran into more trouble... The .NET Framework 2.0 Configuration was nowhere to be found. As it [seems](http://blogs.msdn.com/astebner/archive/2005/12/19/505734.aspx), this tool disappears when the [.NET Framework 2.0 SDK](http://www.microsoft.com/downloads/details.aspx?FamilyID=fe6f2099-b7b4-4f47-a244-c96d69c35dec&DisplayLang=en) is installed. Where it disappeared to is another question that I haven't found an answer to.

However, the [great description](http://blogs.msdn.com/charles_sterling/archive/2008/06/03/the-test-engine-cannot-run-tests-in-the-assembly-tests-dll-because-the-assembly-is-not-fully-trusted-by-net-framework-security-policy.aspx) also told us how to handle the problem on the command prompt, with the [caspol](http://msdn.microsoft.com/en-us/library/cb6t8dtz(VS.80).aspx) tool.

To make a long story short, this command solved the problem on our build machine. Good enough for us:

```bash
caspol -machine -addgroup 1 -url \\[machine\]\Drops\* FullTrust -name FileW
```