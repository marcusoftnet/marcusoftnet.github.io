---
layout: post
title: Resovling policy enabled objects with Unity 2.0
date: '2010-06-14T10:26:00.001+02:00'
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
modified_time: '2010-12-14T16:22:38.156+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-6094690562014768810
blogger_orig_url: http://www.marcusoft.net/2010/06/resovling-policy-enabled-objects-with.html
---


I had the opportunity to use
<a href="http://unity.codeplex.com/" target="_blank">Unity</a> and
<a href="http://entlib.codeplex.com/" target="_blank">Enterprise
Libarary</a> in my current project. On of the really cool features of
Enterprise Library (and most Dependency Injection frameworks) is the
support for
<a href="http://en.wikipedia.org/wiki/Aspect-oriented_programming"
target="_blank">Aspect Oriented Programming</a>. It’s a really neat way
of handling the cross-cutting concerns in your application.

I was therefore very surprised when I had a really hard time to get,
what I thought was simple, the following scenario to work:

> I want the objects that I resolve to be “policy enabled” – i.e.
> configured in such a way that I can add policies in the configuration
> that can be picked up later and applied to the resolved objects.

That is, it was hard in Enterprise Library 4.1 and Unity 1.2. I had to
scan the net and put together a solution of my own. It was a mix of
extension methods, wrappers and some low-level enterprise library
tweaking. You know, the kind of code that doesn’t make you feel proud
after you wrote it.

And then Unity 2.0 and Enterprise Library was released. All my problems
gone! Everything is simple and the sun is always shining. … Not quite –
the scenario I was looking for was a bit tricky still. But the solution
a lot cleaner.

I asked a question about in on both
<a href="http://stackoverflow.com" target="_blank">StackOverflow</a> and
in the
<a href="http://unity.codeplex.com/Thread/View.aspx?ThreadId=215690"
target="_blank">Unity Community</a> and soon got an answer. In the unity
thread I’ve posted a complete code example of the solution.

In short the answer was to add an extension called <a
href="http://msdn.microsoft.com/en-us/library/ff650299.aspx#unityconfig_create"
target="_blank">EnterpriseLibraryCoreExtension</a>, like this:

> `_container.AddNewExtension<EnterpriseLibraryCoreExtension>();`

Using this extension will instruct Unity to pick up my configuration
with, in this example, the policies and apply them to the resolved
object.
