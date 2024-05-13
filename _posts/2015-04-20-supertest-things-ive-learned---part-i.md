---
layout: post
title: "Supertest: Things I've learned - part I"
author: "Marcus Hammarberg"
date: 2015-04-20 09:20:08
tags:
 - Javascript
 - Tools
 - Koa
 - Node
---

My favorite thing with blogging is the feedback I get. In fact; that's the reason I blog. There. I've said it. I love to see many read my stuff and get back to me with questions and suggestion. I'm not even ashamed to say so.

Sometimes people even ask me to blog about something. I really love that, even though I've have to find time to do so. I got a very nice comment from [James Gardner](https://disqus.com/by/disqus_UQ63SKULd3/) asking me to blog a little more about [supertest](http://npmjs.org/package/supertest).

He specifically asked me to show how to "split test into separate files for big APIs", so I'll do that in this post.

But that sprung a few ideas about things that I've started to use a lot and I thought I'll do a little mini-series here. Here are some posts I have in mind:

* Splitting API over several files - this post
* [Splitting the API not only the test](/2015/splitting-an-koa-app-into-parts-and-putting-it-together-again.html)
* [Verify in database after ended request](/2015/05/supertest-verify-in-database-after-ended-request.html)

Cliffhanger; the last bullet is still not clear to me... It will be a blast seeing me stumble through that one.

<!-- excerpt-end -->

When I read James comment two things popped (every time I use that word I'm afraid that I will use two o's, instead of p's) into my head; how to split the test and how to split the API itself over several files.

Let's do it one at the time starting with the test question.

My code will, as with the [screen cast I did](http://www.marcusoft.net/2014/02/mnb-supertest.html) be [found here](https://github.com/marcusoftnet/UserApiWithTest).

If you haven't seen the screen cast where we build out the first version it's here:

<iframe width="420" height="315" src="https://www.youtube.com/embed/aTTjednotGQ" frameborder="0" allowfullscreen></iframe>

## Splitting the test

In my [original example](https://www.youtube.com/embed/aTTjednotGQ) I kept things super simple and had the tests in one file. Let's split it out, but still keep it simple; one test per file, simulating that we test completely separate parts of a bigger API.

Oh, yeah; I'm using [mocha](http://www.marcusoft.net/2014/02/mnb-mocha.html) here. Read that post on mocha, should you need a refresher.

Here's is how the `test.js` file look from the start:

```javascript
var co = require('co');
var users = require('./userRoutes.js').users;

var app = require('./app.js');
var request = require('supertest').agent(app.listen());

describe('Simple User Api:', function(){

 var test_user  = { name: 'Marcus', City : 'Bandung, Indonesia'};

 it('creates a new user', function(done){
  // Post
  request
   .post('/user')
   .send(test_user)
   .expect('location', /^\/user\/[0-9a-fA-F]{24}$/) // Mongo Object Id /user/234234523562512512
   .expect(200, done);
 });


 var removeAll = function(done){
  co(function *(){
   yield users.remove({});
  })(done);
 };

 beforeEach(function (done) {
  removeAll(done);
 });

 afterEach(function (done) {
  removeAll(done);
 });

 it('get existing user', function (done) {
  co(function *() {
   // Insert test user in database
   var user = yield users.insert(test_user);
   var userUrl = '/user/' + user._id;

   // Get
   request
    .get(userUrl)
         .set('Accept', 'application/json')
         .expect('Content-Type', /json/)
         .expect(/Marcus/)
         .expect(/Bandung, Indonesia/)
         .expect(200, done);
     })();
 });

 it('updates an existing user', function(done){
  co(function *() {
   // Insert test user in database
   var user = yield users.insert(test_user);
   var userUrl = '/user/' + user._id;

   request
    .put(userUrl)
    .send({name: 'Marcus v2', City: 'Bandung Updated'})
    .expect('location', userUrl)
    .expect(204, done);
  })();
 });

 it('deletes an existing user', function(done){
  co(function *() {
   // Insert test user in database
   var user = yield users.insert(test_user);
   var userUrl = '/user/' + user._id;

   // Delete the user
   request
    .del(userUrl)
    .expect(200, done);
  })();
 });
});
```

## New direction

The first thing that is a good practice is to keep your tests in a separate directory. Create one with `mkdir test`. Yes, call it "test", that helps mocha. And then move the `test.js` file in there `mv test.js test`.

Finally, we need to update the `npm test` command, since we specified the `test.js` in it explicitly before. Here is how it looked:

```javascript
"scripts": {
    "test": "./node_modules/mocha/bin/mocha --harmony-generators test.js -u bdd -R spec"
  },
```

Just a comment on the very long path to mocha. This is a really good practice, because this means that your code doesn't rely on everyone having mocha installed globally. Instead, just add it as `devDependencies` using `npm install mocha --save-dev` and then use the path to the local mocha installation.

Luckily for us, mocha by default checks a folder called `test`, so the only thing we need to do is to remove the `test.js` reference. This is how the command looks after that.

```javascript
"scripts": {
    "test": "./node_modules/mocha/bin/mocha --harmony-generators -u bdd -R spec"
  },
```

Oh, we need to update any paths in our test file as well. At the top of the file we are requiring the `userRoutes.js` and the `app.js`

```javascript
var co = require('co');
var users = require('./userRoutes.js').users;

var app = require('./app.js');
```

This reference must now be updated since we move the `test.js` into folder. Make it `var users = require('../userRoutes.js').users;` and `var app = require('../app.js');` and you should be good.

Rerunning the tests (`npm test`, or `npm tst` or `npm t` - did you know that?) shows that we have not broken anything.

Phew! Refactoring without tests are scary. This is much better.

## Break it up, you guys

Let's break the tests up a bit. Our goal is to test one route per file; all POST to /user tests in one file, all GETs /user in another etc. Imagine a bigger real life and you can think about maybe all /user-stuff in one file and all /order-test in another etc.

Later I'll show you how to get really fancy with this using [mount](http://www.marcusoft.net/2015/04/koa-js-and-the-power-of-mouting.html), but for now let's keep it like this and just split up the test, the original request was about that.

First let's just create 3 more copies of the file and then rename the original. Like this:

```bash
cp test/test.js test/user.post.js
cp test/test.js test/user.get.js
cp test/test.js test/user.update.js
mv test/test.js test/user.del.js
```

Running the tests now makes us ... happy ... because now we have 16 passing tests, instead of for. But... they are all duplicated. And badly named. Let's fix that. Go into each file and remove the stuff that is not related to the verb in the file name. For example, clean up `user.post.js` to look like this:

```javascript
var co = require('co');
var users = require('../userRoutes.js').users;

var app = require('../app.js');
var request = require('supertest').agent(app.listen());

describe('User API posting: ', function(){

 var test_user  = { name: 'Marcus', City : 'Bandung, Indonesia'};

 it('creates a new user', function(done){
  // Post
  request
   .post('/user')
   .send(test_user)
   .expect('location', /^\/user\/[0-9a-fA-F]{24}$/) // Mongo Object Id /user/234234523562512512
   .expect(200, done);
 });

 var removeAll = function(done){
  co(function *(){
   yield users.remove({});
  })(done);
 };

 beforeEach(function (done) {
  removeAll(done);
 });

 afterEach(function (done) {
  removeAll(done);
 });
});
```

Yes, of course we need to fix the other files as well, to only contain the GET, UPDATE and DEL respectively. Once that was done I got a test result like the one below:

![Test result verb](/img/testResultVerbInOwnFiles.png)

As you probably can notice from my name we might have more test for validation and stuff later. For example, for the POST-tests that could look like this:

```javascript
it('returns validation error if name is not present', function(done){
 var u = { city : "A city without a user name"};

 request
  .post('/user')
  .send(u)
  .expect('ValidationError', "Name is required")
  .expect(200, done);
});

it('returns validation error if city is not present', function(done){
 var u = { name : "A name without a city"};

 request
  .post('/user')
  .send(u)
  .expect('ValidationError', "City is required")
  .expect(200, done);
});
```

I leave the implementation for the user to work out... and update [the repo](https://github.com/marcusoftnet/UserApiWithTest) with the solution.

## It's getting DRY in here

Me. Today. To newbie programmer:

> If you want to be an excellent programmer you have to use your head. But there's one rule where that is optional: [Don't Repeat Yourself](http://en.wikipedia.org/wiki/Don%27t_repeat_yourself)

Very hard to do - very easy to say. But as you've seen we have a lot of duplication in our code right now, let's try to get rid of some of it.

First let's create the `request` object in one central place. I often create a file called `testHelpers.js` in the test-directory where stuff like this goes. Here is how the first version will look:

```javascript
var app = require('../app.js');
module.exports.request = require('supertest').agent(app.listen());
```

And using that in our code is dead simple, here's from the user.post.js.

```javascript
var request = require('./testHelpers.js').request;
```

By reusing the variable name `request` our test still passes. We have dried up our files with 1 line per file and made one place to change. Next!

The next obvious thing is to move the database stuff into test helpers too. This will take care of a couple of duplications for us. We need to expose the collection and expose a function clean the database. Here's the update `testHelper.js`

```javascript
var co = require('co');

var app = require('../app.js');
module.exports.request = require('supertest').agent(app.listen());

var users = require('../userRoutes.js').users;
module.exports.users = users;

module.exports.removeAll = function(done){
 co(function *(){
  yield users.remove({});
  // and other things we need to clean up
 })(done);
};
```

And our test code lost a lot of line too. Here's the `user.del.js` for example:

```javascript
var co  = require('co');
var helpers = require('./testHelpers.js');
var users = helpers.users;
var request = helpers.request;

describe('DEL to /user/:id', function(){

 var test_user  = { name: 'Marcus', City : 'Bandung, Indonesia'};

 beforeEach(function (done) {
  helpers.removeAll(done);
 });

 afterEach(function (done) {
  helpers.removeAll(done);
 });

 it('deletes an existing user', function(done){
  co(function *() {
   // Insert test user in database
   var user = yield users.insert(test_user);
   var userUrl = '/user/' + user._id;

   // Delete the user
   request
    .del(userUrl)
    .expect(200, done);
  })();
 });
});
```

There's one more thing that we have duplicated. I'm a bit skeptical to do anything about this, but for the sake of argument. The `test_user` is duplicated - let's move it and fix a bug in the meantime. This goes into `testHelper.js`

```javascript
module.exports.test_user  = { name: 'Marcus', city : 'Bandung, Indonesia'};
```

Notice that I've fixed the `City` to be `city`.

Now we can use it, in the proper place, recreating the data before each test in our test files. Like this:

```javascript
var test_user = {};

beforeEach(function (done) {
 test_user = helpers.test_user;
 helpers.removeAll(done);
});
```

Notice that in this very simple case I'm just returning the object

 as it is. For more advanced cases check out the [test data builder](http://www.natpryce.com/articles/000714.html) pattern.

## Until next time

And round this point I realize that this post is way too long already. I'll move the rest to another post. The rest means - splitting the entire API into several modules, using mount and other goodness.

I've tagged the code in GitHub for this post and you [can find it here](https://github.com/marcusoftnet/UserApiWithTest/tree/v1.1).

It' will be great! [See you there](/2015/splitting-an-koa-app-into-parts-and-putting-it-together-again.html)!
