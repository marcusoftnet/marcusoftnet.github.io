---
layout: post
title: 'Marcus Node Bits: Express is best without
generators'
date: '2014-02-07T14:00:00.000+01:00'
author: Marcus
Hammarberg
tags: - MobProgramming - Javascript
   - Tools
modified_time: '2014-06-02T10:56:52.524+02:00'
thumbnail: http://2.bp.blogspot.com/-1qNQ7SOosMg/UvDtzj8PjNI/AAAAAAAAB7M/gk0bNXl-\_E8/s72-c/Screen+Shot+2014-02-04+at+20.38.36+.png
blogger_id: tag:blogger.com,1999:blog-36533086.post-65862151838481954
blogger_orig_url: http://www.marcusoft.net/2014/02/mnb-express.html ---

<div dir="ltr" style="text-align: left;" trbidi="on">

I'm writing down some of the things I've picked up when I started to
learn
about <a href="http://nodejs.org/" target="_blank">Node</a>, <a href="http://expressjs.com/" target="_blank">Express</a> and <a href="http://www.mongodb.org/" target="_blank">Mongo</a>.
Here are all the post in the series:

-   <a href="http://www.marcusoft.net/2014/02/mnb-terminal.html"
    target="_blank">Doing stuff in the terminal is not scary at all</a>
-   <a href="http://www.marcusoft.net/2014/02/mnb-npm.html"
    target="_blank">npm is not only for getting packages</a>
-   <a href="http://www.marcusoft.net/2014/02/mnb-packagejson.html"
    target="_blank">Package.json is a mighty tool</a>
-   <a href="http://www.marcusoft.net/2014/02/mnb-git.html"
    target="_blank">Git is not that hard, but I need to refresh my
    knowledge</a>
-   <a href="http://www.marcusoft.net/2014/02/mnb-callbacks.html"
    target="_blank">Callback function is cool stuff, and I even know how to
    write them</a>
-   <span
    style="color: #0000ee; text-decoration: underline;"><a href="http://www.marcusoft.net/2014/02/mnb-mocha.html"
    target="_blank">mocha is cool both as framework and test runner</a></span>
-   <a href="http://www.marcusoft.net/2014/02/mnb-should.html"
    target="_blank">Should is a nice way to do asserts</a>
-   <a href="http://www.marcusoft.net/2014/02/mnb-monk.html"
    target="_blank">monk is an easy way to access mongo</a>
-   Express is best without generators - this post
-   <a href="http://www.marcusoft.net/2014/02/mnb-supertest.html"
    target="_blank">supertest is a nice way to test an api</a>

This post is about the most commonly used web framework in Node:
<a href="http://expressjs.com/" target="_blank">Express</a>.
<span
id="more"></span><a href="http://nodejs.org/" target="_blank">Node</a>
in itself is pretty cool and the three-line web server is mind blowing
at first sight. Pretty soon though you want something that is a bit
friendlier to code against. Most people seems to go
with <a href="http://expressjs.com/" target="_blank">Express</a>. From
their web page we read:

> Express is a minimal and flexible node.js web application framework,
> providing a robust set of features for building single and multi-page,
> and hybrid web applications.

Couldn't agree more. The only thing is... most tutorials on Express uses
the generators. That is the set of tools that comes with Express
(install with <span
style="font-family: Courier New, Courier, monospace;">npm install
express -g) </span><span style="font-family: inherit;">and you'll have
the generators all over. This site generator bothers me in two
ways:</span>

-   it sets up a complete site, when I just want to do an API
-   that site defaults to server-side generation, when I want to serve a
    static JavaScript client

<div>

Nowadays I tend to default to a simple backend API (see, I din't even
write REST API just to avoid religious battles. Smooth operator :)),
that just serve JSON and then a Javascript client that calls into that
API, using <a href="http://angularjs.org/" target="_blank">AngularJS</a>
for example. 

</div>

<div>

I don't need Jade, Sessions and folders for controllers etc. My whole
API will be 1-5 files depending on how modular I'm feeling. I might need
a public folder but that's easy enough to fix.

</div>

<div>



</div>

<div>

So my suggestion is that you ditch the
<a href="http://expressjs.com/guide.html#executable"
target="_blank">generators (powerful as they are)</a> and drop down to
bare-bones <a href="http://expressjs.com/" target="_blank">Express</a>. You'll
find a very powerful and terse framework that resembles
<a href="http://nancyfx.org/" target="_blank">NancyFx</a> a lot. Ah,
well it resembles
<a href="http://www.sinatrarb.com/" target="_blank">Sinatra</a> too, but
Nancy is cooler. 

</div>

<div>



</div>

<div>

In fact, on their <a href="http://expressjs.com/guide.html#executable"
target="_blank">guide-page</a>,
<a href="http://expressjs.com/" target="_blank">ExpressJs</a> is showing
you the minimal version first. And we can write the ubiquitous
fit-in-a-tweet-web application:

</div>



<div>

<div style="text-align: left;">

This little application just responds with "Hello World" when you access
it on [http://localhost:3000](http://localhost:3000/)

</div>

### Understanding Express

<div>

The API for Express is very easy and in fact there just a couple of
basic things that you need to know in order to start coding up an API.
Things are considerable easier when we're just dishing out JSON rather
than keeping creating a complete site.

As always this is just the things that I've used and get to know. You
should check out the
<a href="http://expressjs.com/api.html" target="_blank">API
documentation</a>, it's great. And the
<a href="http://expressjs.com/guide.html" target="_blank">starting
guide</a> is also nice.


</div>

<div>

First and formost you should create an Express application. This is
super simple since that's what the <span
style="font-family: Courier New, Courier, monospace;">express()</span>
function returns. Like this:

In the little tweet example above you saw the app.get() function in
action. The really good news is that all the HTTP verbs act in the same
manner. They take an URL path and a callback function. 

</div>



<div>

You can understand it as: "when somebody *Posts* to '/orders/', execute
this function that I'm writing here".

</div>

<div>



</div>

<div>

As I said the path parameter can contain parameters that we easily get
hold of via the <span
style="font-family: Courier New, Courier, monospace;"><a href="http://expressjs.com/api.html#req.params"
target="_blank">req.params</a> </span><span
style="font-family: inherit;">property</span>. Here's an example of a
get to an URL with a parameter, called id

</div>



<div>

Often your clients will be sending data in the body of the HTTP request.
Express provides an easy way to extract those by using the middleware
<span
style="font-family: Courier New, Courier, monospace;"><a href="http://expressjs.com/api.html#req.body"
target="_blank">bodyParser()</a></span> (see below). Which gives us this
easy way to access the body data

</div>

To this you can post a HTTP form like this (using the awesome
<a href="http://www.getpostman.com/" target="_blank">Postman extension
for Chrome</a>):

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://2.bp.blogspot.com/-1qNQ7SOosMg/UvDtzj8PjNI/AAAAAAAAB7M/gk0bNXl-_E8/s1600/Screen+Shot+2014-02-04+at+20.38.36+.png"
data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
src="http://2.bp.blogspot.com/-1qNQ7SOosMg/UvDtzj8PjNI/AAAAAAAAB7M/gk0bNXl-_E8/s1600/Screen+Shot+2014-02-04+at+20.38.36+.png"
data-border="0" width="640" height="328" /></a>

</div>



</div>

<div>

Sometimes, or rather after awhile, writing the functions inline gets a
bit messy. You can then write the handling code in a separate module and
include that. Express, default, puts these in a folder called "routes",
but we can do as we want.

</div>



<div>

Note that I'm using the <span
style="font-family: Courier New, Courier, monospace;">exports</span>-keyword
in the <span
style="font-family: Courier New, Courier, monospace;">userHandler.js</span>
file. That let's the function be visible to other modules. I used the
name <span
style="font-family: Courier New, Courier, monospace;">handler</span> as
a nod to a way we created frameworks in the 90-ies. Everything that we
really didn't know what to name was "handler". It should maybe have been
"controller" in this case...

</div>

<div>

You return data via the response-object that is passed to the callback
function for your route, often called <span
style="font-family: Courier New, Courier, monospace;">res </span>but you
can of course name it what ever you want. The simplest is just to do
send as we seen a lot of examples of already.


</div>

<div>

When you send JSON back there's a special method for that. The
content-type will automatically be set to "application/json" for you
when using this method as a nice little service to you. 

</div>



### Middleware

<div>

At the heart of Express is the Connect middleware. For the most part you
don't need to care about Connect since it's nicely exposed as a couple
of functions, but it's really how Express is stitched together.

We have already seen
the <a href="http://expressjs.com/api.html#req.body"
style="font-family: &#39;Courier New&#39;, Courier, monospace;"
target="_blank">bodyParser()</a> in action and here are few others that
I found useful:

#### basicAuth

<div style="text-align: left;">

<span
style="font-family: Courier New, Courier, monospace;"><a href="http://expressjs.com/api.html#basicAuth"
target="_blank">basicAuth()</a></span>- sets up basic authentication for
your site. As always, basic is sending the username and password in
clear text, so beware.

</div>



#### directory and static

<span
style="font-family: Courier New, Courier, monospace;"><a href="http://expressjs.com/api.html#directory"
target="_blank">directory()</a></span> - that helps you configure
directories, together with <span
style="font-family: Courier New, Courier, monospace;">static()</span> it
can help you to serve up static files; like your client side JavaScript
application for example

</div>



#### app.param() - an example of middleware, that is really powerful

<div>

The one middleware that impressed me the most, so far, is <span
style="font-family: Courier New, Courier, monospace;"><a href="http://expressjs.com/api.html#app.param"
target="_blank">app.param()</a></span>. This can help you do some really
powerful stuff, in just a few lines of code. To show this I'm going to
<a
href="http://webapplog.com/tutorial-node-js-and-mongodb-json-rest-api-server-with-mongoskin-and-express-js/"
target="_blank">lean on an example from this site</a> and walk your
through it:

</div>



<div>

You could also do hard coded paths, of course (like /users) and create a
little snippet that loads users by id. This is shown to great effect in
the documentation for <a href="http://expressjs.com/api.html#app.param"
style="font-family: &#39;Courier New&#39;, Courier, monospace;"
target="_blank">app.param()</a> and I've adapted it here:



### Conclusion

Yeah, as you can see express is not that hard and that the same time
powerful. Just like we like it. I think you get the know the framework
much better without the generators. Go old school and type it yourself!

</div>

</div>
