---
layout: post
title: "Marcus Node Bits - Basic Authentication with Koa"
date: 2014-05-02T13:26:00.001Z
author: Marcus Hammarberg
tags:
  - Javascript
  - Tools
  - Koa
modified_time: 2014-06-09T02:59:00.503Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-8966292886396606059
blogger_orig_url: http://www.marcusoft.net/2014/05/marcus-node-bits-basic-authentication.html
---

As [you might know I have fallen in love](http://www.marcusoft.net/search/label/Koa) with [Koa Js](http://www.koajs.com/). I have, from experience, also come to realize that if you want to really understand a framework or tool you need to build something real with it. In that spirit, I created a little voting site that we will use in [my current job](http://www.marcusoft.net/search/label/Team%20Yayasan). The whole application is simple; basically, you can create a question (poll maybe is a better word) that you want someone to answer. “How did you enjoy your stay?” for example. There are then only 4 valid answers: ![Sad smile](/img/wlEmoticon-sadsmile2.png), ![Disappointed smile](/img/wlEmoticon-disappointedsmile2.png), ![Smile](/img/wlEmoticon-smile2.png), and ![Open-mouthed smile](/img/wlEmoticon-openmouthedsmile2.png). The idea is that answering this is just pushing a button on your way out, like a physical Facebook like-button. From this, we can gather some simple, but interesting data about what people think about the question asked.

However, soon I realized that I wanted to be able to add new questions, or fix spelling errors, etc. Since the site was open, I needed some sort of authentication to make sure that not everyone could change this. I opted for the most basic I could think of: Basic Authentication.

Yes – I know that I could have done this with Twitter etc., but this was just a simple thing. I would think that maybe some of you might use this for internal applications etc.

In the [rich Koa ecosystem](https://github.com/koajs/koa/wiki#middleware), there’s support for basic authentication ([koa-basic-auth](http://www.npmjs.org/koa-basic-auth)) and this post describes how I set that up. In doing so, I learned a couple of things about Koa and how the middleware works. It was interesting for me – I hope you enjoy it too.

Let’s head over to the [koa-basic-auth code](https://github.com/koajs/basic-auth) and see what they have to say to help us. I’ve created a gist of that code.

I had to read this a couple of times before I fully understood how it works. Line 23 is where we use the `auth` (that is required on line 1) object and, in this case, simply hard-code it to a user object. The properties of this object need to be `name` and `pass`. On line 27, we find the complete application that simply returns a string… A secret string… You need to be authenticated to see that.

Lines 7-19 is where this authentication is required. Here we create a little middleware of our own. Did you see that little line in the beginning of the example section of the README? “Password protect downstream middleware.” Remember that Koa is built up of tiny pieces of middleware (often just a single function) that are stitched together. The koa-basic-auth middleware password protects the middleware called after it. This comes in handy now.

The `app.use()` is how middleware is added to Koa. You probably have seen `app.use(logger())` if you’ve read any Koa examples. The function on lines 7-9 takes a `next` variable as a parameter, which is Koa’s way of representing the next middleware to call in the chain. We simply do our stuff in this middleware and then wait (using `yield`) for the rest of the middleware chain. Or, as in this case, wrap the rest of the chain with something. This function wraps “the rest of the chain” with an error handler. Since we are using koa-basic-auth (on line 23) to require authentication on the complete site, all our requests will throw a 401 Unauthorized error. We catch that (line 11) and create a response that:

- Sets the status to 401
- Writes a nice message to the body of the response
- Sets the header to [WWW-Authenticate](http://en.wikipedia.org/wiki/Basic_access_authentication) that for most browsers (?) triggers the all-familiar basic authentication log-in box.

Yeah, that’s a pretty roundabout way of doing it, you might think, but it’s just a couple of lines of code that set this up. I did, however, encapsulate this in another file resulting in this:

Which is the same thing but only exposes 2 lines (ah, well 4 if you count the require-statement) in your `app.js`. A bit simpler. Hence.

## For parts of my site

About here I came to realize that this effectively meant that you had to be logged in to vote. Obviously, this was not good enough. Thanks to [some quick help from TJ](https://github.com/koajs/basic-auth/issues/8), I soon realized the Koa way of doing this. You guessed it: “there’s a middleware for that” ©,™ & ®. I’m hereby claiming the rights to that phrase. It will be a thing!

Okay, silliness aside; there’s another middleware called [koa-mount](https://www.npmjs.org/package/koa-mount), which mounts applications.

> Mount other Koa applications as middleware. The `path` passed to `mount()` is stripped from the URL temporarily until the stack unwinds. This is useful for creating entire apps or middleware that will function correctly regardless of which path segment(s) they should operate on.

Ah – that sounds about what we need. We want to mount the basic authentication middleware for part of our application. Once I knew about that, it was almost trivial to append that to my application.

Here’s how it looks in my application right now using the same `authentication.js` as above:

It was all about 2 new lines (9 and 10) that specify which URLs should be password protected. And my `reqBasic-middleware` function is still included on line 8.

## Configuration

At this point, I was about to commit this and push it to GitHub. And I realized that the whole programming humanity (maybe not…) would read the username and password, since it’s hard-coded into my code. I also thought about testing (we’ll come to that later) and publishing this. And there was gnashing of teeth. Because now I needed to have this configurable, and to select the correct configuration for the correct environment.

Luckily, I had a configuration object in place already, for Mongo parameters and other things, so I built from that. Here is how the object ended up looking:

There’s quite a lot of stuff going on in there that really doesn’t have to do with this post, but let’s go through the highlights:

- The last lines (28-30) is a function that simply exposes the object as a function. This is so that you can go `var config = require([path])('test')` if you wanted to. Or it picks up the parameter from you starting node. And if nothing of that is supplied, it defaults to ‘local’, which is the name I used for my development environment.
- The config object itself is, thankfully, a bit more straightforward. It sets up the different settings for the environments. However, only one of them is returned by the function we just mentioned. Remember that JavaScript objects are just key-value pairs and you can index into the objects with strings. That is what that strange line is really doing (`config[mode || process.argv[2] || 'local']` would eventually be evaluated as `config['local']` for example).

Let’s talk a bit about the authentication parts also, sorry for that longish detour:

- Lines 3-5 set up an object that either uses the [process.env](http://nodejs.org/api/process.html#process_process_env) parameters `BASIC_USER` and `BASIC_PASS` or some default values. That object is stored in an `adminUser` variable.
- That variable is then slapped onto the config object that I return, resulting in that I can use it like this in my authentication module:

```javascript
var config = require('../config')();
module.exports.user = config.user;
```

This means that if you have set anything in `process.env.BASIC_USER`, that will be used; if not, ‘marcus’ will be used. You can pass the process [environment variables as parameters to the node process at your command prompt](http://nodejs.org/docs/latest/api/process.html#process_process_argv). In the development and testing case, I will not set anything in those variables and hence have a known state (marcus, koavote) to test against. In the production environment, however…

## On Heroku or other providers

… you need to [supply it as parameters to Node](http://nodejs.org/docs/latest/api/process.html#process_process_argv) as I wrote above. You could do this by setting these parameters in the [start script of your package.json](http://www.marcusoft.net/2014/02/mnb-packagejson.html), but that would defeat our purpose of having to check in the username and password in clear text.

![settingConfigVars](/img/settingConfigVars_thumb34.jpg)

Most providers provide (hihi) a way to set these process parameters in their platform-as-a-service configuration. For [Heroku](http://www.heroku.com/) (that I am using), that looks like this and worked beautifully if it hadn’t been for my own stupidity [where I had a typo in the production code](https://github.com/marcusoftnet/koaVote/commit/abd3ba07720e54bb199d391fc9bec2f69f9bd48d). [Test all the things that could possibly break](http://c2.com/cgi/wiki?TestEverythingThatCouldPossiblyBreak)!

So now I can set the username and password that I want to use in production in the production environment and have another for testing purposes. Speaking of testing…

## How do I test this?

Oh man, this grew long. Luckily, the testing story is just beautiful, using [Supertest](https://www.blogger.com/www.marcusoft.net/2014/02/mnb-supertest.html). I just pick up my testing-config object and use those parameters to authenticate the Supertest request with. Here’s one test that does all that.

The interesting line here is line 12 where I use the `.auth()` function of supertest, passing it the variables from my config user described above.

I learned a lot from getting this to work. Much more than things about authentication and doing the very basic password protection I first wanted. Hmmm… there might be something in there…

[You learn stuff by pushing it out into production and starting to use it for real](http://theleanstartup.com/). I should write about that. Nah! It will never catch on.
