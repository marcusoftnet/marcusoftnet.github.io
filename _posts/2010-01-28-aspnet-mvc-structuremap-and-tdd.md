---
layout: post
title: ASP.NET MVC, StructureMap and … TDD?
date: '2010-01-28T09:26:00.003+01:00'
author: Marcus Hammarberg
tags:
  - BDD -
.NET - NHibernate - ASP.NET MVC - Agile - TDD
modified_time: '2010-12-14T16:19:35.814+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-8081588236115919566
blogger_orig_url: http://www.marcusoft.net/2010/01/aspnet-mvc-structuremap-and-tdd.html
---


I’ve been playing around a bit with
<a href="http://www.asp.net/mVC/" target="_blank">ASP.NET MVC</a> and
StructureMap (an IOC container). It all looks very nice and works
wonder. During this I ran into an excellent blog post by
<a href="http://elijahmanor.com/" target="_blank">Elija Manor</a> on
wiring <a
href="http://elijahmanor.com/webdevdotnet/post/Using-StructureMap-with-ASPNET-MVC-MVC-Contrib.aspx"
target="_blank">StructureMap and ASP.NET MVC together</a>. Beware of the
<a
href="http://haacked.com/archive/2008/07/14/make-routing-ignore-requests-for-a-file-extension.aspx"
target="_blank">favicon-problem though</a>.

Again – i use <a href="https://www.hibernate.org/343.html"
target="_blank">NHibernate</a> and
<a href="http://fluentnhibernate.org/" target="_blank">Fluent
NHibernate</a> which so much nicer than the XML-stuff. The critics to
Fluent NHibernate says that you cannot reach all functionality from
Fluent NHibernate, but <a
href="http://stackoverflow.com/questions/968730/how-to-set-a-configuration-property-when-using-fluent-nhibernate"
target="_blank">here is an example on how to set specific properties in
your configuration</a>. Helped me through this example.

Also found some great code examples from the
<a href="http://tekpub.com/" target="_blank">TekPub</a>
<a href="http://tekpub.com/view/nhibernate/1"
target="_blank">NHibnernate series</a>
<a href="http://github.com/robconery/Kona/blob/master/Kona.Web/"
target="_blank">here</a>.

OK – I've added
“<a href="http://en.wikipedia.org/wiki/Test-driven_development"
target="_blank">TDD</a>?” in the title. I love TDD and it’s my preferred
way of doing code, but
<a href="http://www.blogger.com/dannorth.net/introducing-bdd"
target="_blank">I have a problem</a> (to quote a thinker). I think TDD
doesn’t help my through the broader strokes of my application.

Where do I start? How do I use the test to know that it’s time to add an
repository, or an IOC Container? Do I TDD the IOC-code?

I asked the <a
href="http://groups.google.se/group/sweden-altnet/browse_thread/thread/748166ff04f8c511"
target="_blank">Swedish ALT.NET group a question</a> and got some great
tips, mostly they pointed me to
<a href="http://en.wikipedia.org/wiki/Behavior_Driven_Development"
target="_blank">BDD</a> and those ideas. I also liked the idea of the
<a href="http://alistair.cockburn.us/Walking+skeleton"
target="_blank">Walking skeleton</a>.

But I’m still confused. Can TDD really help you to design a system from
the bottom up, or top-down (BDD) for that matter? Will the design be
improved by the TDD-design technique? I’m not sure.

For now, my thinking is that it’s better to create a very simple design
(MVC + repositories + IOC) to get your “skeleton to walk”, maybe with a
functional/integration test that verify the functionality.

With that foundation in place it becomes easier to add some meat to the
bones (is this skeleton metaphor taken too far yet?) with the normal TDD
techniques and patterns.
