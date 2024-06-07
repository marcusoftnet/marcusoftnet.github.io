---
layout: post
title: "Testing a Koa application with supertest using async/await"
author: "Marcus Hammarberg"
date: 2018-06-12 20:43:07
tags:
  - Koa
  - Javascript
  - Programming
---

I've been playing around with refactoring a [Koa](http://koajs.com/) application to use modern JavaScript constructs like `async`, `await` `=>` and do away with generators etc.

In doing so I had an epic battle with [mocha](https://mochajs.org/), [monk](https://github.com/Automattic/monk) and [supertest](https://github.com/visionmedia/supertest) to use async / await etc. I finally found a good structure for this purpose that I wanted to share.

<!-- excerpt-end -->

## The case

This will be small but not too contrived. The test will store an object in a MongoDb database, then will call an HTTP-endpoint (`/user/:id`) that simply returns that object for us again.

To do this we will have to await the call to mongo using monk, then do the request using supertest and finally use supertests own asseration features to ensure that we get back what we expected.

I started with a simple `setTimeout` but thought I would something a little bit more real.

### Setup

Create a new directory, I called mine `koasupertestasync` . Enter the directory and set up a `package.json` file using `npm init -y`.

Now install the tools we need:

- the runtime dependencies are installed with `npm I koa koa-route monk -S`
- the development dependencies are installed with `npm I mocha supertest should`

Create two files: `api.js` and `api.test.js`

Finally open the `package.json` file and add this test script:

```json
"scripts": {
    "test": "mocha -w -u bdd -R spec ./*.test.js"
 }
```

There - we are ready. Let's start with the production code, because this is not really a tutorial in TDD.

### Writing the app

The app is very simple luckily, and I'm just going to write it out here:

```javascript
const Koa = require("koa");
const app = new Koa();
const routes = require("koa-route");

const monk = require("monk");
const db = monk("localhost/usersApi");

app.use(
  routes.get("/user/:id", async (ctx, id) => {
    const users = db.get("users");
    const user = await users.findOne({ _id: id });
    ctx.body = user;
    ctx.status = 200;
  })
);

if (!module.parent) {
  app.listen(3000);
}

module.exports = {
  app,
};
```

First three lines just brings in the Koa stuff we need

- Notice how we export the `app` object on the last rows. This is so that we can reach it from the test code later

Setting up monk is done with the next three lines:

- require monk so that we can use it
- Initialize a database pointing to the Mongo database you will use, by giving a connection string of sorts

The actuall application code is found on line 8-13

- get the Mongo collection you will work with in our code. I'm doing it inline here, but this can of course be moved out to an own file
- Then use Monks excellent `findOne` feature that returns a user by some search critera. In this case I'm searching by id (called `_id` in the Mongo world)
- We then just store the user in the `ctx.body` to return it and set the status to 200 ok.

Should this fail, Koa will automatically return 500 for us. Good enough for now

I added a [little trick from befrore](http://www.marcusoft.net/2015/10/eaddrinuse-when-watching-tests-with-mocha-and-supertest.html) where I start the Koa server only when the module has no parent. This is the case when the code is started with `node api.js`. When you run the server as normal. When the code is run under test there is a parent; namely mocha

### Writing the test

Ok - let's write the test. I will go through this part. The first part looks like this:

```javascript
/* global describe, before, beforeEach, after, it */
const app = require("./api.js").app;
const supertest = require("supertest");

const monk = require("monk");
const db = monk("localhost/usersApi");
const users = db.get("users");
```

The first line is a comment that make sure that my linter, [standard](https://standardjs.com/), understand the global mocha objects

I make a reference to the system under test `./api.js`

Supertest is my weapon of choice when it comes to testing api's so that is included as well

Finally we make the same configuration for the Mongo/Monk stuff ensuring that we have a reference to the `user` collection that we can issue commands against the database in a smooth way.

Next up is the test infrastructure:

```javascript
describe('User API', () => {
  const testUser = { name: 'Marcus', city: 'Stockholm, Sweden' }
  let request = {}
  let server = {}

  before(() => { server = app.listen(8888) })
  after(() => { server.close() })

  beforeEach(async () => {
    await users.remove({})
    request = supertest(server)
  })

  const throwIfError = (err, res) => { if (err) throw err }
  ...
  ...
})
```

In the describe block for these tests I create some test data that is easy to reuse and modify, throughout my tests

We will need a server and a request so I create these objects in this scope as well.

Now for the fun part: `before` is run before any of the tests in the scope and is a great place to fire up our server. This could be costly and doing it once is better than once per test.

Using the reference to the `app` this becomes a one-liner: `before(() => { server = app.listen(8888) })`.

The same goes for `after` all the tests are run, we should close the server down; `after(() => { server.close() })`

This means that the tests starts in a prestine state without take a long time.

`beforeEach` test I want to do two things:

- first completely wipe the (test) database so that each test knows the state they are testing against. This is accomplished by using the monk `users` collection and the `remove` function; `await users.remove({})`
  - Remove returns a promise and we `await` the resovled promise before we continue
  - We can use `await` in this method because it's marked as `async`
- Second thing I want to do is to create the supertest `request` object, so that it's a fresh request object for each test. This is done with `request = supertest(server)`

Final part is a small little utility that I will use to check for errors, better explained below.

Finally it's time for a test:

```javascript
it("returns JSON for existing user", async () => {
  const user = await users.insert(testUser);
  request
    .get(`/user/${user._id}`)
    .set("Accept", "application/json")
    .expect("Content-Type", /json/)
    .expect(/Marcus/)
    .expect(/Stockholm, Sweden/)
    .expect(200)
    .end(throwIfError);
});
```

Since the database is empty `beforeEach` test we better put some data in there for our API to retrieve. Again we use the monk `users` collection and the `insert` function. That function returns the created user, making the whole line: ` const user = await users.insert(testUser)`

Now we can issue the request by chaining function calls together:

1. We will `.get()` the `/user/:id` with the generated id for our newly created users
2. We also tell supertest that we expect json back, by setting that header. Koa automatically returns JSON if the body is an object
3. Our expectations starts by checking that we got json back
4. We then use some simple regular expressions to inspect the returned result for the name part
5. We can also (thrown in here for demonstration) check the result object itself, by getting it as a parameter to our expect function: ` .expect(res => res.body.city.should.equal('Stockholm, Sweden'))`
6. We check that the status code is correct
7. Finally I use my little utility that checks for errors in the `.end()`.
   I have to admit that I don't fully understand why I have to do this. I'm thinking it's because we are using an async test and hence doesn't call any `done` functional, which is mochas old way of running asynchronous tests.
   By calling `.end()` explicitly we tell supertest that the request is done.

In all honestly this test did a lot of things at once. In the repository for this code I've added other versions that split this up into individual tests.

## Summary

I've used Koa and supertest many times. With the advent of the ES6 features writing the code becomes even leaner and easier to read.

The code for the [blog post can be found here](https://github.com/marcusoftnet/koasupertestasync)
