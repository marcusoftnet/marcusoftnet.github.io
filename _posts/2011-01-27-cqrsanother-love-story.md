---
layout: post
title: CQRS–another love story
date: 2011-01-27T08:27:00.001Z
author: Marcus Hammarberg
tags:
  - MobProgramming
  - BDD
  - .NET
  - ÖreDev
  - Kanban
  - Agile
modified_time: 2014-06-02T08:56:52.530Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-7262514878258726848
blogger_orig_url: https://www.marcusoft.net/2011/01/cqrsanother-love-story.html
---


People who know me also know that I easily get all ga-ga, fall in love
in or simply get very excited over thing that I like. Actually the other
day I thought for myself that I right now talk a lot about
<a href="http://en.wikipedia.org/wiki/Behavior_Driven_Development"
target="_blank">BDD</a>,
<a href="http://www.specflow.org" target="_blank">Specflow</a> and
Kanban – simply because I think that these things are just great. A
quote that I often use by Dan North;

> “It’s no silver bullet, but this darn close”

When I thought about that I also came to think that I don’t want to talk
about or focus on things that I don’t feel like that for. There are
simply to many new concepts, frameworks and technologies out there – I
cannot take them all in and of course not be ga-ga over all of them.

The second that thought left my mind I started to watch a recording of
Greg Young from [ÖreDev](http://www.oredev.org) last year. It was called
[“Unleash your domain”](http://vimeo.com/13852695) and was about CQRS.
After a short while – I was in love again. I had another of those before
and after moments. I already knew about this but this time it really got
to me. And stuck!
Before I stepped on the tube I saw things one way – and after I was a
completely different thing. I see my earlier work with new eyes now – I
cannot believe that I wanted to do it that way. Just like when I first
learned about Scrum and agile methods – how could I possibly think that
what I did before was a good way to work?

OK – I a still a newbie to the concepts but I think that the benefits
from the CQRS principles are plain and clear.

- Why should we have one and the same model to do all aspects of our
    application? We have to make trade-offs and compromises. Simply by
    splitting up the read model from the write model we get a much
    simpler management of that
- Why are we often missing verbs in our domain models? The application
    workflow are more often than not in client or rather in the head of
    the user.
- Why are we storing state that we don’t know how it came to be? For
    example; if somebody Create a shopping cart, Add 3 items, Remove 1
    item and Checkout we only store a shopping cart with 2 items. The
    fat that one item was removed in the process is discarded. That
    could be valuable

In the ÖreDev presentation Greg Young hinted a site call
[CQRSInfo.com](http://CQRSInfo.com). I went there yesterday... and MY
GOD! What a site. Loads of [documents](http://cqrsinfo.com/documents/),
[example](http://cqrsinfo.com/examples/) implementations (including [one
in Sculptor](http://cqrsinfo.com/2010/10/29/sculptor-simplecqrs-port/)
by some former colleagues of mine) and this 6 hour + presentation:

I will sure hang out there a lot. Thanks for some truly great content.

I now have another thing that I’m ga-ga over. And they all play nicely
together;

- Kanban to get control over my work and process
- BDD to get the collaboration with stakeholders, behavior
    specifications and testing  and outside-in development in place in a
    nice way.
- And CQRS to create the application in a well designed manner

One of these days I need to write something on how I use them together.
