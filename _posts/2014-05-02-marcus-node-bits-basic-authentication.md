---
layout: post
title: 'Marcus Node Bits: Basic Authentication with
Koa'
date: '2014-05-02T15:26:00.001+02:00'
author: Marcus Hammarberg
tags: - Javascript
   - Tools - Koa
modified_time: '2014-06-09T04:59:00.503+02:00'
thumbnail: http://lh5.ggpht.com/-fD9vojC0hwk/U2OczEnFGpI/AAAAAAAAC3w/u8pjXbXFELU/s72-c/wlEmoticon-sadsmile2.png?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-8966292886396606059
blogger_orig_url: http://www.marcusoft.net/2014/05/marcus-node-bits-basic-authentication.html
---


<div dir="ltr" style="text-align: left;" trbidi="on">

As
<a href="http://www.marcusoft.net/search/label/Koa" target="_blank">you
might know I have fallen in love</a> with
<a href="http://www.koajs.com/" target="_blank">Koa Js</a>. I have, from
experience, also come to realize that if you want to really understand a
framework or tool you need to build something real with it. In that
spirit I created a little voting site that we will in
<a href="http://www.marcusoft.net/search/label/Team%20Yayasan"
target="_blank">my current job</a>.
The whole application is simple; basically you can create a simple
question (poll maybe is a better word) that you want someone to answer.
“How did you enjoy your stay?” for example. There are then only 4 valid
answers (<img
src="http://lh5.ggpht.com/-fD9vojC0hwk/U2OczEnFGpI/AAAAAAAAC3w/u8pjXbXFELU/wlEmoticon-sadsmile2.png?imgmax=800"
class="wlEmoticon wlEmoticon-sadsmile"
style="border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none;"
alt="Sad smile" />, <img
src="http://lh4.ggpht.com/-gJrRHvCfWNA/U2Oc0FPwm3I/AAAAAAAAC34/YT51RJ8tQoE/wlEmoticon-disappointedsmile2.png?imgmax=800"
class="wlEmoticon wlEmoticon-disappointedsmile"
style="border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none;"
alt="Disappointed smile" />, <img
src="http://lh5.ggpht.com/-UtJG61pi-vQ/U2Oc1KsRAbI/AAAAAAAAC4A/w1zab5GW4sQ/wlEmoticon-smile2.png?imgmax=800"
class="wlEmoticon wlEmoticon-smile"
style="border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none;"
alt="Smile" /> and <img
src="http://lh5.ggpht.com/-riy09E1NzG0/U2Oc21nemoI/AAAAAAAAC4I/Zc2ofnE619I/wlEmoticon-openmouthedsmile2.png?imgmax=800"
class="wlEmoticon wlEmoticon-openmouthedsmile"
style="border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none;"
alt="Open-mouthed smile" />). The whole idea is that answering this is
just pushing a button on your way out. Like a physical Facebook
like-button. From this we can gather some simple, but interesting data
about what people thinks about the question asked.
However, soon I came to realize that I wanted to be able to add new
questions, or fix spelling errors etc. But since the site was open I
needed some sort of authentication to make sure that not everyone could
change this. I opted for the most basic I could think of. Hmmm Basic
Authentication.
Yes – I know that I could have done this with Twitter etc. but this was
just a simple thing. I would think that maybe some of you might use this
for internal applications etc.
In the <a href="https://github.com/koajs/koa/wiki#middleware"
target="_blank">rich Koa echo system</a> there’s support for
basic-authentication (<a href="http://www.npmjs.org/koa-basic-auth"
target="_blank">koa-basic-auth</a>) and this post describes how I set
that up. In doing so I learned a couple of things about Koa and how the
middleware works. It was interesting for me – I hope you enjoy it too.


## Basic Authentication

Let’s head up to the <a href="https://github.com/koajs/basic-auth"
target="_blank">koa-basic-auth code</a> and see what they have to say to
help us. I’ve created a gist of that code.


I had to read this a couple of times before I fully understood how it
goes together. This is how I understand it.
Line 23 is where we use the <span
style="font-family: Courier New;">auth</span> (that is required on
line 1) object and, in this case, simply hard code it to a user object.
The properties of this object needs to be <span
style="font-family: Courier New;">name</span> and <span
style="font-family: Courier New;">pass</span>.
On line 27 we find the complete application that simply returns a
string… A secret string… You need to be authenticated to see that.
Lines 7-19 is where this authentication is required. Here we create a
little middleware of our own. Did you see that little line in the
beginning of the example section of the README? “Password protect
downstream middleware”.  Remember that Koa is built up of tiny pieces of
middleware (often just a single function) that is stitched together. The
koa-basic-auth middleware passwords protects the middleware called after
it. This comes handy now.
The <span style="font-family: Courier New;">app.use()</span> is how
middleware is added to Koa. You probably seen <span
style="font-family: Courier New;">app.use(logger())</span> is you’ve
read any Koa-examples. The function on 7-9 takes a <span
style="font-family: Courier New;">next</span> variable as parameter,
which is Koa’s way of representing the next middleware to call in the
chain. We simply do your stuff in this middleware and then wait (using
<span style="font-family: Courier New;">yield</span>) for the rest of
the middleware chain. Or, as in this case, wraps the rest of the chain
with something.
This function wraps “the rest of the chain” with an error handler. Since
we are using koa-basic-auth (on line 23) to require authentication on
the complete site, all our requests will throw an 401 Unauthorized
error. We catch that (line 11) and creates a response that:

-   Set’s the status to 401
-   Writes a nice message to the body of the response
-   Set’s the header to
    <a href="http://en.wikipedia.org/wiki/Basic_access_authentication"
    target="_blank">WWW-Authenticate</a> that for most browsers (?)
    triggers the all familiar basic authentication log-in box.  

Yeah, that’s a pretty around about way of doing it you might think, but
it’s just a couple of lines of code that sets up this. I did, however
encapsulate this in another file resulting in this:


Which is the same thing but only exposes 2 lines (ah, well 4 if you
count the require-statement) in your app.js. A bit simpler. Hence
better, in my book.

## For parts of my site

About here I came to realize that this effectively meant that you had to
be logged in to vote. Obviously this was not good enough. Thanks to
<a href="https://github.com/koajs/basic-auth/issues/8"
target="_blank">some quick help from TJ</a> I soon realized the Koa-way
of doing this. You guessed it: “there’s a middleware for that” ©,™ & ®.
I’m hereby claiming the rights to that phrase. It will be a thing!
Ok, silliness aside; there’s another middleware called
<a href="https://www.npmjs.org/package/koa-mount"
target="_blank">koa-mount</a>, which mounts applications.

> Mount other Koa applications as middleware. The `path` passed to
> `mount()` is stripped from the URL temporarily until the stack
> unwinds. This is useful for creating entire apps or middleware that
> will function correctly regardless of which path segment(s) they
> should operate on.

Ah – that sounds about what we need. We want to mount the basic
authentication middleware for part of our application. Once I knew about
that it was almost trivial to append that to my application.
Here’s how it looks in my application right now using the same
authentication.js as above:


It was all about 2 new lines (9 and 10) that says which URLs that should
be password protected. And my reqBasic-middleware function is still
included on line 8.

## Configuration

It was at this point that I was about to commit this an push it to
GitHub. And I realize that the whole programming humanity (maybe not…)
would read the username and password, since it’s hard coded into my
code.
I also thought about testing (we come to that later) and publishing
this. And there was gnashing of teeth's. Because now I needed to have
this configurable, and to select the correct configuration for the
correct environment.
Luckily I had a configuration object in place already, for Mongo
parameters and other things, so I build from that. Here is how the
object ended up looking;

There’s quite a lot of stuff going on in there that really doesn’t have
with this post to do but let’s go through the highlights:

-   The last lines (28-30) is a function that simply exposes the object
    as a function. This is so that you can go <span
    style="font-family: Courier New;">var config =
    require(\[path\])(‘test’)</span> if you wanted to. Or it picks up
    the parameter from you starting node. And if nothing of that is
    supplied it defaults to ‘<span
    style="font-family: Courier New;">local</span>’, which is the name I
    used for my development environment.
-   The config object itself is, thankfully, a bit more straightforward.
    It sets up the different settings for the environments. However only
    one of them are returned by the function we just mentioned. Remember
    that JavaScript objects is just key-value pairs and you can index
    into the objects with strings. That is what that strange line is
    really doing (<span style="font-family: Courier New;">config\[mode
    \|\| process.argv\[2\] \|\| 'local'\]</span> would eventually be
    evaluated as <span
    style="font-family: Courier New;">config\[‘local’\]</span> for
    example).

Let’s talk a bit about the authentication parts also, sorry for that
longish detour;

-   Lines 3-5 sets up an object that either uses the
    <a href="http://nodejs.org/api/process.html#process_process_env"
    target="_blank">process.env</a> parameters <span
    style="font-family: Courier New;">BASIC_USER</span> and <span
    style="font-family: Courier New;">BASIC_PASS</span> or some default
    values. That object is stored in a <span
    style="font-family: Courier New;">adminUser</span> variable.
-   That variable is then slabbed onto the config-object, that I return,
    resulting in that I can use it like this in my authentication
    module:

> <span style="font-family: Courier New;">var config =
> require('../config')();
> module.exports.user = config.user;</span>

This means that if you have set anything in process.env.BASIC_USER that
will be used, if not ‘marcus’ will be used. You can pass the process <a
href="http://nodejs.org/docs/latest/api/process.html#process_process_argv"
target="_blank">environment variables as parameters to the node process
at your command prompt</a>.
In the development and testing case I will not set anything in those
variable and hence have a known state (marcus, koavote) to test against.
In the production environment however…

## On Heroku or other providers

.. you need to <a
href="http://nodejs.org/docs/latest/api/process.html#process_process_argv"
target="_blank">supply it as parameters to Node</a> as I wrote above.
You could do this by setting these parameters in the
<a href="http://www.marcusoft.net/2014/02/mnb-packagejson.html"
target="_blank">start script of your package.json</a> but that would
defeat our purpose of having to check in the username and password in
clear text.
[<img
src="http://lh3.ggpht.com/-KMNQGRHRPSg/U2Oc5eRWgwI/AAAAAAAAC4Y/zUZZwjjV8HM/settingConfigVars_thumb34.jpg?imgmax=800"
title="settingConfigVars" data-align="left" data-border="0"
style="background-image: none; border-bottom: 0px; border-left: 0px; border-right: 0px; border-top: 0px; display: inline; float: left; padding-left: 0px; padding-right: 0px; padding-top: 0px;"
width="278" height="76" alt="settingConfigVars" />](http://lh6.ggpht.com/-UlXqz1Ca3WU/U2Oc4nkE2wI/AAAAAAAAC4Q/8rDCUnukzto/s1600-h/settingConfigVars36.jpg)Most
providers provide (hihi) a way to set these process parameters in their
platform as a service configuration. For
<a href="http://www.heroku.com/" target="_blank">Heroku</a> (that I am
using) that looks like this and worked beautifully if it hadn’t been for
my own stupidity <a
href="https://github.com/marcusoftnet/koaVote/commit/abd3ba07720e54bb199d391fc9bec2f69f9bd48d"
target="_blank">where I had a typo in the production code</a>.
<a href="http://c2.com/cgi/wiki?TestEverythingThatCouldPossiblyBreak"
target="_blank">Test all the things that could possible break</a>!
So now I can set the username and password that I want to use in
production in the production environment and have another for testing
purposes. Speaking of testing…

## How do I test this?

Oh man, this grew long. Luckily the testing story is just beautiful,
using <a
href="https://www.blogger.com/www.marcusoft.net/2014/02/mnb-supertest.html"
target="_blank">Supertest</a>. I just pick up my testing-config object
and use those parameters to authenticate the Supertest request with.
Here’s is one test that does all that.


The interesting line here is line 12 where I use the <span
style="font-family: Courier New;">.auth()</span> function of supertest,
passing it the variables from my config user described above.

## Summary

I learned a lot from getting this to work. Much more than things about
authentication and doing the very basic password protection I first
wanted. Hmmm… there might be something in there…
<a href="http://theleanstartup.com/" target="_blank">You learn stuff by
pushing it out into production and starting to use it for real</a>. I
should write about that. Nah! It will never catch on.

</div>
