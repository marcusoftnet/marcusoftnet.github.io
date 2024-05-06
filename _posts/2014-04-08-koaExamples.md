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

### Examples

I wanted to take a look at some of the [examples Koa Js](https://github.com/koajs/examples/) provides and make some comments. [Clone the repository](http://www.marcusoft.net/2014/02/mnb-git.html) and follow along. My plan is that these examples will prove useful for me and you as we start to build "real" things.

Yes, I have copied the example files out to separate gists. This is because I don't trust linking directly to repositories. And the content of the repository files might change too.

There's [one package.json](http://www.marcusoft.net/2014/02/mnb-packagejson.html) for all the examples, which is awesome because that means that we can do "`npm install`" in the root and get all the examples. All examples must be run with the "`node --harmony`" flag, [as described earlier](http://www.marcusoft.net/2014/03/koaintro.html).

#### Blog

The first example that I recommend that you look at is the /blog example. Head into that directory and fire the site up (with "`node --harmony index.js`" or better yet "`nodemon --harmony index.js`"). Most of the action goes on in the single index.js file:

This site is very basic of course but shows off a number of features (and hence middleware):

- On line 7 we're including [koa-logger](https://www.npmjs.org/package/koa-logger) and make sure to use it on line 20 (`app.use(logger())`). This produce some very handy and nice output in the console. I use it for most of my sites.
- Routing we've seen before and it's very simple to use, since it reminds a lot of other frameworks like [ExpressJs](http://expressjs.com/). It's of course a package of it's own, [koa-route](https://www.npmjs.org/package/koa-route).
- With [co-body](https://www.npmjs.org/package/co-body) you can easily parse the content of a posted payload to an object. Note, on line 10 that the variable, from the require-statement is called parse. This is then used on line 62 to parse the request (`var post = yield parse(this);`) The "`this`" here might confuse you, shouldn't it be request? I have a little section on that below.
- This site uses a view engine to called [swig](http://paularmstrong.github.io/swig/). To use that a little module has been created (/lib/render.js) that is included on line 6. Using this little render-function we can render templated views as simple as shown on line 35. Notice how we're passing the data, as the second parameter (`{ posts: posts }`). This can then be picked up by the partial view (list.html) and looped over with `{% for post in posts %}` Read more about templates and supported engines on the [co-views npm-page](https://www.npmjs.org/package/co-views).

All in all this is a very good entry example I think. A nice little exercise could be to replace the in-memory storage with Mongo. Psst... use [co-monk](https://www.npmjs.org/package/co-monk), for that. Let's deep dive into something else. Let's look at error handling. UPDATE: [I couldn't hold it in...](https://github.com/marcusoftnet/koablog-mongo)
