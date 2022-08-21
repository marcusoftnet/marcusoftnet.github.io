---
layout: post
title: "ClaudiaJs and console.log"
author: "Marcus Hammarberg"
date: 2016-04-01 20:10:37
tags:
 - Tools
 - Javascript
 - Claudia
---

AWS Lambda functions are really great since the server is out of the picture. We don't really need to care about it, since AWS will handle scaling, patching, starting and stopping for us. It's just us and our code. Ah bliss!

But wait a second: what if I do a `console.log`? Where will that be output? There's no console, since I don't have a server. Or is it?

Spoiler alert: [Claudia](http://www.claudiajs.com) got you covered.

<!-- excerpt-end -->

# A simple example

As our example let's use one of the [example projects](https://github.com/claudiajs/example-projects) that Claudia has provided for us to learn from. In fact - let's use the simplest possible: [Hello-World](https://github.com/claudiajs/example-projects/blob/master/hello-world/).

Create a new directory (called `hello-world` for example) and in it do a `npm init` and click through the wizard.

There's only one development dependency for this simple application, Claudia itself. Install it with `npm install claudia --save-dev`.

Now create a `main.js` with the following content:

    /*global exports, console*/
    exports.handler = function (event, context) {
        'use strict';

        console.log('Logged event:')
        console.log(event);

        context.succeed('hello world');
    };

Very simple, just to simple log statements.

Finally let's add a few scripts to our `package.json` to make our life simple:

      "scripts": {
        "create": "claudia create --name hello-world --region us-east-1 --handler main.handler",
        "test": "claudia test-lambda",
        "deploy": "claudia update"
      }

(You might want to change `--region` to something that suits you if you want)

Finally make sure to add the `main.js` file to the `files` property of `package.json` so that it gets pushed to AWS:

    "files": [
        "main.js"
      ]

Now we can create the AWS Lambda with `npm run create` and then do subsequent deploys with `npm run deploy`.

Do a `npm run create` now to create your application.

# Testing it out
Did you see the little `test` script in the `package.json`? That's a really cool way to test run our application.

Test the application by running `npm t` (a shortcut for `npm test` which is a shortcut for `npm run test`) to test our application.

If everything went well this would print out a nice little message about our AWS Lambda function being called and the response being:

    {"StatusCode":200,"Payload":"\"hello world\""}

# See the log
Ok, but what about the log? That was, of course, not printed in our console. That happened on the ... eh.... server? In our server-less architecture?

Well Claudia has, behind the scenes, done some nice configuration for you so that your log message ends up in something called [CloudWatch](https://console.aws.amazon.com/cloudwatch/home?region=us-east-1).

Head over there now and find the [Logs menu entry](https://console.aws.amazon.com/cloudwatch/home?region=us-east-1#logs:). Here's you'll find all the log files that you have created.

In that list you should see a entry for `/aws/lambda/hello-world`. Click it and then the `$LATEST` stream.

Presto! That's where you log ends up for the $LATEST staging (that Claudia also creates for you per default).

# Summary
A `console.log` statement in AWS Lambda do not really have a server whose console to log to... But using Claudia for your deployment will automatically hook your log statements into the CloudWatch utility of AWS.