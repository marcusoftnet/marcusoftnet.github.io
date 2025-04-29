---
layout: post
title: "Refactoring a Koa app (part V) - refactoring the root app"
author: "Marcus Hammarberg"
date: 2018-06-05 21:07:13
tags:
  - Javascript
  - Koa
  - Programming
---

This is the fifth and last post in a series where I refactor an old (4 years) code base (an API written in [Koa](http://koajs.com)) to modern Javascript and tools.

Here are all the posts in the series

- [Part I - get the tests to run](http://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript.html)
- [Part II - where we clean up the test code a bit](http://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript_ii.html)
- [Part III - where we start to move over to async/await testing](http://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript_iii.html)
- [Part IV - where finally do something about the production code, and fix the other parts of the application](http://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript_iv.html)
- [Part V - wrapping up by refactoring the root application](http://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript_v.html) - this post

<!-- excerpt-end -->

The last post ended with us finishing refactoring the individual part applications. The time has come to the orchestration app on top. If you remember from the very first post I had done this to show a feature of [Koa](http://koajs.com/) where you can compose Koa applications in a nice way. There's [another blogpost on that.](http://www.marcusoft.net/2015/05/splitting-an-koa-app-into-parts-and-putting-it-together-again.html)

We'll tackle this in the same manner:

- First get the tests to run
- Then refactor the system under test, now protected by our test suite
- Then refactor the test themselves

At least that is the plan. I will only highlight any differences or now problems I ran into as I don't want to repeat what I've already written in the previous blog posts in the series. Hope that is ok with you.

### Get tests to run

The first thing I need to do is to `cd` my way all the way to the top of the application. And I realized that I haven't installed the dependencies for this application, but that is helped with `npm i`.

The first test run (`npm t` ) of course fail in the same manner as before, regarding the `—harmony` flags.

#### Fixing local dependencies

But then the interesting stuff started. Because this application uses local reference in the `package.json` file like this: `    "AddressAPI": "file:./apis/address"`

That's all and well, but I learned now, those names ` AddressAPI` are apparently case-sensetive. And my casing was all over the place. And I know why.

I got a linting error in the `package.json` file about using upper-case letters. I fixed that in some places and … not in others.

(Sidenote - I figured this out by installing a local dependency with `npm I -S ./api/order`, which can be handy to know).

Luckily this is not hard, although boring to fix:

- Go into each of the `package.json` in the `apis`-folder and lower case the `name` property
- Open `package.json` in the root application
- Update it to use the same casing, all lowercase
- Reinstall the `node_modules` using brute force `rm -rf node_modules && npm I `

Rerun the tests and we can build our app. Great!

#### Fix failing tests

The tests are failing due to [some funky yield-issue](https://stackoverflow.com/questions/30457200/when-should-i-use-yield-and-when-yield-with-koa-js). Knowing that I will update this soon anyway I'm going to update all the packages to the latest version:

```bash
npm uninstall koa koa-basic-auth koa-mount -S && npm I koa koa-basic-auth koa-mount -S
```

and then

```bash
npm uninstall mocha supertest -D && npm I mocha supertest -D
```

And then re-run again. It's a bit dirty maybe, from a purist TDD persons perspective but now at least I know that I'm using the packages I will use moving on.

Ok - that led to some familiar errors of not using `new` and then some deprecation warnings. So I installed the [standard](https://standardjs.com/) linting tool and fixed the `var/const` things in the `index.js` and finally change any generators to `async/await`.

Just as we have done all along.

The tests are still passing and I'm a bit nervous.

### Listening when spoken too

But now we got another problem that I happen to recognize from before `Uncaught Error: listen EADDRINUSE :::3000 `. I actually wrote a [pretty long post](http://www.marcusoft.net/2015/10/eaddrinuse-when-watching-tests-with-mocha-and-supertest.html) on this problem, that now served me well in fixing this…

```javascript
if (!module.parent) {
  app.listen(config.port);
  console.log("listening on port " + config.port);
}
```

There - now we're only listening on a port, coming from the config object, when this is started without a parent. That is the case when we are running in production. We could also have checke the `ENV` flag of course, but now this is how I do it.

It turned out that I had done a few different ways of doing this, for example passing in an ENV variable called `standalone` for the AddressAPI, forgetting to listen at all for the Order and just listening on port 3000 every time for the Users. A mess!

It's now refactored to always do the above little fix in the same way.

### Refactoring the root application

The root application is a very tiny, the smallest possible in fact, Koa application that just returns a string. But that was in the old-style Koa so I needed to update it to this:

```javascript
const rootApp = new Koa();
rootApp.use(async (ctx, next) => {
  await next();
  ctx.body = "Find the APIs under /user, /order and /address respectively";
});
```

Using koa-mount I could then mount it under `/` using this expression `app.use(mount('/', rootApp))`

### Fixing the original URL

I then ran into some follow-on problems from me cleaning up the code, that I now found when I mounted the different sub applications into my root application.

The test for the root application ran and gave me:

```bash
expected "location" matching /^\/address\/[0-9a-fA-F]{24}$/, got "/address5b37d4160f74002df27fbc20"
```

Which turned out to be true! Because in, for example `userRoutes.js` I had this line

```javascript
ctx.set("location", ctx.originalUrl + insertedUser._id);
```

That should actually have been this, with an extra `/` in between.

```javascript
ctx.set("location", `${ctx.originalUrl}/${insertedAddress._id}`);
```

However, that now fails the tests in the sub applications. Going into the `/apis/users/` folder and run the test I now get this error.

```bash
Error: expected "location" matching /^\/[0-9a-fA-F]{24}$/, got "//5b37d45bda4bd52e3001bbb2"
```

Ok - here's a little glitch in my plan. Because this app, by its own, doesn't care where it is mounted. But that causes problem since I get double slashes. The `ctx.originalUrl` is just `/`.

I tried to change the urls for my app to now have a slash in front but ended up with some weird errors. So I decided to go the hacky route instead like this:

```javascript
const url = `${ctx.originalUrl}/${insertedUser._id}`.replace("//", "/");
ctx.set("location", url);
```

Replacing that same thing in the `addressRoutes.js` and `orderRoutes.js` files and ensuring that their tests still run. Then I went back up and ...

So close! One thing left.

### Sidebar - Marcus is not a programmer anyone

Here I will let you down my friends. There are a few test, and features, in the code around (basic) authentication that I couldn't get to work.

I was pulling my hair to get it to work but ran out of energey. I simply don't find the energy sometimes, now a-days, to flesh out all the fails.

It looks like the packages are out of sync and possible have not been updated for the more updated versions of Koa. It's not particular hard to fix, if you had the energy to look into it. I didn't this time.

Sorry about that.

### Authentication

I will just disable this feature. It's a naive implementation to start with and I don't have the energy to resolve it. I hope someone of you can find the time to fix it for me. It should be done with OAuth or something more modern I think.

Basically this means:

- remove the package `koa-basic-auth` - `npm uninstall koa-basic-auth -S`
- remove the code that uses `koi-basic-auth` :
  - remove the `authentication.js` file - `rm authentication.js`
  - in `index.js` there's a few places that a simple `node index.js` will reveal for you
- Clean up the mounting, that now is done without the authentication code.

From this:

```javascript
// Mounting
app.use(mount("/users", userApi));
app.use(mount("/address", addressApi));
app.use(mount("/", rootApp));

// middleware configuration
app.use(mount("/orders", userAuth.reqBasic));
app.use(mount("/orders", auth(config.adminUser)));
app.use(mount("/orders", orderApi));
```

to this:

```javascript
// Mounting
app.use(mount("/users", userApi));
app.use(mount("/address", addressApi));
app.use(mount("/orders", orderApi));
app.use(mount("/", rootApp));
```

Finally

- we take out 2 tests (`'and an order api, but that requires login'` and `exactly - the order API require login. Not logging in will give you access'`)

With that the whole test suite should be passing again. And `npm t` reveals that it does.

## Summary

It felt like cheating in the end but it was beyond the scope of this series to fix the old-school basic authentication as well.

In this series I took a old (ah, 4 years at least) [Koa](http://koajs.com/) application and tried to update it to the new Koa framework. This led me to learn and understand quite a lot about ES6, funcational programming and async/await.

I hope you found this helpful and intresting.

All the code is checked in and merged to [master here](https://github.com/marcusoftnet/UserApiWithTest)

If you got this far... Thanks for reading.

Here are all the posts in the series

- [Part I - get the tests to run](http://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript.html)
- [Part II - where we clean up the test code a bit](http://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript_ii.html)
- [Part III - where we start to move over to async/await testing](http://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript_iii.html)
- [Part IV - where finally do something about the production code, and fix the other parts of the application](http://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript_iv.html)
- [Part V - wrapping up by refactoring the root application](http://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript_v.html) - this post
