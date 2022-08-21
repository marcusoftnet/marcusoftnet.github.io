---
layout: post
title: 'Javascript callbacks: can''t live with them
can''t live without them... or can you? '
date: '2014-03-06T08:00:00.000+01:00'
author: Marcus Hammarberg
tags:
  - MobProgramming - Javascript
  - Tools
modified_time: '2014-06-02T10:56:52.519+02:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-5949303220137372164
blogger_orig_url: http://www.marcusoft.net/2014/03/javascript-callbacks-cant-live-with.html
---


<div dir="ltr" style="text-align: left;" trbidi="on">

This is a confession post. Yes,
<a href="http://www.hanselman.com/blog/ImAPhonyAreYou.aspx"
target="_blank">I'm a phony too</a>. I pick up some things very late.
Like JavaScript. And Node and ... well a lot of things.

But I'm sure that a lot of people have run into this and maybe, just
maybe, there will be some others that haven't run into it yet. So this
might help someone. Or me, for that matter, when I come back to this
problem later.

It has to do with callbacks. The things that Node is made up of. And how
they confused me a lot. And how I grew to love them, then hate them, and
finally get them. And right about that point realize that there's
another way.

Let's see if I can explain this. Just as an experiment.

Everything in node is event-driven (as from their
mission statement on
<a href="http://nodejs.org/" target="_blank">the homepage</a>) and
non-blocking. Which means that you see a lot of code like this in
Node:


One time when this really shines in testing with
<a href="http://visionmedia.github.io/mocha/" target="_blank">Mocha</a>
for example. Here's a bit of Mocha for you:


Let's talk through this (only focus on the testingConfig.js file in this
case):

Line 3 starts the <span
style="font-family: Courier New, Courier, monospace;">describe-function.
This function takes a string and a callback function.

-   Mocha will call all the describe-functions in your file one by one,
    and when it does that it will fire the anonymous function (line
    4-9).

Line 4 calls the <span
style="font-family: Courier New, Courier, monospace;">it-function.
Which takes a string (description) and a callback function.   

-   For each describe-function Mocha will call the it-functions in it
    and the anonymous function we have created on line 5-7. 
-   Note the parameter to this callback function (<span
    style="font-family: 'Courier New', Courier, monospace;">done())

The it-function contains our assertions and is then finished by calling
<span
style="font-family: Courier New, Courier, monospace;">done()

-   <span style="font-family: inherit;">The done-function is used to
    signal the end of our test. More about that later. 

### How not to Node

Now to the problem that I've run into more times than I care think
about. Let's say that I want to return something from my function. Like
this API that I started out doing a couple of days back:

> <span style="font-family: Courier New, Courier, monospace;">var post =
> getPostById(id);

Now that's just wrong. It's not the Node way and you'll get into trouble
if you try to pursue that path. So let's do that and see what happens.
In my case I used Mongoose to access the database, hence building a data
access layer. But since everything (!) in Node is non-blocking you'll
likely run into similar problems no matter what you try.
Ok so I wrote this code in my method:


But I ended up returning <span
style="font-family: Courier New, Courier, monospace;">undefined.
Every time. I couldn't understand why.
This is my understanding of it:

-   When I call Post.find() I supply an anonymous function
-   This function is called asynchronously by Mongoose when the data is
    returned from the database
-   Which bascially means that on line 5-15 I'm just declaring what is
    going to happen when we execute the query. It's not executed right
    away. 
-   So the code after the anonymous function (line 5-15) can be executed
    before the anonymous code. Or not. 
-   Which means that there's no value to return when we get to line 18. 

The idea of waiting (with a thread.sleep() equivalent) just made me
smiled. In a tiered way. There's something wrong here.

### How to Node

That's not how you should do it. It's wrong on the API level already.
Instead it looks something like this:

<div style="text-align: left;">

> <span
> style="font-family: 'Courier New', Courier, monospace;">getPostById(id,
> callback);

</div>

<div style="text-align: left;">

With this implementation:


This is basically just pushing the problem upwards, if you like. You're
caller will also supply a callback and you call that. It's nice and
clean, and also allows for Node to continue to operate in a non-blocking
way. 

</div>

<div style="text-align: left;">



</div>

<div style="text-align: left;">

But... where does it end? Someone need to hold on to the whole chain and
wait for all the callbacks to execute? At this point my mind was
spinning.

Let's see what happens when someone tries to use this. First a test:

</div>



<div style="text-align: left;">

When can see that we're nesting the callbacks and in the innermost
callback we'll call out to <span
style="font-family: Courier New, Courier, monospace;">done();
That function had me wondering when i started to do mocha testing. But
now I understand. It will wait there until all the callbacks has
completed. From the
<a href="http://visionmedia.github.io/mocha/" target="_blank">Mocha
documentation</a>:

</div>

> By adding a callback (usually named done) to it() Mocha will know that
> it should wait for completion.

Ok, that was testing. But in the real deal world then. This is how we
ended up using it with sockets in Node.
src="https://gist.github.com/marcusoftnet/9366464.js"\>

Sockets is the sockets from Node and hence is non-blocking. So the <span
style="font-family: Courier New, Courier, monospace;">socket.on()
takes a string and a function. This function is called when someone
calls the socket with the string ("post" in our example). We then call
the <span
style="font-family: Courier New, Courier, monospace;">createPost
method that takes a ... callback, you guessed it. And it calls into the
data access layer which takes callbacks and ...
Finally all the callbacks has returned (and Node has done other things
in the background which leads to it's awesome scalabilities) and we're
back up in <span
style="font-family: Courier New, Courier, monospace;">createPost-anonymous
callback block. We call broadcast an emit with "postAdded" and the post
that was returned and we're done handling the callback block for <span
style="font-family: Courier New, Courier, monospace;">socket.on("post")

Yeah, I needed some oxygen to when I tried to follow that. This is cool
and everything, but there must be a easier way. Now doesn't it?

### How to promise instead

<div>

Promises! The mirage in the callback-desert. The wonderful sunrise that
brings tears in the eyes of every Javascript developers. The thing that
I don't use and haven't understood yet. Not completely at least. 

</div>

<div>

But I can show you this from the
<a href="https://github.com/kriskowal/q" target="_blank">promise library
Q's site</a>:

</div>

<div>

</div>

<div>

I cannot, sadly, explain what's going on there fully. But I can see that
it's better, easier and clearer.
That's enough for me to want to dive in and try to learn it. Promise
(pun intended) to get back to you on that. 

</div>

</div>
