---
layout: post
title: 'Marcus Node Bits: Deploying to Heroku (and
MongoHq)'
date: '2014-04-21T16:02:00.000+02:00'
author: Marcus
Hammarberg
tags: - Node - Javascript
   - Tools - Koa - Lean - Agile -
ContinuousDelivery modified_time: '2014-05-29T14:22:24.020+02:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-6218298441525731501
blogger_orig_url: http://www.marcusoft.net/2014/04/mnb-heroku.html ---

<div dir="ltr" style="text-align: left;" trbidi="on">

I've been doing something for real! A very
<a href="http://warm-brushlands-9555.herokuapp.com/"
target="_blank">simple little polling site</a>, that actually turned out
pretty ok (saved the UI but I have a friend brushing that up for me) and
might be useful.
It's built with
<a href="http://www.koajs.com/" target="_blank">KoaJs</a>, of course,
and using
<a href="http://mongodb.github.io/" target="_blank">MongoDb</a> as
database. Basically you can create a "question", tag it with some meta
data and then send a link to a page where you can start receiving
answers. And there's some very basic "export to excel"-reporting. Simple
stuff. I spent maybe 3-5 hours altogether on it, in the hospital bed
with my son in the bed next to me. He was pretty ok, so the
concentration was not on top on either tasks for me. Bad!

This Sunday I wanted to deploy the first version of it. To
<a href="http://www.heroku.com/" target="_blank">Heroku</a>. It went
pretty smooth but I wanted to share my story and some problems I ran
into.



<div style="text-align: left;">

For the most part I was impressed over the smoothness and "it just
works"-factor throughout the deployment of my application.  This <a
href="https://devcenter.heroku.com/articles/getting-started-with-nodejs"
target="_blank">article is a great starting point</a> for NodeJs
applications and I suggest your read it before you start. 

</div>

### Setting up Heroku

First you of course need to sign up
with <a href="http://www.heroku.com/" target="_blank">Heroku</a>, so go
ahead and create an account there if you haven't already.
Locally you need something called the
<a href="https://toolbelt.heroku.com/" target="_blank">Heroku tool
belt</a>. It's an easy install from their site and then you can read
this to get started. The tool belt is basically just a bunch of command
line commands that is really powerful.

The first things you probably use the tool belt for is probably:

-   <span style="font-family: Courier New, Courier, monospace;">heroku
    login</span> - to authenticate with the Heroku-site credentials
-   <span style="font-family: Courier New, Courier, monospace;">heroku
    create \[appname\]</span> - create an Heroku application in a
    directory and on the Heroku site. And setup a nice link between them
    that is the real power of Heroku. 
-   <span style="font-family: Courier New, Courier, monospace;">heroku
    keys:add</span> - add your ssh-keys to let Heroku know that you are
    you. <a href="https://devcenter.heroku.com/articles/keys"
    target="_blank">Read this</a>.

The last point was also my first gist. I'll soon come back to it. But I
need to explain one more command that you need to know about:

-   <span style="font-family: Courier New, Courier, monospace;">git push
    heroku \[branch\]</span> - remember above where we created the
    application. This also sets up a
    <a href="http://gitref.org/remotes/" target="_blank">git remote</a>
    for you. Aptly named heroku. This is awesome because it means that
    we can move code to Heroku by a normal git push. If you're new to
    <a href="http://www.marcusoft.net/2014/02/mnb-git.html"
    target="_blank">git have a look here. </a>

#### Error: git push heroku master -\> Permission denied (publickey)

<div>

I was happy. Everything had gone so great. I had installed and run the
Heroku tool belt command. They all worked like a charm. I even started
to think that I knew what I was doing. Then I pushed to Heroku for the
first time:

</div>

> <span style="font-family: Courier New, Courier, monospace;">git push
> heroku master
> Permission denied (publickey).
> fatal: Could not read from remote repository.
> Please make sure you have the correct access rights</span>

This was strange. I had ssh-keys in place (if you have not,
<a href="https://devcenter.heroku.com/articles/keys"
target="_blank">read this article</a>) since I was using GitHub that
used ssh-keys too. But apparently Heroku wanted them to be in special
files called "id_rsa" and "id_rsa.pub". I didn't have them. I had GitHub
and GitHub.pub. Thank you <a
href="http://stackoverflow.com/questions/17626944/heroku-permission-denied-publickey-fatal-could-not-read-from-remote-reposito"
target="_blank">StackOverflow</a>.

#### package.json and the engine-node

<div>

Oh yeah... almost forgot. I'm of course using
<a href="http://www.marcusoft.net/2014/03/koaintro.html"
target="_blank">KoaJs</a> for the app. I got tired of writing nested
functions... As you remember Koa needs a version of Node that is later
than the current version. You need to tell Heroku that you're planning
to use another version of node also, otherwise it will use the latest
stable version.

</div>

<div>



</div>

<div>

Luckily this is super simple. In you
[package.json](http://www.marcusoft.net/2014/02/mnb-packagejson.html) file
just define a node called
"<a href="https://www.npmjs.org/doc/json.html#engines"
target="_blank">engines</a>" and give it the version of Node you're
using. Like this:

</div>

<div>

> <span style="font-family: Courier New, Courier, monospace;">"engines":
> {
>     "node": "0.11.12"
> }</span>

</div>

<div style="text-align: left;">

Thank you [Jonathan Channon](https://twitter.com/jchannon) for reminding
me to write this. Tripped me up at first. 

</div>

### MongoHq

<div>

Now I could push my code to Heroku. Great - but I needed a database as
well. Luckily Heroku is built around modules that you add to your
application. In Heroku-speak: addons that you provision. I choose
<a href="https://addons.heroku.com/mongohq" target="_blank">MongoHq</a>
since I had heard that name before. 

</div>

<div>



</div>

<div>

Installing the addon is super simple: <span
style="font-family: Courier New, Courier, monospace;">heroku addons:add
mongohq</span>

</div>

<div style="text-align: left;">

The addon is then added to your application on the Heroku site and
configured as needed. But your are not using it in your application. 

</div>

#### Getting it to work with your app

<div>

In order to use MongoHq in your application you need to get hold of the
URL to the MongoDb database. The MongoHq addon exposes this through
a environment variable which you can get hold of in Node by doing:
"<span
style="font-family: Courier New, Courier, monospace;">process.env.MONGOHQ_URL</span>".

</div>

<div>

You can see the settings for you application
under https://dashboard.heroku.com/apps/\[your application
name\]/settings.

</div>

<div>



</div>

<div>

Now, this poses a bit of a problem since you want to use your local
MongoDb server when developing and the one in the cloud at MongoHq when
you are running live. There's myriads of ways to solve this but I have
dragged a little configuration utility around for a while. It's just a
single file that exports an object with the configuration variables I
need. Here is one incarnation of it:

</div>

<div>

</div>

<div>

The first lines sets up my database connection strings, and uses the
MONGOHQ_URL if it is present. I can then use my configuration object
when I create my database object (in this case using
<a href="http://www.marcusoft.net/2014/02/mnb-monk.html"
target="_blank">Monk</a>) like this:

> <span style="font-family: Courier New, Courier, monospace;">var config
> = require('../config')();
> var monk = require('monk');
> var wrap = require('co-monk');
> var db = monk(config.mongoUrl);</span>

</div>

<div>

Ok, that worked just fine. Exceptionally actually. Because it just
worked. MongoHq rocks!

</div>

### Problems and logging

<div>

Now I hade everything installed. I pushed "the button" to Heroku and
<a href="http://sadtrombone.com/?play=true"
target="_blank">Maw-maw-maw</a>. I got a really strange error.

</div>

#### Error: Web process failed to bind to $PORT within 60 seconds of launch

<div>

When I opened my site (<span
style="font-family: Courier New, Courier, monospace;">heroku open</span>
form the command prompt by the way) it just gave me a bland: the site is
not working, contact your admin kind of message. Admin... hey that's me
in this case. I should probably read some logs or something. 

</div>

<div style="text-align: left;">



</div>

<div style="text-align: left;">

Reading logs at the prompt is actually quite simple, albeit a bit
verbose in it's output: <span
style="font-family: Courier New, Courier, monospace;">heroku logs
</span>will flush the log before you eyes.  If the log is really big you
can do "<span
style="font-family: Courier New, Courier, monospace;">heroku logs -n
1500</span>" (last 1500 events) or "<span
style="font-family: Courier New, Courier, monospace;">heroku logs
-t</span>" (100 last events). 

</div>

<div>

But it's not very nice to read, nor searchable. 

</div>

<div>



</div>

<div>

We <a href="http://www.marcusoft.net/2014/04/lookingForBetter.html"
target="_blank">need better</a>. We need
<a href="https://addons.heroku.com/papertrail"
target="_blank">Papertrail</a>. Papertrail is a nice little addon that
helps you read your log. Install it (<span
style="font-family: Courier New, Courier, monospace;">heroku addons:add
papertrail</span>) and you get a dashboard for you app with a nice UI to
see, read and search your logs. 

</div>

<div>



</div>

<div>

With that in place the <a
href="http://www.hanselman.com/blog/YakShavingDefinedIllGetThatDoneAsSoonAsIShaveThisYak.aspx"
target="_blank">Yak was shaved</a> and I could get back to trying to
figure out why my site didn't show. There were two problems that
hindered me:

</div>

<div>

1.  I was using
    <a href="https://github.com/remy/nodemon" target="_blank">Nodemon</a>
    to start my application. It was not in my dependencies. Bad Marcus!
    I added that and updated my "<span
    style="font-family: Courier New, Courier, monospace;">npm
    start</span>" command to point to the nodemon in my
    node_modules-directory (<span
    style="font-family: Courier New, Courier, monospace;">"start":
    "./node_modules/nodemon/bin/nodemon.js --harmony app.js
    prod"</span>).
    If nothing of that made any sense to you
    <a href="http://www.marcusoft.net/2014/02/mnb-packagejson.html"
    target="_blank">read this first</a>.
    <a href="http://www.marcusoft.net/2014/02/mnb-npm.html"
    target="_blank">And then this</a>.
2.  I then ran into the "Web process failed to bind to $PORT within 60
    seconds of launch" mentioned above. Let's talk more about that. 

<div>

Heroku dynamically assigns your app a port, so you can't set the port to
a fixed number. Heroku adds the port to the env, so you can pull it from
there. Very much like the MONGOHQ_URL above. We need to use the
environment variable set dynamically by Heroku in the production case
and our local port in the local case. If you scroll back up you can see
that I do that in my config-object (line 18), where set the port of my
object to either the port from Heroku or a static one (<span
style="font-family: Courier New, Courier, monospace;">port:
process.env.PORT \|\| 5000,</span>)

</div>

### Conclusion

</div>

<div>

There's always bumps in the road. These were mine. Overall I was still
very impressed with the smooth ride to live site in production that
Heroku and MongoHq treated me to. 

</div>

</div>
