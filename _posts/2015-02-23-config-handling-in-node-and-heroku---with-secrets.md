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
<script src="https://gist.github.com/marcusoftnet/68d7bb7bf61fb08aeb91.js"></script>

At line 1 and 4-5 I'm using an old Javascript-trick:
{% highlight javascript %}

var x = something || somethingelse;

{% endhighlight %}
This is basically just check if the first expression is defined and if not, using the second one. In this case we check if a [process.env](http://nodejs.org/api/process.html#process_process_env) has been set (we'll talk more about those later) and if not we use a sensible default.

Line 8 - 27 sets up a the object, which actually is three different object, one per mode (dev, staging and production) that I want to keep track of in my configuration.

Within each object, for example line 10 - 13, I'm simply exposing the values for that configuration.

The last part is the final three lines, 29-31. This is the only thing that is exposed from my module and with this little function I can pass a parameter that let me select the configuration mode I'm running. It looks a little bit strange but that's mainly to give an easy access and fallback to 'local' if nothing is passed to the function. Here's a few way to use this:

No parameters, which will default to "local" mode:
{% highlight javascript %}
var localConfig = require("./config")();
{% endhighlight %}

Pass a parameter to control the mode:
{% highlight javascript %}
var config = require("./config")("staging");
{% endhighlight %}

Don't pass a parameter in code, but rely on the parameter passed when starting Node. Here I'm passing prod which will be picked up by that quirky function in the config-object and set the mode to prod:
{% highlight bash %}
node --harmony app.js prod
{% endhighlight %}
Meaning that in code I don't have to pass any parameters, the one passed to Node will the precedence:
{% highlight javascript %}
var config = require("./config")(); // Will create a Prod-mode configuration object
{% endhighlight %}

# Testing my configuration
This of course allows for nice testability of my configuration. Like this for example:
<script src="https://gist.github.com/marcusoftnet/db5f368a80021327da29.js"></script>

There's not much to be said about the testing code, other than test the presence of the values and not the actual values since that means that you will have duplications of the configuration. And maybe secrets leaking out into your code... Speaking of secrets.

# Secrets, Heroku and process.env
The process.env is a powerful feature of Node which let's you store configuration values (and other things) outside your code and retrieve them in code. You've seen example of this in the configuration object already:

{% highlight javascript %}

var x = process.env.MONGOLAB_URI || "a default connection string";

{% endhighlight %}

This is a perfect place to store secrets like passwords and connection strings. Now you can "store" your secrets outside your code and read it in your code when needed. No need to have to check things in etc.

You can pass this when starting Node like this:

{% highlight bash %}
node -e 'process.env.MONGOLAB_URI = "my local connectionstring"'
{% endhighlight %}

This is a good way to set environment variables that you don't want in your code (or in source control). If the command grows long you can store it in package.json .... no wait a second... you can create a command file that you share among the team, for example.

In production, if you are using Heroku and other platform as a service services you can configure these parameters. In Heroku it's called Config variables and can be found under Settings, https://dashboard.heroku.com/apps/_your appname here_/settings.

<img src="/img/heroku_config_vars.jpg" style="float:right" width="70%" />
The picture to the right guide you and that also shows you that I don't should reveal the variables and their values to anyone.

These values can now be picked up from code using the process.env.MONGOLAB_URI for example. When you run it local you can instead pass some sensible default in the config object or as a process.env parameter when you start up your application.

# Summary
This simple little object and accompanying knowledge about how process.env and Heroku works have helped me a lot. As I said I'm using it on almost all my applications. I think I first picked it up from my bro [Hugo](http://www.hugohaggmark.com).

The [code can be found here](https://github.com/marcusoftnet/Config), as a little package that you can use including tests. But please do something better than this - and please tell me. And first of all: don't store secrets in your code!