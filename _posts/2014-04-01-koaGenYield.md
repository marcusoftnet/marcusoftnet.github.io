---
layout: post
title: Marcus Node Bits - Let us talk about yield and generators, shall we?
date: 2014-04-01T07:00:00.000Z
author: Marcus Hammarberg
tags:
  - Node
  - Javascript
  - Tools
  - Koa
modified_time: 2014-04-06T12:41:45.558Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-4757293937630995296
blogger_orig_url: http://www.marcusoft.net/2014/04/koaGenYield.html
---

[Koa Js](http://www.koajs.com/) removes the need for callbacks but still uses non-blocking code. How is that possible?

If you read the code of the last blog post you might have reported a bug or two since I was using a strange asterisk in the getGreeting-function. Is that really valid Javascript?

And when you looked very closely you might be wondering about the "yield" right there in the middle... What kind of witchcraft is this thing anyway?

These questions and more flew through my head when I first learned about Koa and the concepts it's built upon. In this post I will try to explain that a bit and point you to other places where they explain this much better, if you don't like my tries. This is just how I, a newbie to these concepts, have tried to wrap my head around it. Hey, let's be completely transparent and say that I have to relearn this just about every day.

It's really not that complicated once you understand it the first time... Just like [quantum mechanics](http://en.wikipedia.org/wiki/Quantum_mechanics)...

First, let me restate that the things we're diving into now are bleeding-edge stuff. It's proposed for the [EcmaScript 6 and is included in Google's V8 Javascript engine](http://wingolog.org/archives/2013/05/08/generators-in-v8). You will need to tweak your environment in order to get this version of [Node](http://www.nodejs.org/) that can execute this. [Read this for instructions](http://www.marcusoft.net/2014/03/koaintro.html).

I have learned LOADS from this [awesome article](http://tobyho.com/2013/06/16/what-are-generators/) by [Toby Ho](https://twitter.com/airportyh). Here I'm just writing down how I understood it. All credit for any good stuff here goes to Toby. Any crap is probably from me.

### What is yield?

Now, on to the war... The first concept that tripped me a bit was `yield`. I have not thought much about nor used `yield` in my mother-tongue, C#, that have had them for quite some time. Quite simple it can be described with the following code:

```javascript
function* loop() {
  while (true) {
    yield;
  }
}
```

This will just continue looping forever, so it's not very useful that way. But look at line 3, we're not actually *returning* anything. Instead, we are *yielding* the result. I can't relate to that expression. It simply doesn't mean anything to me. My mind just goes ".........".

But when I [understood that](http://tobyho.com/2013/06/16/what-are-generators/):

> when the code encounters a yield statement, it suspends execution indefinitely, and doesn't start again until you tell it to

I was intrigued to say the least. Could this be used instead of [callbacks](http://www.marcusoft.net/2014/03/javascript-callbacks-cant-live-with.html) when doing non-blocking, asynchronous code? But how? Let's press on and see if that is the case.

### Aha, but what are generators then?

Ok, but how can I use this then? Or in other words; how can I call this loop? Let's wrap that loop in a function. Like this:

```javascript
function* loop() {
  while (true) {
    yield;
  }
}
```

Please note the little asterisk at the function. This is how Javascript denotes *generator functions* and I'll come back to that later. A function becomes a generator function when you have at least one yield in it. And you need to add the asterisk.

"Well, that's pretty and everything, but how do we use that function then?" you ask. We have to create an instance of the generator function and then get the *next* element in the sequence by calling `.next()`. Like this:

```javascript
var myGenerator = loop();
myGenerator.next();
```

That was the quote about mean when it said: "... until you tell it to". The code will halt at the yield until we tell it to continue, and we tell it by calling `.next()` on the function instance. To run this, remember that you have to call Node with the "--harmony" flag, as described in [my earlier post](http://www.marcusoft.net/2014/03/koaintro.html). This is the command I used:

```bash
node --harmony callingGenerator.js
```

Two things worth noting here. First, nothing happens until you call `.next()`. The loop in the generator is doing nothing in the meantime. Like a block of code that waits for an asynchronous callback. Also, it's worth noting that what we get back is an object with two properties; *value* and *done* (true/false). The `done` parameter equals true when the sequence is over, as shown in this example:

```javascript
var myGenerator = loop();
myGenerator.next();
myGenerator.next();
myGenerator.next();
myGenerator.next();
myGenerator.next(); // done === true
```

If you run that, you will get `done === true` for the fourth call to `.next()` (with the value === undefined). The fifth call throws an exception ("Generator has already finished").

Tying back to the heading of this section: a generator is simply a function that represents a sequence of values. We saw examples of ending and non-ending sequences above. You can use the generator by creating a generator object and call `.next()` to

 get the next value. It's like *iterating* through the return values of the function.

### What use is this? And what's all this talk about Koa?

This is a mind-twister and interesting and all that... but what use can we have from this? Well, yield and generators are, in fact, the helping hand that will draw us up from callback hell and put our feet back on solid, well-trampled ground.

Did you notice the little passage about the asynchronous wait above? The thing is, when yield is called the code is waiting for you to call `.next()` to continue. For as long as that takes. In the meantime, Node can do something else that is more important than waiting. You recognize this? (Saved the fact that I wrote it above). This is what [callbacks give us](http://www.marcusoft.net/2014/03/javascript-callbacks-cant-live-with.html). Non-blocking code. Sadly to the cost of nesting and tightly coupled code, where you have to pass parameters that the innermost code need.

Let's take a look at an example on how [Koa Js](http://www.koajs.com/) uses this. This example is doing some very simple logging and really made the usefulness of generators stand out for me. Start this simple site up and then access it from the terminal with `curl http://localhost:3000 -v` so that you can see the headers returned, and there you see the X-Response-Time reported. As well at the console.

Let's see if we can break it down a bit. `app.use()` is how Koa defines middleware. In this case, the middleware is just two simple generator functions. When the request comes in the following happens:

- First, since it's defined first, the x-response-time generator function is called. It gets hold of the current date and time and then *yields* the passed-in `next` variable. This is a Koa variable that indicates the next middleware in line.
- So, we end up in the logger middleware. This generator function does the same thing. Get hold of "now" and yields out the next middleware.
- There's no more middleware defined so we are taken to the response (for any route in this case) that always sets the body to "Hello world!"
- When the response is created the execution is turned back to the logging middleware that calculates the response time for this request and blurts it out on the console.
- The x-response-time middleware does the same thing, but saves the result into the header of the response.

If you want to, you could read the middleware code like this: "Get the start time. Do whatever else you need to do. When that is done subtract the current time from the start and save the result in the header". In an easy to read, sequential fashion. No callbacks and long indentation chains.

I like that. A lot. It's simple, short, and easy to read and understand. All the hard stuff about generators... Well, we don't have to think so much about that. Yield means: "do everything else you need to do at this point".

Here's another example where we store the data from a post into a Mongo database using [Monk](http://www.marcusoft.net/2014/02/mnb-monk.html) via the coroutine library [Co-Monk](https://www.npmjs.org/package/co-monk) (which is the simplest way to access MongoDB with generators right now):

Again, using curl (why not?) we can now add a couple of users with the following commands:

```bash
curl -X POST -d "name=Marcus" http://localhost:3000/user
curl -X POST -d "name=John" http://localhost:3000/user
```

And then see the result with this:

```bash
curl http://localhost:3000/user -v
```

Pretty short and sweet for adding users, if you ask me. More interesting, let's go through the code.

First, there are a couple of requires that bring in the things we are going to use. The "lego" pieces in Koa are pretty small so there's usually at least a couple of them.

Line 8-11 see us set up Monk, and use it with "mongodb generator goodness for co" via Co-Monk. Man, I love Monk. It's really sweet!

On line 14 and 15, we set up our routes and simple direct them to a couple of generator functions that are found below. This is how Koa calls out to other things.

In the create generator function (note the asterisk) we have two yields:

- first (line 21) we parse the body (with co-body) and if that should take time, for a big file for example, we yield the response. Koa can let other execute in the meantime. Just like for a callback. But without the callback.
- secondly, on line 27, we store the object in MongoDB. And better yield there too since that might take time, or at least is IO.
- Did you see that try...catch? It's back baby! Error handling that feels reasonable. Structured exception handling I think it's called. The alternative is, in other words, ... :)

In the list generator, we just yield the result from our, very simple, Mongo query. See line 38.

Line 43 fires the whole thing up.

### Conclusion

Around this point when I'm using Koa I always think to myself... So what's the deal with generators, what did that really give me? It's actually pretty easy to forget and to me that is a good thing. Because I just write the code like I would "normally" without callbacks. Feels much more natural to me. And when I'm doing IO or Networking I remember to yield to let Koa do other things.

I have had GREAT use of a couple of articles to explain this to me.

- [What Is This Thing Called Generators?](http://tobyho.com/2013/06/16/what-are-generators/) is **awesome** and a must-read.
- Two articles from Mozilla on the topic were interesting; [the first](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Iterators_and_Generators) was obsolete but had great examples. [The second](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/function*) is up to date but very short and ... left me wanting more.
- [KoaJs](http://www.koajs.com/) own site has a couple of good examples.

I want to thank all those resources and humbly point to them for more, better, and in-depth information. This is just my understanding, written for me to remember. Because I have now forgotten how this worked again, and need to start over :)

My code is in those gists listed above or [here in a repo](https://github.com/marcusoftnet/KoaBlogPosts/tree/master/KoaFirstStumblingSteps).

I like Koa Js. I've written a couple of posts about it. Here they will be when they are published:

- [Let's talk about Koa for a while, shall we?](http://www.marcusoft.net/2014/03/koaintro

.html)
- Let's talk about yield and generators, shall we? (this post)
- [Marcus Node Bits: Let's flex Koa Js, shall we?](http://www.marcusoft.net/2014/04/koaExamples.html)