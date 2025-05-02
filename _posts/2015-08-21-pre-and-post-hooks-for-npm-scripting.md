---
layout: post
title: "Pre and Post hooks for npm scripting"
author: "Marcus Hammarberg"
date: 2015-08-21 07:03:49
tags:
 - Javascript
 - Node
 - Tools
---

[npm](https://www.marcusoft.net/2014/02/mnb-npm.html) is at the core of developing in [Node](http://www.nodejs.org). Most of us use it to get packages, set up the [package.json](https://www.marcusoft.net/2014/02/mnb-packagejson.html) etc.

But when you put it together with the vast possibilities in package.json you get another gear. Then npm can actually become a [build tool](http://blog.keithcirkel.co.uk/how-to-use-npm-as-a-build-tool/) - driving every aspect of your development. Without getting unwieldy and out of control.

In this post I wanted to examine one of the lesser known features of scripting with npm and package.json; `pre`- and `post` hooks. In doing so I will most likely brush on a lot of other subjects too.  We'll see how it goes.

**[UPDATED]**
This, and other posts on npm scripting, has drawn a lot of attention. I wanted you to know that I have created a [PluralSight](http://www.pluralsight.com/) course on this topic, published in late October 2015. You can [find it here](http://www.pluralsight.com/courses/npm-build-tool-introduction).

Also, don't miss the other posts on this blog on npm scripting:

* [npm scripting: git, version and deploy](https://www.marcusoft.net/2015/08/npm-scripting-git-version-and-deploy.html)
* [npm scripting: configs and arguments... and some more tricks](https://www.marcusoft.net/2015/08/npm-scripting-configs-and-arguments.html)
* [Pre and Post hooks for npm scripting](https://www.marcusoft.net/2015/08/pre-and-post-hooks-for-npm-scripting.html)

If you liked this post I know you will love the course! Thank you for reading this.

<!-- excerpt-end -->

I'll keep my [code here](https://github.com/marcusoftnet/preposthooks)

## The scripts

Pretty soon after starting to use the package.json file we start to use the `scripts`-node. In fact when you use `npm init` to set up your `package.json` file a test script is created for you. Often it looks something like this:

```javascript
"scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
}
```

That's not much to look at (and you should probably change it to something that actually does something useful, like running your tests), but it can still teach us some about the `scripts`-node.

So, a command is defined for me. In this case an `echo` reminding me to add some test facilities to my application / package.
How can I run this?

All scripts under `scripts` can be executed with `npm run-script [script name]`. Like this, to run our test command:

```bash
npm run-script test
```

This command with simply just run whatever code found under the `test`-key of the `scripts`-node.

Luckily there's a short form too and it's more commonly used:

```bash
npm run test
```

This is awesome because that means that we now can have scripts in our `package.json` that we can use `npm` to execute. A first, vital, step towards a build tool.

## test and start

There are two scripts that `npm` supports out of the box; `test` and `start`. When I write _supports_ it's more like; there's very convenient, well-known short cuts for them.

So instead of `npm run start` we can go `npm start`. Testing is even cooler; we can choose from these options:

```bash
npm run test
npm test
npm tst
npm t
```

But the really useful thing about these "well known" scripts is that tools and infrastructure in the Node world knows that they exists and can make use of them. For example, when you push code to [Heroku](http://www.heroku.com) it will launch your application with `npm start`. Or you continuous integration platform might run test, by convention by simply executing `npm test`.

## Hooks; pre and post

Before I get completely side tracked here let's go back to the theme of the this post; pre and post hooks.

This is one of the lesser known and used features of npm scripting I think. And it's a bit funny that this is "lesser" known and used, since it's actually the first thing that they write about [in the documentation](https://docs.npmjs.com/misc/scripts).

Ok anyway; all scripts supports `pre` and `post` hooks or scripts. They are automatically run by `npm` before (`pre`) and after (`post`) their respectively script / command. Aka JustWhatIThought (tm)

The pre/post scripts are for all intents and purposes just another script in your `package.json` file. They are also defined under the `scripts`-node.

For example; the script you've defined (if any) under `pretest` is run before the `test` script. And subsequently the `posttest` script is run after.

Here's an example;, you can find all my [code here](https://github.com/marcusoftnet/preposthooks):

```javascript
"scripts": {
    "test": "mocha -u bdd -R spec",
    "pretest": "rm -r ./logs/ && mkdir logs",
    "posttest": "rm -r ./logs/ && mkdir logs"
}
```

In this contrived example my tests creates some log files and I need to remove them, and recreate the folder, before (and after) I run my test. Easy to accomplish with the `pre` and `post` hooks. If you haven't seen it `&&` is a simple way of running a few commands in a row.

> Note that you should probably clean up test-data in your test code but it works as an example

## Hooks out the box

There's quite a few hooks that `npm` knows about out of the box, and hence will run for you, if they are defined:

* The `npm` command `publish` will run:
  * `prepublish`
  * then `publish`
  * and finally `postPublish`
* `install` has `preinstall` and `postinstall`
* `uninstall` also have pre and post hooks
* `version`
* `test`, that we talked about
* `start`
* `stop`
* `restart`

For all of these there's respectively `pre` and `post` hook. This comes very handy to manage the life cycle of your application.

## Custom scripts

What makes `npm` more useful, and what actually makes it a viable build tool, is that you can define your own, custom scripts.

Remember that you `npm test` actually was a short-cut for `npm run test` (which in turn is a short-cut for `npm run-script test`)?

Well there's nothing stopping you from defining your own script and run them. Here's a script that I've defined to run [jslint](http://www.jslint.com) over my code. The "tool that makes developer cry". I'm one of those guys I guess...

```javascript
"scripts": {
    "lint": "jslint '*.js'"
}
```

I can now run this by simply going `npm run lint` and it will lint all my files in the root directory.

Yes, I've could have defined the script as:

```javascript
"scripts": {
    "lint": "jslint '**/*.js'"
}
```

to run it on **all** my files, but I grew tired trying to fix the lint issues with mocha. Sorry.

## Dependencies and devDependencies

Now, there's a dependency problem here - that `jslint` command? What is that? Psst... [a Node package](http://npmjs.org/package/jslint).

And now everyone has to have it installed globally? No. This is a _development time_ dependency for my package. It only needs to be installed if you're going to run `npm run jslint`.

This is what `devDependencies` in the `package.json` is for. You can install and save the dependency like this `npm install jslint --save-dev`.

We don't have to give the path to the `node_modules`-folder (`./node_modules/jslint/bin/jslint`) since [npm will look for packages](http://www.bennadel.com/blog/2169-where-does-node-js-and-require-look-for-modules.htm) first the local `node_modules` and then continue upwards.

## Pre and post hooks for custom script

Now, while that `npm run lint` is cool, I still have to remember to run it from time to time. If only I could run it just _before_ testing, failing if the linting didn't pass 100%. What to do? What to do?

Aha! `pretest`! Yes, folks - this is a perfect scenario to run my custom `lint` script. Let's add it to the `pretest` script:

```javascript
"scripts": {
    "lint": "jslint '*.js'",
    "test": "mocha -u bdd -R spec",
    "pretest": "npm run lint && rm -r ./logs/ && mkdir logs",
    "posttest": "rm -r ./logs/ && mkdir logs"
}
```

Now then I, or my continuous integration server or what have you, go `npm test` to test my application the following happens:

* The `pretest` script is executed
  * it's first command `npm run lint` is run, and halt execution if `jslint` returns errors
  * we then clean the `./logs/` folder
  * and recreate it for good measures
* Now the `pretest` script is fully executed and the `test` script is run

## Refactor the script

My `package.json` is doing what I want, but starting to look messy. For example the `pretest` script is a bit ugly to read now, don't you think? Also the exact same script is used for `posttest` Let's fix it by refactoring a new script to clean logs. Like this:

```javascript
"scripts": {
    "cleanLogs" : "rm -r ./logs/ && mkdir logs",

    "lint": "jslint '*.js'",

    "test": "mocha -u bdd -R spec",
    "pretest": "npm run lint && npm run cleanLogs",
    "posttest": "npm run cleanLogs"
}
```

There - that's better. Now I simply call into my custom `cleanLogs` script from `pretest` and `posttest`. The `pretest` script calls two scripts after each other.

I played around with actually installing the `jslint` as a `prelint` task. It works but I don't think this is a good idea:

1. The dependencies that is need to develop should be listed under `devDependencies`. This adds clarity and understanding.
2. Updating the `package.json` feels ... dirty me thinks

That said - it's totally possible. Here's how:

```javascript
"scripts": {
    "lint": "jslint '*.js'",
    "prelint": "npm install jslint --save-dev"
}
```

But I'd advice against it.

## The 'npm run' command

Let me leave you with a nifty little feature more of `npm`. If you only go `npm run`, without _any_ parameters, `npm` will list all scripts in your `package.json`. Like a poor-mans-help. Here's what comes out if you go `npm run` on the file we've created:

```bash
Lifecycle scripts included in prePostHooks:
  test
    mocha -u bdd -R spec
  pretest
    npm run lint && npm run cleanLogs
  posttest
    npm run cleanLogs

available via `npm run-script`:
  cleanLogs
    rm -r ./logs/ && mkdir logs
  lint
    jslint '*.js'
```

## Summary

As you can see the `pre` and `post` hooks are very powerful allies if you want to use `npm` and `package.json` as a build tool.

You can find my [code here](https://github.com/marcusoftnet/preposthooks)

I'll write a post more about how we can integrate git, pushing and deploying into such script next.

I hope you liked this post.
