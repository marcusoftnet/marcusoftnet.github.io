---
layout: post
title: KoaJs and the SyntaxError Unexpected identifier error - or that time when I understood generators
date: 2014-04-11T14:43:00.001Z
author: Marcus Hammarberg
tags:
  - Javascript
  - Koa
modified_time: 2014-04-11T15:19:56.787Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-4774542661205622224
blogger_orig_url: https://www.marcusoft.net/2014/04/WhenIGotGenerators.html
---

It was quite sometime since I wrote a blog post with an error message in the title. However I have now got this error so many times, and keep scratching my head every time. Also I think I can explain why it happens.

Here's an example on how to make this error occur, from the co-monk library [README (not anymore maybe)](https://github.com/visionmedia/co-monk/pull/4):

Running that code (either with "node --harmony koaErrorFail.js" or test it with "mocha --harmony-generators koaErrorFail.js") fail with the error from the title of the blog post:

```javascript
yield users.remove({});
      ^^^^^
SyntaxError: Unexpected identifier
```

At this point you start to think that you forgot to run the example with the [`--harmony` flag](https://www.marcusoft.net/2014/03/koaintro.html). But of course you do that, right?
Ah, maybe you are running the [wrong version of Node](https://www.marcusoft.net/2014/03/koaintro.html). Again, no. You're doing it right. Right?

However this code is not running within a generator function. And the keyword `yield` is just allowed within a generator function. In fact, to my understanding, a function is a generator function if it has an asterisk before the name of the function and one or more `yield`s within the function.

But we want to say `yield`.

The yield is good. It's what helps us get non-blocking code. You are basically telling node to do something else while we wait for this operations. Like [callbacks](https://www.marcusoft.net/2014/03/javascript-callbacks-cant-live-with.html) but without yuck.
But there has to be a generator function around it. And someone to drive the generator for us. I mean that can keep track on where we were when we waited for the next yield. There's has to be *someone* that takes care of this [generator async flow control goodness](https://www.npmjs.org/package/co). Someone greater than us. Someone like [co](https://www.npmjs.org/package/co).

Co is a neat little library that lets you ["write non-blocking code in a nice-ish way"](https://github.com/visionmedia/co). That's all very complicated if you ask me. But let's show how this co could be used to help us fix the error we ran into before:

Here we can see that the code, from our failing example is wrapped in a generator function (note the asterisk). This (anonymous) generator function is then passed to the [co](https://www.npmjs.org/package/co)-library constructor function. Finally we also invoke the function that co-returns, right away, hence the "})(); on line 20.

### Summary and hat tipping

I would not have grasped this [without this awesome article](http://zef.me/6096/callback-free-harmonious-node-js) by [Zef](https://twitter.com/zef). Not only did he write that article but he also helped me when I [reached out to him on Twitter](https://twitter.com/marcusoftnet/statuses/454620650410237952). Thank you mr Zef, my hat is tipped towards you. Loudly (?)

Summing up the problem would be something like this:

- The "Unexpected identifier" is not really users (in my example), but rather that yield is not valid outside a generator function.
- We can create an anonymous generator function by wrapping the code in "function *(){ // code }"
- Only problem left, is that we need someone that calls and drives through that function for us, continuing after a yield is reached for example. That could be [co](https://www.npmjs.org/package/co), for example.
- The co constructor takes a generator function as parameter making our entire wrapping for this into "co(function *(){ // code })();"

I can now find eternal peace. I will probably never be able to explain this again, but then I can come back to this post and "the time I understood generators".
