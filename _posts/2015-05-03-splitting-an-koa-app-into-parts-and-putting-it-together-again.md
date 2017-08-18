---
layout: post
title: "Splitting a Koa app into parts and putting it together again"
author: "Marcus Hammarberg"
date: 2015-05-03 15:09:00
tags:
 - Javascript
 - Koa
 - NodeJs
---

The little series I've written on [supertest](https://github.com/visionmedia/supertest) and other [Koa](http://koajs.com/) friends is moving very slowly ahead. Lots of new findings is making for a lot of innovation that I need to find out and try out. 

But here are the things I've written so far:

* [Splitting API over several files](http://www.marcusoft.net/2015/04/supertest-things-ive-learned---part-i.html)
* Splitting the API not only the test - this post
* [Verify in database after ended request](http://www.marcusoft.net/2015/05/supertest-verify-in-database-after-ended-request.html)

In this post I will show you a powerful way of using [koa-mount](https://www.npmjs.com/package/koa-mount) to create a very modular application structure. And how to test it, of course. 

As before, if you want to tag along as I build this example out, grab the code from this [tag](https://github.com/marcusoftnet/UserApiWithTest/tree/v1.2), and we'll start at the same place.

<a name='more'></a>

# The problem / opportunity

Right now this is a nice little API for users. But what if this starts to grow? If you remember the original post it was answering a question on how to split the _tests_ over several files. But that's only half the story. I want the entire API to be split up in smaller sections. 

I've already split it into files, but they are managed as one unit. I wanted to show you away to make more autonomous units. 

However I think I've pushed the <code>User</code>-parts far enough. It would make no sense (that pops to head right now at least) to use separate services for the different HTTP-verbs. 

Instead let's say that we have Addresses, Orders as a separate API. Our task at hand is to create three small, autonomous API's like the one we have and then gather it under an over-arching _app_ that exposes the API resources. 

# Goal structure
Our application right now is all about Users. Let's move that down a level or two and create a structure like this:

* Application responsible for putting together the application
	* Application code
	* Application tests
	* Application configuration
	* Application etc
	* API - a folder with the different APIS
		* User
			* Code
			* Dependencies
			* Tests
			* etc
		* Address
			* same as for User
		* Orders
			* same as for User

This will be a lot of code to write, but you will not see me writing about every single line here. Instead I will focus on the glue-code and you can see the [result here](https://github.com/marcusoftnet/UserApiWithTest/tree/v1.3) once it's done.

# Humble beginnings
First let's create a few folders:

```bash
$ mkdir apis
$ mkdir apis/user
$ mkdir apis/address
$ mkdir apis/order
```

And then we move everything we have right in the root of our application right now in under <code>./apis/user</code>. Leaving the LICENSE and README for convince.

```bash
$ mv *.js ./apis/user/
$ mv package.json ./apis/user/
$ mv node_modules/ ./apis/user/
$ mv test ./apis/user/
```

In our root folder there's only <code>LICENSE</code> and <code>README</code> and the <code>apis</code>-folder left... 

And all the code we had is in the <code>/apis/user</code> folder. We can check that it still works by going into the directory and run <code>npm test</code>.

# Don't mind the man behind the curtain
In order to make this a little more interesting I will now create two more apis and put in there. But that's very boring to write about since it will be very much alike the things we have. 

By the power of time travel you will instead see it completed. 
Wait just one s...there! Get the [code from GitHub](https://github.com/marcusoftnet/UserApiWithTest/tree/v1.3)

Fun fact; I have not written this as I type this. Just faked it :)

Ok, each of those small APIs is structured a little bit different, just to prove a point of them being autonomous. 

Oh my, that took much longer than I thought. But now we have it ready.

# Putting it together
Now for something more interesting. Because now we have 3 totally separate APIs that cannot be used as an entity. Let's fix that by creating an application on top that exposes the APIs. In the progress we will have to clean somethings up in the separate APIs but I'll come back to that later. 

## No app?
The first thing to realize is that there's no application in the root directory. Let's create one - the responsibility for this application is just to gather the apis together. 

I use <code>npm init</code> of course and create a simple application. I created an initial <code>index.js</code>, looking like this: 

```javascript
var koa = require('koa');
var app = module.exports = koa();
var mount = require('koa-mount');
var config = require("./config.js")();

// The root application
var rootApp = koa();
rootApp.use(function *(next){
  yield next;
  this.body = 'Find the APIs under /user, /order and /address respectively';
});

// Mounting
app.use(mount('/', rootApp));

// listen and all of that
app.listen(config.port);
console.log('listening on port ' + config.port);
```

Of course you need to <code>npm install koa koa-mount --save</code> too. 

I've written blog posts about most of these parts before, so I'll direct you to them for details:

* Line 4 and 17-18 uses a configuration object to externalize the configuration of the application. [See more here](http://www.marcusoft.net/2015/02/config-handling-in-node-and-heroku---with-secrets.html)
* Line 7 - 11 sets up a small (I say) application that just returns a very simple string, for now. This could of course been done in a separate file too, should it be bigger than this
* Line 14 is the magic-sauce: here's we use that applications and mounts it under the <code>/</code> path. Read more about [mounting in koa here](http://www.marcusoft.net/2015/04/koa-js-and-the-power-of-mouting.html)

Finally I added two new commands to my <code>package.json</code> to start it, both in production (notice the <code>prod</code> parameter that will be picked up by our configuration object) and for local runs:

```javascript
"scripts": {
    "start": "node --harmony index.js prod",
    "startLocal": "nodemon --harmony index.js"
}
```
## Test for our root app
While we're at it, let's write some tests for our "root"-application too. <code>npm install mocha supertest --save-dev</code> and then create a test directory (<code>mkdir test</code>) with a <code>rootApp.spec.js</code> file with the following content: 

```javascript
var supertest = require('supertest');
var app = require("../");
var config = require('../config')();
var request = supertest.agent(app.listen());

describe('Our application', function () {
    it('has a simple root application', function (done) {
        request
            .get('/')
            .expect(200)
            .expect(/Find the APIs under/)
            .end(done);
    });
});
```

And then a test command that looks like this, in the <code>package.json</code>

```javascript
"test": "./node_modules/mocha/bin/mocha --harmony-generators -u bdd -R spec"
```

Let's run it with <code>npm test</code>. Works!

# Mounting it together
Ok, now we have some APIs and and a root application. Let's put it all together, and that is done with [koa-mount](https://www.npmjs.com/package/koa-mount) as you might expect. 

Let's add a little twist, let's mount the <code>/orders</code> with some authentication. I'm using basic-authentication now, but this can be more elaborate if needed. 

Mounting ([read previous post](http://www.marcusoft.net/2015/04/koa-js-and-the-power-of-mouting.html)) takes two parameters; 

* A path/URL under which the application will be found
* the (koa) application itself

Mounting the Users-API from our previous posts, for example, will look like this:

```javascript
var userApi = require('UserAPI');

app.use(mount('/users', userApi));
```

The mounting on line 3 is just as before, but please notice that we are mounting it under <code>/users</code>. This will cause us some pain soon. 

## File dependencies and package.json
But first; what on earth is <code>UserApi</code> in that <code>require</code>-statement and how did I get it there? 

As I've written before [package.json & npm are a might tools](http://www.marcusoft.net/2014/02/mnb-packagejson.html) and since 2.0.0 you can set dependencies to local files or directories. The simplest way to do this is just use <code>npm install</code>, as I did for the user api: <code>npm install ./apis/user/ --save</code>. 

And with that I got a new dependency in my <code>package.json</code>:

```javascript
"dependencies": {
    "UserAPI": "file:apis/user",
    "koa": "^0.20.0",
    "koa-mount": "^1.3.0"
},
```

## Test the mounting
Let's add a test to make sure that our mounted API responds at expected. Here's my test for that: 

```javascript
it('and an user api to which we can post, for example', function (done) {
     request
		.post('/users')
		.send({ name: 'Marcus', city : 'Bandung, Indonesia'})
		.expect('location', /^\/users\/[0-9a-fA-F]{24}$/) 
		.expect(201, done);
});
```

Yup, the test is simple and not a full test. But we're also just testing simple things: that we mounted it correctly. Notice the <code>\/users\/</code>, that is different from /user in the user test. This is because it's now mounted using another URL. Also remember that the "full" tests will be found under <code>/apis/user/test</code>. 

Running this test is a disappointment though... It fails: <code>expected "location" header field</code> which basically means that we didn't post at all. Or at least not to the right place. 

## Run it to test it
Sometimes I find it easier to run the application when looking for failures.

<strong>Spoiler alert</strong> - I only know what's wrong but I'm letting you feel my pain. Fun, huh?

Starting a local application with <code>npm run startLocal</code> (see earlier script) ... gives us more errors? <code>Error: listen EADDRINUSE</code>

### Running on same port
This trying to say that there's more than one application listening to the same port. How can that b....aaaaah? Remember the individual api application files? They all have line like this:

```javascript
// Fire it up
app.listen(3000);
console.log("The app is listening. Port 3000");
```

And now the main application is listening on that port too? What to do? 

Well, we could (i tried) go through and make sure that each application is running under different ports. But that will cause a mess trying to put this together again.

What we can do instead is to run these APIs as entities that is not meant to be started by themselves. They are part of a bigger application. We can then just remove the <code>app.listen()</code> from each APi. 

To still be able to run each API separately we can pass a variable as we start it <code>node index.js standalone</code> for example and then only start listening when that is present. Like this: 

```javascript
// Start command in package.json:     "start": "node --harmony index.js standalone",

// In app.js
if(process.env.standalone){
	app.listen(3000);
}
```

I've update the <code>Address</code>-api in this manner. The other apis I just taken the <code>app.listen()</code> out. 

### Running as mounted app
Ok; <code>npm test</code> in the root application gives us ... Still the same failure. The posting of users doesn't work, when the application is mounted. 

Opening the <code>/apis/user/app.js</code> it's pretty easy to see why. Remember that we mounted the application using <code>app.use(mount('/users', userApi));</code> meaning that the user API will reside under <code>/users</code>.

But in the user api itself we have routes called POST /user, GET /user/:id etc. Meaning that the full URL will be http://localhost:3000/users/user for POST for example. Most likely that is not what we want. 

### Cleaning up Users
Let's go through the users-api and simply remove the notion of <code>/user</code> in it. The app routes will look like this: 

```javascript
var userRoutes = require("./userRoutes.js");
app.use(routes.post("/", userRoutes.add));
app.use(routes.get("/:id", userRoutes.get));
app.use(routes.put("/:id", userRoutes.update));
app.use(routes.del("/:id", userRoutes.remove));
```

Going into the <code>userRoutes.js</code> we will have to make some trickery. Because now the this api will move around. The URL will be different depending on where it's mounted. 

Basically it's only in two lines where we're creating urls that we need to take this into consideration, where we set the header <code>location</code>. Here's that part of the post-handler:

```javascript
	this.set("location", this.originalUrl + "/" + insertedUser._id);
	this.status = 201;
```

In the POST case we can just use the original URL. In the PUT case we need some more code:

```javascript
var prefixOfUrl = this.originalUrl.replace(orderId, "");
this.set("location", prefixOfUrl + "/" + id);
this.status = 204;
```

Here I just take away the <code>id</code> passed to the function and use the rest of the URL of the request. 

These "rules" are my conventions. You might need others more advanced. 

Finally in the tests make sure that the references to <code>/user</code> is removed and then the tests. For example, here's the test for POST

```javascript
it('creates a new user for complete posted data', function(done){
	// Post
	request
		.post('/')
		.send(test_user)
		.expect('location', /^\/[0-9a-fA-F]{24}$/) 
		.expect(201)
		.end(function () {
			co(function *() {
				var userFromDb = yield users.findOne({ name : test_user.name });
				userFromDb.name.should.equal(test_user.name);
			}).then(done, done);
		});				
});
```

See? No mentioning of /user. Rerunning the tests for <code>user</code> and it works!

I have done similar constructs in the apis for orders and addresses.

## Referencing files or files
No up and rerun the test for the root application. Fail! WHAT?! Well, now our referencing bites us a bit. When we did <code>npm install ./apis/user/ --save</code> we got a copy of the code in our directory. Just like when we install something from [npmjs](http://www.npmjs.org). To get the changes we have made we need to reinstall from ./apis/user/.

Once that is done... FINALLY the tests are running without failure.

## Mount the address
Mounting order are similar simple, but let me show you another way to mount applications. You can do a relative path for the require: 

```javascript
var addressApi = require('./apis/address/');
```

This is great because it means that you don't need to <code>npm install ./apis/address</code> between every change you make. It sucks because you need to have all the dependencies for <code>address</code> in the root application. 
Might be useful for development but probably not. 

Let's use the other way; <code>npm install ./apis/address --save</code> and then

```javascript
var addressApi = require('AddressAPI');
app.use(mount('/address', addressApi));
```

And a test for that:
```javascript
it('and an address api to which we can post', function (done) {
	var test_address = { 
		userId: 987654321, 
		street : 'Jalan Jawa No 20', 
		city : 'Bandung', 
		country: 'Indonesia'
	};

	request
		.post('/address')
		.send(test_address)
	    .expect(201)
		.expect('location', /^\/address\/[0-9a-fA-F]{24}$/)
		.end(done);
	});
```

## Mount the orders and secure them
Ok, to not repeat myself too much, let's as a final mount the order but do that with some authentication turned on. 

We need a new package (in the root, since that's where this authentication will take place - the module knows nothing about it...): <code>npm install koa-basic-auth --save</code>.

And we need to include the order-api: <code>npm install ./apis/order --save</code>.

Then we require the OrderApi it as before

```javascript
var orderApi = require('OrderAPI');
```

But now let's plug in the authentication. Here's a little module I've create that takes care of the nitty gritty code for authentication:

```javascript
module.exports.reqBasic = function *(next){
	try {
		yield next;
	}
	catch (err) {
		if (401 == err.status) {
			this.status = 401;
			this.set('WWW-Authenticate', 'Basic');
			this.body = 'Nope... you need to authenticate first. With a proper user!';
		}
		else {
			throw err;
		}
	}
};
```

Yes, you are right! It looks exactly as a little [koa](http://koajs.com) application. Let's mount the orders-api under basic authentication and you'll be even more surprised:

```javascript
var auth = require('koa-basic-auth');
var userAuth = require('./authentication.js');

app.use(userAuth.reqBasic);
app.use(mount('/orders', auth(config.adminUser)));
app.use(mount('/orders', orderApi));
```

* First we just require the <code>koa-basic-auth</code> package and the little authentication module we just created
* On line 4 we tell our application to use our basic authentication application.
* Line 5 mounts the <code>/orders</code> path under authentication
	* with the configuration we make sure that we can change user via environment variables. See above about configuration
* Then, line 6, we mount yet another application on the same url: the order API.

Writing a test for this will be something like this:
```javascript
it('and an order api, but that requires login', function (done) {
	var test_order = { 
    	orderId: '123456789', 
    	ordered : new Date("2015-01-01"), 
    	userId : "987654321" 
    };

    request
		.post('/orders')
		.auth(config.adminUser.name, config.adminUser.pass)
		.send(test_order)
		.expect('location', /^\/orders\/[0-9]{9}$/) 
		.expect(201)
		.end(done);
});
```

I added a test to check that not-logged in gives you a 401. See the code on [GitHub](https://github.com/marcusoftnet/UserApiWithTest).

And there you have it! 

# Summary
This might be the longest post I've ever written but we also did a lot of things here. 

We have:

* created 3 different, and autonomous APIs. With their own databases, own test and own code
* created a root application to hold it together, with it's own tests
* mounted the applications under different URL and made sure that the applications can be moved around (as long as we follow our URL convention)
* mounted one application under basic authentication

I've checked it in on [GitHub under tag 1.3](https://github.com/marcusoftnet/UserApiWithTest/tree/v1.3). The only thing is the name of the repository that not is very helpful now. 

I learned a lot doing this - I hope you found it helpful too. 