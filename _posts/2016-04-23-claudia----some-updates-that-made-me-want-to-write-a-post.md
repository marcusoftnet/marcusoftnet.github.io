---
layout: post
title: "Claudia 1.2 - some updates that made me want to write a post"
author: "Marcus Hammarberg"
date: 2016-04-23 11:42:02
tags:
 - JavaScript
 - Claudia
 - Tools
---

I downloaded a new markdown editor called [Typora](https://www.typora.io/) that looks amazing. Now I just wanted to try it out, and needed something to write about. 

Also I've noticed that [Claudia](https://github.com/claudiajs/claudia) has come out with some new releases and that [AWS Lamdba](http://docs.aws.amazon.com/lambda/latest/dg/current-supported-versions.html) now supports Node 4.3.2 - which is awesome. 

This post gave an opportunity to fix both itches above in one go. So this is an updated "Get started with Claudia JS for AWS Lambda"-post.

<a name='more'></a>

## Setting up AWS Lambda

This is very much like before, see my [previous post on the subject](http://www.marcusoft.net/2016/02/first-aws-lamda-steps.html#setting-up-your-environment)

## Get your nodes corrected

You might need to up/down-grade the version of Node that you are using. I like the [nvm](https://github.com/creationix/nvm) tool for this. Once install you can get the version of Node that AWS Lambda supports with: 

```
nvm install v4.3.2 
```

Just wait a second and you'll have the v.4.3.2 on your system. Sweet!

## Create our project

This is simple:

* Create a new directory called `helloClaudia1.2`
* `cd helloClaudia1.2`
* Do a `npm init` and accept all defaults in the wizard
* Install some dependencies for our demo:

  * claudia-api-builder that we will use to create a nice little web api`npm install claudia-api-builder -S`
  * [Claudia](http://npmjs.org/package/claudia) itself `npm install claudia --save-dev`
* Create our code file `touch index.js` 
* No need to tell Claudia which `"files"` to deploy, as you had to do before, but it could be a good idea to exclude the `claudia.json` in your `.gitignore` and `.npmignore` 


Open the `index.js` file and write the following simple code: 

```javascript
/* global require, module */
var ApiBuilder = require("claudia-api-builder");
var api = new ApiBuilder();

api.get("/hello/{name}", function (request) {
    return `Hello World! Haaaaave you met ${request.pathParams.name}?`;
});

module.exports = api;
```

Quite simple we will respond to `/hello/Marcus` with a nice little greeting. Did you notice the string interpolation there? Oh yeah - modern javascript, baby! 

## Deploying

Ok - time to release this little site. Open the `package.json` and add the following two scripts: 

```
"scripts": {
    "create": "claudia create --region us-west-2 --api-module index",
    "deploy" : "claudia update"
}
```

The first script is the one actually creating our little site in the AWS Lambda world; setting API gateways, configuring roles and all of that, which we want to forget - is the reason we're using Claudia in the first place.

Notice that we don't give our lambda function a name. That is picked up from the `package.json` and the `name` property. As long you're happy with that name you don't need to supply a `--name` flag to `claudia create`. You still can should you want to override the name, of course.

Let's run it now: `npm run create` and a few seconds later you'll see a nice little output stating that you have a new application in AWS. Here's the output, let's look a little closer: 

```
{
  "lambda": {
    "role": "helloworld12-executor",
    "name": "helloworld12",
    "region": "us-west-2"
  },
  "api": {
    "id": "7f0k8elirh",
    "module": "index",
    "url": "https://7f0k8elirh.execute-api.us-west-2.amazonaws.com/latest"
  }
}
```

It tells us what the role is called, the name of our function and the region we deployed it in. Also we get some very useful information about the API Gateway that Claudia has created for us. This is needed for us to actually be able to invoke the function over the internet. 

Checkout that last part in the end; there's a URL there. Paste it into a browser and [wah-wah-wah](http://www.sadtrombone.com/?autoplay=true), you forgot to add the `/hello/Marcus` part to the URL, like me - didn't you? Because that URL in the output is just the URL to the root of our API. 

Ok - let's fix it: `https://7f0k8elirh.execute-api.us-west-2.amazonaws.com/latest/hello/Marcus` 

YES! Alive!

## Redeploy

I just realize that there's a bug. A question mark is missing at the end of the string we return. Let's fix it: 

```
return `Hello World! Haaaaave you met ${request.pathParams.name}?`;
```

Save `index.js` and then redeploy the function with `npm run deploy`. How's the for continuous deployment? 

We now got some more detailed output from Claudia: 

```
{
  "FunctionName": "helloworld12",
  "FunctionArn": "arn:aws:lambda:us-west-2:430072528539:function:helloworld12:3",
  "Runtime": "nodejs4.3",
  "Role": "arn:aws:iam::430072528539:role/helloworld12-executor",
  "Handler": "index.router",
  "CodeSize": 7811,
  "Description": "",
  "Timeout": 3,
  "MemorySize": 128,
  "LastModified": "2016-04-23T16:34:56.773+0000",
  "CodeSha256": "uCGRZAovdXALf+fC9lhrCed+wDIkyioG25Nkj2qKR5I=",
  "Version": "3",
  "url": "https://7f0k8elirh.execute-api.us-west-2.amazonaws.com/latest"
}
```

This time Claudia knows a little bit more about the version, runtime we're running on, last time we modified the function etc.  

Reloading the URL proves that our function is updated.

## Testing

Testing this simple little function is probably easiest to do just with curl. Here's test script that I used: 

```
"test" : "curl https://7f0k8elirh.execute-api.us-west-2.amazonaws.com/latest/hello/marcus"
```

Now I can run a quick smoke-test by just going `npm t` .

## Summary

There's few nice additions in the output from Claudia that makes it feel more production ready. Also I seem to feel a significant improvement in performance and the overall speed. 

The new possiblities with the updated Node version is very nice too. 

And I like writing with [Typora](https://www.typora.io/) - check it out!