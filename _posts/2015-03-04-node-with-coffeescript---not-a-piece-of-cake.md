---
layout: post
title: "Get started writing NodeJs with CoffeeScript - not a piece of cake"
author: "Marcus Hammarberg"
date: 2015-03-04 09:23:07
tags:
 - Javascript
 - NodeJs
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

<a name='more'></a>
# Initialize project and more
Initalization of the project is straight forward for any Node developer, especially if you [rely](http://www.marcusoft.net/2014/02/mnb-npm.html) on the [tool](http://www.marcusoft.net/2014/02/mnb-packagejson.html).

Start by doing:

{% highlight bash %}
mkdir CoffeeDemo && cd CoffeeDemo
git init
npm init
{% endhighlight %}

and accept the defaults (that's 9 enter-clicks, people...) of the last wizard, if you don't have any reason to do otherwise.

Now, we of course need coffee-script installed. Best is probably to install it on our computer so run this command:

{% highlight bash %}
npm install -g coffee-script
{% endhighlight %}

Here I got a lot of warnings like these:

{% highlight bash %}
npm WARN unmet dependency /usr/local/lib/node_modules/grunt-init/node_modules/prompt requires colors@'0.x.x' but will load
{% endhighlight %}

But that had to do with that I was running the new craze [iojs](https://iojs.org/). It works anyway but maybe better to switch over to a version of Node that doesn't give you warnings.

We then need the dependencies for our application, which is just test and assertions:

{% highlight bash %}
npm install mocha should --save-dev
{% endhighlight %}

Oh, get a [.gitignore for Node](https://www.gitignore.io/api/node) from the excellent [www.gitignore.io](https://www.gitignore.io/) site

Done - we are set up.

# Run tests
The first thing I tried to do was to get the tests to run. In order to do so I had to write a little test. In coffee-script of course, so the next paragraph should probably had come before this one... Well well. Do this:

{% highlight bash %}
mkdir test
touch test/spec.coffee
{% endhighlight %}

Open that file in a text-editor and add the following naive test:

{% highlight coffeescript %}
describe "Writing Node with CoffeeScript", ->
	it "is easy to get started testing... or is it?", -> true
{% endhighlight %}

In CoffeesScript indentation is significant so make sure you enter it exactly as above.

I want to run my tests with mocha and I want to end up with a <code>test</code>-command in the package.json. Let's try the simplest we can come up with:

{% highlight javascript%}
"scripts": {
    "test": "mocha -w"
 }
{% endhighlight %}

This simply tells mocha to run and watch changes in our test-directory (by convention). Let's save the file and run it and see what happens:

{% highlight bash %}
npm test
{% endhighlight %}

which gives us <code>0 passing (0ms)</code>... No tests passing? But there is one in the spec.coffee-file?

However it's not JavaScript and we need to tell mocha to compile the .coffee files into JavaScript before it runs. This is done with a flag, that took me some time to track down: <code>--compilers coffee:coffee-script/register</code>. Add that to your test-script, in the package.json, making it look like this:

{% highlight javascript%}
"scripts": {
    "test": "mocha -w --compilers coffee:coffee-script/register"
 }
{% endhighlight %}

Rerun <code>npm test</code> and YES! It works...

There's other options you can set, I usually end up with a complete command that looks like this:

{% highlight javascript%}
"scripts": {
    "test": "mocha --compilers coffee:coffee-script/register -R spec -u bdd -w"
 }
{% endhighlight %}

If you find that to long to read you could specify the options in a <code>mocha.opts</code> file, in the test-directory. It will look like this:

{% highlight bash%}
 --compilers coffee:coffee-script/register
 -R spec
 -u bdd
 -w
{% endhighlight %}

Leaving our test command simply as <code>mocha</code>. I personally don't like this approach since I find that it's more places to look. But it's an option.

Ok, we can run our tests... Let's write some code.

# Write .coffee code
In order to have this working properly let's first add a file with our production code (<code>mkdir src && touch src/index.coffee</code>) and add the following code:

{% highlight coffeescript %}
greeting = (name) ->
	"Hello #{name}!"
{% endhighlight %}

If you never seen CoffeeScript, this defines function <code>greeting</code> that takes one parameter <code>name</code> and returns (last row of a function automatically returns in coffeescript, and many other functional langauges) a string with the name inserted in.

To not have all problems pour down on us at the same time, let's not add a test right now, but rather just call the function we defined below it. Like this:

{% highlight coffeescript %}
greeting = (name) ->
	"Hello #{name}!"

console.log greeting "Marcus"
{% endhighlight %}

# Run .coffee code

Ok - let's run it. Naively I tried <code>node src/index.coffee</code>. But unsurprising Node doesn't know anything about CoffeeScript (<code>SyntaxError: Unexpected token > </code>).

In order to run Node code we first need to compile it. And then run the compiled JavaScript file. To spare you all my pain I'll just show you the command I ended up with for <code>npm start</code> in my <code>package.json</code>, and then talk through it:

{% highlight javascript %}
"scripts": {
	"test": "mocha",
	"start": "(coffee --compile --output dist --watch src &);node ./dist/index.js"
}
{% endhighlight %}

Oh mama! That should probably go into a build file or something. But I'm keeping it here so that we can see it. Nothing too complicated though. Let's disect that a bit:

* the first part (up to the ;-sign) compilies .coffee files into .js files and put them in the dist folder.
	* <code>--output dist</code> means that the output will end up in the dist-folder, that will be created for us if non-existing
	* the <code>--watch src</code> simply means watch the <code>src</code> directory and subdirectories for changes to our .coffee-files
	* the <code>&</code> in the end (I think) is just to let the Node know that there's more commands to be executed. Anyhow, without that ampersand <code>npm start</code> hangs after compiling the .coffee-files.
* the second part of the command starts the application.
	* notice that it's starting the application in the dist-folder (<code>node ./dist/index.js</code>)

We can improve on this by using [Nodemon](http://nodemon.io/), that helps us to watch for changes. Install it with <code>npm install nodemon --save</code> and then change the start command into this:

{% highlight javascript %}
"scripts": {
    "test": "mocha",
    "start": "(coffee --compile -o dist --watch &);./node_modules/nodemon/bin/nodemon.js ./dist/index.js"
}
{% endhighlight %}

And the second part now starts Nodemon from our local node_modules-folder, not relying on that everyone that runs this code have Nodemon installed globally.

Ok, let's run it: <code>npm start</code>. It works!

And if we change the <code>index.coffee</code> file ... it fails!

{% highlight bash %}
Error: The two following source files have the same output file:
{% endhighlight %}

This is a bug in [CoffeeScript 1.9.1](https://github.com/jashkenas/coffeescript/issues/3863). It is fixed but not yet released. Make sure that you're running something else than 1.9.1 <code>sudo npm install -g coffee-script@1.9.0</code> for example.

# Testing our function - CoffeeScript all the way
Ok, let's stich it all together. Now we can run tests and we can run our code. But we have not yet run test that tests our code...

In the <code>spec.coffee</code> first require the file:

{% highlight coffeescript %}
sut = require '../src/index.coffee'
{% endhighlight %}

Then add a test that access the <code>greeting</code> function. This is the entire <code>spec.coffee</code> after these changes:

{% highlight coffeescript %}
sut = require '../src/index.coffee'
should = require 'should'

describe 'Writing Node with CoffeeScript', ->
	it 'is easy to get started testing... or is it?', -> true
	it 'can access exported functions in other modules', ->
		sut.greeting('Marcus').should.equal 'Hello Marcus!'
{% endhighlight %}

Yes, I added should since that's a nice way to do assertions.

Let's run the test <code>npm test</code>. It fails miserably:

{% highlight bash %}
TypeError: undefined is not a function
{% endhighlight %}

Luckily this is easy to understand... We have not exported the greeting function in our <code>/src/index.coffee</code>. Make that file look like this and it will be better:

{% highlight coffeescript %}
greeting = (name) ->
	"Hello #{name}!"

module.exports.greeting = greeting

console.log greeting "Marcus Hammarberg"
{% endhighlight %}

Better?! It rocks - because that acutally works. Since we are watching changes on our tests the change is picked up and it runs all our tests. Passing.

# Summary
This is a little bit too complicated to get set up if you ask me. I've gone back and forth a number of times before I got it too work but this should do it.

One problem that I first had but then went away is described [here](https://github.com/jashkenas/coffeescript/issues/3349). My code now works without adding the <code>require 'coffee-script/register'</code> but maybe you have too...

You'll find my [code here](http://github.com/marcusoftnet/FirstCoffeeDemo)

I'm by no means an expert. Consider this an experience report from me, an average JavaScript developer trying out CoffeeScript.

And please tell me if there are better ways.