---
layout: post
title: Marcus Node Bits - supertest is a nice way to test an api'
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
blogger_orig_url: http://www.marcusoft.net/2014/02/mnb-supertest.html
---




I'm writing down some of the things I've picked up when I started to
learn
about <a href="http://nodejs.org/" target="_blank">Node</a>, <a href="http://expressjs.com/" target="_blank">Express</a> and <a href="http://www.mongodb.org/" target="_blank">Mongo</a>.
Here are all the post in the series:

- <a href="http://www.marcusoft.net/2014/02/mnb-terminal.html"
    target="_blank">Doing stuff in the terminal is not scary at all</a>
- <a href="http://www.marcusoft.net/2014/02/mnb-npm.html"
    target="_blank">npm is not only for getting packages</a>
- <a href="http://www.marcusoft.net/2014/02/mnb-packagejson.html"
    target="_blank">Package.json is a mighty tool</a>
- <a href="http://www.marcusoft.net/2014/02/mnb-git.html"
    target="_blank">Git is not that hard, but I need to refresh my
    knowledge</a>
- <a href="http://www.marcusoft.net/2014/02/mnb-callbacks.html"
    target="_blank">Callback function is cool stuff, and I even know how to
    write them</a>
- <span
    style="color: #0000ee; text-decoration: underline;"><a href="http://www.marcusoft.net/2014/02/mnb-mocha.html"
    target="_blank">mocha is cool both as framework and test runner</a>
- <a href="http://www.marcusoft.net/2014/02/mnb-should.html"
    target="_blank">Should is a nice way to do asserts</a>
- <a href="http://www.marcusoft.net/2014/02/mnb-monk.html"
    target="_blank">monk is an easy way to access mongo</a>
- <a href="http://www.marcusoft.net/2014/02/mnb-express.html"
    target="_blank">Express is best without generators</a>
- supertest is a nice way to test an api - this post

This post is about a testing framework for HTTP:
<a href="https://github.com/visionmedia/supertest"
target="_blank">supertest</a>.

Really, I shouldn't need to write anything more after stating the name
of the module. That's SUPER testing people. That's all we really
need...

It's called <a href="https://github.com/visionmedia/supertest"
target="_blank">supertest</a> since it depends on a module
called <a href="https://github.com/visionmedia/superagent"
target="_blank">super-agent</a>, an HTTP client. This is important to
know since the <a href="https://github.com/visionmedia/supertest"
target="_blank">supertest</a> library is actually just extending
the <a href="https://github.com/visionmedia/superagent"
target="_blank">super-agent</a> library. Many of the functions you use
when writing tests
with <a href="https://github.com/visionmedia/supertest"
target="_blank">supertest</a> is defined
in <a href="https://github.com/visionmedia/superagent"
target="_blank">super-agent</a>. So if you need to look something up
you might have to peek that the documentation
of <a href="https://github.com/visionmedia/superagent"
target="_blank">super-agent</a>.

The <a href="https://github.com/visionmedia/supertest"
target="_blank">supertest</a>  library is very handy when it comes to
test API and web applications and have a nice fluent interface that I
immediately fell in love with. You install it, of course, with

> <span style="font-family: Courier New, Courier, monospace;">npm
> install supertest

As always the best way to show you this is with an example. Let's write
a little test for a simple GET

See, that was very simple. Note the fluent interface and how you first
compose your request (the <span
style="font-family: Courier New, Courier, monospace;">.get() and
<span
style="font-family: Courier New, Courier, monospace;">.set()
functions) and then we can do the expects, all in one statement. It's
pretty nice, I think!

The app object needs to be exported from the app-file so that the test
can get hold of it. This is done with the

> <span
> style="font-family: Courier New, Courier, monospace;">module.exports.getApp
> = app;

statement so it's not too bad. In return you get a very simple way of
testing the express application that don't even have to be up and
running, it's all in-process of the test. At least that's my current
understanding of it.

Now let's do a post as well and see how to send data to the server:

Here you can see me use the URL instead of the app-object. I (think that
I) then have to make sure that the application is up and running so it's
a bit more complex with more moving parts.

If you need to test things that are under authentication there's a
<a href="http://jaketrent.com/post/authenticated-supertest-tests/"
target="_blank">great post about that over here. </a>

There's not really much more to say about this framework. It's one of
those - "it just works"-frameworks which is awesome. In doubt checkout
the documentation for <a href="https://github.com/visionmedia/supertest"
target="_blank">supertest</a> and <a href="https://github.com/visionmedia/superagent"
target="_blank">super-agent</a>.
