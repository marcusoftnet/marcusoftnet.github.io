---
layout: post
title: Supported Step Exporter – watch your language
date: '2010-10-08T16:27:00.001+02:00'
author: Marcus Hammarberg
tags:
  - Tools
  - Life of a consultant
  - C# - SpecFlow
modified_time: '2010-12-14T16:22:38.153+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-8540178614606428776
blogger_orig_url: http://www.marcusoft.net/2010/10/supported-step-exporter-watch-your.html
---


After working intensively with
<a href="http://www.specflow.org" target="_blank">SpecFlow</a> <a
href="http://www.marcusoft.net/2010/08/using-bdd-with-specflow-wpf-and-white_14.html"
target="_blank">for a while now</a> I have experienced something that I
think is common. After a while you have all the steps you need… Or
rather, if you write your step <a
href="http://www.richardlawrence.info/2010/07/20/just-enough-regular-expressions-for-cucumber/"
target="_blank">regular expressions</a> carefully you’ll end up with a
little language that automates the running of your application. So if
you stay within the supported language you can simply write
<a href="http://github.com/aslakhellesoy/cucumber/wiki/gherkin"
target="_blank">Gherkin</a>. In Swedish for example.

It’s really cool to write Swedish that tells what the application should
do. And it does it. I <a
href="http://www.marcusoft.net/2010/09/whitestephelper-small-step-toward.html"
target="_blank">wrote about that experience before</a>. The extension of
this is that non-developers soon can start to write the specs and run
them without any steps needed to be developed. But to do that you’ll
need to have communicate which steps are supported.

Also after a while the supported regular expressions steps can be hard
to remember. Even if you wrote all of it yourself. You soon start to
want some kind of documentation for the supported regular expressions of
your steps. But you don’t want to write that documentation. It’s a
violation to the
<a href="http://en.wikipedia.org/wiki/Don&#39;t_repeat_yourself"
target="_blank">DRY-principle</a> in my opinion.

The coolest thing would be if SpecFlow could give you some kind of
Intellisense for the steps. But until then …

I have written a small console application that searches an assembly for
the Given, When and Then attributes for SpecFlow and produces a very
simple HTML-page. You simply point it to the assembly with your steps
and give it a filename to create. Done!

You can now give that documentation to someone who cannot write the
steps themselves, and they can just all those steps.

You’ll find the small
<a href="http://github.com/marcusoftnet/SupportedStepExporter"
target="_blank">SupportedStepExporter-application here</a>, on
<a href="http://github.com" target="_blank">Github</a>, my new friend.
