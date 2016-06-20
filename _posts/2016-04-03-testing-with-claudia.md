---
layout: post
title: "Testing with Claudia"
author: "Marcus Hammarberg"
date: 2016-04-03 21:00:57
tags:
 - Tools
 - Javascript
 - NodeJs
 - Claudia
---

In writing the [last post](http://www.marcusoft.net/2016/04/claudiajs-and-consolelog.html) I stumbled into a little nugget of gold that I never tried before `claudia test-lambda`.

This is a quick and simple way to verify and [smoke test](https://www.wikiwand.com/en/Smoke_testing_(software)) your lambda function once deployed.

And it's super easy to use. Tag along

<a name='more'></a>

# Our example... again
I'm going to use something very similar to the [last post](http://www.marcusoft.net/2016/04/claudiajs-and-consolelog.html) for our example. Here's the short version:

* `mkdir hellotesting && cd hellotesting`
* `npm init` and then some enter-strokes
* `npm install claudia --save-dev`
* Add a node for files in `package.json` like this `files : ["*.js"]`
* Add the following two `scripts`-nodes:
    * `"create": "claudia create --name hello-world-demo --region us-west-1 --handler main.handler"`
    * `"deploy": "claudia update"`

Finally `touch main.js` and enter the code below

    /*global exports, console*/
    exports.handler = function (event, context) {
        'use strict';
        console.log(event);
        context.succeed(event);
    };

This will quite simply just log the event you sent to your function (see the [last post](http://www.marcusoft.net/2016/04/claudiajs-and-consolelog.html) on where that ends up) and then return whatever you passed to the function back to you.

Finally create this lambda function in AWS by running `npm run create`

# Testing this
Now to the point of this post; how to test this. It's simple: `claudia test-lambda`. Try it and you'll see.

See?! This will call your lambda function and if everything went well return you something like the following:

    {"StatusCode":200,"Payload":"{}"}

Pretty sweet, huh?

Let's make it a bit more accessible and save that command in the `package.json` under a script called `test`. And run it again, just for the hey of it: `npm t`.

Ah ... bliss. Short, sweet and useful.

# Passing data
In all honesty that call is a bit simple, because most of your function will require some sort of data being passed to them in order to work properly.

No worries, Claudia got you covered:

    claudia test-lambda --event ./testdata/event.json

where `event.json` is a file with the data you want to pass to your function. Here's some dummy data that our echoing function will just return back to us:

    {
        "name" : "Marcus",
        "age" : 43,
        "interests" : [
            "node development",
            "euphonium",
            "lean"
        ]
    }

Running the command will pass the data in our file and the lambda function will return it:

    {"StatusCode":200,"Payload":"{\"name\":\"Marcus\",\"age\":43,\"interests\":[\"node development\",\"euphonium\",\"lean\"]}"}

Let's move that into our test command (making it: `"test": "claudia test-lambda --event ./testdata/event.json"`) and then rerun it with `npm test`.

Ah... it works. But how really?

# How does this work?
Running `claudia test-lambda --help` reveals a bunch of parameters that we could use to set lambda function version, source directory and configuration file. Luckily for us the defaults are awesome.

For example, the default for `configuration` is the `claudia.json` file in the local directory. This file is created for us by `claudia create` and is the thing that Claudia use to keep track of the deployed function locally.

From that file Claudia can deduce all parameters she (it?) needs to be able to call our function. In the case of no `--event` an empty payload will be used.

As I said, many cases this might cause your function to throw exceptions since it needs some in parameters to operate. But that's what the `--event` flag is for: pointing out the data to pass.

## Test more stuff at once
Psst - you could create multiple test data file and pass them as parameters in your script, essentially building a little test suite. For example have a few different test-commands and chain them together:

    "test-big": "claudia test-lambda --event ./testdata/big.json",
    "test-medium": "claudia test-lambda --event ./testdata/medium.json",
    "test-small": "claudia test-lambda --event ./testdata/small.json",
    "test" : "npm run test-big && npm run test-medium && npm run test-small"

Running `npm t` will now trigger all three test-runs.

# Summary
The `claudia test-lambda` is a nifty little addition to Claudia that helps you to quickly call into your deployed AWS Lambda function and see that it is up and running.

Using the `--event event.json` construct helps you to set up a test data to pass to the function in a simple manner.
