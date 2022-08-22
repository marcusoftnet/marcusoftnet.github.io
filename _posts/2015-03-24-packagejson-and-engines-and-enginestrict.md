---
layout: post
title: package.json engines & engineStrict - and how to use them
author: Marcus Hammarberg
date: 2015-03-24T11:14:54.000Z
tags:
  - Javascript
  - Tools
---

I'm poking around quite a lot with <a href="https://iojs.org">io.js</a> recently for reasons that soon will be revealed. When doing so I used my favorite Node version manager - <a href="https://github.com/creationix/nvm">Node Version Manager</a> to manage different versions of <a href="http://nodejs.org">Node</a> and io.js.

Switching back and forth is simple and sometimes I end up running some code on a version of Node/io.js that the code does not support. For example running EcmaScript 6 ```let```-statements in Node.

I was hoping that I'd get a <a href="http://www.marcusoft.net/2015/01/koa-and-the-referenceerror-promise-is-not-defined.html">warning</a> or preferable even an error when doing that. But no. Or...

In this post I'll show you how to use the <a href="http://www.marcusoft.net/2014/02/mnb-packagejson.html">package.json</a> file to make sure that you get warnings and errors when using the wrong version of the framework

<!-- excerpt-end -->

# engines

In the package.json there's an optional node that you can set called ```engines```. From the <a href="https://docs.npmjs.com/files/package.json">documentation</a> we can read about what this is for:

<blockquote>You can specify the version of node that your stuff works on</blockquote>

Love the informal tone of that documentation. Ok, so here we can list of not only Node, but also alternative runtime like io.js but also <a href="http://npmjs.org">npm</a>. This can be given as just a version number or with a range

```javascript
{ "engines" : { "iojs" : "1.6.1" } } // exactly 1.6.1

{ "engines" : { "npm" : "~1.0.20" } } // around 1.0.20

{ "engines" : { "node" : ">0.11.9" } } // above 0.11.9

{ "engines" : { "node" : ">=0.10.3 <0.12" } } // below or at 0.10.3 but not higher than 0.12
```

But you could also state that your "stuff" runs on several version of Node. In the case of using iojs this is true for all Node applications that is not using the EcmaScript 6 features not yet released in Node. <a href="http://koajs.com">Koa</a> is a good example of this. This is an extract from their package.json

```javascript
"engines": {
    "node": ">= 0.11.16",
    "iojs": ">= 1.0.0"
}
```

Koa supports both node and io.js at the respectively stated versions.

# engineStrict

There's another optional configuration setting in the package.json file called ```engineStrict```. Again from the documentation we read

<blockquote>If you are sure that your module will definitely not run properly on versions of Node/npm other than those specified in the engines object, then you can set "engineStrict": true in your package.json file.</blockquote>

and also about the engines-node

<blockquote>...unless the user has set the engine-strict config flag, this field is advisory only.</blockquote>

Note that the ```engineStrict``` flag is set to false per default, leaving the ```engines``` node "advisory only".

Basically it means that we can be more restrictive about what our code need to run. For example, let's say that I'm using some feature that only io.js supports, like the ```let```-statement for EcmaScript 6 for example. Then I can use the following configuration:

```javascript
"engineStrict" : true,
"engines": {
    "iojs": "1.6.1"
}
```

This will ensure that only io.js at version 1.6.1 is used when running my module. But how is that ensured?

# Using the engines configurations

Well this is cool but what does that mean? I'm state the engine my things requires but how can I use it?

Let's take an example and test it out. Let's say that I have a package.json with the following configuration for engines:

```javascript
"engineStrict": true,
"engines": {
    "node": "0.12.0"
}
```

But right now I'm running Node at ```v0.11.14``` (for example by going ```nvm install v0.11.14```) on my system. In my directory I go ```npm install``` to install all the packages my application depends on. Knowing what I know now I expect an error. I have the wrong version of the framework and I'm using the ```engineStrict```-flag, right?

But we are sorely disappointed. No error. No warning. Everything happily installed. It even starts up, unless there's a syntax error due to us using a later version of node.

<blockquote>Surely this is a bug?!</blockquote>
Marcus, a few days a go.

As it turns out the engines configuration are checked installation time of **package**. Yes, remember that ```npm``` stands for Node **Package** Manager. The engines-field is also in the package.json file. I first thought and hoped that this would be checked when i run my application but it's not. The engine field will be verified when you **install** the package, not when you run it.

But we did do ```npm install```. Why didn't it check this field?! Because doing ```npm install``` in our application folder only installs our applications *dependencies*. Should anyone of those dependencies require another framework version than the one we are on will would get the warning/error (depending on the ```engineStrict``` setting).

However there's a trick here. Bless the makers of Node for their strive for simplicity. Here's what you do:

1. go up one directory ```cd ..```
1. now npm install your application folder, for example ```npm install myApp```

This will install your application as a package, trigger the checks of the ```engines``` and ```engineStrict```.

If we try that again, with the same settings as before; engines: node = 0.12.0, and engineStrict = true... Lo and behold: we get the error we've been longing for:

```bash
npm ERR! notsup Not compatible with your version of node/npm: demoapp@1.0.0
npm ERR! notsup Required: {"node":"0.12.0"}
npm ERR! notsup Actual:   {"npm":"2.0.0","node":"0.11.14"}
```

Changing the ```engineStrict``` to false, give us warnings but it installs. Just as expected:

```bash
npm WARN engine demoapp@1.0.0: wanted: {"node":"0.12.0"} (current: {"node":"0.11.14","npm":"2.0.0"})
```

And finally, if we change the ```engines``` to match our running version (0.11.14) it works without errors.

# Summary

I think that with the advent of io.js we all have to be more watchful of which engines we are using for our code. Especially when we are deploying to services like <a href="http://www.heroku.com">Heroku</a> etc.

Knowing how, and why, the ```engines``` and ```engineStrict``` behaves as it does will be very valuable for me. And hopefully for you too.
