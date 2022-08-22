---
layout: post
title: Refactoring a Koa app (part III) - async tests
author: Marcus Hammarberg
date: 2018-06-05T21:07:13.000Z
tags:
  - Javascript
  - Koa - Programming
---

This is the third post in a series where I refactor an old (4 years) code base (an API written in [Koa](http://koajs.com)) to modern Javascript and tools.

Here are all the posts in the series

- [Part I - get the tests to run](http://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript.html)
- [Part II - where we clean up the test code a bit](http://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript_ii.html)
- [Part III - where we start to move over to async/await testing](http://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript_iii.html) - this post
- [Part IV - where finally do something about the production code, and fix the other parts of the application](http://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript_iv.html)
- [Part V - wrapping up by refactoring the root application](http://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript_v.html)

<!-- excerpt-end -->

We have done some progress cleaning up and linting our code.

### Moving to async over generators - tests

This is pretty good, but not there yet. There's a major thing bugging me and here is where we need to start untangle it.

One of the things that made me love [Koa](http://www.koajs.com) in the first place was that it's clever use of [generators and yield](https://www.youtube.com/watch?v=egLUa6urd6I) made it possible for me to get out of callback hell and write asynchronous code that looked very synchronous.

We can do that now using async and await. I wanted to do that in this code too, and a good place to start (I hope) would to be the tests. Let's try it first in this file (`testHelpers.js`) to explain what I mean.

See the function called `removeAll`? It removes all users from the Mongo collection. It uses the keyword `yield`. Which basically means "**Y**o, node! **I E**xpect a **L**ittle **D**elay - do something else and then continue here once this thing is done.".

This command (`yield users.remove({})`) will executed, asynchronously and once it's completed we will either get an error (and in this case fail the test) or come back to this line. The keyword to get this to work is `yield`.

But there's so much fluffy stuff around this method. See that `  co(function * () {` for example? I you remove this then JavaScript all of a sudden doesn't know what `yield` means. See this [blog post for more information](http://www.marcusoft.net/2014/04/WhenIGotGenerators.html). In short: `co` is the thing that helps us to get `yield` to work as an asynchronous processor for us.

But that is what we have async and await for. Let's rewrite it. As simple as possible first.

```javascript
async function removeAll  (done) {
  co(function * () {
    await users.remove({})
    done()
  })
}
```

 This gives an error something like this:

```bash
await users.remove({})
    ^^^^^

SyntaxError: await is only valid in async function
```

Ok. Makes sense because we are using await in the inner (generator) function (`co(function * () {`). That is not async. Let's take that line out:

```javascript
async function removeAll (done) {
  await users.remove({})
  done()
}
```

Nice! Smaller! Tighter. And passing the tests! This calls for a check-in!

## Tigther still

We can be even more functional and ES6-y, by writing the function using `=>` syntax:

```javascript
const removeAll = async (done) => {
  await users.remove({})
  done()
}
```

That still passes but now the `done`-flag is troubling me. Because I remember that done is really [mochas way of allowing us to test asynchronous code](https://mochajs.org/#asynchronous-code). But in theory that should not be needed, now that we are using async and await. That handles the synchronisation for us.

### Functional like it's 1958!

(There's a very geek reference to [LISP](https://en.wikipedia.org/wiki/Lisp_(programming_language)) in the title and this section)

Let's try to remove the done and see what happens.

```javascript
const removeAll = async () => users.remove({})
```

Oh praise be to [McCarthys name](https://en.wikipedia.org/wiki/John_McCarthy_(computer_scientist)), creator of LISP, kids! This is starting to look functional. We have to get this to work.

Let me first unpack that beautiful one-liner above:

* By removing the `done`  call the parameter is not needed, of course. So we remove it.
* Then there's only one line in the method. In JavaScript (ES6) if there's only has one line in the method you can remove the curly braces and bring it up on one line
* Since there's only one statement in the function now, without curly braces, JavaScript assumes that this a return. And `await` is consider redudant for return values. I presume (but do not know) it's because we will wait implicilty until the method can return or fail. No other way out.
* This is great, but wait there's more: we can also remove the `const co = require('co')` at the top of the file, since it's not used in this code.

And the tests are still passing!

###Fixing the tests for functional code

Ok - but the tests are failing. Let's fix them. We get a lot of time outs now stating:

```bash
Ensure the done() callback is being called in this test.
```

Remember that this is the helper-file. Someone is calling the `removeAll` function. And that someone is passing in a `done` function that now never get's called. Mocha wonders when the asynchronous call is ever going to complete and finally kills it with a timeout.

One of the places that calls `removeAll` is in the `user.get.js` file, in the `beforeEach` function:

```javascript
beforeEach(function (done) {
  test_user = helpers.testUser
  helpers.removeAll(done)
})
```

 Ah see how we pass the `done` function. Let's, as a test, remove it outside. Like this:

```javascript
beforeEach(function (done) {
  test_user = helpers.testUser
  helpers.removeAll()
  done()
})
```

(and do the same in `removeAll`…). YES! That passes the tests. But why do we need this flag, really. Let's make this test function asynchronous and see if we can get JavaScript rather than Mocha to control the asynchronous code for us.

```javascript
beforeEach(async function () {
 testUser = helpers.testUser
 await helpers.removeAll()
})
```

That works! See how I removed both the `done` paratmeter and it's call. Now we are await-ing or failing the tests. JavaScript is controlling that execution for us, just like any normal function.

### Tighter test-code

But now this code looks a bit bloated, I'm getting my functional-mode on. Let make it tighter.

I don't like that `test_user = helpers.testUser`, that can be done outside the function.

And then we arrive to these two one-liners:

```javascript
beforeEach(async () => helpers.removeAll())
afterEach(async () => helpers.removeAll())
```

There are a bunch of other fixes that we can do, in the similar fashion. Before long we arrive at this complete code example:

```javascript
/* global describe, beforeEach, afterEach, it */
const helpers = require('./testHelpers.js')
const users = helpers.users
const request = helpers.request

describe('GET user /:id ', function () {
  beforeEach(async () => helpers.removeAll())
  afterEach(async () => helpers.removeAll())

  it('returns JSON for existing user', async () => {
    const user = await users.insert(helpers.testUser)
    request
      .get(`/${user._id}`)
      .set('Accept', 'application/json')
      .expect('Content-Type', /json/)
      .expect(/Marcus/)
      .expect(/Bandung, Indonesia/)
      .expect(200)
  })
})
```

A few comments:

* In order to get rid of some linting warnings the first comment line is need so that we allow the mocha global objects.
* I can use string interpolation for the ``/${user._id}` to make it more readable.
* I can remove `co` from the code as all my tests are now using async and await.
* And I have the lovely, tight functional code for the `beforeEach, afterEach` functions.
* And remove the comments.

I'll fix the other test-files and then make a check-in for you (`All tests functional and nice`)

Pssst - I made some errors here, by skipping the `.end()` function. But we will fix that in the next post. Promise.

### Fix the numerous test file problem

But now I get very bother by the fact that we have so many files… It's only one test per file, in rare occations 2. Also, they are in a separate directory, which makes sense if there's many files but I want to have one file with all tests.

I will create a new file next to `userRoutes.js` and call it `userRoutes.test.js`. I will do this with `cp test/user.del.js ./userRoutes.test.js` Then I'm going to copy (yes, copy) all the code from each file in the `test`-directory into that file. That will double the number of tests.

Ok - done. And I got a lot of duplication errors for the `requires` and the gobal comment. Let's remove it.

I was a bit surprised to see that my test doesn't work, until I realized that we need to tell mocha where to look for my tests. By default that is in the `test` directory, but now we have to update the test command to this:

```json
"test": "mocha -w -u bdd -R dot ./*.test.js",
```

And now it doesn't find the `testHelper.js`-file. I knew this was going to give us pain. For now, let's just update the reference to the file in the import:

```javascript
const helpers = require('./test/testHelpers.js')
```

And it works! Now we can refactor.

The first things is to surround all the tests with another `describe` like this:

```javascript
describe('User API', () => {
    ...// the entire file
})
```

That gives a nice reporting but also allows us to move the setup code up to the new scope that `describe`-block gave us. Move `before/removeAll`, any instansiation that is common etc. And then remove those things in the other, nested `describe`-blocks.

Nice! Much shorter and less repetion. Love it.

Now I removed all the test-files in the `test` directory. Leaving only the `testHelpers.js`

### Kill testhelpers.js

In fact - let's do away with that file all together. I copied all of the `testHelpers.js` into my only test file now.

I copied these lines:

```javascript
const app = require('../app.js')
const request = require('supertest').agent(app.listen())
const users = require('../userRoutes.js').users
const testUser = { name: 'Marcus', city: 'Bandung, Indonesia' }
const removeAll = async () => users.remove({})
```

into the `userRoutes.test.js` at the top. Then I remove the require statements in that file all together, and updated the path to the files under test; leaving the start of the `userRoutes.test.js` like this:

```javascript
const app = require('./app.js')
const request = require('supertest').agent(app.listen())
const users = require('./userRoutes.js').users
const testUser = { name: 'Marcus', city: 'Bandung, Indonesia' }
const removeAll = async () => users.remove({})
```

Now we got a lot of reference errors to `helpers` that we can fix by just removing `helpers.`. This takes care of a nasty leaky abstraction problem we had in the `testHelpers.js`

Tests are passing - remove the entire `test`-directory and the only file (`testHelpers.js`) in it.

### Summary

Time to end this post here. We have cleaned up the test considerably and learned a great deal about asynchronous code in ES6 using async and await. In [the next post](http://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript_iv.html) we will do the same to the system under test; `userRoutes.js ` and `app.js` and see where it takes us.

