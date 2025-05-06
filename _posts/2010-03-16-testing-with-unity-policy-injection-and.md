---
layout: post
title: Testing with Unity, Policy injection and solving “Ambiguous match found.
  (Strategy type Instance Interception Strategy” problem
date: 2010-03-16T12:04:00.001Z
author: Marcus Hammarberg
tags:
  - .NET
  - Life of a consultant
modified_time: 2010-03-16T12:04:10.748Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-7189093225452166118
blogger_orig_url: https://www.marcusoft.net/2010/03/testing-with-unity-policy-injection-and.html
---

I have been chasing this for quite some time now, about 4 days on and off. But now I have nailed it, thanks to Christer Cederborg – my Unity beacon in the dependency injection mist.

OK – the problem is as follows; I have an object factory that encapsulates the calls to <a href="http://www.codeplex.com/unity" target="_blank">Unity</a> for registration and resolving. This is done because I want to control if the resolved objects should be wrapped with <a href="http://msdn.microsoft.com/en-us/library/cc309507.aspx" target="_blank">PolicyInjection</a> or not.

However I ran into problem when I created test for my code. In the top most layer an resolved started to fail for the layers beneath them. I started to get an error which basically said:

> **Ambiguous match found. (Strategy type Instance Interception Strategy…**

As often, I didn’t understand the error message and started to chase down the wrong things. I first thought that this had to do with the fact that I was mocking (with <a href="http://code.google.com/p/moq/" target="_blank">Moq</a>) the object that I was resolving. And since Moq creates a type on the fly I could not possible create a policy match for it.

But that was not it. In fact it was simple and of course my own doing.

My ObjectFactory is a singleton – I want to resolve against the same container. But the reference to the <a href="http://msdn.microsoft.com/en-us/library/cc440947.aspx" target="_blank">UnityContainer</a> was done inline right where variable was declared. Ugly and it jumped up and bit me…

OK – the solution was to have a Init-method that creates a new
UnityContainer. And to call it in the test-setup (before each test) and
in the application before the ObjectFactory is configured.

Easy – when you looked at the right place.
