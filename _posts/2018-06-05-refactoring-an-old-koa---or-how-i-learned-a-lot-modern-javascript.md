---
layout: post
title: "Refactoring a Koa app - or how I learned a lot about modern JavaScript while refactoring an old app"
author: "Marcus Hammarberg"
date: 2018-06-05 21:07:13
tags:
 - Javascript
 - Koa
 - Programming
---

I have learned so much by following the [Koa Js community](https://koajs.com/) and framework over the years. My [first post on the topic](https://www.marcusoft.net/2014/03/koaintro.html) was written in March 2014, when Koa was just a little tiny bird trying out its wings (look up that reference…).

From that point I've [written many posts](https://www.marcusoft.net/tags/#Koa), done a few [screencasts for fun](https://www.youtube.com/watch?v=aTTjednotGQ)  and [other for profit](https://www.pluralsight.com/courses/javascript-koa-introduction).

4 years (MY GOD!) is a long period but in the JavaScript world it's eons of time. I noticed that the other day when I refactored one of my later Koa applications into something more modern. I learned so much about the topics that I ran into, while upgrading my code and the resulting code was much more elegant, functional and understandable.

So… I thought I'd do it again. This time you can tag along. This post will be long, but hopefully worth it.

<!-- excerpt-end -->

## The case and introductions

My most viewed YouTube-video on programming is this one where I build out an API using Koa.

<iframe width="100%" src="https://www.youtube.com/embed/aTTjednotGQ" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

It has attracted a lot of views and a lot of comments from my handling of the keyboard. It was all recorded live (before I knew editing), in my bedroom in Bandung (you can hear roosters and dogs in the background).

The reason people like it, I think, is that it's a small but complete domain and it's built with tests.

However it's hopelessly dated now. I will create a branch in [my repository](https://github.com/marcusoftnet/UserApiWithTest) for the code and start updating it to a moderns stack. While doing so I will write about what I experience and think on how to structure the app today. It will not only be Koa things, but I will point out those changes as well.

## What is this project?

It's a very simple API return three type of resources. Thank to ~~pure luck~~ my infinite wisdom, [I have split the application up into separate parts](https://www.marcusoft.net/2015/05/splitting-an-koa-app-into-parts-and-putting-it-together-again.html) that can be run and tested separately. We will use this to break down the problem into smaller parts.

Ha - smaller is better! Who knew!?

## Getting started

For reference I have installed Node `v10.2.1` using the excellent [nvm tool](https://github.com/creationix/nvm/blob/master/README.md).  But the code is written for something much much older. Aincient almost… Node `0.11.9` that was needed to get Koa to run. Bleeding edge back in the days.

Get, [clone the repo from this tag](https://github.com/marcusoftnet/UserApiWithTest/tree/OrignialBefore2018Update) and … tag along. Promise, that was the last *bad* joke in the article series.

Let's start by fixing one of the "api"'s first. That will make the problem easier to grasp. Let's go into the user `cd apis/user`.

Then run `npm i` (shortcut for `npm install` save those fingers). That create a `package-lock.json` that we will commit later. I suspect there will be a lot of updating here, shortly.  There will be a lot of warning of deprecated packages, but that's what we are here to fix. Don't worry.

## Get the tests to run

Nowadays the first thing I do is always to run `npm run` to see the commands avaible to me (you know [npm scripting right?](https://www.pluralsight.com/courses/npm-build-tool-introduction) Saved my life!) When we can see that I've actually set up commands for testing and starting. Good on me!

Also good on me, is that I have written test. They are written as integrationtests using an excellent framework called [supertest](https://github.com/visionmedia/supertest). This will serve excellent as a safety net for our refactoring.

My first order of business, if possible, is to get them to run. If I can get there then I can refactor more safely, knowning that the tests will let me know if I've done something stupid.

`npm t` (shortcut for `npm test`, that in turn is a shortcut for `npm run test`) and … [baw-baw-baaaaw](https://sadtrombone.com/):

```bash
bad option: --harmony-generators
```

Ok kids - history lesson. Koa used (and still can use) a feature called generators. The inner workings of that is a bit complicated and out of scope of this article but I've recorded a [screen cast on that too.](https://www.youtube.com/watch?v=egLUa6urd6I)

Anyway; at the time I wrote this code, Node didn't support generator functions by default. Hence we need to use a flag to enable it. That flag in turn was only availble in Node versions above `0.11.9`, which is the reason that version was important.

(A whole [separate fork of Node, called iojs](https://www.pluralsight.com/courses/running-node-applications-io-js) was created to get features like these faster. War, then love, emerged and now everyone is playing togther nicely. )

Since then it's been included out of the box and this flag is not needed. Time to change some code. Let's do as little as possible now and only update the test script to this

```javascript
"scripts": {
	"test": "mocha -u bdd -R spec"
}
```

Sidenote; the strange `./node_modules/mocha/bin/mocha` reference that I have in there is not needed. `npm` can use tools in the local `node_modules`-folder without that prefix. I didn't know this at the time. Already an improvement.



Let's run it again; `npm t` and … yes. New errors this time. Progress.

This time we get an error saying something like `var skinClassName = 'Skin' + NativeClass.name; ... Cannot read property 'name' of undefined`. This has to do with a framework that I'm using to access MongoDb called [Monk](https://github.com/Automattic/monk). The [error is well-known](https://github.com/sahat/tvshow-tracker/issues/9) and has been fixed, in later versions of the framework.

Let's remove the monk-stuff and reinstall it `npm uninstall monk co-monk -S` and then `npm install monk co-monk -S`.

Then rerun the tests `npm t`. This will produce a slow-running test suite, all tests failing, because you havent started (or installed?) Mongod. Open a new terminal window or tab, and start MongoDb with `mongod`.

Then rerun the … you know what? This is tedious. Change the `package.json` test command to `"test": "mocha -w -u bdd -R spec"` that will watch your files for changes. **Then** rerun the test, for the last time; `npm t`.

### Failure is progress - newspeak is here

This probably feels stupid, but we are actually making progress. Two tests are failing. 4 passing. The tests are also failing for new reason. If you scroll back up you will notice an error like

```bash
TypeError: Cannot read property 'apply' of undefined
      at Collection.findById
```

That's JavaScript trying to be friendly and say that it doesn't know what `Collection.findById` is. Monk has updated it's api. We did a upgrade from 1.0.0 to 6.0.0 so that was kind of expected.

Ok - this is easy to fix, by using the [excellent documentation of Monk](https://automattic.github.io/monk/docs/collection/findOne.html). Let's update the useage of `.findById`. It's in the `userRoutes.js` file on line 30. Change it from

```javascript
var user = yield users.findById(id);
```

to

```javascript
var user = yield users.findOne({_id: id});
```

All documents in MongoDb gets an id called `_id` by default, and hence the code above finds one document with the `_id` matching the `id` we pass to it.



Now do a similar change for the `.updateById` and change line 38 [into this](https://automattic.github.io/monk/docs/collection/findOneAndUpdate.html):

```javascript
yield users.findOneAndUpdate({_id: id}, userFromRequest);
```

Run the tests again `npm t` and … YES! They are now passing. Meaning that we have a nice little protection from introducing bugs while refactoring.

### Summary

You can notice three things in my approach here:

1. I made the smallest possible change. I did that because the test was not yet protecting me from failure. Call it a calculated risk, if you will.
2. The test ran as soon as you saved the file. Yah for faster feedback!
3. The tests are now passing. Time to check in!

And I think… time to end this blog post. It's getting long already. I'll post them all at once, but in parts.

Hold on and meet me in [the next post](https://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript_ii.html) where we will do some refactoring.

Here are all the posts in the series

* [Part I - get the tests to run](https://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript.html) - this post.
* [Part II - where we clean up the test code a bit](https://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript_ii.html)
* [Part III - where we start to move over to async/await testing](https://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript_iii.html)
* [Part IV - where finally do something about the production code, and fix the other parts of the application](https://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript_iv.html)
* [Part V - wrapping up by refactoring the root application](https://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript_v.html)

