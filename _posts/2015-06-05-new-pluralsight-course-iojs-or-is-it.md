---
layout: post
title: "New PluralSight Course: io.js ... (or is it?)"
author: "Marcus Hammarberg"
date: 2015-06-05 07:16:00
tags:
 - JavaScript
 - io.js
 - Tools
---

For the last couple of months I have used [io.js](http://iojs.org) to run all my Node applications. I'm not going back. The transition has been very smooth, with a few minor things that you need to think about. And as always; I improved my existing skills by just moving outside the comfort zone a little bit. 

I thought that my journey could be an interesting [PluralSight](http://www.pluralsight.com) course. So did they. 

I'm happy to release this as my second course on PluralSight, [Koa Js](http://www.pluralsight.com/courses/javascript-koa-introduction) being the first.

Here's the [link to the course](http://www.pluralsight.com/courses/running-node-applications-io-js)

A very interesting challenge presented itself at the end of the production as well. Tell you soon.

<a name='more'></a>

The course is in three parts (and a summary):

* What is io.js - in this module I introduce what io.js is (and what's it's really called) and how to install it using [nvm](https://github.com/creationix/nvm). Now that's even simpler with [nvm-latest](http://nvm-latest.herokuapp.com/)
* Running Node apps on io.js - this is the meat of the course showing some of the small quirks getting started but mostly showing what possibilities that io.js opens up for your Node applications. Especially around [EcmaScript 6](http://www.pluralsight.com/courses/javascript-fundamentals-es6). There's also a section about how make sure that you actually are using the correct version of the framework. I [blogged about that before](www.marcusoft.net/2015/03/packagejson-and-engines-and-enginestrict.html)
* Deploying to [Heroku](http://www.heroku.com) - in this module I show how to convert an existing application and then what you need to think about to make sure that your configuration is correct. This module serves a little bit as repetition of the second part. 

# The twist
I was done. All the material was handed into PluralSight and I was just waiting for the launch. And then [this happened](https://medium.com/node-js-javascript/io-js-week-of-may-15th-9ada45bd8a28).

<blockquote>io.js decides to join the Node Foundation.</blockquote>

Basically io.js will go away, so will Node and "new node" will replace it. Now this is not as dramatic as it first might sound. io.js was created as a clone of our Node and released in 1.0.0 early this year. Since then active development has taken place in both Node and io.js, but most development has taken place in io.js, of course. 

"new node", that most likely will be called <code>nodejs</code>, will hence be a fork of io.js. 

So the threat to the relevance of my course is not that big. In fact it's an opportunity. It only woke up on the wrong side of bed that morning, so it was a little bit hard to see it as a opportunity at first. 

It's is an opportunity because the things thought in the course will be the foundation for how "new node" will work. Basically - if you know io.js you know "new node".

The course is [published here](http://www.pluralsight.com/courses/running-node-applications-io-js). 

Go watch it now!