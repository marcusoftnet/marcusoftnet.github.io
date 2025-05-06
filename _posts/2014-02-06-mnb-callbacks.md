---
layout: post
title: Marcus Node Bits - Callback function is cool stuff, and I even know how to write them
date: 2014-02-06T10:50:00.000Z
author: Marcus Hammarberg
tags:
  - MobProgramming
  - Javascript
  - Tools
modified_time: 2014-06-02T08:56:52.533Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-7442756146419940924
blogger_orig_url: https://www.marcusoft.net/2014/02/mnb-callbacks.html
---

I'm writing down some of the things I've picked up when I started to learn about [Node](http://nodejs.org/), [Express](http://expressjs.com/), and [Mongo](http://www.mongodb.org/). Here are all the posts in the series:

- [Doing stuff in the terminal is not scary at all](https://www.marcusoft.net/2014/02/mnb-terminal.html)
- [`npm` is not only for getting packages](https://www.marcusoft.net/2014/02/mnb-npm.html)
- [Package.json is a mighty tool](https://www.marcusoft.net/2014/02/mnb-packagejson.html)
- [`git` is not that hard, but I need to refresh my knowledge](https://www.marcusoft.net/2014/02/mnb-git.html)
- Callback function is cool stuff, and I even know how to write them - this post
- [`mocha` is cool both as framework and test runner](https://www.marcusoft.net/2014/02/mnb-mocha.html)
- [`should` is a nice way to do asserts](https://www.marcusoft.net/2014/02/mnb-should.html)
- [`monk` is an easy way to access mongo](https://www.marcusoft.net/2014/02/mnb-monk.html)
- [Express is best without generators](https://www.marcusoft.net/2014/02/mnb-express.html)
- [supertest is a nice way to test an api](https://www.marcusoft.net/2014/02/mnb-supertest.html)

This is not Node related but rather a Javascript thing that was something that I had a real hard time with at first. And I know that I should learn about [promises](http://www.html5rocks.com/en/tutorials/es6/promises/), but I haven't yet.

Functions are first class citizens in Javascript, which is super cool and something that you'll make use of A LOT. Passing functions to functions is just the way to go in Node code. One thing that this manifests itself is through the concept of "callbacks".

Callbacks are pretty easy on the concept level; a function does something and then "call back" to the caller when the work is done. The callback is simply a function that you pass to the function as a parameter. Like this function:

```javascript
function doSomething(p, callback) {
    // .. do stuff
    callback("Done");
}
```

Calling this function will look something like this:

```javascript
doSomething(123, function (res) {
  console.log(res);
});
```

Quite simply (eh ... not really the first time I saw this but anyway) `doSomething` will execute using `123` as the `p` parameter. It will finally call the callback function and hence execute my little anonymous function that does the `console.log`.

It took some time to wrap my head around this. And Yes, I know that promises are the new kid on the block, but I haven't come there yet.

The first time it really clicked for me was actually when I started to write my code in another way. It was since I messed up the parentheses, curly braces, and semicolons a lot. So I write (most often) my function calls in this sequence, which helped me realize that the function is just another parameter. It also saved me from a lot of [JSLint](http://www.jslint.com/) errors.

After a while, this way of writing will get boring and tedious so I will stop. Right now it helps me understand the structure so I'll keep doing this.

Just to be clear, I love JSLint and it makes me look like I know how to write proper, well-formatted Javascript, when I actually don't :) There's an excellent plugin to Sublime. [Get it now](https://github.com/fbzhong/sublime-jslint).
