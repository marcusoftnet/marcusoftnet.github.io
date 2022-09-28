---
layout: post
title: "Koa Js and the power of mounting"
author: "Marcus Hammarberg"
date: 2015-04-02 08:41:15
tags:
 - Javascript
 - Koa
 - Node
 - Tools
---

I've been writing quite a lot of [Koa](http://koajs.com) applications, but most of them have been small. Now I'm doing a little bit bigger website. It consists of three parts:

* A public site that is just static html, served with [static-now](http://npmjs.org/package/static-now). The site will do API calls back to the server for the content.
* An administration site for administration of the text content of the site. This will be based on my example [koa example blog](https://github.com/marcusoftnet/koablog-mongo)
* An API serving the content from use form the static site.

Absolutely nothing humongous but still big enough that you need to think about application structure a little bit.

That's when I came to think about [koa-mount](https://github.com/koajs/mount). In this post I wanted to show you what I've learned about this powerful little middeleware, at the heart of Koa thinking.

<a name='more'></a>

The tag-line on the [koa-mount](https://github.com/koajs/mount) page says it all really:

<blockquote>Mount other Koa applications or middleware to a given pathname</blockquote>

That sounds easy but how does it really work and what opportunities does this give us? I think it's easiest to show with an example:

# Basic (?) example

```javascript
var koa = require('koa');
var mount = require('koa-mount');

// hello app
var hello = koa();
hello.use(function *(next){
  yield next;
  this.body = 'Hello';
});

// world
var world = koa();
world.use(function *(next){
  yield next;
  this.body = 'World';
});

// app
var app = koa();

app.use(mount('/hello', hello));
app.use(mount('/world', world));

app.listen(3000);
console.log('listening on port 3000');
```

This is the example code that koa-mount supplies. Let's walk through it:
1. At line 4-9 we create a small little Hello application that simply
1.1. wait until all other middleware has answered
1.1. always return 'Hello' in the body
1. Line 11-16 sets up a very similar application always returning 'World' in the body
1. Now.. the interesting things happens on line 21 and 22.
1.1. See on line 21 that we are 'mounting' the ```a``` application under the path ```/hello```
1.1. And the ```world``` is mounted under ```/world```
1. The final part 24-25 just starts the application on ```http://localhost:3000```.

Now if you were to go to ```http://localhost:3000``` you'll get a ```Not found``` since no-one is listening there. ```http://localhost:3000/hello``` will of course answer ```Hello``` and ```http://localhost:3000/world``` answers ```World```

* That's it really, but sadly I find this example a little bit over complicated. The apps are not really apps. They are koa middleware and the ```yield next``` is a little bit distracting.
* Also, in this case the examples applications are in the same file, which doesn't really show the power of this.

Let's improve this a bit.

# Separate files
Let's address the second point above first, because that's trivial. Moving the applications to separate files are very simple. I moved them into a sub directory called ```subapps``` Here's the ```/subapps/hello.js``` application:

```javascript
var koa = require('koa');
var app = module.exports = koa();

app.use(function *(next){
  yield next;
  this.body = 'Hello';
});
```

Only thing worth noticing is that I've exposed the ```app``` object using ```var app = module.exports = koa();``` on line 2.

Here's the ```/subapps/world.js``` application. Exactly the same:

```javascript
var koa = require('koa');
var app = module.exports = koa();

app.use(function *(next){
  yield next;
  this.body = 'World';
});
```

Ok, this turns out very beautiful in the main application now: ```mountingAppsFromDifferentFiles.js```:

```javascript
"use strict";
let mount = require('koa-mount');
let koa = require('koa');
let app = koa();

let helloApp = require('./subapps/hello.js');
let worldApp = require('./subapps/world.js');

app.use(mount('/hello', helloApp));
app.use(mount('/world', worldApp));

app.listen(3000);
console.log('listening on port 3000');
```

Here's we're just stitching together the application, giving each sub application the path under which they operate.

# Sub routing
But that's still "just" middle ware. Let's see what a little more real application would look like.

Here's an application using [koa-route](https://www.npmjs.com/package/koa-route) to create some routing:

```javascript
"use strict";
let koa = require('koa');
let route = require('koa-route');
let app = module.exports = koa();

app.use(route.get("/", index));
app.use(route.get("/user/:name", user));

function *index() {
	this.body = "You are on the index of the sub app";
};

function *user(name) {
	this.body = `The name of the user is ${name}`;
};
```

Very simple: at the root of *this* application we return a string informing the users that they have reached the index of the sub app. The second route takes a ```name``` querystring parameter that we return in a EcmaScript 6 templated string (Achievement unlocked!)

In our "main" application we can do this:

```javascript
"use strict";
let mount = require('koa-mount');
let koa = require('koa');
let app = koa();

let subApp = require('./subapps/appWithRoutes.js');
app.use(mount('/subapp', subApp));

let deepPath = require('./subapps/appWithRoutes.js');
app.use(mount('/sub/app/and/a/very/deep/path', deepPath));

app.listen(3000);
console.log('listening on port 3000');
```

Now we can reach our sub application by going to ```http://localhost:3000/subApp``` which will return  ```You are on the index of the sub app```. From ```http://localhost:3000/subapp/user/marcus``` we will get a nice message greeting ... well me.

As a finale to this example I show how you can mount another instance of the application in another path. So ```http://localhost:3000/sub/app/and/a/very/deep/path/user/marcus``` will again display a nice greeting.

In fact you could also use the same instance of the sub application if you wanted. Like this:

```javascript
"use strict";
let mount = require('koa-mount');
let koa = require('koa');
let app = koa();

let subApp = require('./subapps/appWithRoutes.js');
app.use(mount('/subapp', subApp));
app.use(mount('/sub/app/and/a/very/deep/path', subApp));

app.listen(3000);
console.log('listening on port 3000');
```

# Conclusion
[koa-mount](https://github.com/koajs/mount) is perfect to compose bigger applications into smaller parts. Maybe you already have a blog application that you can reuse and just include under the ```/blog``` path. That's one line of code using ```koa-mount```.

Bringing it back to my application that I've described at the top it will have a main application that looks something like this:

```javascript
"use strict";
let mount = require('koa-mount');
let koa = require('koa');
let app = koa();

let staticSite = require('./staticSite/index.js');
let api = require('./api/index.js');
let adminSite = require('./admin/index.js');

app.use(mount('/', staticSite));
app.use(mount('/api', api));
app.use(mount('/admin', adminSite));

app.listen(3000);
console.log('listening on port 3000');
```

In each of the directories I can now create and keep the site modular and nice. In fact I could create them as separate packages too if I wanted and then just mount the packages.

Get on the mounting-train - it's good for you.

I've put these files and examples up on [github](https://github.com/marcusoftnet/mountDemos) should you want to play with it.