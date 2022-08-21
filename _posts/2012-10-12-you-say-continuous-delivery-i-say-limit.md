---
layout: post
title: You say 'continuous delivery', I say 'limit WIP'
date: '2012-10-12T09:57:00.000+02:00'
author: Marcus Hammarberg
tags: -
Tools - Kanban - Agile modified_time: '2012-10-12T12:25:44.623+02:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-6086100727965739079
blogger_orig_url: http://www.marcusoft.net/2012/10/you-say-continuous-delivery-i-say-limit.html
---

<a href="http://continuous-delivery.thoughtworks.com/"
target="_blank">Continuous delivery</a> is something that everyone seems
to be talking about these days. And it's very cool.
Put very simply you can say that it's striving for releasing
**every** change you do in your code base and configuration to the
production environment.

This can seem like a very daunting task to take on but if you think
about it, it only has to do with us taking on to much work in process.
In this blog post I'll elaborate on some thoughts around that.



### Continuous delivery is not hard at all

This little conversation took place the other day when I explained
continuous delivery for a colleague:

"When is the easiest day to release a system?"
"Huh?"
"The first day. Continuous delivery is to just keep doing that ever
day"

Yeah - it's one of those; that's easy for you to say, but there's a
great amount of truth in there as well. It is actually pretty easy to
release the system to production the first day; nothing hard to compile,
the automated tests are easy to write, the build and release pipeline is
super easy to set up.
All of these task are easy to do with a blank sheet, new environment and
very few moving parts in the system.

Way, way back in 1999 I had a friend that thought me something profound
around releasing early. This was before the time of TDD, automated
builds and even good source control practices in some cases. Build was
often done on a developer machine and then copied into production by
hand.

My friend told me that he tried to release the system after one week of
coding; "I always try to do a release after the first week". I don't
know if he kept on doing it though nor do I know the reasons for him to
do so. But I do remember my reaction - I laughed. Shame on me.
Sorry Anders - that's was brilliant. Just didn't get it back then.

Early on in the systems lifetime we have a lot of opportunities to get
some good habits and policies in place. That's also easier to do since
the system is so small and easy to change.

### Continuous delivery is very hard indeed

<a
href="http://www.amazon.com/gp/product/0321601912?tag=contindelive-20"
target="_blank">The book on continuous delivery</a> is thick and
completely littered with tips, solutions to common problems and guidance
on how to get continuous delivery to work. And this is for a reason -
continuous delivery is hard stuff!

> Hey - wait a minute... Didn't you just write that ...
> Yes, I did. But stay with me for a while and something interesting
> might fall out. 

In a system that has been around for a while we have a big code base, a
lot of dependencies to other systems, runs on several servers, no
automated tests and even organisations that guard access to different
parts of the system - continuous delivery is hard.  You have to get all
of those part aligned and in good shape to be able to create frequent
releases of the system.

To even get started can be daunting since it will take a long time to
see result on the broader scale. The whole chain (every commit is
released) is far away and the changes we do takes us there in painfully
small steps. It's easy to just ditch the whole idea.

But you shouldn't! There's great value in your efforts and remember the
<a
href="http://programmer.97things.oreilly.com/wiki/index.php/The_Boy_Scout_Rule"
target="_blank">boy scout rule</a>: leave the system in a little better
shape than you found it. We will get there. Every step is one step
closer to it.

### What is the difference then?

<div>

In one end continuous delivery is hard and seemingly impossible to get
started with. On the other side of things continuous delivery is easy to
do and get started with. What's the difference then? 

</div>

<div>



</div>

<div>

WIP. <a href="http://en.wikipedia.org/wiki/Work_in_process"
target="_blank">Work in process</a>. Doing a lot of stuff at the same
time. This is a key concept in lean and well known way of increasing the
flow of work in your workflow is to limit work in process. 

</div>

<div>



</div>

<div>

Anders, that does release after the first week, he has a WIP-load of 1
weeks coding worth. The company that releases every 4 month has
increased that to 4 months of changes that need to be tested, 
dependencies that needs to be tracked etc. 

</div>

<div>

If you release on day 1 the WIP is tiny. And thereby easy to handle. To
release every commit/change to the system is lowering the WIP even
more. 

</div>

<div>



</div>

<div>

A couple of things to note here:

</div>

<div>

-   You chose! There's nothing technical that forces us to do releases
    more seldom. You can change that policy. Or even better set it at
    the outset of you project. <a
    href="http://www.marcusoft.net/2012/05/deploying-often-is-betteragile-for-non.html"
    target="_blank">Still we chose not to</a>
-   If you release at day one you have a super low WIP, as noted. Here's
    some good news; if you then do a release on day 2 that WIP is still
    just 1 day. It never increases. You can keep it low.
-   There's a lot (!) of other good things that come
    from preferring small stuff often rather big ones seldom; business
    agility, less risk, higher trust with stakeholders, higher
    motivation etc. Seeking a lower WIP can only do you good.
    Customers want stuff in production - not a lot of stuff almost in
    production. 

### Summary and what I didn't talked about

</div>

<div>

In this post I just contrasted two ways of looking a deployment to see
that it's really just a choice we make. The choice of doing a lot of
changes, dependencies, environment tweaks, coding and testing at the
same time - or not. 

</div>

<div>

The choice is yours. It starts the first day of your system. 

</div>

<div>



</div>

<div>

Continuous delivery is much more than this of course. I haven't talked
anything about HOW to get this to work. There's <a
href="http://www.amazon.com/gp/product/0321601912?tag=contindelive-20"
target="_blank">great resources</a> on
<a href="http://continuous-delivery.thoughtworks.com/"
target="_blank">this</a> that does it
<a href="http://t.co/GP2GZjOM" target="_blank">much better</a> than me.

</div>
