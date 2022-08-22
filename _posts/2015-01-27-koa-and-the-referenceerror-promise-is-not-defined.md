---
layout: post
title: Koa and the ReferenceError Promise is not defined.
author: Marcus Hammarberg
date: 2015-01-27T19:52:38.000Z
tags:
  - Koa
  - Javascript
  - Tools
---

M: "... hahaha, exactly. And speaking of RT*M, you know what I did yesterday?"

H: "No, but I like it already. Tell me more."

M: "So I wanted to whip out a fast little [Koa](http://www.koajs.com) site. It's sooo good for those"

H: "Yeah, I know. You told me like a million times."

M: "Ok... sorry. Off to the terminal I went and went through the usual steps:"

```bash
mkdir newAwesomeApp
cd newAwesomeApp
git init
npm init
npm install koa koa-route --save
touch app.js
```

<!-- excerpt-end -->

H: "Dude, is this a screen cast or are you going to tell me something interesting already?"

M: "Well hang on for just a few seconds more. I wrote my first simple route, to verify it. And I'm glad I did"

```javascript
var app = require("koa")();
var route = require("koa-route");

// routes
app.use(route.get("/", function *(){ this.body = "Yup, it's working!"}));

// start it
app.listen(3000);
console.log("App listening... http://localhost:3000");
```

H: "I'm borderline bored... "

M: "And then! I fired it up as normal: node --harmony app.js. You know what happened?"

H: "If you say 'It worked, because Koa is awesome' I'm leaving."

M: "Eeeh, well it worked. Until I hit the route, <http://localhost:3000/>. Then it spit out an error like this:"

```bash
/Volumes/Storage/Users/marcus/Projects/Koa/booooring.com/node_modules/koa/node_modules/co/index.js:47
  return new Promise(function(resolve, reject) {
             ^
ReferenceError: Promise is not defined
    at Object.co (/Volumes/Storage/Users/marcus/Projects/Koa/booooring.com/node_modules/koa/node_modules/co/index.js:47:14)

```

H: "Ok, you're running on the wrong version of Node."

M: "No - I'm running version v0.11.12, installed using the awesome [nvm](https://github.com/creationix/nvm), of course."

H: "Of course. But what was it then?"

M: "Well dissecting the error it seemed like it needed Promise, whatever that is."

H: "Ok, so it's something you npm install, I guess?"

M: "Maybe, but why did this happen all of a sudden. I have loads of Koa apps running. For no particular reason I happened to check the package.json of Koa. You know what?"

H: "What?"

M: "They've updated the Node version needed for Koa. It's now 0.11.13."

H: "And you where running on?"

M: "v0.11.12. I nvm install v0.11.14 (that is the stable version) and it worked again."

H: "But how on earth should you know. I think Koa should tell you when you start an app."

M: "ME TOO! I actually regged an [issue about that](https://github.com/koajs/koa/issues/397). And boy was that embarrissing?"

H: "Huh? How come? Are they mean?"

M: "No, super nice guys, but apparently this is already in place. You do get an warning.... but not from Koa."
<img src="/img/npmLogKoaVersion.jpg" style="float:right" width="50%">

H: "No from Koa? So who ... aaaaah npm?"

M: "Yup - scrolling back up... sure enough I saw it. Not really right in front of my eyes but still... Read the manual, dude!"

H: "But now wait a second... what if I cannot change the version of node? If it's on a server that I don't control or something. Talk about breaking change!"

M: "Well... the nice Koa-guys showed me a trick. First install something called `bluebird`, with `npm install bluebird --save`. Then add this line at the top of you app.js:

```javascript
global.Promise = require('bluebird');
```

M: "And then it started to work as well... but really you should try to keep to the right version. And read the npm log..."

H: "I guess so..."
