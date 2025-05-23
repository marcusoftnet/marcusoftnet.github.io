---
layout: post
title: "Get started writing NodeJs with CoffeeScript - not a piece of cake"
author: "Marcus Hammarberg"
date: 2015-03-04 09:23:07
tags:
 - Javascript
 - Node
 - Tools
---

For some reason I'm from time to time drawn to different languages that compiles to JavaScript. And then I'm drawn away again. Especially nowadays with [ES6 coming up](https://robots.thoughtbot.com/replace-coffeescript-with-es6) many ideas and needs for [CoffeeScript](http://www.coffeeScript.org) or [TypeScript](http://www.typescriptlang.org/) goes away.

So the other day I found myself thinking again:

<blockquote>
Hey - CoffeeScript. That's not such a bad idea. Maybe I should try to write some.
</blockquote>

CoffeeScript and I have a dormant but warm relationship because this little language was the one that helped me understand not only JavaScript but also got grips of functional programming.

I thought I'd write a simple little kata in Node to fresh up my CoffeeScript-fu. How hard could it be?

Well... there's quite a lot of setup and idiosyncrasies that you need to be aware of. This post tries to summary what I learned as I got my environment up and running. Specifically; initialization, run tests, write code and run my app.

<!-- excerpt-end -->

## Initialize project and more

Initialization of the project is straight forward for any Node developer, especially if you [rely](https://www.marcusoft.net/2014/02/mnb-npm.html) on the [tool](https://www.marcusoft.net/2014/02/mnb-packagejson.html).

Start by doing:

```bash
mkdir CoffeeDemo && cd CoffeeDemo
git init
npm init
```

and accept the defaults (that's 9 enter-clicks, people...) of the last wizard, if you don't have any reason to do otherwise.

Now, we of course need coffee-script installed. Best is probably to install it on our computer so run this command:

```bash
npm install -g coffee-script
```

Here I got a lot of warnings like these:

```bash
npm WARN unmet dependency /usr/local/lib/node_modules/grunt-init/node_modules/prompt requires colors@'0.x.x' but will load
```

But that had to do with that I was running the new craze [iojs](https://iojs.org/). It works anyway but maybe better to switch over to a version of Node that doesn't give you warnings.

We then need the dependencies for our application, which is just test and assertions:

```bash
npm install mocha should --save-dev
```

Oh, get a [.gitignore for Node](https://www.gitignore.io/api/node) from the excellent [www.gitignore.io](https://www.gitignore.io/) site

Done - we are set up.

## Run tests

The first thing I tried to do was to get the tests to run. In order to do so I had to write a little test. In coffee-script of course, so the next paragraph should probably had come before this one... Well well. Do this:

```bash
mkdir test
touch test/spec.coffee
```

Open that file in a text-editor and add the following naive test:

```coffeescript
describe "Writing Node with CoffeeScript", ->
 it "is easy to get started testing... or is it?", -> true
```

In CoffeesScript indentation is significant so make sure you enter it exactly as above.

I want to run my tests with mocha and I want to end up with a `test`-command in the package.json. Let's try the simplest we can come up with:

```javascript
"scripts": {
    "test": "mocha -w"
 }
```

This simply tells mocha to run and watch changes in our test-directory (by convention). Let's save the file and run it and see what happens:

```bash
npm test
```

which gives us `0 passing (0ms)`... No tests passing? But there is one in the spec.coffee-file?

However it's not JavaScript and we need to tell mocha to compile the .coffee files into JavaScript before it runs. This is done with a flag, that took me some time to track down: `--compilers coffee:coffee-script/register`. Add that to your test-script, in the package.json, making it look like this:

```javascript
"scripts": {
    "test": "mocha -w --compilers coffee:coffee-script/register"
 }
```

Rerun `npm test` and YES! It works...

There's other options you can set, I usually end up with a complete command that looks like this:

```javascript
"scripts": {
    "test": "mocha --compilers coffee:coffee-script/register -R spec -u bdd -w"
 }
```

If you find that to long to read you could specify the options in a `mocha.opts` file, in the test-directory. It will look like this:

```bash
 --compilers coffee:coffee-script/register
 -R spec
 -u bdd
 -w
```

Leaving our test command simply as `mocha`. I personally don't like this approach since I find that it's more places to look. But it's an option.

Ok, we can run our tests... Let's write some code.

## Write .coffee code

In order to have this working properly let's first add a file with our production code (`mkdir src && touch src/index.coffee`) and add the following code:

```coffeescript
greeting = (name) ->
 "Hello #{name}!"
```

If you never seen CoffeeScript, this defines function `greeting` that takes one parameter `name` and returns (last row of a function automatically returns in coffeescript, and many other functional languages) a string with the name inserted in.

To not have all problems pour down on us at the same time, let's not add a test right now, but rather just call the function we defined below it. Like this:

```coffeescript
greeting = (name) ->
 "Hello #{name}!"

console.log greeting "Marcus"
```

## Run .coffee code

Ok - let's run it. Naively I tried `node src/index.coffee`. But unsurprising Node doesn't know anything about CoffeeScript (`SyntaxError: Unexpected token >`).

In order to run Node code we first need to compile it. And then run the compiled JavaScript file. To spare you all my pain I'll just show you the command I ended up with for `npm start` in my `package.json`, and then talk through it:

```javascript
"scripts": {
 "test": "mocha",
 "start": "(coffee --compile --output dist --watch src &);node ./dist/index.js"
}
```

**[UPDATED]**
If you haven't seen it before the ampersand ```&``` at the end of the first part of the command, is a UNIX way of starting a command in a separate process, in the background.
Also the ```;``` is separating two commands, running them in sequence; first the coffee-compilation-watcher and then the start-our-application command. You can also chain commands with ```&&``` but then the execution will stop if one of the command should fail.
Thank Ania for pointing that out to me.

Oh mama! That should probably go into a build file or something. But I'm keeping it here so that we can see it. Nothing too complicated though. Let's dissect that a bit:

* the first part (up to the ;-sign) compiles .coffee files into .js files and put them in the dist folder.
  * `--output dist` means that the output will end up in the dist-folder, that will be created for us if non-existing
  * the `--watch src` simply means watch the `src` directory and subdirectories for changes to our .coffee-files
  * the `&` in the end (I think) is just to let the Node know that there's more commands to be executed. Anyhow, without that ampersand `npm start` hangs after compiling the .coffee-files.
* the second part of the command starts the application.
  * notice that it's starting the application in the dist-folder (`node ./dist/index.js`)

We can improve on this by using [Nodemon](http://nodemon.io/), that helps us to watch for changes. Install it with `npm install nodemon --save` and then change the start command into this:

```javascript
"scripts": {
    "test": "mocha",
    "start": "(coffee --compile -o dist --watch &);./node_modules/nodemon/bin/nodemon.js ./dist/index.js"
}
```

And the second part now starts Nodemon from our local node_modules-folder, not relying on that everyone that runs this code have Nodemon installed globally.

**UPDATE**
Again Ania pointed out (see comments) that you need a Nodemon ignore file (`nodemon.json`) with the following pattern

```bash
src/*.coffee
```

Ok, let's run it: `npm start`. It works!

And if we change the `index.coffee` file ... it fails!

```bash
Error: The two following source files have the same output file:
```

This is a bug in [CoffeeScript 1.9.1](https://github.com/jashkenas/coffeescript/issues/3863). It is fixed but not yet released. Make sure that you're running something else than 1.9.1 `sudo npm install -g coffee-script@1.9.0` for example.

## Testing our function - CoffeeScript all the way

Ok, let's stich it all together. Now we can run tests and we can run our code. But we have not yet run test that tests our code...

In the `spec.coffee` first require the file:

```coffeescript
sut = require '../src/index.coffee'
```

Then add a test that access the `greeting` function. This is the entire `spec.coffee` after these changes:

```coffeescript
sut = require '../src/index.coffee'
should = require 'should'

describe 'Writing Node with CoffeeScript', ->
 it 'is easy to get started testing... or is it?', -> true
 it 'can access exported functions in other modules', ->
  sut.greeting('Marcus').should.equal 'Hello Marcus!'
```

Yes, I added should since that's a nice way to do assertions.

Let's run the test `npm test`. It fails miserably:

```bash
TypeError: undefined is not a function
```

Luckily this is easy to understand... We have not exported the greeting function in our `/src/index.coffee`. Make that file look like this and it will be better:

```coffeescript
greeting = (name) ->
 "Hello #{name}!"

module.exports.greeting = greeting

console.log greeting "Marcus Hammarberg"
```

Better?! It rocks - because that actually works. Since we are watching changes on our tests the change is picked up and it runs all our tests. Passing.

## Summary

This is a little bit too complicated to get set up if you ask me. I've gone back and forth a number of times before I got it too work but this should do it.

One problem that I first had but then went away is described [here](https://github.com/jashkenas/coffeescript/issues/3349). My code now works without adding the `require 'coffee-script/register'` but maybe you have too...

You'll find my [code here](http://github.com/marcusoftnet/FirstCoffeeDemo)

I'm by no means an expert. Consider this an experience report from me, an average JavaScript developer trying out CoffeeScript.

And please tell me if there are better ways.

**UPDATE**
There are many! [Check out my follow up post](https://www.marcusoft.net/2015/03/coffeescript-what-ive-should-have-done.html)
