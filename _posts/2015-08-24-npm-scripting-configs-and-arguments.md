---
layout: post
title: "npm scripting: configs and arguments... and some more tricks"
author: "Marcus Hammarberg"
date: 2015-08-24 13:23:57
tags:
 - Javascript
 - NodeJs
 - Tools
---

I've written [two](http://www.marcusoft.net/2015/08/pre-and-post-hooks-for-npm-scripting.html) [posts](http://www.marcusoft.net/2015/08/npm-scripting-git-version-and-deploy.html) on <code>npm</code> scripting with <code>package.json</code> and during the course of these post I've picked up some tricks that I didn't really use in the posts. 

This post will hence be a bit less structured by contain some small tidbits of information for you to, hopefully, enjoy and use. 

I'll be working of the [code here](https://github.com/marcusoftnet/npmfullbuilddemo) and add all the features I describe (as far as possible) to that repository.

**[UPDATED]**
This, and other posts on npm scripting, has drawn a lot of attention. I wanted you to know that I have created a [PluralSight](http://www.pluralsight.com/) course on this topic, published in late October 2015. You can [find it here](http://www.pluralsight.com/courses/npm-build-tool-introduction).

Also, don't miss the other posts on this blog on npm scripting: 

* [npm scripting: git, version and deploy](http://www.marcusoft.net/2015/08/npm-scripting-git-version-and-deploy.html)
* [npm scripting: configs and arguments... and some more tricks](http://www.marcusoft.net/2015/08/npm-scripting-configs-and-arguments.html)
* [Pre and Post hooks for npm scripting](http://www.marcusoft.net/2015/08/pre-and-post-hooks-for-npm-scripting.html)

If you liked this post I know you will love the course! Thank you for reading this

Here we go:
<a name='more'></a>

# Chaining tasks... more options
In the [last post](http://www.marcusoft.net/2015/08/pre-and-post-hooks-for-npm-scripting.html) I used <code>&&</code> to call task one after another.

There's more options just using normal command line functionality: 

## Piping result into the next command
I also "borrowed" from [this post](http://www.jayway.com/2014/03/28/running-scripts-with-npm/) an example where you want to send the output from one task into the next one. Here's that example again: 

```javascript
"build-js": "browserify -t reactify app/js/main.js | uglifyjs -mc > static/bundle.js"
```

By using the <code>|</code> you can take the result of one task and pass it on to the next. The output of the <code>browserify</code> command is a bundled file with all the code from all the required modules into one file (the <code>-t reactify</code> is simply packing up <code>.jsx</code> React stuff).

That file is then passed to the <code>uglifyjs</code> (you front-end guys and your names) that minifies the file and puts it into the <code>static/bundle.js</code>.

Now all of that is packed into the <code>build-js</code> command. 

## <a name="parallel"></a>Running in parallel
We will see later, under [Watching](#watching), we will have the need to start more than one thing simultaneous, running tasks in parallel.

This can be accomplished, also using normal "linux" commands, with the <code>&</code> switch or what you call it. 

Here we start our node server and a live reload functionality for our browser at the same time. Meaning that we something changes on the server <code>nodemon</code> will restart the server for us. If something changes on the client, our browser(s), will be reloaded.

```javascript
"scripts": {
	// other scripts
	"watch:server"	: "nodemon --harmony app.js",
	"watch:client"	: "live-reload --port 9091 ./",
	"watch" 		: "npm run watch:server & npm run watch:client"
}
```

This will fire up both the <code>npm run watch:server</code> and <code>npm run watch:client</code> at the same time, concurrent. Now when I make a change on the server [Nodemon](http://nodemon.io/) will reload the server. 

The client will be reloaded with the help of [live-reload](https://github.com/Raynos/live-reload) that simply is a server listening on port 9091, our case. Should the <code>./</code> directory be changed in any way the browsers open will be reloaded. This requires that you include a simple <code>script</code>-tag on your page:

{% highlight html %}
	<script src="//localhost:9091"></script> 
	// Note the matching port number 9091, to the live-reload command
```

# Calling remote scripts
As you probably can see scripting in the <code>package.json</code> file can only get you so far. No sweat though, if needed you can always call out to a bash or command file:

```javascript
"scripts": {
	"deploy:complex" : "./longdeploy.sh"
}
```

Now you are free to write the script how you want. This will of course require that you have permissions to execute that script. 

Also it hides some of the functionality of the script. So I would steer away from this as much as possible.

# External arguments, options etc.
Speaking of breaking out to separate files **and** contradicting myself a bit sometimes all the options and their parameters might get out of hand. An example where this is likely to happen would be for a linting task, that potentially could have a lot of parameters. 

## Options in separate files
You can, just as at the command prompt, run this command with all options in a separate file. Here's two versions of a linting task; one with options in-line and one in a <code>.jslint</code> options file:

```javascript
"lint:optionsfile" : "jslint index.js",
"lint:inlineoptions" : "jslint --evil --indent 2 --vars --passfail false --plusplus false index.js"
```

Yeah... I stand corrected. Sometimes it might be better to externalize the details of a script. 

## Passing through command line argument
Speaking of parameters and arguments to a command. There's a feature of npm that I didn't know of until a couple of days ago; if you pass <code>-- </code> (there's a space after the <code>--</code>, right there) you can "pass argument through" to the underlying command. 

This can be really handy to create versions of a script without having to rewrite it over and over. Let's say that our application accepts the port number to start it on as an argument; <code>node app.js 3456</code>, or the port set in the <code>ENV</code> defaulting to 3000 for example. Sounds complicated but here it is, for a [Koa](http://koajs.org) application: 

```javascript
app.listen(process.env.PORT || (process.argv[2] || 3000));
```

We could now create a few scripts like this: 

```javascript
"scripts": {
	"start"			: "node --harmony app.js",	// No argument - start with 3000
    "start:test"	: "npm start -- 4000",		// Start on port 4000 in testing
    "start:stage"	: "npm start -- 5000"		// Start on port 5000 in staging
}
```
 
See how we can reuse the original start-script by simply passing the port number through. Nice! 

This could of course be named arguments too: <code>npm test -- reporter:spec</code> for example.

## npm configuration
<code>npm</code> also supports a [config](https://docs.npmjs.com/misc/config#per-package-config-settings) object. This is yet another way to set parameters for your scripts. 

Simply define the values in a <code>config</code> node in <code>package.json</code> like this: 

```javascript
"name"	 : "myapp",
"config" : { "port" : "3000" }
```

This can now be used in your JavaScript code like this: 

```javascript
console.log("Running on port: " + process.env.npm_package_config_port)
```

But also in your <code>npm</code> scripts, like this: 

```javascript
"name"	 : "myapp",
"config" : { "port" : "3000" },
"scripts": {
	"start"	: "node --harmony app.js $npm_package_config_port"
}
```

If you're like me you probably just went: "Eeeeh...? SUCKS!? Now I have to change stuff in the package.json file if I wanna change the parameter". But I missed a important tidbit of information. The value of <code>port</code>, or any other <code>config</code> value can be overridden at the command prompt: 

```bash
npm config set myapp:port 80
```

It can also be overridden by other scripts:

```javascript 
"name"	 : "myapp",
"config" : { "port" : "3000" },
"scripts": {
	"start"			: "node --harmony app.js $npm_package_config_port",
    "start:test"	: "node --harmony app.js --myapp:port=4000",
    "start:test"	: "node --harmony app.js --myapp:port=5000"
}
```

Pretty nice, and yet another option to use.

# <a name="watching"></a>Watching and reloading
Well... you can read about this in the section above on running in [parallel](#parallel). That describes *one* way to get watching and reloading of browsers. There's a number of different ways to do this, of course. 

# npm niftyness
There's some small things with the <code>npm</code> command that is easily missed and that can prove useful.

## -s to silence it down
Any parameter you pass to <code>npm</code> at the command prompt is used for that entire command. For example <code>-s</code> turns logging more or less off (<code>-d</code> is more logging, and <code>-ddd</code> is silly logging, try it!), that can be useful to tweak. 

What I found interesting is that this is passed on to <code>npm</code> scripts. So for our mega-build-script-calling-into-other-scripts thing we [built before](http://www.marcusoft.net/2015/08/npm-scripting-git-version-and-deploy.html):

```javascript 
    "deploy:prod": "npm run test && npm run version:patch && npm run push && npm run launch",
``` 

we can simply turn logging up or down by going <code>npm run deploy:prod -ddd</code> or <code>npm run deploy:prod -s</code>. 

This can prove very useful as a setting to tweak in your build server for example.

## npm run
Just giving the command <code>npm run</code> will list all scripts in your <code>package.json</code>. That in itself can be useful as documentation. 

## npm completion
You can enable tab-completion in <code>npm</code> for all commands and even the scripts in the <code>package.json</code> too. It's a little bit weird I think but here's how it works. 

Calling <code>npm completion</code> will create a <code>.sh</code> file that enables the tab completion for the <code>package.json</code> in the current directory. For example <code>npm completion >> myAppTabCompletion.sh</code> will create a file called <code>myAppTabCompletion.sh</code> with the necessary code to get tab-completion to work. 

But it doesn't work. Until you load it into the current shell. I'm not good enough in Linuxy things to know how to do that. But here's one way, and a tweak; 

Instead of creating a separate file, like we did above, we can send it to <code>~/.bashrc</code> which is a file that is run as you start a new terminal window. Like this: 

Now the tab completion, for <code>myApp</code> mind you, will be enabled in all new terminal windows (so start a new one to try it). 

```bash 
npm completion >> ~/.bashrc 
``` 

That works (and is pretty cool to get tab completion on our scripts), but should you want to add another app it might get unwieldy. For the life of me I cannot understand how to get around it.  If I understand it correctly you can, at the end of <code>~/.bashrc</code> manually run the 
<code>myAppTabCompletion.sh</code>. But I can't get it to work. 

So I only got half-way there. Sorry.

## List binaries for scripting
Something that does work and that is a great help, especially during script-development, is to list all the binaries that your packages exposes. 

When we install a package with a binary that you can start from the command line, such as <code>nodemon</code> it's added to the <code>./node_modules/.bin</code> folder. By simply listing that folder we can easily see all the commands we can use: 

```bash 
$ ls ./node_modules/.bin/
_mocha		jslint		nodemon
cake		live-reload	tsc
coffee		mocha		tsserver
``` 

This also means that we can use these command straight off without prefixing them with <code>./node_modules/nodemon/bin/nodemon.js</code> as I have done before. 

Thanks [Juho Vepsäläinen](https://twitter.com/bebraw) for this tip!

# Summary
I love blogging. Because I learn so much. And I get some nice feedback and learn more. 

I hope that you could pick up some new and useful things here too. 
