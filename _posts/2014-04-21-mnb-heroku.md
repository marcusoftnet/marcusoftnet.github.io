---
layout: post
title: Marcus Node Bits - Deploying to Heroku (and MongoHq)
date: 2014-04-21T14:02:00.000Z
author: Marcus Hammarberg
tags:
  - Node
  - Javascript
  - Tools
  - Koa
  - Lean
  - Agile
  - ContinuousDelivery
modified_time: 2014-05-29T12:22:24.020Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-6218298441525731501
blogger_orig_url: https://www.marcusoft.net/2014/04/mnb-heroku.html
---

I've been doing something for real! A very [simple little polling site](http://warm-brushlands-9555.herokuapp.com/), that actually turned out pretty ok (saved the UI but I have a friend brushing that up for me) and might be useful. It's built with [KoaJs](http://www.koajs.com/), of course, and using [MongoDb](http://mongodb.github.io/) as a database. Basically you can create a "question", tag it with some meta data and then send a link to a page where you can start receiving answers. And there's some very basic "export to excel"-reporting. Simple stuff. I spent maybe 3-5 hours altogether on it, in the hospital bed with my son in the bed next to me. He was pretty ok, so the concentration was not on top on either tasks for me. Bad!

This Sunday I wanted to deploy the first version of it. To [Heroku](http://www.heroku.com/). It went pretty smooth but I wanted to share my story and some problems I ran into.

For the most part I was impressed over the smoothness and "it just works"-factor throughout the deployment of my application. This [article is a great starting point](https://devcenter.heroku.com/articles/getting-started-with-nodejs) for NodeJs applications and I suggest you read it before you start.

### Setting up Heroku

First you of course need to sign up with [Heroku](http://www.heroku.com/), so go ahead and create an account there if you haven't already.
Locally you need something called the [Heroku tool belt](https://toolbelt.heroku.com/). It's an easy install from their site and then you can read this to get started. The tool belt is basically just a bunch of command line commands that are really powerful.

The first things you probably use the tool belt for are:

- `heroku login` - to authenticate with the Heroku-site credentials
- `heroku create [app name]` - create a Heroku application in a directory and on the Heroku site. And set up a nice link between them that is the real power of Heroku.
- `heroku keys:add` - add your ssh-keys to let Heroku know that you are you. [Read this](https://devcenter.heroku.com/articles/keys).

The last point was also my first gist. I'll soon come back to it. But I need to explain one more command that you need to know about:

- `git push heroku [branch]` - remember above where we created the application. This also sets up a [git remote](http://gitref.org/remotes/) for you, aptly named heroku. This is awesome because it means that we can move code to Heroku by a normal git push. If you're new to [git](https://www.marcusoft.net/2014/02/mnb-git.html), have a look here.

#### Error: git push heroku master -> Permission denied (publickey)

I was happy. Everything had gone so great. I had installed and run the Heroku tool belt command. They all worked like a charm. I even started to think that I knew what I was doing. Then I pushed to Heroku for the first time:

```bash
git push heroku master
Permission denied (publickey).
fatal: Could not read from remote repository.
Please make sure you have the correct access rights
```

This was strange. I had ssh-keys in place (if you have not, [read this article](https://devcenter.heroku.com/articles/keys)) since I was using GitHub that used ssh-keys too. But apparently Heroku wanted them to be in special files called "id_rsa" and "id_rsa.pub". I didn't have them. I had GitHub and GitHub.pub. Thank you [StackOverflow](http://stackoverflow.com/questions/17626944/heroku-permission-denied-publickey-fatal-could-not-read-from-remote-reposito).

#### package.json and the engine-node

Oh yeah... almost forgot. I'm of course using [KoaJs](https://www.marcusoft.net/2014/03/koaintro.html) for the app. I got tired of writing nested functions... As you remember Koa needs a version of Node that is later than the current version. You need to tell Heroku that you're planning to use another version of node also, otherwise it will use the latest stable version.

Luckily this is super simple. In your [package.json](https://www.marcusoft.net/2014/02/mnb-packagejson.html) file just define a node called "[engines](https://www.npmjs.org/doc/json.html#engines)" and give it the version of Node you're using. Like this:

```json
"engines": {
  "node": "0.11.12"
}
```

Thank you [Jonathan Channon](https://twitter.com/jchannon) for reminding me to write this. Tripped me up at first.

### MongoHq

Now I could push my code to Heroku. Great - but I needed a database as well. Luckily Heroku is built around modules that you add to your application. In Heroku-speak: addons that you provision. I choose [MongoHq](https://addons.heroku.com/mongohq) since I had heard that name before.

Installing the addon is super simple: `heroku addons:add mongohq`.

The addon is then added to your application on the Heroku site and configured as needed. But your are not using it in your application.

#### Getting it to work with your app

In order to use MongoHq in your application you need to get hold of the URL to the MongoDb database. The MongoHq addon exposes this through an environment variable which you can get hold of in Node by doing: `process.env.MONGOHQ_URL`.

You can see the settings for your application under <https://dashboard.heroku.com/apps/[your> application name]/settings.

Now, this poses a bit of a problem since you want to use your local MongoDb server when developing and the one in the cloud at MongoHq when you are running live. There's myriads of ways to solve this but I have dragged a little configuration utility around for a while. It's just a single file that exports an object with the configuration variables I need. Here is one incarnation of it:

The first lines set up my database connection strings, and use the MONGOHQ_URL if it is present

. I can then use my configuration object when I create my database object (in this case using [Monk](https://www.marcusoft.net/2014/02/mnb-monk.html)) like this:

```
var config = require('../config')();
var monk = require('monk');
var wrap = require('co-monk');
var db = monk(config.mongoUrl);
```

Ok, that worked just fine. Exceptionally actually. Because it just worked. MongoHq rocks!

### Problems and logging

Now I had everything installed. I pushed "the button" to Heroku and [Maw-maw-maw](http://sadtrombone.com/?play=true). I got a really strange error.

#### Error: Web process failed to bind to $PORT within 60 seconds of launch

When I opened my site (`heroku open` from the command prompt by the way) it just gave me a bland: the site is not working, contact your admin kind of message. Admin... hey that's me in this case. I should probably read some logs or something.

Reading logs at the prompt is actually quite simple, albeit a bit verbose in its output: `heroku logs` will flush the log before your eyes. If the log is really big you can do `heroku logs -n 1500` (last 1500 events) or `heroku logs -t` (100 last events).

But it's not very nice to read, nor searchable.

We [need better](https://www.marcusoft.net/2014/04/lookingForBetter.html). We need [Papertrail](https://addons.heroku.com/papertrail). Papertrail is a nice little addon that helps you read your log. Install it (`heroku addons:add papertrail`) and you get a dashboard for your app with a nice UI to see, read and search your logs.

With that in place the [Yak was shaved](http://www.hanselman.com/blog/YakShavingDefinedIllGetThatDoneAsSoonAsIShaveThisYak.aspx) and I could get back to trying to figure out why my site didn't show. There were two problems that hindered me:

1. I was using [Nodemon](https://github.com/remy/nodemon) to start my application. It was not in my dependencies. Bad Marcus! I added that and updated my `"npm start"` command to point to the nodemon in my `node_modules` directory (`"start": "./node_modules/nodemon/bin/nodemon.js --harmony app.js prod"`). If none of that made any sense to you, [read this first](https://www.marcusoft.net/2014/02/mnb-packagejson.html). [And then this](https://www.marcusoft.net/2014/02/mnb-npm.html).
2. I then ran into the "Web process failed to bind to $PORT within 60 seconds of launch" mentioned above. Let's talk more about that.

Heroku dynamically assigns your app a port, so you can't set the port to a fixed number. Heroku adds the port to the env, so you can pull it from there. Very much like the MONGOHQ_URL above. We need to use the environment variable set dynamically by Heroku in the production case and our local port in the local case. If you scroll back up you can see that I do that in my config-object (line 18), where set the port of my object to either the port from Heroku or a static one (`port: process.env.PORT || 5000`).

### Conclusion

There's always bumps in the road. These were mine. Overall I was still very impressed with the smooth ride to live site in production that Heroku and MongoHq treated me to.
