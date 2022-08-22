---
layout: post
title: Marcus Node Bit: Let''s talk about yield and
generators, shall we?'
date: 2014-04-01T09:00:00.000+02:00
author: Marcus Hammarberg
tags:
  - Node - Javascript
  - Tools - Koa
modified_time: 2014-04-06T14:41:45.558+02:00
blogger_id: tag:blogger.com,1999:blog-36533086.post-4757293937630995296
blogger_orig_url: http://www.marcusoft.net/2014/04/koaGenYield.html ---

<div dir="ltr" style="text-align: left;" trbidi="on">

<a href="http://www.koajs.com/" target="_blank">Koa Js</a> removes need
for callbacks but still have uses non-blocking code. How is that
possible?

If you read the code of the last blog post you might have reported a bug
or two since I was using a strange asterisk at in the
getGreeting-function. Is that really valid Javascript?

And when you looked very closely you might be wondering about the
"yield" right there in the middle... What kind of witchcraft is this
thing anyway?

These questions and more flew threw my head when I first learned about
Koa and the concepts its's built upon. In this post I will try to
explain that a bit and point you to other places where they explain this
much better, if you don't like my tries. This is just how I, a newbie to
these concepts, have tried to wrap my head around it. Hey, let's be
completely transparent and say that I have to relearn this just about
everyday.

It's really not that complicated once you understood it the first
time... Just like
<a href="http://en.wikipedia.org/wiki/Quantum_mechanics"
target="_blank">quantum mechanics</a>...

First, let me restate that the things we're
diving into now is bleeding edge stuff. It's proposed for the
<a href="http://wingolog.org/archives/2013/05/08/generators-in-v8"
target="_blank">EcmaScript 6 and is included in Googles V8 Javascript
engine</a>. You will need to tweak your environment in order to get this
a version of <a href="http://www.nodejs.org/" target="_blank">Node</a>
that can execute this.
<a href="http://www.marcusoft.net/2014/03/koaintro.html"
target="_blank">Read this for instructions</a>.

I have learned LOADS from this
<a href="http://tobyho.com/2013/06/16/what-are-generators/"
target="_blank">awesome article</a> by
<a href="https://twitter.com/airportyh" target="_blank">Toby Ho</a>.
Here I'm just writing down how I understood it. All credit for any good
stuff here goes to Toby. Any crap is probably from me.

### What is yield?

Now, on to the war... The first concept that tripped me a bit was <span
style="font-family: Courier New, Courier, monospace;">yield.  I
have not thought much about nor used <span
style="font-family: Courier New, Courier, monospace;">yield in
my mother-tongue, C#, that have had them for quite some time. Quite
simple it can be described with the following code:

This will just continue looping forever, so it's not very useful that
way. But look at line 3, we're not actually *returning* anything.
Instead we are *yielding* the result. I can't relate to that expression.
It simply doesn't mean(t) anything to mean. My mind just goes
".........".

But when I <a href="http://tobyho.com/2013/06/16/what-are-generators/"
target="_blank">understood that</a>:

> when the code encounters a yield statement, it suspends execution
> indefinitely, and doesn't start again until you tell it to

I was intrigued to say the least. Could this be used instead of <a
href="http://www.marcusoft.net/2014/03/javascript-callbacks-cant-live-with.html"
target="_blank">callbacks</a> when doing non-blocking, asynchronous
code? But how? Let's press on and see if that is the case.

#### Aha, but what is generators then?

Ok, but how can I use this then? Or in other words; how can I call this
loop? Let's wrap that loop in a function. Like this:

Please not the little asterisk at the function. This is how Javascript
denotes *generator functions* and I'll come back to that later. A
function becomes a generator function when you have at least one yield
in it. And you need to add the asterisk.

"Well, that pretty and everything, but how do we use that function
then?" you ask.
We have to create a instance of the generator function and then get the
*next* element in the sequence by calling ... <span
style="font-family: Courier New, Courier, monospace;">next().
Like this:


That was the quote about mean when it said: "... until you tell it to".
The code will halt at the yield until we tell it to continue, and we
tell it by calling <span
style="font-family: Courier New, Courier, monospace;">.next() on
the function instance.
To run this, remember that you have to call Node with the "--harmony"
flag, as described in
<a href="http://www.marcusoft.net/2014/03/koaintro.html"
target="_blank">my earlier post</a>. This is the command I used:

> <span style="font-family: Courier New, Courier, monospace;">node
> --harmony callingGenerator.js

Two things worth noting here. First, nothing happens until you
call <span
style="font-family: 'Courier New', Courier, monospace;">.next().The
loop in the generator is doing nothing in the meantime. Like a block of
code that waits for an asynchronous callback ^^.
Also it's worth noting that what we get back is a object with two
properties; *value* and *done* (true/false). The <span
style="font-family: Courier New, Courier, monospace;">done
parameter equals true when the sequence is over, as shown in this
example:


If you run that you will get <span
style="font-family: Courier New, Courier, monospace;">done ===
true for the fourth call to <span
style="font-family: Courier New, Courier, monospace;">.next()
(with the value === undefined). The fifth call throws an exception
("Generator has already finished").

Tying back to the heading of this section: a generator is simply a
function that represents a sequence of values. We saw examples of ending
and non ending sequences above. You can use the generator by creating a
generator object and call <span
style="font-family: Courier New, Courier, monospace;">next() to
get the next value.  It's like *iterating* through the return values of
the function.

### What use is this? And what's all this talk about Koa?

This is a mind-twister and interesting and all that... but use can we
have from this? Well, yield and generators is in fact the helping hand
that will draw us up from callback hell and put our feet back on solid,
well-tramped ground.

Did you notice the little passage about the asynchronous wait above? The
thing is, when yield is called the code is waiting for you to call
.next() to continue. For as long as that take. In the meantime Node can
do something else that is more important than waiting. You recognize
this? (Saved the fact that I wrote it above ^^). This is what <a
href="http://www.marcusoft.net/2014/03/javascript-callbacks-cant-live-with.html"
target="_blank">callbacks gives us</a>. Non blocking code. Sadly to the
cost of nesting and tightly coupled code, where you have to pass
parameters that the inner most code need.

Let's take a look at an example on
how <a href="http://www.koajs.com/" target="_blank">Koa Js</a> uses
this. This example is doing some very simple logging and really made the
usefulness of generators stand out for me. Start this simple site up and
then access it from the terminal with "<span
style="font-family: Courier New, Courier, monospace;">curl
http://localhost:3000 -v" so that you can see the headers
returned, and there you see the X-Response-Time reported. As well at the
console.


Let's see if we can break it down a bit. app.use() is how Koa defines
middleware. In this case the middleware is just two simple generator
functions. When the request comes in the following happens:

First, since it's defined first, the x-response-time generator function
is called. It get's hold of the current date and time and then *yields*
the passed in next variable. This is a Koa variable that indicates the
next middleware in line

So, we end up in the logger middleware. This generator function does the
same thing. Get hold of "now" and yields out the next middleware

-   There's no more middleware defined so we are taken to the response
    (for any route in this case) that always sets the body to "Hello
    world!"

When the response is created the execution is turned back to the logging
middleware that calculate the response time for this request and blurts
it out on the console

The x-response-time middleware does the same thing, but saves the result
into the header of the response. 

<div>

If you want to you could read the middleware code like this: "Get the
start time. Do whatever else you need to do. When that is done subtract
the current time from the start and save the result in the header". In a
easy to read, sequential fashion. No callbacks and long indention
chains. 

</div>

<div>
</div>

<div>

I like that. A lot. It's simple, short and easy to read and understand.
All the hard stuff about generators... Well we don't have to think so
much about that. Yield means: "do everything else you need to do at this
point". 

</div>

<div>

Here's another example where we store the data from a post into a
Mongo-database using
<a href="http://www.marcusoft.net/2014/02/mnb-monk.html"
target="_blank">Monk</a> via the coroutine library
<a href="https://www.npmjs.org/package/co-monk"
target="_blank">Co-Monk</a> (which is the simplest way to access MongoDb
with generators right now):

</div>


Again, using curl (why not?) we can now add a couple of users with the
following commands:

And then see the result with this:

> <span style="font-family: Courier New, Courier, monospace;">curl
> http://localhost:3000/user -v

Pretty short and sweet for adding user, if you ask me. More interesting,
let's go through the code.

First there's a couple of requires that bring in the things we are going
to use. The "lego" pieces in Koa is pretty small so there's usually at
least a couple of them.

Line 8-11 sees us set up
<a href="http://www.marcusoft.net/2014/02/mnb-monk.html"
target="_blank">Monk</a>, and use it with "mongodb generator goodness
for co" via <a href="https://www.npmjs.org/package/co-monk"
target="_blank">co-monk</a>. Man I love Monk. It's really sweet!

On line 14 and 15 we set up our routes and simple direct them to a
couple of generator functions that is found below. This is how Koa calls
out to other things.

In the create generator function (note the asterisk) we have two yields

-   first (line 21) we parse the body (with co-body) and if that should
    take time, for big file for example, we yield the response. Koa can
    let other execute in the meantime. Just like for a callback. But
    without the callback. 
-   secondly, on line 27, we store the object in mongo. And better yield
    there too since that might take time, or at least is IO. 
-   Did you see that try...catch. It's back baby! Error handling that
    feels reasonable. Structured exception handling I think it's called.
    The alternative is in other words ...  :)

In the list generator we just yield the result from our, very simple,
Mongo query. See line 38. 

Line 43 fires the whole thing up. 

### Conclusion

<div>

Around this point when I'm using Koa I always thing to myself... So
what's the deal with generators, what did that really give me? Its
actually pretty easy to forget and to me that is a good thing. Because I
just write the code like I would "normally" without callbacks. Feels
much more natural to me. And when I'm doing IO or Networking I remember
to yield to let Koa do other things. 

</div>

<div>
</div>

<div>

I have had GREAT use of a couple of articles to explain this to me. 

</div>

<div>

-   <a href="http://tobyho.com/2013/06/16/what-are-generators/"
    target="_blank">What Is This Thing Called Generators?</a> is
    **awesome** and a must read.
-   Two articles from Mozilla on the topic was interesting; <a
    href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Iterators_and_Generators"
    target="_blank">the first</a> was obsolete but had great examples.
    <a
    href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/function*"
    target="_blank">The second</a> is up to date but very short and ...
    left me wanting more. 
-   <a href="http://www.koajs.com/" target="_blank">KoaJs</a> own site
    has a couple of good examples

</div>

I want to thank all those resources and humbly point to them for more,
better and in-depth information. This is just my understanding, written
for me to remember. Because I have now forgot how this worked again, and
need to start over :)

My code is in those gists listed above or <a
href="https://github.com/marcusoftnet/KoaBlogPosts/tree/master/KoaFirstStumblingSteps"
target="_blank">here in a repo</a>.

I like Koa Js. I've written a couple of post about it. Here they will be
when they are published:

-   <a href="http://www.marcusoft.net/2014/03/koaintro.html"
    target="_blank">Let's talk about Koa for a while, shall we?</a>
-   Let's talk about yield and generators, shall we? (this post)
-   <a href="http://www.marcusoft.net/2014/04/koaExamples.html"
    target="_blank">Marcus Node Bits: Let's flex Koa Js, shall we?</a>

</div>
