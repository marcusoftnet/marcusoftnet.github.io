---
layout: post
title: "Marcus Node Bits - Let us flex Koa Js, shall we?"
date: 2014-04-08T12:12:00.000Z
author: Marcus Hammarberg
tags:
  - Node
  - Javascript
  - Tools
  - Koa
modified_time: 2014-05-23T03:28:22.873Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-628425760225674799
blogger_orig_url: "http://www.marcusoft.net/2014/03/koaExamples.html"
---

The [first](http://www.marcusoft.net/2014/03/koaintro.html) [two](http://www.marcusoft.net/2014/03/koaGenYield.html) post of this mini-series, we picked up the basic on getting [Koa Js](http://www.koajs.com/) to start as well as understand what it's build from and the concepts behind it. It's time to do something for real. Well over time, one might add. This post is all about using Koa to build different websites and web api's.

By using [Koas own examples](https://github.com/koajs/examples/) I will show you how you can use Koa for a lot of common tasks and scenarios. Let's dive right in.

<!-- excerpt-end -->

### Middleware

The first thing to understand is that Koa is very modular. "Ok, got it", you think. "No", I answer, "**very** modular! The bits are tiny." So a Koa application is to a large extent made up by middleware you include, that is not included per default. The list of [middleware is quite staggering](https://github.com/koajs/koa/wiki) and will quite some time to learn and take in. Luckily you don't have to learn all of them, and they are so tiny that they one-by-one is not a problem.

You should also check out the [co-project](https://github.com/visionmedia/co) that provide generator/yield style access to a [VAST amount of features and scenarios](https://github.com/visionmedia/co/wiki). [Co-monk](https://github.com/visionmedia/co-monk) is just one example, that we saw in the [last post](http://www.marcusoft.net/2014/03/koaGenYield.html) and will meet again later in this post.
