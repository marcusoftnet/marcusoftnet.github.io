---
layout: post
title: Repost Beyond Callbacks or How Koa helps me Code Better
author: Marcus Hammarberg
date: 2014-05-07 15:30:13
tags:
  - Javascript
  - Tools
  - Node
  - Koa
  - CodeBetter
---

### REPOST FROM CODEBETTER

I noticed that [CodeBetter](http://codebetter.com/marcushammarberg/) is slowing down. Maybe dying. I'm preserving my post from there here.

## Original post

For the better part of my life I have been a C# programmer. But lately I have ventured into [JavaScript land](https://www.marcusoft.net/search/label/Javascript). And I like it. I have come over the “what kind of junk is this”-phase and come to see the power and beauty that is “[hidden under a huge steaming pile of good intentions and blunders is an elegant, expressive programming language](http://codeascraft.com/2011/03/23/douglas-crockford-at-etsy/)”. You should read [that book](http://shop.oreilly.com/product/9780596517748.do), by the way, that’s the one that made me like JavaScript.

Being a backend-guy (I will NEVER understand CSS… There – I’ve said it!) I soon came to look into [Node](http://www.nodejs.org/)too. And pretty soon after that I met [Express](http://www.expressjs.com/). Express was very nice since it reminded me of [Nancy](http://www.nancyfx.org/). Felt right at home, back on the super-duper-happy-path! So after going through a lot of examples and tutorials and writing a couple of applications on my own I grew really tiered of one feature of most Node applications.

That was … …wait (state)

```text
​     …creating request for fact (state)

​          Wrapping in logger (state)

​                And authenticating (state)

​                    Calling service (state)

​                        “THE FACT”

​                    Attaching to state

​              Out of callback

​          reformatting response and out of callback

​     Out of callback
```

<!-- excerpt-end -->

There – we can continue. _the fact_ that you need to use [callbacks](https://www.marcusoft.net/2014/03/javascript-callbacks-cant-live-with.html) so extensively. Don’t get me wrong – the non-blocking principles that Node is built around is awesome. I especially like that you “fall into the pit of success” since everything is written around non-blocking code, which automatically helps my application to scale and manage resource wisely.

But seriously… all those nested callbacks are making my eyes bleed. Talk about hiding the intention of the code. And I also grew very tired of trying of passing state through the chain of callbacks just to be able to use it in the final one. And for the record; Yes – I have heard about [promises](http://www.html5rocks.com/en/tutorials/es6/promises/), but for some reason I couldn’t wrap my head around it. For me, it didn’t feel natural. Never gave it a proper chance, I’m willing to admit. But when I saw [Koa Js](http://koajs.com/) things started to make sense again. Here is a mini-application that returns a user, from [MongoDB](http://mongodb.github.io/)by name sent to the URL.

```javascript
// Dependencies
var koa = require("koa");
var app = koa();
var logger = require("koa-logger");
var route = require("koa-route");

// Db access
var monk = require("monk");
var wrap = require("co-monk");
var db = monk("localhost/koaDemoUsers");
var users = wrap(db.get("users"));

// Middleware
app.use(logger());

// Route
app.use(route.get("/user/:name", getUser));

// Route handling
function* getUser(userName) {
  var user = yield users.findOne({ name: userName });
  if (!user) this.throw(404, "invalid user name");
  this.body = user;
}
```

Pretty nice, huh? Thumbs up from me! I even threw in some logging and error handling just to make it a little more interesting. Strip that out and you end up with 2,3 significant lines of code. I take my web frameworks like my coffee – short, sweet and powerful. And we have not lost the non-blocking features that we’ve come to expect and love in Node. In short –

Koa helps me Code Better! In the rest of this post I’ll introduce you to the concepts of Koa and give you a short overview to how it works.

## Generators, asterisk and yield

In fact, when I read the code above it’s exactly how I think about code. Get the user from the database. Store in variable. Use on the following line. The callbacks that Node “pushed” to write is not how I think about my code. Now, in order to fully understand what happened above I need to explain about the [generator concepts coming in ES6 of JavaScript.](http://wingolog.org/archives/2013/05/08/generators-in-v8) And to do that, at least I, need to refresh my knowledge on [yield](http://en.wikipedia.org/wiki/Yield).

### Yield and generators

I happily confess that I never used [yield in C#](http://msdn.microsoft.com/en-us/library/9k7k7cf0.aspx), although it have been around for years. Now yield is coming to JavaScript and then they can be used in very interesting ways, which led me to try to understand yields again. Quite simply you can say that a yield statement is used to return a value from a sequence, and then halt until the client asks for the next value. Often they are used within loops through enumerations but they don’t have too. In fact this example made me understand them better;

```javascript
function* theGenerator() {
  yield "One, for the money";
  yield "Two, for the show";
  yield "Three to get ready! Now go, cat, go";
}
```

This is a little function that contains three yield statements. We can call the function in this way, in order to make use of the yield’ed values.

```javascript
var elvis = theGenerator(); // get an instance of the generator

console.log(elvis.next().value); // outputs "One, for the money”
console.log(elvis.next().value); // outputs "Two, for the show"
console.log(elvis.next().value); // outputs "Three to get ready! Now go, cat, go"

/*
console.log(elvis.next()); // outputs { value: undefined, done: true }
console.log(elvis.next()); // throws Error: Generator has already finished*/
```

Note that I’m using the `.value` property to get the value out of the generator. The answer returned from the `.next()` is actually a little structure containing the value and a boolean property called done, which can be used to see if the sequence is finished or not. If fact, we could keep calling the function which would result in “undefined” for the fourth call and for the rest of the calls it would throw an `Sequence already finished` error.

I said above that yield most commonly is used within enumerations of sequences (`for(var item in list){ yield item;}` for example.) But the function is not an enumeration, but rather a generator-function. This is another feature that comes with ES6 and quite simply can be thought of like enumerators for functions, or simpler with the example above as a guide. In order for a function to be a generator function it needs to fulfil two things;

- It needs to contain one or more yield-statements
- You need to denote it with an asterisk, like the example above; function \*_theGenerator(){}_ or for anonymous functions just _function \*(){}_

You can read more about [generators here](https://www.marcusoft.net/2014/04/koaGenYield.html).

From <http://twistedsifter.com/2012/04/50-animated-gifs-for-every-situation-ever/>

This explanation might render you totally unimpressed. And you may ask; “Why is this cool then? This seems just like a very theoretical computer science concept that is squeezed into JavaScript. Why should I care about that? Well, for me the following statement from this great article made all the change;

> when the code encounters a `yield` statement, it suspends execution indefinitely, and doesn’t start again until you tell it to

Or in laymen (that’s me) terms; when the code hits a yield it performs that action in non-blocking way, returning the execution control to Node that can do other things while our yield statements complete. It’s just like callbacks but without the callback. It’s [#beyondCallbacks](https://twitter.com/search?f=realtime&q=%23beyondCallbacks&src=typd) © I’m claiming that hashtag now, but you can use it freely.

That’s all the theory – let’s now take a look on how [Koa Js](http://www.koajs.com/) uses these techniques to help you write less and easier to read code. For the record I hold both those properties in the highest regard. Just two short notices first.

## A quick note on how to run this example

As mentioned these features are not in JavaScript yet, they are [coming in ES6](http://wiki.ecmascript.org/doku.php?id=harmony:specification_drafts). However, you can already now run this. There’s a couple of things you need to do in order to get it to run.

### Install Node 11.9 or higher

The easiest way I have found to do this is using the [nvm node package](http://npmjs.org/package/nvm). This let’s you install several versions of Node on your machine and easy switch between them. Here’s what you need to do, provided that you have [Node](http://www.nodejs.org/)installed.

- Install nvm (`npm install nvm –g`)
- Install a version of node later than 11.9 (`nvm install 0.11.12` for example). That command also switches over to the 0.11.12 version, so that is the version you are using after the installation is complete.
- You can in the same manner install other versions of node if you want to (`nvm install 0.11.8` for example)
- To switch to another version of node use the `use` command (`nvm use 0.11.8` for example).
- To check which version you’re running just use `nvm current`

### Start Node with the –harmony flag

Ok, now that you have an updated version of Node on your system there’s one final thing you need to do;

> use the –harmony flag when you execute the program.

Let’s say that we had the code from my example above in a file called generatorDemo.js. We would then start the program like this; “_node –harmony generatorDemo.js_“. For me, the best way of remembering to do this is to put it into my package.json file, under the scripts-tag as the “_start_” script;

```
 “scripts” : { “start” : “node –harmony app.js” }
```

This will then allow me to start the application, like I always do, with “npm start”. If you want to learn more I’ve written about [package.json](https://www.marcusoft.net/2014/02/mnb-packagejson.html) and [npm](https://www.marcusoft.net/2014/02/mnb-npm.html).

## A quick note on a problem you might run into

Sorry, one more thing. You will probably run into this error;

```javascript
yield "One! For the money";
^^^^^^^^^^^^^^^^^^^^

SyntaxError: Unexpected string
```

This happens when you forget to put the asterisk in the name of the function. It should be

```javascript
function* theYielder() {} // or function *(){}
```

It’s too embarrassing really talk about the number of times I’ve forgot this and tried to figure out what the error message means.

## Koa Js – a generator based web framework

Ok, back to the point of all this. This post is growing too long already, but I wanted to introduce you to Koa Js – a minimalistic web framework that uses generators to simplify the code you need to write a great deal. This is by no means a complete overview of this framework but rather just a little appetizer on how generators can be used. Let’s skip the Hello World example and instead build something a little more exciting. Let’s build a blog that stores posts in Mongo Db. It’s will not be long, I promise you, but it will show a couple of features of Koa Js and I’m sure you can take it from there. I’m also adding some structure to the application (as opposed of keeping everything in one file) and introducing testing.

The [whole example can be found here](https://github.com/marcusoftnet/CodeBetterKoaDemoCode). Create a new directory called KoaMongoBlog and cd into it (`mkdir KoaMongoBlog* and then *cd KoaMongoBlog`).

Now create a `package.json` with the following content;

```javascript
{
  "name": "KoaMongoBlog",
  "description": "A very simple blog using mongo via monk",
  "version": "0.0.1",
  "dependencies": {
    "co": "^3.0.0",
    "co-body": "0.0.1",
    "co-views": "^0.1.0",
    "koa": "^0.5.0",
    "koa-logger": "^1.1.0",
    "koa-route": "^1.0.2",
    "swig": "^1.2.2",
    "monk": "^0.8.1",
    "co-monk":"^1.0.0"
  },
  "devDependencies": {
    "co": "*",
    "mocha": "*",
    "should": "*",
    "supertest": "*"
  },
  "scripts": {
    "test": "./node_modules/mocha/bin/mocha --harmony-generators test.js -u bdd -R spec",
    "start" : "node --harmony app.js"
  },
  "engines": {
    "node": ">= 11.9"
  },
  "license": "MIT"
}
```

As you can see there’s a number of packages that we are depending on and that’s how Koa rolls. Koa is really tiny and then you include the middleware you need. Examples of such in this case is koa-route (for routing DUH!), koa-logger (for… well you know) and co-monk (a generator friendly wrapper for Mongo Db access). Embrace the middleware! There’s loads of them and often they are tiny, no more than a single function.

Note in my `package.json` that I have encapsulated the starting of the application in the scripts start node as described above. I’ve also growing into the habit to separate out the devDependencies from the dependencies needed in production. Next, create the application file, `app.js` and paste this in;

```javascript
// Dependencies.
var logger = require("koa-logger");
var route = require("koa-route");
var koa = require("koa");
var app = (module.exports = koa());

// middleware
app.use(logger());

// route middleware
var routes = require("./blogRoutes.js");
app.use(route.get("/", routes.list));
app.use(route.get("/post/new", routes.add));
app.use(route.get("/post/:id", routes.show));
app.use(route.post("/post", routes.create));
app.use(route.post("/post/:id", routes.update));
app.use(route.get("/post/:id/edit", routes.edit));
app.use(route.get("/post/:id/delete", routes.remove));

// listen
app.listen(3000);
console.log("Blog engine fired up on http://localhost:3000");
```

If you think this looks a lot like ExpressJs you are right. Koa is actually created by the VisionMedia guys, that created Express too. Wonder why they did that…?

Routing works as expected by telling the app to `.use` a certain function to response to a certain URL. Nothing strange. Also note how simple it is to use the middleware of Koa, just `app.use(logger())` and you’re done. Writing your own middleware, or encapsulating them is very easy to. [Here’s a post](https://www.marcusoft.net/2014/05/marcus-node-bits-basic-authentication.html) where I create my own very simple middleware.

But right now, nothing is really happening in the app… it’s just routes. Let’s create the `blogRoutes.js` we’re requiring on line 11, just below the // routes comment.

Add the following code to it.

```javascript
// dependencies
var parse = require("co-body");
var render = require("./render.js");

// Set up monk
var monk = require("monk");
var wrap = require("co-monk");
var db = monk("localhost/koaMongoBlog");
var posts = wrap(db.get("posts"));
module.exports.posts = posts; // Let's expose the posts collection for testing

// And now... the route definitions
// List posts
module.exports.list = function* () {
  var postList = yield posts.find({});
  this.body = yield render("list", { posts: postList });
};

// Show creation form.
module.exports.add = function* () {
  this.body = yield render("new");
};

// Show post for id.
module.exports.show = function* (id) {
  var post = yield posts.findOne({ _id: id });
  if (!post) this.throw(404, "invalid post id");
  this.body = yield render("show", { post: post });
};

// create new post
module.exports.create = function* () {
  var post = yield parse(this); // parses the incoming request (this) into an object
  post.created_at = new Date();

  yield posts.insert(post);
  this.redirect("/");
};

// Show edit form
module.exports.edit = function* (id) {
  var post = yield posts.findOne({ _id: id });
  this.body = yield render("edit", { post: post });
};

// Update post
module.exports.update = function* (id) {
  var post = yield parse(this);
  yield posts.updateById(id, post);
  this.redirect("/post/" + id);
};

// Remove post
module.exports.remove = function* (id) {
  yield posts.remove({ _id: id });
  this.redirect("/");
};
```

There’s a couple of lines at the top where we are setting up our access to Mongo through a great little library called Monk. This all ends up with us getting a blogPosts collection that we then can use in our functions below. With the generator goodness around [Monk](https://github.com/visionmedia/monk) (using [co-monk](http://npmjs.org/package/co-monk)) the code is almost trivial, yet powerful. Just like we like it. You see examples on `.findById(id)`, `.find()`, `.update` and `.remove` in the code and I barely need to describe those. Many of the method takes optional parameters making them powerful, for things like sorting and projections. See the [Monk test for examples](https://github.com/visionmedia/monk). The rendering to views is done using a template engine called [swig](http://paularmstrong.github.io/swig/docs/) which you can read about if you need to, it’s really simple. You can pass data to the templates as a second parameter to render like this (`yield render(“view.html”, { posts : postList})`).

The call to the view engine is encapsulated in a simple function/middleware found in the `render.js` file.

```javascript
// Dependencies.
var views = require("co-views");

// setup views mapping .html
// to the swig template engine
module.exports = views(__dirname + "/views", {
  map: { html: "swig" },
});
```

This simple function just tells Koa where to find the views (`/views` folder) and that the swig template engine is to be used. In the actual views you use `{ % % }` for statements and `{{ data }}` to have data appear on the page. Take a look at the list.html page that lists all the blog-posts in the system and you’ll see what I mean about swig being really simple.

{% raw %}

```handlebars
{ % extends 'layout.html' %}

{ % block title %}Posts{ % endblock %}

{ % block content %}
  <h1>Posts</h1>
  <p>You have <strong>{{ posts.length }}</strong> posts!</p>
  <p><a href="/post/new">Create a Post</a></p>
  <ul id="posts">
    { % for post in posts %}
      <li>
        <h2>{{ post.title }}</h2>
        <p><a href="/post/{{ post._id.toString() }}">Read post</a></p>
      </li>
    { % endfor %}
  </ul>
{ % endblock %}
```

{% endraw %}

Note the inclusion of a layout page at the top (`{ % extends … % }`), where you can set up the framework of the pages. The rest of the views, works the same way and [can be found here](https://github.com/marcusoftnet/CodeBetterKoaDemoCode).

Ready to roll! You can now run you blog engine, written in less than 85 lines of code (not counting views). By you write tests first, right? Let’s try it out first and then write tests. [TDD is dead I heard](http://david.heinemeierhansson.com/2014/tdd-is-dead-long-live-testing.html)…

To run this you need to:

- install the packages in the `package.json` with `npm install`
- and then kick the site off with `npm start` that fires up the command I had in `package.json` under scripts->start, if you remember

Now open the blog app on <http://localhost:3000>. The [Mongo](http://www.mongodb.org/) database (you have Mongo installed right?) will be created for you and you can use a tool like [RoboMongo](http://robomongo.org/) to peek into it.

### Testing

Before you leave, let’s take a look on how this can be tested. I will not show all the tests since that tends to grow long, but rather just show you how we can make a simple test to check that the update page shows up for an existing post.

```javascript
var app = require("./app.js");
var co = require("co");
var should = require("should");
var request = require("supertest").agent(app.listen());
var posts = require("./blogRoutes.js").posts;

describe("Blog with mongo:", function () {
  var removeAll = function (done) {
    co(function* () {
      yield posts.remove({});
    })(done);
  };

  beforeEach(function (done) {
    removeAll(done);
  });

  afterEach(function (done) {
    removeAll(done);
  });

  var test_post = { title: "A nice title", body: "Short body. Yeah!" };

  it("updates an existing post", function (done) {
    co(function* () {
      var post = yield posts.insert(test_post);

      var postUrl = "/post/" + post._id;
      request
        .post(postUrl)
        .send({ title: "Updated title", body: "Updated body" })
        .expect(302)
        .expect("location", postUrl);
    })(done);
  });
});
```

Here we are using [Supertest](https://www.marcusoft.net/2014/02/mnb-supertest.html) together with [mocha](https://www.marcusoft.net/2014/02/mnb-mocha.html) to test our application. Note how simple it is to do requests against the application (line 4 and 29-33) and how we can validate the data on the page too. I should say a couple of words about [co](http://npmjs.org/package/co) and how I’m using it in testing. In order to show an existing post from the database on the page, I need first to insert it into mongo. I do that using the posts-collection from the `blogRoutes.js` file.

When that is done I need to access the page and validate that the data is on there. Since the co-monk is using generators it’s expecting that we use yield, and hence wait until that line is completed before moving on, we need someone to control that flow of execution. That’s Koa when we’re running this as a web application, but in the testing case we need help from another library, `co` . Co controls the flow through the yields for us and we can write the code as in our tests.

Note that the co constructor function wraps our entire test specification and then is immediately invoked, like this:

```javascript
co(function* () {
  // the actual test that will use yield
  // code, code, code
  // and then, when we’re done…
})(done);
```

## Summary

First – all the code for this [blog post can be found here](https://github.com/marcusoftnet/CodeBetterKoaDemoCode). You should check out generators since they are coming in ES6 and can help you #beyondCallbacks. You should check out KoaJs since that’s a really nice way of writing small, powerful, web applications. You should check out the following blog posts and sites that helped me a lot when I learned this;

- [Great intro on Generators](http://tobyho.com/2013/06/16/what-are-generators/)
- [Koa’s own examples](https://github.com/koajs/examples/) contains a lot of good starting points
- [Koa’s website](http://www.koajs.com/)
- And I’ve written [some posts on Koa](https://www.marcusoft.net/search/label/Koa) that dives a bit deeper than this

I hope this longish post helps you steer away from some of the long winding error roads I have traveled and wrong turns I’ve taken the last couple of months.
