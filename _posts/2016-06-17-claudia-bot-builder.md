---
layout: post
title: "Claudia bot builder - giving Skynet legs"
author: "Marcus Hammarberg"
date: 2016-06-04 20:59:58
tags:
 - Javascript
 - Tools
 - NodeJs
 - Claudia
---

I've written [a few](http://www.marcusoft.net/2016/04/claudia-some-updates-that-made-me-want-to-write-a-post.html) [posts](http://www.marcusoft.net/2016/02/first-aws-lamda-steps.html) on [Claudia](http://claudiajs.com/) now and as often I jumped almost too early on the boat - it turns out that there's significant improvements to both Claudia herself and the entire ecosystem around the main tool. 

The main tool Claudia: 

> automates and simplifies deployment workflows and error prone tasks, so you can focus on important problems and not have to worry about AWS service workflows

In this post I wanted to check out a new tool around Claudia that helps you to build bots  for use in chats - specifically for this post in Slack. 

AWS Lambda is really cool but it leaves one of those: `Oh wow… now what am I going to use this for?` feeling. It's just code that scale infinity without you having to worry about it. It's a very open playing field. 

<a name='more'></a>

## What we're going to build

To build something a little more useful than a HelloWorld (although they can [be fun too](https://github.com/claudiajs/claudia-bot-builder)) In this post we are going to build a little Slack Slash Command called pingu. The need came from my current team at work where we sometimes need a quick way of checking response-times for our sites. With pingu you can, in Slack, just go `/pingu http://www.marcusoft.net` and it will return you a message about how long it took to request that url. 

Let's rebuild that now. Step by step.

## Up and run

We're going to follow the instructions from the [Getting Started guide](https://github.com/claudiajs/claudia-bot-builder/blob/master/GETTING_STARTED.md) of the Claudia-bot-builder repository. There's some short administration first;

* Install [nvm](https://github.com/creationix/nvm) or something similar so that you can `nvm install v4.3.2` that Claudia-bot-builder requires (and AWS now supports)
* Intall ClaudiaJs globally (if you want to) for that version of Node `npm install claudia -g` or update it if it's already installed `npm update claudia -g`
* Set up an [AWS Account](http://www.marcusoft.net/2016/02/first-aws-lamda-steps.html#setting-up-your-environment) - yeah that's troublesome, but a one time thing. Hang in there. 
* And then some coding. 

Create a new directory called `pingu`, cd into it and then init a new git repository and a npm application. Here's one command to do all of that for you: 

```bash
mkdir pingu && cd pingu && git init . && npm init
```

Add a new file `bot.js` and enter the following code: 

```javascript
const botBuilder = require('claudia-bot-builder');
const co = require('co');
const coreq = require('co-request');

module.exports = botBuilder(request => {
    var url = request.text;

    return co(function*() {
        var start = new Date();
	    var result = yield coreq(url);
    	var end = new Date() - start;

        return `Pinged ${url} successfully - took ${end} ms`;
    }).catch(function(err) {
		return `Could not ping ${url} (${err.message})`;
    });
});
```

The `claudia-bot-builder` gives us a simple construct that receives the `request` object as single inparameter. From that we can read the `request.text` property which contains the text that the user sends us. In our case we will use a [Slack Slash Command](https://api.slack.com/) like this: `/pingu http://www.marcusoft.net`, and in that case `request.text` will be `http://www.marcusoft.net`. 

I'm using the [co-request](https://www.npmjs.com/package/co-request) module as to do simple http request, co-request allows me to use `yield` rather than the callback horrors that I've come to hate. 

There's some simple error handling in there as well. Good enough for now. 

To get all the dependencies we need into our application, and more importantly into the `package.json`, we can use this command: 

```
npm install claudia-bot-builder co co-request -S
```

That's the hard part done.

## Deploy to the cloud

Now for the part where Claudia excels. Deploying this is super simple: 

```
claudia create --region us-east-1 --api-module bot
```

Note that the region may have to be tweaked to suite the place where you have your account setup. Also note that if you've named your module something else than `bot.js` you will have to change the api-module name above. 

I've move this into a script in the `package.json` together with the update command we will use later:

```
"scripts": {
    "create": "claudia create --region us-east-1 --api-module bot",
    "deploy" : "claudia update"
 }
```

Which means that I can `npm run create` at the prompt now. Do that and Claudia goes off and does her thing. Look at that new and fancy status reports… 

After a few seconds you are done and Claudia spits out a nice little summary of what's been created in the as-needed-growing/scaling cloud (that part blows my mind really). Like this: 

```json
{
  "lambda": {
    "role": "pingu-executor",
    "name": "pingu",
    "region": "us-east-1"
  },
  "api": {
    "id": "vozc2ng03h",
    "module": "bot",
    "url": "https://vozc2ng03h.execute-api.us-east-1.amazonaws.com/latest",
    "deploy": {
      "facebook": "https://vozc2ng03h.execute-api.us-east-1.amazonaws.com/latest/facebook",
      "skype": "https://vozc2ng03h.execute-api.us-east-1.amazonaws.com/latest/skype",
      "telegram": "https://vozc2ng03h.execute-api.us-east-1.amazonaws.com/latest/telegram",
      "slackSlashCommand": "https://vozc2ng03h.execute-api.us-east-1.amazonaws.com/latest/slack/slash-command"
    }
  }
}
```

All see all those deployed functions that means that we could reach our little pingu bot from Skype, Facebook messenger, Telegram and Slack. We will use the last part, and hence will soon need that url.

### Testing

We could in fact that the setup is correct, by using the [testing feature of Claudia](http://www.marcusoft.net/2016/04/testing-with-claudia.html). 

Create a `testdata/basictest.json` file containing the following: 

```json
{
	"context" : {
		"path" : "/",
		"method" : "GET"
	}
}
```

Now add a new script: `"test" : "claudia test-lambda —event ./testdata/basicTest.json"` and then run `npm t` and the prompt. This will quite simply call our service to verify that everything is deployed correctly. Pretty neat.

## Hook up a Slack command

Ok, but that's not why we are here. Let's create a slack command. This is very straight-forward by following the description on the [Slack api-site](https://api.slack.com/). The thing you want to look for is called a ["custom slash command"](https://api.slack.com/slash-commands).

Actually finding where to create the command was a bit of a hassle for me, but this [link did the trick](https://my.slack.com/services/new/slash-commands). Make sure that you're logged into the correct team. 

From this part on it's just following the wizard. Here's a few pointers: 

* My command is called `/pingu’
* URL is the deploy-url that Claudia spit out for slack above (`"slackSlashCommand": "https://vozc2ng03h.execute-api.us-east-1.amazonaws.com/latest/slack/slash-command`).
  ​
  So that's `https://vozc2ng03h.execute-api.us-east-1.amazonaws.com/latest/slack/slash-command` in my case
* I left method as POST
* I customised the name to be `pingu` 
* I uploaded a, most likely trademark violated, picture for my command
* Finally I added a nice description and a usage hint

I then clicked Save integration. 

## Gluing them together

Now that just leaves one final thing - token-based authentication. Brrr… Luckily Claudia got us covered. 

Slack generated a *token* for us. In my case it was `0L6RSXRO0du6Ig6pM2X2Mx3D` (but I've changed it now…). 

Copy that token and then run the following command in the terminal: 

```bash
claudia update --configure-slack-slash-command 
```

Claudia will now redeploy the lambda function and at the end ask you input the token from Slack. 

To be honest it will ask you about your Client ID, Client Secret and a homepage url too. I do not really understand that, but think that it doesn't matter much for our integration. That's needed when you create a Slack application, which we don't have to for our little integration. Looking forward to be enlightened by astute readers in the common. 

## Test!

Once all of that is done you can now go to the Slack group for which you installed the command and run your beauty. 

![Pingu in Action](/img/pingu_in_action.png)

It works! Everyone in your team could now try it out by going `/pingu` in the Slack channel. You can also create [Slack-button to install](https://api.slack.com/docs/slack-button) it in other channels but I leave that as an exercise for others to try.  

## Summary

As always, when writing everything down it will be pretty long, but quite honestly it took me ca 15 minutes to get the first version of this command up and running the first time I tried it. 

A testimony to see this quick turnaround in action would be to change the command a bit. For example allow for a comma separated list. Think about how much time you spend writing your business logic and how little you spend on infrastructure and redeploys (`npm run deploy`). 

It just works.

My code can be [found here](https://github.com/marcusoftnet/pingu).