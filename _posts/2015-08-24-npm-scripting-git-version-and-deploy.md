---
layout: post
title: "npm scripting: git, version and deploy"
author: "Marcus Hammarberg"
date: 2015-08-24 13:24:58
tags:
 - Javascript
 - NodeJs
 - Tools
---

In the [last post](/2015/08/pre-and-post-hooks-for-npm-scripting.html) I promised to write something about "git, pushing and deploying". This is purely from a personal need since I have used [make](https://www.gnu.org/software/make/http://www.marcusoft.net/2014/02/mnb-packagejson.html) for those things. I wanted to see if I can move all of that to use [npm](https://docs.npmjs.com/misc/scripts) and [package.json](http://www.marcusoft.net/2014/02/mnb-packagejson.html) instead.

I'll also add a compile and minification step, just since that it's a common need. 

**[UPDATED]**
This, and other posts on npm scripting, has drawn a lot of attention. I wanted you to know that I have created a [PluralSight](http://www.pluralsight.com/) course on this topic, published in late October 2015. You can [find it here](http://www.pluralsight.com/courses/npm-build-tool-introduction).

Also, don't miss the other posts on this blog on npm scripting: 

* [npm scripting: git, version and deploy](http://www.marcusoft.net/2015/08/npm-scripting-git-version-and-deploy.html)
* [npm scripting: configs and arguments... and some more tricks](http://www.marcusoft.net/2015/08/npm-scripting-configs-and-arguments.html)
* [Pre and Post hooks for npm scripting](http://www.marcusoft.net/2015/08/pre-and-post-hooks-for-npm-scripting.html)

If you liked this post I know you will love the course! Thank you for reading this

<a name='more'></a>

# The makes of a makefile
My current [make file](http://www.marcusoft.net/2014/06/koajs-making-make-file-test-push-and.html) (that I copy around from project to project) does the following: 

1. Test the application, see [last post](/2015/08/pre-and-post-hooks-for-npm-scripting.html)
2. Create a release by incrementing the minor part of the version number in <code>package.json</code>
3. Push my code to [gitHub](http://www.github.com)
4. Push my code to [Heroku](http://heroku.com) using the [heroku toolbelt](https://toolbelt.heroku.com/)
5. Launches a web browser with the deployed application. 

Each of those tasks can be started individually and there's also a <code>deployToProd</code> task which just runs them all in order. 

To make this a little bit more "complete" we should probably add some sorts of compilation step before (and maybe a minification step *after*) 1.

Well - time waits for no-one. Let's go. You can find the full code [here](https://github.com/marcusoftnet/npmfullbuilddemo), by the way.

## Compilation
Everytime I write "compilation" when it comes to JavaScript I cannot help but to giggle a little. Wasn't it supposed to be interpreted? What have we done? Well, well... [Typescript](http://www.typescriptlang.org/) and [CoffeeScript](http://coffeescript.org/) are two very common options to spice up your JavaScript or your productivity. 

The pattern here will be the same as for all our tasks; add [npm](http://www.npmjs.org) tool to <code>devDependencies</code>, write script for task, plug task into over-all deploy script. 

Both [TypeScript](https://www.npmjs.com/package/typescript) and [CoffeeScript](https://www.npmjs.com/package/coffee-script) (as well as most any tool you can think of) have <code>npm</code> packages. Typically package for tools like these also have command line tools that you easily can use in your build process. Hmmm... maybe [using npm as a build tool](http://blog.keithcirkel.co.uk/how-to-use-npm-as-a-build-tool/) isn't such a bad idea after all.

Let's do both just for the fun of it. Here's my <code>package.json</code> updates with tasks to compile coffee-script.

{% highlight javascript %}
"devDependencies": {
	"coffee-script": "^1.9.3"
},

"scripts": {
	"compile:coffee" : "coffee --compile --output ./lib ./src/coffeescripts",
	"compile": "npm run compile:coffee"
}
{% endhighlight %}

<blockquote>
Note that I don't require this to be installed globally on the users computer. Including these tools as a <code>devDependecies</code> will make sure that I can use them. 
</blockquote>

<blockquote>
	Also note the nice comment from Juho Vepsäläinen below that told me how to clean up my scripts from paths to the ./node_modules/ directory
</blockquote>

There's two scripts that is interesting so far <code>compile:coffee</code> and <code>compile</code>. In the <code>compile:coffee</code> script I just compiles the coffee-script to the <code>lib</code>-folder. 
The <code>compile</code>-script will be an overarching script, where I do all compilation. 

Speaking of let's add some TypeScript compilation too. 

{% highlight javascript %}
"devDependencies": {
	"coffee-script": "^1.9.3",
	"mocha": "^2.2.5",
	"should": "^7.0.4",
	"typescript": "^1.5.3"
},

"scripts": {
	"compile:coffee" : "coffee --compile --output ./lib ./src/coffeescripts",
	"compile:ts"     : "tsc --outDir ./lib --module commonjs ./src/typescripts/tsCode.ts",

	"compile": "npm run compile:coffee && npm run compile:ts"
},
{% endhighlight %}

There we go. More of the same. And the <code>compile</code>-script is just updated with the <code>compile:ts</code>-script to make *all* compilation in one step.

I've written a dumb little <code>index.js</code> that simply uses the code compiled from Type- and Coffee-Script. Here it is: 

{% highlight javascript %}
var fill = require("./lib/coffeeCode.js");
var greeter = require("./lib/tsCode.js");

module.exports.fillMyJar = function (beverage) {
	return fill("jar", beverage);
};

module.exports.greetAType = function (name) {
	var g = new greeter();
	return g.greet(name);
};
{% endhighlight %}

And some simple tests to verify that it works:

{% highlight javascript %}
var should = require("should");
var app = require("../");

describe("Test placeholder", function () {
	it("testing frameworks", function (done) {
		app.should.not.be.null;
		done();
	});

	it("calls into stuff written in coffeescript", function (done) {
		app.fillMyJar("Java").should.equal("Filling the jar with Java...");
		done();
	});

	it("calls into stuff written in typescript too", function (done) {
		app.greetAType("Marcus").should.equal("A type-scripting greeting to you, Marcus");
		done();
	});
});
{% endhighlight %}

This means that we now create a <code>test</code> and a suitable <code>pretest</code> task that runs the compilation before the testing, as we learned about in the [last post](/2015/08/pre-and-post-hooks-for-npm-scripting.html). 

Just to make sure that everything is safe, let's clear out the <code>lib</code>-folder, with a <code>clean</code> task. 

*[UPDATED]*
Got a nice tip from [maxdow](https://disqus.com/by/maxdow/) about using [rimraf](https://www.npmjs.com/package/rimraf) to clean the folder out. It's a normal Node package and in doing so we can ensure that this runs on any platform, nothing "Linux" or "Windows" specific in the scripts. 

Install rimraf with <code>npm install rimraf --save-dev</code>

Here's the full <code>scripts</code>-node.

{% highlight javascript %}
  "scripts": {
    "start"           : "node index.js",
    
    "pretest"         : "npm run clean && npm run compile",
    "test"            : "mocha test -u bdd -R dot",
    
    "compile:coffee"  : "coffee --compile --output ./lib ./src/coffeescripts",
    "compile:ts"      : "tsc --outDir ./lib --module commonjs ./src/typescripts/tsCode.ts",
    
    "compile"         : "npm run compile:coffee && npm run compile:ts",
    "clean"           : "rimraf lib/*"
}
{% endhighlight %}

Now that you go <code>npm t</code> (short cut for <code>npm test</code>, remember) the following happens:

1. <code>pretest</code> is run
	1. <code>clean</code> is run
	1. <code>compile</code> is run
		1. <code>compile:coffee</code> is run
		1. <code>compile:ts</code> is run
1. <code>test</code> is run

Pssst - you can slience the output from <code>npm</code> with <code>npm t -s</code>.

There should probably be some linting in there too, but I did that in the [last post](/2015/08/pre-and-post-hooks-for-npm-scripting.html) and this is running log already. 

## Versioning
That was compilation and testing from my list in the start of this post. Let's tackle *versioning*. The challenge here is that we want to update the version number in the <code>package.json</code> but also set a tag in our git log, marking a new version. 

If you think this sounds daunting, fear no more: this is actually built right into <code>npm</code> itself. Let's check the command with <code>npm version -h</code>: 

{% highlight bash %}
npm version [<newversion> | major | minor | patch | prerelease | preminor | premajor ]
{% endhighlight %}

What it's trying to say is that you can either set the version yourself or use one of the predefined constants. For example: <code>npm version patch</code> to increment the patch part of your version number (this 0.0.**X**.0) and write that too your <code>package.json</code> version field. 

Amazingly this will also set the tag in git for you. 

Let's try it out. I have <code>"version": "1.0.0"</code> in my <code>package.json</code> and no tags in git. 

Let's create a simple script that bumps the patch part: 

{% highlight javascript %}
"version:patch" : "npm version patch"
{% endhighlight %}

Ok - let's see how it works:

{% highlight bash %}
$ git tag
$ npm run version:patch

> fullbuild@1.0.0 version:patch /Users/marcus/Projects/Node/npm-scripting/npmfullbuild
> npm version patch

v1.0.1
$ git tag
v1.0.1
{% endhighlight %}

The only downside of this is ... that the command updates the <code>package.json</code> file. Meaning that my fancy formatting disappears. Haven't found a way around that yet. 

### Committed to git
One thing that is worth noticing that if you git repository contains stuff that is not committed yet you will get an error. Luckily the error message is good:

{% highlight bash %}
$ npm run version:patch

... stuff ....

npm ERR! Error: Git working directory not clean.
npm ERR! M package.json

{% endhighlight %}

<code>git commit</code> the changes in package.json and you're good to go. 

## Pushing
Pushing the code is now almost trivial: just add scripts for pushing:

{% highlight javascript %}
"scripts": {
    // ...
    // Everything we've seen so far
    // ...
    "push:git" 		: "git push --tags origin HEAD:master",
    "push:heroku" 	: "git push heroku master"
}
{% endhighlight %}

Nothing very special here, of course. The <code>--tag</code> flag simply means that we want to push that tags to our remote git repository (name <code>origin</code> in this case).

The Heroku command is trivial, once the [Heroku Toolbelt](https://toolbelt.heroku.com/) is installed. 

The <code>git push heroku master</code> will do quite a lot of things on the remote side; get dependencies, build and deploy. We don't need to care about that here, just wait it out. 

## Launching the app
I've grown into the custom of always starting the application once it's pushed to it's environment, just to make sure it shows up. A little silly thing maybe, but it saved me from embarrassment a few times. 

In my case, being on a OS X system, launching the application once it's deployed is very easy:

{% highlight bash%}
open [url] # for example 'open http://koavote.herokuapp.com'
{% endhighlight %}

For Windows they tell me it's <code>start "http://koavote.herokuapp.com"</code>.

# Putting it all together
Now we are ready to create our <code>deployToProd</code> script. And it will just be stitching things together. 

You might have noticed that I'm using some kind of grouping with the <code>push:git</code>, <code>compile:ts</code>. I picked that up (among most everything I learned about npm scripting) from [this post](http://blog.keithcirkel.co.uk/how-to-use-npm-as-a-build-tool/). I like the idea of grouping the task, but might switch to <code>push_git</code> that I think reads nicer. 

## Some quick notes on chaining tasks
Chaining tasks is very easy, you just use <code>&&</code> between each task. If it get's long and unwieldy we can always group scripts together (as we did in the refactoring part of the [last post](/2015/08/pre-and-post-hooks-for-npm-scripting.html)) and also use the <code>pre/post</code>-scripts to manage it. 

This is the approach we will take below and it looks something like this: 

{% highlight javascript %}
"deploy": "npm run test && npm run version:patch && npm run deploy"
{% endhighlight %}

Another thing that might be useful is to send the output from one script execution into the next script. You might want to bundle your JavaScript files and then minify them, for browser based applications. That can be accomplished with the <code>|</code> (pipe) functionality. Like this example "stolen" from a [great article here](http://www.jayway.com/2014/03/28/running-scripts-with-npm/):

{% highlight javascript %}
"build-js": "browserify -t reactify app/js/main.js | uglifyjs -mc > static/bundle.js"
{% endhighlight %}

Finally you could use a tool like [npm-run-all](https://www.npmjs.com/package/npm-run-all) if you have a lot of tasks that you want more fine grained control over. 

## My example
Here's my first stab of a complete deploy script, I'll start with the <code>deployToProd</code> script and then list all the sub task scripts (my, what do you call these...) underneath:

{% highlight javascript %}
  "scripts": {
	"deploy:prod"     : "npm run test && npm run version:patch && npm run push && npm run launch",  

	"clean"           : "rimraf lib/*",

	"compile"         : "npm run compile:coffee && npm run compile:ts",
	"compile:coffee"  : "coffee --compile --output ./lib ./src/coffeescripts",
	"compile:ts"      : "tsc --outDir ./lib --module commonjs ./src/typescripts/tsCode.ts",

	"pretest"         : "npm run clean && npm run compile",
	"test"            : "mocha test -u bdd -R dot",

	"version:patch"   : "npm version patch",

	"push"            : "npm run push:git && npm run push:heroku",
	"push:git"        : "git push --tags origin HEAD:master",
	"push:heroku"     : "git push heroku master",

	"launch"          : "open https://npmfullbuilddemo.herokuapp.com/",
	"start"           : "node --harmony app.js"
}
{% endhighlight %}

<blockquote>
Oh, for the start command I've added a small web application, just to make sure it shows up. It's written using [koa](http://koajs.org) of course and hence I need the <code>--harmony</code> flag... Not on [iojs](www.pluralsight.com/courses/running-node-applications-io-js) but still on Node... :P 
</blockquote>

# Summary
This means that I can go <code>npm run deploy:prod</code> and it will clean, test, version, push, deploy and launch my application. Just using npm and the <code>package.json</code> file. 

There's no external tools dependencies but everything is downloaded with <code>npm install</code> which makes 0 to deploying very fast.  

That's pretty sweet, me thinks! 

You can find the full code [here](https://github.com/marcusoftnet/npmfullbuilddemo).

Again; I picked up a lot of things from these 3 sources: 

* [Excellent article](blog.keithcirkel.co.uk/how-to-use-npm-as-a-build-tool/) by Keith Cirkel on using npm as build tool
* The great [npm documentation](https://docs.npmjs.com/misc/scripts) - the only documentation that makes me giggle every minute. 
* [Blog post](http://www.jayway.com/2014/03/28/running-scripts-with-npm/) from Anders Janmyr @ JayWay

Thank you

{% include adsense.html %}