---
layout: post
title: Marcus Node Bits - supertest is a nice way to test an API
date: 2014-02-07T14:00:00.000Z
author: Marcus Hammarberg
tags:
  - MobProgramming
  - Javascript
  - BDD
  - Tools
  - TDD
  - Node
modified_time: 2014-06-02T08:56:52.507Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-3190239835699558696
blogger_orig_url: https://www.marcusoft.net/2014/02/mnb-supertest.html
---

I'm writing down some of the things I've picked up when I started to learn about [Node](http://nodejs.org/), [Express](http://expressjs.com/), and [Mongo](http://www.mongodb.org/). Here are all the posts in the series:

- [Doing stuff in the terminal is not scary at all](https://www.marcusoft.net/2014/02/mnb-terminal.html)
- [`npm` is not only for getting packages](https://www.marcusoft.net/2014/02/mnb-npm.html)
- [Package.json is a mighty tool](https://www.marcusoft.net/2014/02/mnb-packagejson.html)
- [`git` is not that hard, but I need to refresh my knowledge](https://www.marcusoft.net/2014/02/mnb-git.html)
- [Callback function is cool stuff, and I even know how to write them](https://www.marcusoft.net/2014/02/mnb-callbacks.html)
- [`mocha` is cool both as framework and test runner](https://www.marcusoft.net/2014/02/mnb-mocha.html)
- [`should` is a nice way to do asserts](https://www.marcusoft.net/2014/02/mnb-should.html)
- [`monk` is an easy way to access mongo](https://www.marcusoft.net/2014/02/mnb-monk.html)
- [Express is best without generators](https://www.marcusoft.net/2014/02/mnb-express.html)
- supertest is a nice way to test an api - this post

This post is about a testing framework for HTTP: [supertest](https://github.com/visionmedia/supertest).

Really, I shouldn't need to write anything more after stating the name of the module. That's SUPER testing people. That's all we really need...

It's called [supertest](https://github.com/visionmedia/supertest) since it depends on a module called [super-agent](https://github.com/visionmedia/superagent), an HTTP client. This is important to know since the [supertest](https://github.com/visionmedia/supertest) library is actually just extending the [super-agent](https://github.com/visionmedia/superagent) library. Many of the functions you use when writing tests with [supertest](https://github.com/visionmedia/supertest) is defined in [super-agent](https://github.com/visionmedia/superagent). So if you need to look something up you might have to peek at the documentation of [super-agent](https://github.com/visionmedia/superagent).

The [supertest](https://github.com/visionmedia/supertest) library is very handy when it comes to testing API and web applications and has a nice fluent interface that I immediately fell in love with. You install it, of course, with

```bash
npm install supertest
```

As always the best way to show you this is with an example. Let's write a little test for a simple GET

See, that was very simple. Note the fluent interface and how you first compose your request (the `.get()` and `.set()` functions) and then we can do the expects, all in one statement. It's pretty nice, I think!

The app object needs to be exported from the app-file so that the test can get hold of it. This is done with the

```javascript
module.exports.getApp = app;
```

statement so it's not too bad. In return, you get a very simple way of testing the express application that doesn't even have to be up and running, it's all in-process of the test. At least that's my current understanding of it.

Now let's do a post as well and see how to send data to the server:

Here you can see me use the URL instead of the app-object. I (think that I) then have to make sure that the application is up and running so it's a bit more complex with more moving parts.

If you need to test things that are under authentication there's a [great post about that over here.](http://jaketrent.com/post/authenticated-supertest-tests/)

There's not really much more to say about this framework. It's one of those - "it just works"-frameworks which is awesome. In doubt, check out the documentation for [supertest](https://github.com/visionmedia/supertest) and [super-agent](https://github.com/visionmedia/superagent).