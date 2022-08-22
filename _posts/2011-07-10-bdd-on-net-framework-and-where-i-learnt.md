---
layout: post
title: BDD on .NET Framework and where I learned about it
date: 2011-07-09T19:02:00.002Z
author: Marcus Hammarberg
tags:
  - BDD
  - .NET
  - Agile
modified_time: 2011-09-14T07:31:18.229Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-7319819737087236385
blogger_orig_url: http://www.marcusoft.net/2011/07/bdd-on-net-framework-and-where-i-learnt.html
---



I got a very well formulated email from Jose Samonte the other day. He
asked me about some resources on
<a href="http://en.wikipedia.org/wiki/Behavior_Driven_Development"
target="_blank">BDD</a> and where to start learning about it. As I think
this is a great question and I’ve struggled and read a lot before I got
a grip on BDD I thought I post my answer publicly.

#### Start here

It all started with a blog post by
<a href="http://dannorth.net" target="_blank">Dan North</a>;
<a href="http://dannorth.net/introducing-bdd"
target="_blank">Introducing BDD</a>. It provides some context on where
the ideas came from and is a good read. While you’re there you should
read
<a href="http://dannorth.net/whats-in-a-story" target="_blank">“What’s
in a story”</a> – that article is equally good and provides a great
background and understanding.

#### Learn from others

Now that we know the background and history we should go on. Much of the
early work (and current to be honest) of the BDD was done on other
platforms than .NET. So I’ve read a lot from the Ruby community, Java
community and other platforms and languages.

One of the best books I’ve read on BDD is
<a href="http://www.pragprog.com/titles/achbd" target="_blank">The RSpec
book</a> – that introduces the thinking behind BDD in Ruby land. It also
introduces <a href="http://cukes.info" target="_blank">Cucumber</a>
which is a tool that have had great influence on the BDD development and
has been ported to other platforms.
<a href="http://www.specflow.org" target="_blank">SpecFlow</a> is such a
port on the .NET platform.

The <a href="http://cukes.info/" target="_blank">Cucumber site</a> is
littered with loads of information, web casts and articles that I have
found useful. Check out
<a href="http://www.teachmetocode.com/screencasts/" target="_blank">Cuke
TV</a> for example.

#### Casts and posts

Other stuff I’ve learned from are (in no particular order):

- The excellent book
    <a href="http://www.growing-object-oriented-software.com"
    target="_blank">Growing Object Oriented Systems Guided by Tests</a>
    (or GOOS for short)
- <a href="http://specflow.org/specflow/screencast.aspx"
    target="_blank">This web cast by Rob Conery</a>
- <a
    href="http://blog.stevensanderson.com/2010/03/03/behavior-driven-development-bdd-with-specflow-and-aspnet-mvc/"
    target="_blank">This blog post by Steven Sandersson</a>
- The <a href="https://github.com/cucumber/cucumber/wiki/Gherkin"
    target="_blank">excellent wiki on Gherkin</a> (the language used by
    Cucumber)
- Loads of stuff on
    <a href="http://gojko.net" target="_blank">Gojko Adzic’s site</a>
- Reading and contributing to the
    <a href="https://github.com/techtalk/SpecFlow/" target="_blank">SpecFlow
    source code on GitHub</a>. I especially like the
    <a href="https://github.com/techtalk/SpecFlow/Tests/FeatureTests"
    target="_blank">FeatureTests</a> that are using SpecFlow itself

I know that this a bit (!!) SpecFlow heavy but that’s how I’ve learned
about these concepts. Please feel free to use another tool if you like.
<a href="http://raconteur.github.com/" target="_blank">Raconteur</a>
looks cool, if you ask me.

If I have forgot something important or useful, please let me know.

Jose – I hope this help. Thanks for giving me the opportunity to write
these links down.
