---
layout: post
title: Resolving with Unity and Policy Injection using extension methods
date: 2010-02-17T10:05:00.001Z
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
modified_time: 2010-12-14T15:23:11.099Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-4787243305328550278
blogger_orig_url: http://www.marcusoft.net/2010/02/resolving-with-unity-and-policy.html
---


I actually thought that this was going to be a small thing. The
<a href="http://msdn.microsoft.com/en-us/library/dd140117.aspx"
target="_blank">Unity application block</a> is Microsoft’s
<a href="http://www.martinfowler.com/articles/injection.html"
target="_blank">IoC-container</a>, part of the
<a href="http://msdn.microsoft.com/en-us/library/cc467894.aspx"
target="_blank">Enterprise Library</a>. The
<a href="http://msdn.microsoft.com/en-us/library/cc309507.aspx"
target="_blank">Policy Injection application block (PIAB)</a> is
Microsoft’s
<a href="http://en.wikipedia.org/wiki/Aspect-oriented_programming"
target="_blank">AOP framework</a>, also part of the Enterprise Library.

You’d think that it would be easy to integrate the two… But it’s not…
that simple. Actually that is stranger than it first sound because <a
href="http://www.codewrecks.com/blog/index.php/2009/01/26/combine-policy-injection-application-block-with-unity/"
target="_blank">apparently they are calling each other</a> internally.

OK – I want it to be easy to combine them, so I have written two
extension methods of
<a href="http://msdn.microsoft.com/en-us/library/cc440947.aspx"
target="_blank">UnityContainer</a> that make it easer.

Here is the extension methods:

And here is some tests showing the usage:

Of course I haven’t thought this out by myself. That takes time. I want
things fast. So I steal ;). Thanks goes to this <a
href="http://www.codewrecks.com/blog/index.php/2009/01/26/combine-policy-injection-application-block-with-unity/"
target="_blank">blogpost</a> that helped me on the way and Christer and
Anders who supplied me with some great input on the way.

Yeah that’s right here is the <a
href="http://dl.dropbox.com/u/2408484/ResolvingWithPolicyInjection.zip"
target="_blank">complete code example.</a> And here is a services that
<a
href="http://www.marcusoft.net/2008/01/convert-c-to-vbnet-and-back-again.html"
target="_blank">translates C# to VB.NET</a> if that’s your preference,
mr Scott. :)
