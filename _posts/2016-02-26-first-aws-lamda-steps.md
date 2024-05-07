---
layout: post
title: "First AWS Lambda steps - using ClaudiaJs"
author: "Marcus Hammarberg"
date: 2016-02-29 12:52:28
tags:
 - Tools
 - Node
 - Claudia
---

First time I heard about [AWS Lambda](https://aws.amazon.com/lambda/) my mind was blown to pieces. Quite simply AWS Lambda gives you the opportunity to run a piece of code without concerning yourself about the infrastructure - AWS will handle deployment, configuration, scaling and all of that stuff. You just push your code.

That "just" in the last sentence proves to be quite a lot of grunt-work, sadly. That is, until you meet [ClaudiaJs](http://claudiajs.com); your [Node](https://nodejs.org/en/) flight attendant for AWS Lambda - ensuring a smooth flight to the clouds.

In this post I wanted to describe how I got started with Claudia and Lambdas. It will be loads of fun - let's get on it!

<!-- excerpt-end -->

# Getting off the ground with Claudia Js
<blockquote>Claudia helps you deploy Node.js micro services to Amazon Web Services easily. It automates and simplifies deployment workflows and error prone tasks, so you can focus on important problems and not have to worry about AWS service quirks.</blockquote>

I have to say, after just a day or two of working with Claudia, that it's a smooth ride. Many of the [things that it helps me](https://github.com/claudiajs/claudia/blob/master/README.md) with are things that I didn't know was a problem in the first place.

The command line interface is intuitive and the documentation is easy to follow. Don't miss the high paced [introduction movie](https://vimeo.com/156232471) for a whirlwind tour of the most basic features.

Also, luckily for us it's just a <code>npm</code> package that we can install, but don't do that just yet...

## Setting up your environment
AWS Lambda, for some reason, runs on an ancient version of Node. 0.10.36, released in January 2015.

Ok, that's a small thing to fix by using the [nvm tool](https://www.npmjs.com/package/nvm). Install this tool (<code>curl http://nvm-latest.herokuapp.com | bash</code>, for example) and then run the following command

```bash
nvm install v0.10.36
```

Great - now you can easily switch (<code>nvm use v0.10.36</code>) to this version of Node when you want to do Lambda development.

## Setting up AWS
You need an account for AWS of course. It's free to get started, just head over to [https://aws.amazon.com/](https://aws.amazon.com/) and create one now. I'll wait right here. It's a funky telephone-based authentication in the end that you'll find pretty cool.

Ok, great! Now set up a file with your [AWS credentials](https://console.aws.amazon.com/iam/home#security_credential) so that you don't have to write them over and over when you deploy your functions.

Create a credentials files in the <code>.aws</code> directory of your root, like this:

```bash
mkdir ~/.aws
touch ~/.aws/credentials
```

Open that file in your favorite editor (<code>sublime ~/.aws/credentials</code> for example) and add the following structure, using [your credentials](https://console.aws.amazon.com/iam/home#security_credential) of course:

```text
[default]
aws_access_key_id = <YEAH RIGHT>
aws_secret_access_key = <AS IF I'D TELL YOU ABOUT THESE>
```

## Install Claudia
Now we can install Claudia with the familiar command <code>npm install claudia -g</code>.

We are ready to code!

# Our first API
Let's get something up there!

Although you can run most any Node code in Lambda (i think ... that will be another post)  we are going to use another little Claudia helper - [claudia-api-builder](https://www.npmjs.com/package/claudia-api-builder).

This is NOT required to use Claudia, the Lambda deployment tool, but is very handy to quickly get an easy web API in place.

## Initialization
Create a new directory and do some init stuff:

```bash
mkdir aLittleGreeter
cd aLittleGreeter/
npm init
... enter through the wizard
touch index.js
npm install claudia-api-builder -S
```

## Ensure that our code gets deployed

Now open the <code>package.json</code> file and add a new <code>files</code> property with all your <code>*.js</code> files. Like this:

```bash
"files" : ["*.js"],
```

This ensures that the code we write (in <code>.js</code> files at least) gets deployed.

## Write a simple API

Here's the code for our API, I'll explain it below:

```javascript
/* global require, module */
var ApiBuilder = require("claudia-api-builder");
var api = new ApiBuilder();

api.get("/hello/{name}", function (request) {
    var name = request.pathParams.name;
    return "Hello World - meet " + name;
});

module.exports = api;
```

Quite simply this creates little api for us that will respond to GET request to <code>/hello</code>. We also expect another part of the URL that is the <code>{name}</code> to say hello to. This will be parsed using the <code>request.pathParams.name</code>-property.

At the end we simply return a string with the greeting. Simple stuff and a lot like [KoaJs](http://app.pluralsight.com/courses/javascript-koa-introduction), saved the cool generator stuff.

## Create it in the cloud
It's now time to use Claudia for to do some boring setup stuff for us. You can read about the <code>claudia</code> command by <code>claudia --help</code>.

We are now going to use <code>claudia create</code>, which will create a new lambda function for us, as well as creating an API in the ApiGateway.

Here's the command in full, I'll go through the parts below:

```bash
claudia create --name aLittleGreeter --region us-west-2 --api-module index
```

* The <code>--name</code> is the name that you will use to identify the API and the Lambda with. You'll see it all over the place as roles are prefixed etc.
* <code>--region</code> is the region where you will deploy your stuff to. [This page](http://docs.aws.amazon.com/general/latest/gr/rande.html) shows which services are available in which region
* <code>--api-module</code> is the name of the module that contains our api. In our case it's the <code>index.js</code> file.

I often put this into my <code>package.json</code> file under the <code>scripts</code> node:

```json
"scripts": {
    "claudia:create" : "claudia create --name aLittleGreeter --region us-west-2 --api-module index"
},
```

which means that users of my code can create the lambda using <code>npm run claudia:create</code>

Run that command now and wait until <code>claudia</code> finish her magic.

If everything went well, you'll see some nice output from <code>claudia</code> that ends like this:

```bash
{
    "lambda": {
            "role" : "aLittleGreeter-executor",
            "name":"aLittleGreeter",
            "region":"us-west-2"
        },
    "api" : {
        "id" : "mu2ptzrnc2",
        "module":"index"
    }
}
```

This is the content of the <code>claudia.json</code> that <code>claudia</code> created, which means that your service is created and waiting for you to access it.

## Running the lambda
Now that we are going to run this function in the cloud we will also start to realize how much work <code>claudia</code> made for us behind the scenes.

First open up the [AWS Console](https://console.aws.amazon.com/) (yes that screen is scary. Look away!) and go to the [API Gateway](https://console.aws.amazon.com/apigateway/home). Here's you'll find the first thing <code>claudia</code> did: created a API endpoint for us.

Click the "aLittleGreeter" link of your API and browse around a bit if you want. Or just click the <code>Resources</code> menu and select <code>Stages</code>. This is the next thing <code>claudia</code> did: created a stage called <code>latests</code> which is the endpoint where the latest version of your function will be.

Click the "latests" link and you'll can see a URL to your function: <code>https://mu2ptzrnc2.execute-api.us-west-2.amazonaws.com/latest</code> for example.

By accessing this URL we can call our function. Remember that our API responds to HTTP GET (<code>api.get</code>) and that we expect the URL to end in <code>"/hello/{name}"</code>.

Copy the URL and paste it in a browser (which issues GETs) and append <code>/hello/Marcus</code> (or your name if you want). The full URL for me is: <code>https://mu2ptzrnc2.execute-api.us-west-2.amazonaws.com/latest/hello/Marcus</code>.

If everything worked as planned you should see an epic message on the screen. You now have a little lambda in the cloud. Scaling to whatever traffic you send to it!

## Find your way
If you never used AWS before I can be quite overwhelming, so I thought I'll give you some nice pointers that can be useful. I know that it can be overwhelming since I was overwhelmed about 2 days ago... fresh learnings ahead!

* The API is managed at [https://console.aws.amazon.com/apigateway](https://console.aws.amazon.com/apigateway) and offers a lot of useful settings and tools, including a little testing feature where you can configure test request for your API.
* All the security stuff is handled at [https://console.aws.amazon.com/iam](https://console.aws.amazon.com/iam). For the most part you don't have to care about this, for simple stuff, but everything more advanced is security driven. You have very fine-grained control over the access to your services, should you need it.
* Finally the Lambda function itself is found at [https://console.aws.amazon.com/lambda](https://console.aws.amazon.com/lambda) which shows you all information about the code and the versions of it. There's even a real-time monitor for your function, although not as fancy as [Grafana](http://grafana.org/) still useful.

I suggest that you browse around those areas a bit since it's both pretty cool stuff and also useful to know what can be done.

## Gotchas!
Here's a few things that confused me when I got this simple example up and running.

### Create and update
If you are anything like me; you probably messed up somewhere in there. This means that you want to deploy again and hence run <code>npm run claudia:deploy</code> again.

[Wah-wah-wah](http://www.sadtrombone.com/?autoplay=true).

This fails, probably with something like:

```bash
Role with name aLittleGreeter-executor already exists.
```

Because <code>claudia create</code> is for the first time only. Cleaning up after a creation is, [for now](), not supported by <code>claudia</code>. Doing it manually requires:

* Removing the [IAM Role](https://console.aws.amazon.com/iam)
* Removing the [API Gateway](https://console.aws.amazon.com/apigateway)
* Removing the [Lambda function](https://console.aws.amazon.com/lambda)

What you'd want to do instead of <code>create</code> this again is to <code>claudia update</code>. That's the whole command since <code>claudia</code> will use the <code>claudia.json</code> file the creation step created.

I created a <code>package.json</code> script for it too:

```json
    "scripts": {
        "claudia:create" : "claudia create --name aLittleGreeter --region us-west-2 --api-module index",
        "claudia:update" : "claudia update"
    }
```

Now when you change your code you can simply push the new version with <code>npm run claudia:deploy</code>

### "Missing authentication token"
Another error that I spent some time trying to understand was this:

```json
{
    message: "Missing Authentication Token"
}
```

This happens if you use a faulty URL, for example forget to add the <code>/hello/marcus</code> part in the end.

What AWS is trying to say is that there is no endpoint at the URL. It just does it badly.

# For now
This post grew much longer than I first anticipated. I'll write another with something way cooler - us saving data in the AWS datastore - [DynamoDb](https://console.aws.amazon.com/dynamodb).

I hope you found this useful so far - see you in the next post.