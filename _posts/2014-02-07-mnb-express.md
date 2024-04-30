---
layout: post
title: Marcus Node Bits - Express is best without generators
date: 2014-02-07T13:00:00.000Z
author: Marcus Hammarberg
tags:
  - MobProgramming
  - Javascript
  - Tools
modified_time: 2014-06-02T08:56:52.524Z
thumbnail: http://2.bp.blogspot.com/-1qNQ7SOosMg/UvDtzj8PjNI/AAAAAAAAB7M/gk0bNXl-_E8/s72-c/Screen+Shot+2014-02-04+at+20.38.36+.png
blogger_id: tag:blogger.com,1999:blog-36533086.post-65862151838481954
blogger_orig_url: http://www.marcusoft.net/2014/02/mnb-express.html
---

I'm writing down some of the things I've picked up when I started to learn about [Node](http://nodejs.org/), [Express](http://expressjs.com/), and [Mongo](http://www.mongodb.org/). Here are all the posts in the series:

- [Doing stuff in the terminal is not scary at all](http://www.marcusoft.net/2014/02/mnb-terminal.html)
- [npm is not only for getting packages](http://www.marcusoft.net/2014/02/mnb-npm.html)
- [Package.json is a mighty tool](http://www.marcusoft.net/2014/02/mnb-packagejson.html)
- [Git is not that hard, but I need to refresh my knowledge](http://www.marcusoft.net/2014/02/mnb-git.html)
- [Callback function is cool stuff, and I even know how to write them](http://www.marcusoft.net/2014/02/mnb-callbacks.html)
- [mocha is cool both as framework and test runner](http://www.marcusoft.net/2014/02/mnb-mocha.html)
- [Should is a nice way to do asserts](http://www.marcusoft.net/2014/02/mnb-should.html)
- [monk is an easy way to access mongo](http://www.marcusoft.net/2014/02/mnb-monk.html)
- Express is best without generators - this post
- [supertest is a nice way to test an api](http://www.marcusoft.net/2014/02/mnb-supertest.html)

This post is about the most commonly used web framework in Node: [Express](http://expressjs.com/). Node in itself is pretty cool and the three-line web server is mind-blowing at first sight. Pretty soon though you want something that is a bit friendlier to code against. Most people seem to go with [Express](http://expressjs.com/). From their web page, we read:

> Express is a minimal and flexible node.js web application framework, providing a robust set of features for building single and multi-page, and hybrid web applications.

Couldn't agree more. The only thing is... most tutorials on Express use the generators. That is the set of tools that comes with Express (install with `npm install express -g`) and you'll have the generators all over. This site generator bothers me in two ways:

- It sets up a complete site when I just want to do an API.
- That site defaults to server-side generation when I want to serve a static JavaScript client.

Nowadays I tend to default to a simple backend API (see, I didn't even write REST API just to avoid religious battles. Smooth operator :)), that just serves JSON and then a JavaScript client that calls into that API, using [AngularJS](http://angularjs.org/) for example.

I don't need Jade, Sessions, and folders for controllers, etc. My whole API will be 1-5 files depending on how modular I'm feeling. I might need a public folder but that's easy enough to fix.

So my suggestion is that you ditch the [generators (powerful as they are)](http://expressjs.com/guide.html#executable) and drop down to bare-bones [Express](http://expressjs.com/). You'll find a very powerful and terse framework that resembles [NancyFx](http://nancyfx.org/) a lot. Ah, well, it resembles [Sinatra](http://www.sinatrarb.com/) too, but Nancy is cooler.

In fact, on their [guide page](http://expressjs.com/guide.html#executable), [ExpressJs](http://expressjs.com/) is showing you the minimal version first. And we can write the ubiquitous fit-in-a-tweet-web application:

```javascript
var express = require('express');
var app = express();

app.get('/', function(req, res) {
  res.send('Hello World');
});

app.listen(3000);
```

This little application just responds with "Hello World" when you access it on [http://localhost:3000](http://localhost:3000/).

### Understanding Express

The API for Express is very easy and in fact, there are just a couple of basic things that you need to know in order to start coding up an API. Things are considerably easier when we're just dishing out JSON rather than creating a complete site.

As always this is just the things that I've used and got to know. You should check out the [API documentation](http://expressjs.com/api.html), it's great. And the [starting guide](http://expressjs.com/guide.html) is also nice.

First and foremost you should create an Express application. This is super simple since that's what the `express()` function returns. Like this:

```javascript
var express = require('express');
var app = express();
```

In the little tweet example above you saw the `app.get()` function in action. The really good news is that all the HTTP verbs act in the same manner. They take a URL path and a callback function.

You can understand it as: "when somebody *Posts* to '/orders/', execute this function that I'm writing here".

As I said the path parameter can contain parameters that we easily get hold of via the `req.params` property. Here's an example of a get to a URL with a parameter, called id:

```javascript
app.get('/users/:id', function(req, res) {
  res.send('user ' + req.params.id);
});
```

Often your clients will be sending data in the body of the HTTP request. Express provides an easy way to extract those by using the middleware `bodyParser()` (see below). Which gives us this easy way to access the body data:

```javascript
app.post('/users', function(req, res) {
  var username = req.body.username;
  res.send('user ' + username + ' created');
});
```

To this you can post an HTTP form like this (using the awesome [Postman extension for Chrome](http://www.getpostman.com/)):

![Screen Shot](http://2.bp.blogspot.com/-1qNQ7SOosMg/UvDtzj8PjNI/AAAAAAAAB7M/gk0bNXl-_E8/s1600/Screen+Shot+2014-02-04+at+20.38.36+.png)

Sometimes, or rather after a while, writing the functions inline gets a bit messy. You can then write the handling code in a separate module and include that. Express, default, puts these in a folder called "routes", but we can do as we want.

Note that I'm using the `exports` keyword in the `userHandler.js` file. That lets the function be visible to other modules. I used the name `handler` as a nod to a way we created frameworks in the 90s. Everything that we really didn't know what to name was "handler". It should maybe have been "controller" in this case...

You return data via the response-object that is passed to the callback function for your route, often called `res` but you can of course name it whatever you want. The simplest is just to do `send` as we've seen a lot of examples of already.

When you send JSON back there's a special method for that. The content-type will automatically be set to "application/json" for you when using this method as a nice little service to you.

### Middleware

At the heart of Express is the Connect middleware. For the most part, you don't need to care about Connect since it's nicely exposed as a couple of functions, but it's really how Express is stitched together.

We have already seen the `bodyParser()` in action and here are a few others that I found useful:

#### basicAuth

`basicAuth()` - sets up basic authentication for your site. As always, basic is sending the username and password in clear text, so beware.

#### directory and static

`directory()` - that helps you configure directories, together with `static()` it can help you to serve up static files; like your client-side JavaScript application for example.

#### app.param() - an example of middleware, that is really powerful

The one middleware that impressed me the most, so far, is `app.param()`. This can help you do some really powerful stuff, in just a few lines of code. To show this I'm going to [lean on an example from this site](http://webapplog.com/tutorial-node-js-and-mongodb-json-rest-api-server-with-mongoskin-and-express-js/) and walk you through it:

```javascript
app.param('id', function(req, res, next, id) {
  req.id = id;
  // do something with id
  next();
});

app.get('/user/:id', function(req, res) {
  res.send('user ' + req.id);
});
```

You could also do hard-coded paths, of course (like `/users`) and create a little snippet that loads users by id. This is shown to great effect in the documentation for `app.param()` and I've adapted it here:

```javascript
app.param('userId', function(req, res, next, userId) {
  // do something with userId
  next();
});

app.get('/user/:userId', function(req, res) {
  res.send('user ' + req.userId);
});
```

### Conclusion

Yeah, as you can see express is not that hard and at the same time powerful. Just like we like it. I think you get to know the framework much better without the generators. Go old school and type it yourself!