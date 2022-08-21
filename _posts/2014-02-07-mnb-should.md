---
layout: post
title: 'Marcus Node Bits: Should is a nice way to do
asserts'
date: '2014-02-07T08:00:00.000+01:00'
author: Marcus Hammarberg
tags:
  - MobProgramming - Javascript - BDD
  - Tools - TDD
modified_time: '2014-06-02T10:56:52.516+02:00'
thumbnail: http://3.bp.blogspot.com/-ONHsrONjpi4/Uu4xMOWdH1I/AAAAAAAAB6U/XmOgOFUgBvE/s72-c/Screen+Shot+2014-02-01+at+20.05.01+.png
blogger_id: tag:blogger.com,1999:blog-36533086.post-5065072872368802136
blogger_orig_url: http://www.marcusoft.net/2014/02/mnb-should.html ---

<div dir="ltr" style="text-align: left;" trbidi="on">

I'm writing down some of the things I've picked up when I started to
learn about <a href="http://nodejs.org/" target="_blank">Node</a>,
<a href="http://expressjs.com/" target="_blank">Express</a> and
<a href="http://www.mongodb.org/" target="_blank">Mongo</a>. Here are
all the post in the series:

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
    target="_blank">mocha is cool both as framework and test runner</a>
-   Should is a nice way to do asserts - this post 
-   <a href="http://www.marcusoft.net/2014/02/mnb-monk.html"
    target="_blank">monk is an easy way to access mongo</a>
-   <a href="http://www.marcusoft.net/2014/02/mnb-express.html"
    target="_blank">Express is best without generators</a>
-   <a href="http://www.marcusoft.net/2014/02/mnb-supertest.html"
    target="_blank">supertest is a nice way to test an api</a>

This post is about an assertion framework that I've come to love;
<a href="https://github.com/visionmedia/should.js/"
target="_blank">should.js</a>.

The thing with most
<a href="http://nodejs.org/" target="_blank">Node</a> packages is that
they are quite small, often around 100-200 lines. They, in turn, make
use of other packages in the form of dependencies. This is a good thing
and leads both to modularity, better design (maybe…) but gives you the
opportunity to stitch together an environment just like you like it.
Never is this better displayed than when writing tests.

Not only is there a plethora of testing framework to choose from,
equally many test runners that can run them, mocking frameworks but also
separate assertion frameworks. This is not news to me (I love
<a href="https://github.com/erichexter/Should"
target="_blank">ShouldFluent</a> when writing C# for example) and makes
for a very customisable experience.

The assertion framework that I’ve ended up using is called
<a href="https://github.com/visionmedia/should.js"
target="_blank">should.js</a>. Finally a framework that has a name that
reveals something of it’s usage and syntax.

It’s easily installed with
<a href="https://npmjs.org/" target="_blank">npm</a>, of course

> <span style="font-family: Courier New, Courier, monospace;">npm
> install should<span style="font-family: inherit;"> 

<span style="font-family: inherit;">and you're ready to use the should
assertions in your test code. Oh well you need to: 

> <span style="font-family: Courier New, Courier, monospace;">var should
> = require("should");

in your test file of course.

### The assertions

<a href="https://github.com/visionmedia/should.js"
target="_blank">Should</a> make heavy use of the Javascript dynamic
features and slabs on extension functions to the objects you are
testing. This means that you write your assertions after the thing you
assert which gives for a very read-it-out-loud syntax. Like this:

The full list of the assertions that is supported can be
<a href="https://github.com/visionmedia/should.js/"
target="_blank">found here</a> but here’s the ones that *I’ve* (you
might like others...) come to use a lot:

-   <span
    style="font-family: Courier New, Courier, monospace;">x.should.equal(y)
    - hey, I don't need to explain them. How is that for a great
    demonstration of the use of readable syntax...
-   <span
    style="font-family: Courier New, Courier, monospace;">x.should.be.true
-   <span
    style="font-family: Courier New, Courier, monospace;">x.should.be.false
-   <span
    style="font-family: Courier New, Courier, monospace;">x.should.startWith("a
    string")
-   <span
    style="font-family: Courier New, Courier, monospace;">not -
    just negates the assertions. <span
    style="font-family: Courier New, Courier, monospace;">x.should.not.be.equal(y)
    for example.

In fact, there's an whole array (<span
style="font-family: Courier New, Courier, monospace;">.an, .of, .a,
.and, .be, .have, .with, .is, .which) of those conjunctions that
you could add for readability. Like this <span
style="font-family: inherit;">example:<span
style="font-family: Courier New, Courier, monospace;"> 

> <span
> style="font-family: Courier New, Courier, monospace;">user.should.be.an.instanceOf(Object).and.have.property('name',
> 'tj'); 

<span style="font-family: inherit;">I have only used<span
style="font-family: Courier New, Courier, monospace;"> not<span
style="font-family: inherit;"> so far, but I could see that some of the
others might be useful. 

### ~~The trip ups~~The things I often forget

There are a few problems that I keep running into. It’s not very
flattering for my intelligence that I keep doing it over and over but I
thought I’d write it down so that at least know how to fix it the next
time.

#### Assert for null and undefined

If you’re checking that something is null or not, you’re at a bit of
loss, since should cannot attach any extension methods to null (since
that’s no object I presume). In these cases you need to write the should
as a standalone, global method.
Here’s an example:

#### Forgetting the require

Another, very basic thing, that trips me up is that I forget to add the
<span
style="font-family: Courier New, Courier, monospace;">require
statement for <span
style="font-family: Courier New, Courier, monospace;">should in
my test file. I presume I forget this since you don’t have to add one
for mocha.  My feeble mind seems to reason “Hey, great! In tests we
apparently don’t need to add any requires.”
Let’s say you have the following assertion:

If you don’t add the require-statement for should you’ll end up with an
error message like this:

> <span class="Apple-tab-span" style="white-space: pre;"> <span
> style="font-family: Courier New, Courier, monospace;">"TypeError:
> Cannot call method 'equal' of undefined"

Luckily it’s easy fixed. Add this at the top of your test-file:

> <span style="font-family: Courier New, Courier, monospace;">var should
> = require(“should”);

### "This way assert you should" - Yoda (and Rob Conery)

One last thing that I've found very useful. In the testing episode of
the  excellent
<a href="http://tekpub.com/products/angular" target="_blank">TekPub
series on Angular</a> Rob Conery have a short little part on how he
writes assertions (or it-functions in the case of mocha et al). I have
done the same journey as he and picked up, what he calls, the Yoda
way.

Up to then I used to write:

> <span style="font-family: Courier New, Courier, monospace;">it("should
> be defined"),
> it("should validate presence of email")

But really why put the "should" in there? In the immortal words of
Yoda:

> <a href="http://www.youtube.com/watch?v=BQ4yd2W50No" target="_blank">Do
> or do not. There is no try!</a>

Or in our case:

> Do or do not. There is no should!

And just removing<span style="white-space: pre;"> the "should"
from the assertions clears them up quite a lot.

> <span style="font-family: Courier New, Courier, monospace;">it("is
> defined")
> it("validates presence of email")

This also makes for nicer reports, like this:

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://3.bp.blogspot.com/-ONHsrONjpi4/Uu4xMOWdH1I/AAAAAAAAB6U/XmOgOFUgBvE/s1600/Screen+Shot+2014-02-01+at+20.05.01+.png"
data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
src="http://3.bp.blogspot.com/-ONHsrONjpi4/Uu4xMOWdH1I/AAAAAAAAB6U/XmOgOFUgBvE/s1600/Screen+Shot+2014-02-01+at+20.05.01+.png"
data-border="0" /></a>

</div>



</div>
