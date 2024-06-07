---
layout: post
title: "Refactoring a Koa app (part II) - refactoring the tests"
author: "Marcus Hammarberg"
date: 2018-06-05 21:07:13
tags:
  - Javascript
  - Koa
  - Programming
---

This is the second post in a series where I refactor an old (4 years) code base (an API written in [Koa](http://koajs.com)) to modern Javascript and tools.

Here are all the posts in the series

- [Part I - get the tests to run](http://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript.html)
- [Part II - where we clean up the test code a bit](http://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript_ii.html) - this post
- [Part III - where we start to move over to async/await testing](http://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript_iii.html)
- [Part IV - where finally do something about the production code, and fix the other parts of the application](http://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript_iv.html)
- [Part V - wrapping up by refactoring the root application](http://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript_v.html)

<!-- excerpt-end -->

In the last post we just go the test to run. So now we can start to do some:

## Simple refactoring and lint

Perfect! With passing tests I feel much more confident to make changes. And I want to. This code makes my eyes bleed.

First; it is unlinted with my favorite linter [standard](https://standardjs.com/). Since I also have the [plug-in installed](https://marketplace.visualstudio.com/items?itemName=chenxsan.vscode-standardjs) it makes my editor scream angry squigglies at me. Let's fix that.

First, let's install standard (`npm I standard -D` to save it as a development dependency) and then add two new scripts to the `package.json`:

```json
"scripts": {
    "start": "node --harmony app.js",
    "test": "mocha -w -u bdd -R spec",
    "lint": "standard",
    "lint:fix": "standard --fix"
}
```

The first script will run the linting for you, and probably make you cry… it's a long list of issues. Luckily with the `npm run lint:fix` command most of those goes away. Try it out for yourself.

Rerun the tests `npm t` to see that we still are good. Ha! It's already run. Good thing we put it in watch mode (using the `-w` flag) to have it run all the time.

### Refactor the app

Now open the `app.js` file and let's fix a few things that standard does take care of for us:

First replace `var` with `const` if the value is not changing or `let` in other cases. Don't do `var` - var is confusing with it's variable hoisting and stuff.

Also the line `const app = module.exports = koa()` is cute, but confusing. Let's move the module exports part to the end of the file like this:

```javascript
module.exports = app;
```

Finally, I'm growing out of comments. Yes, there are in here for a reason but so quickly goes out-of-sync with the code. Let's remove them.

The `app.js` is fine and the tests are still passing. Great - let's move to the `userRoutes.js` file.

## Refactoring userRoutes.js

Here's where the real logic happens and it should have more things to fix.

Again, let's remove the `var` and replace them with `const` again. That's a good start.

In this file I used another practice that I've outgrown (or changed my mind about). I used `module.exports.get = function * (id) {` that just creates an export where the function is defined. I rather have that exports-statement more well-defined, as a contract.

Let's define the functions like this: `const add = function * () {` and then add an exports like this:

```javascript
module.exports = {
  add,
};
```

We will need to move all the exports down there before the tests are passing again. We can't mix the two ways of exporting functions, apparently. Also, I need to export the `users` collection in the same way.

Here's the final version

```javascript
module.exports = {
  users,
  add,
  get,
  update,
  remove,
};
```

### Refactor the code in testHelpers.js

Yes yes - I have a helper class. Hate away. But maybe we can get rid of it once we have refactored this code base. Let's see. Anyway it's time to clean it up now.

First we clean it up, like with the others.

- We'll move the exports to a "interface"-definition at the end
- Replace `var` with `const` whereever we can
- Rename `test_user` to what StandardJs tell us `testUser`

That makes the code look like this:

```javascript
const co = require("co");
const app = require("../app.js");
const request = require("supertest").agent(app.listen());
const users = require("../userRoutes.js").users;

const testUser = { name: "Marcus", city: "Bandung, Indonesia" };

function removeAll(done) {
  co(function* () {
    yield users.remove({});
    // and other things we need to clean up
    done();
  });
}

module.exports = {
  testUser,
  app,
  request,
  users,
  removeAll,
};
```

This will fail the tests, as we renamed and reshuffled somethings. Simple fixes (mainly ensuring that we are using `test_user = helpers.testUser`) and soon we are passing again. I did a commit called `Test passing after refactoring testHelpers.js` that you can checkout if you get lost.

### Summary

Ok - that is better but now we need to get to the meat and start using some of the modern features that exists in ES6. Let's do that in the [next post](http://www.marcusoft.net/2018/06/refactoring-an-old-koa-or-how-i-learned-a-lot-modern-javascript_iii.html). See you there.

By the way… Thank God for tests - this is a joy to refactor!
