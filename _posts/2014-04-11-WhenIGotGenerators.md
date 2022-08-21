---
layout: post
title: 'KoaJs and the "SyntaxError: Unexpected
identifier" error - or "that time when I understood generators"' date: '2014-04-11T16:43:00.001+02:00'
author: Marcus Hammarberg
tags: -
Javascript - Koa modified_time: '2014-04-11T17:19:56.787+02:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-4774542661205622224
blogger_orig_url: http://www.marcusoft.net/2014/04/WhenIGotGenerators.html ---

<div dir="ltr" style="text-align: left;" trbidi="on">

It was quite sometime since I wrote a blog post with an error message in
the title. However I have now got this error so many times, and keep
scratching my head every time. Also I think I can explain why it
happens.


Here's an example on how to make this error occur, from the co-monk
library <a href="https://github.com/visionmedia/co-monk/pull/4"
target="_blank">README (not anymore maybe</a>):



<div>

Running that code (either with "<span
style="font-family: Courier New, Courier, monospace;">node --harmony
koaErrorFail.js</span>" or test it with "<span
style="font-family: Courier New, Courier, monospace;">mocha
--harmony-generators koaErrorFail.js</span>") fail with the error from
the title of the blog post:

> <div class="p1">
>
> <span style="font-family: Courier New, Courier, monospace;">yield
> users.remove({});</span>
>
> </div>
>
> <div class="p1">
>
> <span style="font-family: Courier New, Courier, monospace;">     
> ^^^^^</span>
>
> </div>
>
> <div class="p1">
>
> <span
> style="font-family: Courier New, Courier, monospace;">SyntaxError:
> Unexpected identifier</span>
>
> </div>

At this point you start to think that you forgot to run the example with
the <a href="http://www.marcusoft.net/2014/03/koaintro.html"
target="_blank">"<span
style="font-family: Courier New, Courier, monospace;">--harmony</span>"
flag</a>. But of course you do that, right?
Ah, maybe you are running the
<a href="http://www.marcusoft.net/2014/03/koaintro.html"
target="_blank">wrong version of Node</a>. Again, no. You're doing it
right. Right?

However this code is not running within a generator function. And the
keyword "<span
style="font-family: Courier New, Courier, monospace;">yield</span>" is
just allowed within a generator function. In fact, to my understanding,
a function is a generator function if it has an asterisk before the name
of the function and one or more "<span
style="font-family: 'Courier New', Courier, monospace;">yield</span>"s
within the function.

But we want to say "<span
style="font-family: 'Courier New', Courier, monospace;">yield</span>".
The <span
style="font-family: 'Courier New', Courier, monospace;">yield </span>is
good. It's what helps us get non-blocking code. You are basically
telling node to do something else while we wait for this operations.
Like <a
href="http://www.marcusoft.net/2014/03/javascript-callbacks-cant-live-with.html"
target="_blank">callbacks</a> but without yuck.
But there has to be a generator function around it. And someone to drive
the generator for us. I mean that can keep track on where we were when
we waited for the next yield.There's has to be *someone* that takes care
of this
"<a href="https://www.npmjs.org/package/co" target="_blank">generator
async flow control goodness</a>". Someone greater than us. Someone like
<a href="https://www.npmjs.org/package/co" target="_blank">co</a>.

Co is a neat little library that lets you
<a href="https://github.com/visionmedia/co" target="_blank">"write
non-blocking code in a nice-ish way"</a>. That's all very complicated if
you ask me. But let's show how this co could be used to help us fix the
error we ran into before:


Here we can see that the code, from our failing example is wrapped in a
generator function (note the asterisk). This (anonymous) generator
function is then passed to
the <a href="https://www.npmjs.org/package/co" target="_blank">co</a>-library
constructor function. Finally we also invoke the function that
co-returns, right away, hence the "<span
style="font-family: Courier New, Courier, monospace;">)();" </span><span
style="font-family: inherit;">on l<span
style="font-family: inherit;">ine 20</span>. </span>

### Summary and hat tipping

</div>

<div>

I would not have grasped this
<a href="http://zef.me/6096/callback-free-harmonious-node-js"
target="_blank">without this awesome article</a> by
<a href="https://twitter.com/zef" target="_blank">Zef</a>. Not only did
he write that article but he also helped me when I
<a href="https://twitter.com/marcusoftnet/statuses/454620650410237952"
target="_blank">reached out to him on Twitter</a>. Thank you mr Zef, my
hat is tipped towards you. Loudly (?) 

</div>

<div>



</div>

<div>

Summing up the problem would be something like this:

</div>

<div>

-   The "<span
    style="font-family: Courier New, Courier, monospace;">Unexpected
    identifier</span>" is not really <span
    style="font-family: Courier New, Courier, monospace;">users</span>
    (in my example), but rather that <span
    style="font-family: Courier New, Courier, monospace;">yield</span>
    is not valid outside a generator function. 
-   We can create an anonymous generator function by wrapping the code
    in "<span
    style="font-family: Courier New, Courier, monospace;">function \*(){
    // code }</span>"
-   Only problem left, is that we need someone that calls and drives
    through that function for us, continuing after a <span
    style="font-family: 'Courier New', Courier, monospace;">yield</span> is
    reached for example. That could
    be <a href="https://www.npmjs.org/package/co" target="_blank">co</a>,
    for example.  
-   The co constructor takes a generator function as parameter making
    our entire wrapping for this into "<span
    style="font-family: Courier New, Courier, monospace;">co(function
    \*(){// code})();</span>"

<div>

I can now find eternal peace. I will probably never be able to explain
this again, but then I can come back to this post and "the time I
understood generators". 

</div>

</div>

</div>
