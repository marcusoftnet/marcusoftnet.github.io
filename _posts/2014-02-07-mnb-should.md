---
layout: post
title: Marcus Node Bits - Should is a nice way to do asserts
date: 2014-02-07T07:00:00.000Z
author: Marcus Hammarberg
tags:
  - Node
  - Javascript
  - BDD
  - Tools
  - TDD
modified_time: 2014-06-02T08:56:52.516Z
thumbnail: /img/Screen+Shot+2014-02-01+at+20.05.01+.png
blogger_id: tag:blogger.com,1999:blog-36533086.post-5065072872368802136
blogger_orig_url: https://www.marcusoft.net/2014/02/mnb-should.html
---

I'm writing down some of the things I've picked up when I started to learn about [Node](http://nodejs.org/), [Express](http://expressjs.com/), and [Mongo](http://www.mongodb.org/). Here are all the posts in the series:

- [Doing stuff in the terminal is not scary at all](https://www.marcusoft.net/2014/02/mnb-terminal.html)
- [`npm` is not only for getting packages](https://www.marcusoft.net/2014/02/mnb-npm.html)
- [Package.json is a mighty tool](https://www.marcusoft.net/2014/02/mnb-packagejson.html)
- [`git` is not that hard, but I need to refresh my knowledge](https://www.marcusoft.net/2014/02/mnb-git.html)
- [Callback function is cool stuff, and I even know how to write them](https://www.marcusoft.net/2014/02/mnb-callbacks.html)
- [mocha is cool both as a framework and test runner](https://www.marcusoft.net/2014/02/mnb-mocha.html)
- Should is a nice way to do asserts - this post
- [`monk` is an easy way to access mongo](https://www.marcusoft.net/2014/02/mnb-monk.html)
- [Express is best without generators](https://www.marcusoft.net/2014/02/mnb-express.html)
- [supertest is a nice way to test an API](https://www.marcusoft.net/2014/02/mnb-supertest.html)

This post is about an assertion framework that I've come to love: [should.js](https://github.com/visionmedia/should.js).

The thing with most [Node](http://nodejs.org/) packages is that they are quite small, often around 100-200 lines. They, in turn, make use of other packages in the form of dependencies. This is a good thing and leads to modularity, better design (maybe…), but gives you the opportunity to stitch together an environment just like you like it. Never is this better displayed than when writing tests.

Not only is there a plethora of testing frameworks to choose from, equally many test runners that can run them, mocking frameworks but also separate assertion frameworks. This is not news to me (I love [ShouldFluent](https://github.com/erichexter/Should) when writing C#, for example) and makes for a very customizable experience.

The assertion framework that I’ve ended up using is called [should.js](https://github.com/visionmedia/should.js). Finally, a framework that has a name that reveals something of its usage and syntax.

It’s easily installed with [npm](https://npmjs.org/), of course:

```bash
npm install should
```

And you're ready to use the should assertions in your test code. Oh well you need to:

```javascript
var should = require("should");
```

## The assertions

[Should](https://github.com/visionmedia/should.js) makes heavy use of the Javascript dynamic features and slabs on extension functions to the objects you are testing. This means that you write your assertions after the thing you assert which gives for a very read-it-out-loud syntax. Like this:

The full list of the assertions that are supported can be [found here](https://github.com/visionmedia/should.js/), but here’s the ones that *I’ve* (you might like others...) come to use a lot:

- `x.should.equal(y)` - hey, I don't need to explain them. How is that for a great demonstration of the use of readable syntax...
- `x.should.be.true`
- `x.should.be.false`
- `x.should.startWith("a string")`
- `not` - just negates the assertions. `x.should.not.be.equal(y)` for example.

In fact, there's a whole array of those conjunctions that you could add for readability. Like this example:

```javascript
user.should.be.an.instanceOf(Object).and.have.property('name', 'tj');
```

I have only used `not` so far, but I could see that some of the others might be useful.

## The trip ups

There are a few problems that I keep running into. It’s not very flattering for my intelligence that I keep doing it over and over, but I thought I’d write it down so that at least I know how to fix it the next time.

### Assert for null and undefined

If you’re checking that something is null or not, you’re at a bit of a loss, since should cannot attach any extension methods to null (since that’s no object I presume). In these cases you need to write the should as a standalone, global method. Here’s an example:

#### Forgetting the require

Another, very basic thing, that trips me up is that I forget to add the require statement for should in my test file. I presume I forget this since you don’t have to add one for mocha. My feeble mind seems to reason “Hey, great! In tests we apparently don’t need to add any requires.” Let’s say you have the following assertion:

If you don’t add the require statement for should, you’ll end up with an error message like this:

```plaintext
TypeError: Cannot call method 'equal' of undefined
```

Luckily it’s easy fixed. Add this at the top of your test-file:

```javascript
var should = require("should");
```

### "This way assert you should" - Yoda (and Rob Conery)

One last thing that I've found very useful. In the testing episode of the excellent [TekPub series on Angular](http://tekpub.com/products/angular) Rob Conery has a short little part on how he writes assertions (or it-functions in the case of mocha et al). I have done the same journey as he and picked up, what he calls, the Yoda way.

Up to then I used to write:

```javascript
it("should be defined"),
it("should validate presence of email")
```

But really why put the "should" in there? In the immortal words of Yoda:

[Do or do not. There is no try!](http://www.youtube.com/watch?v=BQ4yd2W50No)

Or in our case:

Do or do not. There is no should!

And just removing the "should" from the assertions clears them up quite a lot.

```javascript
it("is defined"),
it("validates presence of email")
```

This also makes for nicer reports, like this:

![Thumbnail](/img/Screen+Shot+2014-02-01+at+20.05.01+.png)
