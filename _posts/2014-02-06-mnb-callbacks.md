---
layout: post
title: Marcus Node Bits - Callback function is cool stuff, and I even know how to
  write them
date: 2014-02-06T10:50:00.000Z
author: Marcus Hammarberg
tags:
  - MobProgramming
  - Javascript
  - Tools
modified_time: 2014-06-02T08:56:52.533Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-7442756146419940924
blogger_orig_url: http://www.marcusoft.net/2014/02/mnb-callbacks.html
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
- Callback function is cool stuff, and I even know how to write them -
    this post
- <span
    style="color: #0000ee; text-decoration: underline;"><a href="http://www.marcusoft.net/2014/02/mnb-mocha.html"
    target="_blank">mocha is cool both as framework and test runner</a>
- <a href="http://www.marcusoft.net/2014/02/mnb-should.html"
    target="_blank">Should is a nice way to do asserts</a>
- <a href="http://www.marcusoft.net/2014/02/mnb-monk.html"
    target="_blank">monk is an easy way to access mongo</a>
- <a href="http://www.marcusoft.net/2014/02/mnb-express.html"
    target="_blank">Express is best without generators</a>
- <a href="http://www.marcusoft.net/2014/02/mnb-supertest.html"
    target="_blank">supertest is a nice way to test an api</a>

This is not Node related but rather a Javascript thing that was
something that I had a real hard time with at first. And I know that I
should learn about
<a href="http://www.html5rocks.com/en/tutorials/es6/promises/"
target="_blank">promises</a>, but I haven't yet.
Functions are first class citizens in Javascript,
which is super cool and something that you'll make use of A LOT. Passing
functions to functions is just the way to go in Node code. One thing
that this manifests itself is through the concept of "callbacks".

Callbacks is pretty easy on the concept level; a function does something
and then "call back" to the caller when the work is done. The callback
is simply a function that you pass to the function as a parameter. Like
this function:

Quite simply (eh ... not really the first time I saw this but anyway)
doSomething will execute using <span
style="font-family: Courier New, Courier, monospace;">123 as the
<span style="font-family: Courier New, Courier, monospace;">p
parameter. It will finally call the callback function and hence execute
my little anonymous function that does the <span
style="font-family: Courier New, Courier, monospace;">console.log.

It took some time to wrap my head around this. And Yes, I know that
promises is the new kid on the block, but I haven't come there yet.

The first time it really clicked for me was actually when I started to
write my code in another way. It was since I messed up the parentheses,
curlys and semicolons a lot. So I write (most often) my function calls
in this sequence, which helped me realise that the function is just
another parameter. It also saved me from a lot of
<a href="http://www.jslint.com/" target="_blank">JSLint</a> errors.

After awhile this way of writing will get boring and tedious so I will
stop. Right now it helps me understand the structure so I'll keep doing
this.

Just to be clear, I love JSLint and it makes me look like I know how to
write proper, well-formatted Javascript, when I actually don't :)
There's an excellent plugin to Sublime.
<a href="https://github.com/fbzhong/sublime-jslint" target="_blank">Get
it now</a>.
