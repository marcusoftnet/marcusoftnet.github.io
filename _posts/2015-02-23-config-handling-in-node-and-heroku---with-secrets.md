---
layout: post
title: "Config handling in Node and Heroku - with secrets"
author: "Marcus Hammarberg"
date: 2015-02-23 07:54:45
tags:
 - Javascript
 - Tools
 - NodeJs
---

Once you've coded and tested a Node application we are anxious to deploy it and put in front of real users. I've [blogged before](http://www.marcusoft.net/2014/04/mnb-heroku.html) on how you can do that very [easily and fast with Heroku](http://www.marcusoft.net/2014/06/koajs-making-make-file-test-push-and.html).

But one thing that trips me up a lot is the configuration and especially things that I want to vary per environment, like connection strings to databases or user names. Hey - some of those things I don't even wanna check into source control at all. They might be secrets that I don't want anyone else to get hold off.

In this post I'll show you a little function / object that I've found plenty use of and that I now include in almost every project I deploy. I'll finish up with a little discussion on how to handle secrets too.

<a name='more'></a>

I don't know really where I picked this construct up, the first time, but I'm eternally grateful that I've found it. It's just a simple object, with a twist. Here's the code for my configuration object, let's go through it below:

```javascript
var mongoProdUri = process.env.MONGOLAB_URI || 'localhost:27017/myApp_Prod';

var adminUser = {
	name : process.env.BASIC_USER || 'marcus',
	pass : process.env.BASIC_PASS || 'koavote'
};

var config = {
	local: {
		mode: 'local',
		port: 3000,
		mongoUrl: 'localhost:27017/myApp_Dev',
		user : adminUser
	},
	staging: {
		mode: 'staging',
		port: 4000,
		mongoUrl: 'localhost:27017/myApp_Test',
		user : adminUser
	},
	prod: {
		mode: 'prod',
		port: process.env.PORT || 5000,
		mongoUrl: mongoProdUri,
		user : adminUser
	}
};

module.exports = function (mode) {
	return config[mode || process.argv[2] || 'local'] || config.local;
};
```

At line 1 and 4-5 I'm using an old Javascript-trick:

```javascript
var x = something || somethingelse;
```

This is basically just check if the first expression is defined and if not, using the second one. In this case we check if a [process.env](http://nodejs.org/api/process.html#process_process_env) has been set (we'll talk more about those later) and if not we use a sensible default.

Line 8 - 27 sets up a the object, which actually is three different object, one per mode (dev, staging and production) that I want to keep track of in my configuration.

Within each object, for example line 10 - 13, I'm simply exposing the values for that configuration.

The last part is the final three lines, 29-31. This is the only thing that is exposed from my module and with this little function I can pass a parameter that let me select the configuration mode I'm running. It looks a little bit strange but that's mainly to give an easy access and fallback to 'local' if nothing is passed to the function. Here's a few way to use this:

No parameters, which will default to "local" mode:

```javascript
var localConfig = require("./config")();
```

Pass a parameter to control the mode:

```javascript
var config = require("./config")("staging");
```

Don't pass a parameter in code, but rely on the parameter passed when starting Node. Here I'm passing prod which will be picked up by that quirky function in the config-object and set the mode to prod:

```bash
node --harmony app.js prod
```

Meaning that in code I don't have to pass any parameters, the one passed to Node will the precedence:

```javascript
var config = require("./config")(); // Will create a Prod-mode configuration object
```

# Testing my configuration
This of course allows for nice testability of my configuration. Like this for example:

```javascript
var should = require("should");

describe("Configuration", function() {

    var validateConfig = function(config) {
        should.exists(config.mode);
        config.mode.should.not.be.emtpy;

        should.exists(config.mongoUrl);
        config.mongoUrl.should.not.be.emtpy;

        should.exists(config.port);
        config.port.should.not.be.emtpy;

        should.exists(config.user);
        config.user.should.not.be.emtpy;
        should.exists(config.user.name);
        config.user.name.should.not.be.emtpy;
        should.exists(config.user.pass);
        config.user.pass.should.not.be.emtpy;
    };

    describe("Local configuration", function() {
        var config = {};
        before(function(done) {
            config = require("./config")("local");
            done();
        });

        it("loads local configuration default", function(done) {
            var localConfig = require("./config")();
            localConfig.mode.should.equal("local");
            done();
        });
        it("loads config by parameter", function(done) {
            config = require("./config")("local");
            config.mode.should.equal("local");
            done();
        });
        it("loads local configuration for unknown configurations", function(done) {
            var config = require("./config")("unknown");
            config.mode.should.equal("local");
            done();
        });
        it("has all the valid properties", function(done) {
            validateConfig(config);
            done();
        });
    });
});
```

There's not much to be said about the testing code, other than test the presence of the values and not the actual values since that means that you will have duplications of the configuration. And maybe secrets leaking out into your code... Speaking of secrets.

# Secrets, Heroku and process.env
The process.env is a powerful feature of Node which let's you store configuration values (and other things) outside your code and retrieve them in code. You've seen example of this in the configuration object already:

```javascript
var x = process.env.MONGOLAB_URI || "a default connection string";
```

This is a perfect place to store secrets like passwords and connection strings. Now you can "store" your secrets outside your code and read it in your code when needed. No need to have to check things in etc.

You can pass this when starting Node like this:

```bash
node -e 'process.env.MONGOLAB_URI = "my local connectionstring"'
```

This is a good way to set environment variables that you don't want in your code (or in source control). If the command grows long you can store it in package.json .... no wait a second... you can create a command file that you share among the team, for example.

In production, if you are using Heroku and other platform as a service services you can configure these parameters. In Heroku it's called Config variables and can be found under Settings, https://dashboard.heroku.com/apps/_your appname here_/settings.

<img src="/img/heroku_config_vars.jpg" style="float:right" width="70%" />
The picture to the right guide you and that also shows you that I don't should reveal the variables and their values to anyone.

These values can now be picked up from code using the process.env.MONGOLAB_URI for example. When you run it local you can instead pass some sensible default in the config object or as a process.env parameter when you start up your application.

# Summary
This simple little object and accompanying knowledge about how process.env and Heroku works have helped me a lot. As I said I'm using it on almost all my applications. I think I first picked it up from my bro [Hugo](http://www.hugohaggmark.com).

The [code can be found here](https://github.com/marcusoftnet/Config), as a little package that you can use including tests. But please do something better than this - and please tell me. And first of all: don't store secrets in your code!