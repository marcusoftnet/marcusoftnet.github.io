---
layout: post
title: Javascript callbacks - cannot live with them cannot live without them... or can you?
date: 2014-03-06T07:00:00.000Z
author: Marcus Hammarberg
tags:
  - MobProgramming
  - Javascript
  - Tools
modified_time: 2014-06-02T08:56:52.519Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5949303220137372164
blogger_orig_url: http://www.marcusoft.net/2014/03/javascript-callbacks-cant-live-with.html
---

This is a confession post. Yes, [I'm a phony too](http://www.hanselman.com/blog/ImAPhonyAreYou.aspx). I pick up some things very late. Like JavaScript. And Node and ... well a lot of things.

But I'm sure that a lot of people have run into this and maybe, just maybe, there will be some others that haven't run into it yet. So this might help someone. Or me, for that matter, when I come back to this problem later.

It has to do with callbacks. The things that Node is made up of. And how they confused me a lot. And how I grew to love them, then hate them, and finally get them. And right about that point realize that there's another way.

Let's see if I can explain this. Just as an experiment.

Everything in node is event-driven (as from their mission statement on [the homepage](http://nodejs.org/)) and non-blocking. Which means that you see a lot of code like this in Node:

```javascript
// Example code block
```

One time when this really shines in testing with [Mocha](http://visionmedia.github.io/mocha/) for example. Here's a bit of Mocha for you:

```javascript
// Example code block
```

Let's talk through this (only focus on the testingConfig.js file in this case):

- Mocha will call all the describe-functions in your file one by one, and when it does that it will fire the anonymous function.
- For each describe-function Mocha will call the it-functions in it and the anonymous function we have created.
- Note the parameter to this callback function (`done()`)

The it-function contains our assertions and is then finished by calling `done()`

- The done-function is used to signal the end of our test.

### How not to Node

Now to the problem that I've run into more times than I care think about. Let's say that I want to return something from my function. Like this API that I started out doing a couple of days back:

```javascript
// Example code block
```

That's just wrong. It's not the Node way and you'll get into trouble if you try to pursue that path. So let's do that and see what happens. In my case I used Mongoose to access the database, hence building a data access layer. But since everything in Node is non-blocking you'll likely run into similar problems no matter what you try.

### How to Node

That's not how you should do it. It's wrong on the API level already. Instead it looks something like this:

```javascript
// Example code block
```

With this implementation:

```javascript
// Example code block
```

This is basically just pushing the problem upwards, if you like. You're caller will also supply a callback and you call that. It's nice and clean, and also allows for Node to continue to operate in a non-blocking way.

### How to promise instead

Promises! The mirage in the callback-desert. The wonderful sunrise that brings tears in the eyes of every Javascript developers. The thing that I don't use and haven't understood yet. Not completely at least.

But I can show you this from the [promise library Q's site](https://github.com/kriskowal/q):

```javascript
// Example code block
```

I cannot, sadly, explain what's going on there fully. But I can see that it's better, easier and clearer. That's enough for me to want to dive in and try to learn it. Promise (pun intended) to get back to you on that.