---
layout: post
title: Code Freeze, Recompile, and Code Generation - Not So Scary with CD
date: 2012-11-02T10:37:00.000Z
author: Marcus Hammarberg
tags:
  - Agile
  - Continuous delivery
modified_time: 2012-11-02T10:37:35.910Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-2349708152375787890
blogger_orig_url: https://www.marcusoft.net/2012/11/ProblemsThatGoesAwayWithCD.html
---

Sure enough... There's an abbreviation for [Continuous Delivery. It's CD](http://en.wikipedia.org/wiki/Continuous_delivery). I think this means that it's important :)

The last couple of days I've run into a lot of expressions, true-isms and problems that we take for granted that are turned a bit on their heads when looking into releasing often. And with often I mean *real* often - like all the time. No, really, I mean continuous delivering.

Yes, I know that it first feels a bit scary and unachievable, but in this blog post I'll try to show you a couple of things that make that strive worthwhile. I think.

## Continuous Delivery?

![Continuous Delivery](http://www.industriallogic.com/wp-content/uploads/2011/04/continuousDelivery_big_None.jpg)

So the short and sweet introduction is really this; push EVERY change to your code, configuration, and environment to production. Do that all the time.

To unwrap that it, of course, means that you need to have your code, configuration, and environment managed in a way that allows for these rapid kind of changes.

Your artifacts need to be version controlled for starters. Yes, even the environment and configuration to it. So that you easily can roll it out and back again if needed.

The build, test, and deployment process need to be automated. Yes, even the testing and deployment. Otherwise, you'll bore your team down within the first 2 hours of the system's lifetime.

The quality of everything needs our highest attention. Yes, a broken build is not acceptable. As I heard [Jez Humble](http://jezhumble.net/) say: "In a Continuous delivery team, the highest priority is not getting new features out, it's keeping the system in a deployable state." All the time.

This is quite hard to achieve. Yes, but it's worth it. Stay with me.

### A Thought Experiment

![Switch](http://livingmaxwell.wpengine.netdna-cdn.com/wp-content/uploads/2011/12/switch-book.jpg)

When faced with hard stuff I like to flip the coin and see a world where the problem was solved already. I picked this up from the excellent book [Switch: How to Change Things When Change Is Hard](http://heathbrothers.com/switch/). And a little bit from Lean and the [Toyota Kata](http://www-personal.umich.edu/~mrother/Homepage.html).

What got Toyota to think differently about optimizing for flow and minimizing WIP in a time when everybody else went for mass production and optimizing for resource allocation? Probably the fact that they were bombed to pieces. They didn't have any stocks, nor money to keep one. They could only build cars for the people that ordered them and hence needed them to flow fast from order to the finished product. It didn't for starters but that was what they needed to do.

So they flipped the way they thought about the problem: we need to be here [future idealized state]. How do we get there? Let's try some different experiments to see if we get closer or further away from that.

Ok - off on a tangent here. But the idea to think about an ideal future and see how wonderful everything would be there, to then try to get there.

So, imagine that you had continuous delivery in place for your system. Just imagine all the things that used to be big problems, things that you avoided and thought of as bad - what would happen with them. Here's a couple of ones that I've thought of lately:

### The Problems

#### Code Freeze

![Code Freeze](http://cdn.memegenerator.net/instances/400x/25013340.jpg)

Code Freeze - oh how I hate that phrase. You know the one: "Ok - people. 2 weeks left to release. No-one touches the code! I declare Code Freeze!" When that's uttered these days I say something like: "Great then we all can go home. Let's go!".

Because it's never true. You still touch the code. Of course. But now you do it with a bad conscience. And for the code you change, you have to go through a Change board of sorts... Yes, I know. I don't want that either.

Imagine that every change is deployed. You deploy several times a day. There is no code freeze in such context. Code changing is the way you roll. It's supposed to be changed. It's built to be changed. Often. The way we've constructed our build-test-deploy-pipeline will help us keep it good and safe.

#### Recompile

![Recompile](http://fixitwizkid.com/attachments/big_red_button2-jpg.731/)

I remember when we wrote lots of code, in strange ways, just to avoid recompilation. We created strange tables (Id, Key, Value) that allowed us to add columns. Just to **avoid** recompiling our code. And got horrors to maintain.

We put more and more information, even business rules or stored procedures, so that we could change it without recompiling and deploy.

Brrr - I shiver at the thought.

But, mind you well, recompilation of big systems is expensive under some circumstances. Just getting hold of the code, doing regression tests of the complete system could make any release manager start crying, right?

> "No, please. No more. Don't change that code anymore. Hands off!"

Imagine that a recompilation was free. And deploy is done as part of the normal procedure at least several times a day. We take pride in being able to change our system often and securely. Recompilation, testing, and deployment should just be a shrug of your shoulders, not a shiver down your spine.

#### Code Generation

Code generation has long been frowned upon. And often for good reasons. I'm not saying that it's the best thing since sliced bread but it can be much nicer to handle.

You know what I'm talking about; building out a typed set of classes for every table in the database (just to mention something I've done a couple of years ago). We hated that functionality after a while. Because we needed to recompile and re-deploy it every time we changed something in the database. Something that we didn't want in periods of code freeze. Or just thinking about recompiling the thing. Brrr.

This code generation (if you wanted it) is of course also part of your deployment pipeline. That gets run every time somebody changes something. And now the problem is not so big or scary anymore.

### Summary

Well, that was just three short examples that popped into my head when I started to think about this. Please don't read this as a silver bullet or understand it as I'm saying that getting continuous delivery into place is something easy.

It's really not. For a legacy system, it can be really hard work. But I am saying that it's worth it. And a wonderful future is to be had once we get there. This is just taking a few programming related things and looking closer into them.

Now... What should we start changing in order to move closer to that future?
