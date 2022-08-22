---
layout: post
title: Applying the Switch framework to developers don’t want to write tests–part III
date: '2012-05-04T12:00:00.000+02:00'
author: Marcus Hammarberg
tags:
  - Tools
  - Life of a consultant
  - Agile
  - TDD
modified_time: '2012-05-04T12:00:05.962+02:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-8461407434616449279
blogger_orig_url: http://www.marcusoft.net/2012/05/applying-switch-framework-to-developers_1663.html
---


This is the last post in my series on how to motivate developers to
write test for their code. Please read the first two posts to get some
context (<a
href="http://www.marcusoft.net/2012/05/applying-switch-framework-to-developers.html"
target="_blank">part 1</a> and <a
href="http://www.marcusoft.net/2012/05/applying-switch-framework-to-developers_04.html"
target="_blank">part 2</a>).

This post talks about the last part of the Switch Framework – Shape the
path. This is all about making the change easier by helping our rider
and elephant to get a smooth path to walk on as they change.

### Tweak the environment

This talks about changing the environment in which the people we’re
trying to change so that it’s easier to change than to not. Microsoft
lately has use the expression; “help developers to fall into the pit of
success”. I like that a lot – that’s what we want here; it should be
easier to do right than to not to.

Everything you can do here to get the tooling out of the way is a great
start. Make sure that your build script is setup so that test is run
automatically and that all your developers have installed some device to
tell them when a build is failing.

Again simplifying the actual writing of the test with some templates and
examples would also help here. Make sure that you help out setting up
test projects in your solution and that they reference the production
code. Every little hurdle you can deflate is a small step closer to
someone reluctant to get started.

### Build habits

The Heath brothers talks about habits in the sense of them being
internalized to us and we don’t think about them. I.e. the rider doesn’t
even have to bother – it’s just done! This can easily be supported by
some simple tools.

One simple thing is to setup something called exit critieras on you
board. It’s like a definition of done for each column. My colleague <a
href="http://hakanforss.wordpress.com/2011/09/05/standard-work-in-software-developmentpart-2/"
target="_blank">Håkan Forss has written extensively</a> on this in a
project which I started and he finished. It was very simple actually
with us just writing done what it meant to be done in this column; for
example “at least one unit test written” (starting small).

Another thing is what’s called “action triggers”, i.e. something in the
environment that tells you to do something or act in a certain way –
like a reflex. This could be done with static code analysis tools such
as <a href="http://stylecop.codeplex.com/" target="_blank">Style Cop</a>
but in my opinion such controls often have the opposite effect. I would
rather let that behavior emerge as your team pick the habits up.

### Rally the herd

To rally the herd is to spread the word and get a behavior to catch on.
Think about tip jars in a bar for example. It’s always “seeded”. This
makes us think; well someone else has … I probably should give that man
some tip also.

Create a forum for people interested in unit testing. Help each other
out. Read books together and discuss it. At my current client we’re
setting up forums for the different roles and get them to meet and
discuss how different situations and problems was solved or handled.
They meet for a “retrospective per role” after each sprint to share and
encourage each other in their work. That could be one trick to get
people to catch the "testing”-bug.

#### Conclusion

And with that we’ve reached the end of this mini-series. I hope that you
have enjoyed reading this and that you have got some ammunition for
convincing developers that testing is cool. And part of our job.
