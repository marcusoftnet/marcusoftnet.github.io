---
layout: post
title: "Delayed responses with AWS Lambda and Claudia (Pingu part II)"
author: "Marcus Hammarberg"
date: 2016-08-04
tags:
 - Javascript
 - NodeJs
 - Claudia
---

Before the summer I showed you how to build a [Slack bot using Claudia](http://www.marcusoft.net/2016/06/claudia-bot-builder.html) - it's a very simple ping command that you could run from a Slack-client. However that implementation had a flaw; if the command takes more than 3 seconds to complete it fails. 

This has to do with a restriction in Slack that doesn't allow requests to take more than 3 seconds. I thought about how I could create a queued request and then ping back into Slack once the ping command returns. But I ran out of time figuring out. 

Which turned out to be a great thing, since the Claudia team not only created a new beautiful site [https://claudiajs.com/](https://claudiajs.com/) but also wrote a [tutorial on this exact topic](https://claudiajs.com/tutorials/slack-delayed-responses.html)

In this post I will re-implement [pingu](https://github.com/marcusoftnet/pingu) using a delayed response as in that tutorial.

<a name='more'></a>

# Getting started

The easiest way to get started is to clone my repo and start from the 1.1 tag. 

```d
git clone https://github.com/marcusoftnet/pingu.git && cd pingu && git checkout tags/1.1
```

Also, we will use the 1.6.0 version of [Claudia](http://npmjs.org/package/claudia) for this so be sure to update your installation: 

```
npm install claudia -g
or
npm upgrade claudia -g
```

You can, of course go through my [previous blog post](http://www.marcusoft.net/2016/06/claudia-bot-builder.html) to reach this point too. 

Now, we are ready to install the dependencies: `npm install` and, if you haven't done that you can create the service with `npm run create`. Make sure to check the `package.json` so that the settings for the `create` script matches your region etc. 

## Configuring a Slack command

Oh, you need to configure a Slack command too. [Read this](http://www.marcusoft.net/2016/06/claudia-bot-builder.html#hook-up-a-slack-command) - it's easy. 

# Where are we?

I've worked a little bit with the code from the blog post so that it's now a command like this: `/pingu [url1, url2]` that accept one or more urls (separated with commas) and returns a nicely formatted (ah, well…) response. 

We need to tweak this a bit so that we first return a simple acknowledgement and after awhile a list of answers.

## Responding to the first request

Just returning the response is simple, of course, but we are going to do one more thing; trigger a request to … we actually ourselves… 

The trick here (made simple with the later versions of [claudia-bot-builder](https://www.npmjs.com/package/claudia-bot-builder)) is to do a call back to ourselves. For the first request we just return a confirmation and then fire the second request that will do the delayed response once all the pinging is done. To call ourselves we will use the [aws-sdk](https://www.npmjs.com/package/aws-sdk) package, which is a package from the AWS team.

Here's the code to do that - I'm using the [tutorial](https://claudiajs.com/tutorials/slack-delayed-responses.html) as a template;

```javascript
'use strict';

const botBuilder = require('claudia-bot-builder');
const co = require('co');
const coreq = require('co-request');
const each = require('co-each');
const aws = require('aws-sdk');
const lambda = new aws.Lambda();

const api = botBuilder((message, apiRequest) => {

  return new Promise(
    (resolve, reject) => {
      lambda.invoke({
        FunctionName: apiRequest.lambdaContext.functionName,
        Qualifier: apiRequest.lambdaContext.functionVersion,
        InvocationType: 'Event',
        Payload: JSON.stringify({ slackEvent: message })
      },
      (err, done) => {
        if (err) return reject(err);
          resolve(done);
        }
      );
  }).then(() => {
    const noOfUrls = message.text.split(',').length;

    return {
      text: `Wait a sec. I'm pinging ${noOfUrls} urls`
    }
  }).catch(() => {
    return `Ok, something went wrong...`
  });
});
```

Oh, dear Lord. Those big promise-objects scares me… but it's not that hard really. It's just compact. Let's walk through it from the bottom up: 

* The final `catch`-block is just the response that we will return for exceptions
* Moving a bit up we have the `then` block that constructs the initial response

The main part is of course the big `Promise` that covers the entire method. It does two things basically; 

1. It calls ourself by using the lambda functionality of the `aws-sdk`. 
   * See the `const lambda = new aws.Lambda();` and later we are calling the lambda with `lambda.invoke`
   * This is accomplished by picking out the name, qualifier etc. by using the `apiRequest` object that `claudia-bot-builder` pass into our main function. That request object contains some context information found in the `lambdaContext`. For example the function name is retrieved like this: `apiRequest.lambdaContext.functionName`
   * We also set up some more data, like the `InvocationType` and  the `Payload` that is the data we will receive in the second function. We will simply just pass everything we got as parameter from slack (`message` parameter to the main function)
2. The second the parameter we set up some error handling that basically will make sure that we end up in the `.catch` part of the Promise, by rejecting or resolving the promise. 

Phew! That's a mouthful. And it's not over yet.

## Responding to the second request

Because the call 