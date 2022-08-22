---
layout: post
title: Refactoring a Koa app (part IV) - update the production code
author: Marcus Hammarberg
date: 2018-06-05T21:07:13.000Z
tags:
  - Javascript
  - Koa - Programming
---

This is the fourth post in a series where I refactor an old (4 years) code base (an API written in [Koa](http://koajs.com)) to modern Javascript and tools.

Here are all the posts in the series

- [Part I - get the tests to run](http://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript.html)
- [Part II - where we clean up the test code a bit](http://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript_ii.html)
- [Part III - where we start to move over to async/await testing](http://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript_iii.html)
- [Part IV - where finally do something about the production code, and fix the other parts of the application](http://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript_iv.html) - this post
- [Part V - wrapping up by refactoring the root application](http://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript_v.html)

<!-- excerpt-end -->

In the last post we made significant progress and now have some very modern and neat looking tests. That run and pass. Time to turn our attention to the system under test and give that an overhaul too.

Keep the test running by doing `npm t` . I notice that sometimes when we rename files or move them mocha can crach so keep your eye out for that and restart the tests if that happens.

### Async / await for our code!

Let's do the same trick as we did for our tests and move from generators and `yield` to `async` and `await`. They are supposed to accomplish the same thing; help us to write asynchronous in a synchronous flow.

Here's a small function that serves as a great example:

```javascript
const get = function * (id) {
  const user = yield users.findOne({_id: id})
  this.body = user
  this.status = 200
}
```

becomes this, in the first iteration:

```javascript
const get = async (id) => {
  const user = await users.findOne({_id: id})
  this.body = user
  this.status = 200
}
```

### This, always this "this"

Those two `this`-statements that we have in there are bothering me. I want them out - because what `this` do they refer to really, let's make the code more pure functional and take it out…

This is surprisingly easy. Add a context object as first parameter and then set the the values on this object. Like this:

```javascript
const get = async (ctx, id) => {
  const user = await users.findOne({_id: id})
  ctx.body = user
  ctx.status = 200
}
```

This is one of those times where integration tests are nice. Because we didn't change the behaviour and external API but only the internals.

Because it works… But does it really… No and I'll try to explain why.

### Getting rid of co and co-monk - need promises

I was on a long detour here, I willingly admit. Hours, days even.

Because the test were passing just fine, but whatever I changed in the system under test, they were still passing. For example changin the order of the parameters to the async functions (`const get = async (ctx, id) => {` or `const get = async (id, ctx) => {`) didn't change much.

So I started to suspect that my tests were not testing anything at all, maybe not even called the code. But they were, they just skipped the result. Here's how I found out.

I entered the simplest possible test `deletes an existing user` and then I logged out the URL that we were going to test via the `request.del()` call. I change the test into this

```javascript
it('deletes an existing user', async () => {
  const user = await users.insert(testUser)
  console.log(`/${user._id}`)
  request
    .del(`/${user._id}`)
    .expect(200)
})
```

But when I did the log statement became `/undefined` in the console. Hmmm… what's up. Further more, why didn't the test fail when navigating to `/undefined ` ?

The first question is answered with this awesome [StackOverflow response](https://stackoverflow.com/questions/39224320/nodejs-koajs-async-await-not-getting-value-from-db-collection-find). It's a long story but my favorite way to access [Mongo is via Monk](http://www.marcusoft.net/2014/02/mnb-monk.html). But [Monk](https://github.com/Automattic/monk), out of the box, doesn't support generators and `yield`, so I had to wrap it with [co-monk](https://www.npmjs.com/package/co-monk).

But now… In my tests, I am not using generators. I'm using `async/await`. And it turns out that, repeating the StackOverflow answer

> Since `co-monk` uses [`thunkify`](https://github.com/tj/node-thunkify), `db.users.find()` will return a [thunk](https://en.wikipedia.org/wiki/Thunk), which `async/await`cannot handle (I think by design).

Ok, once I knew that I was easy to fix by simply removing co-monk from the equation in the `userRoutes.js`:

```javascript
const wrap = require('co-monk')
const db = monk('localhost/usersApi')
const users = wrap(db.get('users'))
```

became

```javascript
const db = monk('localhost/usersApi')
const users = db.get('users')
```

Since I didn't change the name of the exported variable everything worked just fine. I could now see the logging in the console and promptly removed that statment.
Still that didn't explain why my test where passing, because I still had a hunch that they were not running properly.  I changed my delete test into this:

```javascript
it('deletes an existing user', async () => {
  const user = await users.insert(testUser)
  request
    .del(`/${user._id}`)
    .expect(200)
    .end(function (err, res) {
       console.log('Running in Delete-test')
       if (err) throw err
   })
})
```

And sure enough. That console.log statement was fired and then it crashed with a Internal server error… I was bewilder and stumped...

### Update packages! Dear Lord. Do it now!

Then I just checked the `package.json` out of a coincident. The packages in there has pretty low number. I ran a command called `npm outdated` and sure enough. A lot could have happened on the way.

```bash
› npm outdated
Package    Current  Wanted  Latest  Location
co-body      2.0.0   2.0.0   6.0.0  UserAPI
koa         0.20.0  0.20.0   2.5.1  UserAPI
koa-route    2.4.2   2.4.2   3.2.0  UserAPI
should       6.0.3   6.0.3  13.2.1  UserAPI
supertest   0.15.0  0.15.0   3.1.0  UserAPI
```

First I remove co-monk and co altogether. We are not using that.

```bash
npm uninstall co co-monk -S
```

 Note the `-S` flag that save these changes to my `package.json` dependencies section.

Then I reinstalled everything that was outdated

```bash
npm uninstall co-body koa koa-route -S && npm install co-body koa koa-route -S
```

Finally I updated the development dependencies too, saving them with the `-D` flag.

 ```bash
npm uninstall should supertest -S && npm install should supertest -D
 ```

I restarted the tests and ran it. Now I got this error: `TypeError: Class constructor Application cannot be invoked without 'new' `

Ok - Koa now uses a class instead of a ordinary function. So we need to new it up. The first two lines in `app.js` became:

```javascript
const Koa = require('koa')
const app = new Koa()
```

Now I feel better. It's at least updated to the latest versions of the frameworks we are using.
Let's re-run the tests.

WHOA! They are passing. We were doing it right all along. Now the packages are updated and can do what we thought would be working from the start. Update your packages early kids.

I tested that my code was running by changing the expectation in the delete test to another status code than 200. Yes. Test fails. Good.

I then removed the console.log and the whole `.end()` function call in the delete test, as it's not needed. Here's the final version of it:

```javascript
it('deletes an existing user', async () => {
  const user = await users.insert(testUser)
  request
    .del(`/${user._id}`)
    .expect(200)
})
```

(Psst… this is another error I made. See below.)

As a final precautionary action I removed all the node modules, reinstalled them and reran the test as if it was fresh and dandy:

```bash
rm -rf node_modules && npm i && npm t
```

Still works. I feel safe.

### That sinking feeling of passing tests

But there's still a problem here; the tests pass regardless of how I change my code. This is very apparent if we add back the `.end()` function. It is actually needed to get the request with supertest to finish.

I actually changed up quite a lot of how the supertest request is created:

* In `before`, that is run before any testm, I create the server (`app.listen(8888)`)
* and close it in `after` (with `server.close()`)
* Then `beforeEach` test we create a new supertest `request` object with `request = supertest(server) `
* Finally I created an error checker that is called in the `.end()` call, that simply throws an error if one was found.
  * That simply looks like this, when used: `.end(throwIfError)`

This is of course impossible to understand from these bullet. Here is the setup and first test, for context:

```javascript
/* global describe, before, beforeEach, after, afterEach, it */
const app = require('./app.js').app
const supertest = require('supertest')
const users = require('./userRoutes.js').users
const testUser = { name: 'Marcus', city: 'Bandung, Indonesia' }

describe('User API', () => {
  let request
  let server

  before(() => { server = app.listen(8888) })
  after(() => { server.close() })

  beforeEach(async () => {
    await users.remove({})
    request = supertest(server)
  })

  const throwIfError = (err, res) => { if (err) throw err }

  describe('DEL user /:id', () => {
    it('deletes an existing user', async () => {
      const user = await users.insert(testUser)
      request
        .del(`/${user._id}`)
        .expect(200)
        .end(throwIfError)
    })
  })

  //... rest of the tests
})

```

Also a full description of this approach code is found [in a separate post](http://www.marcusoft.net/2018/06/testing-a-koa-application-with-supertest-using-asyncawait.html)
When `.end()` is back in there the tests starts to fail again. I will not lie - this took the better part of a day to clear up and I'm not sure I remember everything I did. Two apparent errors was hindering me:

1) the `await users.remove({})` I had in the `afterEach` hook for mocha was not good. Since this was in an async handler `afterEach(async () => {` , as all the test were they started to wipe the collection clean uncontrollable, or at least unpredictable. So I removed that hook althogether.

2) I had a few slip-ups where I forgot to change from using `this` to using the context object `ctx`. Noteably in the `add` function in `userRoutes.js` where it for the longest time still was. `  const postedUser = await parse(this)`. This is now fixed.

And now the test fails when I change the code! Yes!
(and passes when it's suppose to pass)

### Clean up the helper exists

That just leaves a little helper I've used to check for existence and then the `userRoutes.js` is up to standard.

I've changed it into this, shorter more funcational version:

```javascript
const exists = (value) => (value !== undefined) && (value !== null)
```

## Summary

All in all there were many moving parts here, so let's summarize what we did to get this to work:

* We updated all our frameworks to the latest version (Koa, koa-route and co-body) but also the development tools (supertest and should)
* We realized that co-monk is using thunks and that cannot be used with async / await. So we simply removed co-monk altogether from the equation.
* We then turn all the functions in `userRoutes.js` from the generator functions they were into async functions
  * And then turned them into using `=>` notation.
* That made me nervous about using this and we started to used the passed in Koa context object instead
  * I forgot that in places and messed up additionally that took me about 4 hours to find
* For the test, using supertest, I [wrote a separate post on this](http://www.marcusoft.net/2018/06/testing-a-koa-application-with-supertest-using-asyncawait.html), but:
  * I create the server before all tests and close it after all tests
  * before each test I create the request object for the request under test
  * Finally I've put the `.end()`-function call

I learned a lot in writing this post. I realize that it became a bit messy for you, but I hope you could follow along to.

The code is checked in under `UserApi refactoring done`

The good news, is that I now will do the same thing for the other apis (in folders address and order) without writing a post.

* First checking is found under `Refactored OrderAPI`
* Second check in is found under `Refactored Address API`

Then, in the final post, we will tackle the top-level api that puts all of this together. Might be long or short. See [you there](http://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript_v.html)!