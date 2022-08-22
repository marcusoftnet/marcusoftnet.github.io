---
layout: post
title: Nancy.Testing - no hat, no shoes with Simple.Data
date: 2013-02-04T08:00:00.000Z
author: Marcus Hammarberg
tags:
  - Nancy
  - Tools
  - .NET
  - C#
modified_time: 2014-06-21T00:09:55.478Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-3442155135108836212
blogger_orig_url: http://www.marcusoft.net/2013/02/NancyTesting4.html
---


<div>

This is the fourth (oh my!) post in my series on Nancy.Testing. This
time we will leave the Nancy.Testing specific stuff and let our gal meet
a friend of mine: [Simple.Data](http://simple.data/)(.Testing). By
marrying these kids together we will have a really cool
full-stack-in-memory-testing-experience (FSIMTE it's gonna be a
thing!).

I'll supply you with some background to Simple.Data and it's (awesome)
testing capabilities, and I probably have to explain the title of this
blog post, but then it's just code all the way down.

The other posts in the series can be found here:

1. <a href="http://www.marcusoft.net/2013/01/NancyTesting1.html"
    target="_blank">Intro to testing with Nancy</a>
2. <a href="http://www.marcusoft.net/2013/01/NancyTesting2.html"
    target="_blank">The Configurable bootstrapper</a>
3. <a href="http://www.marcusoft.net/2013/01/NancyTesting3.html"
    target="_blank">The Browser and Response objects</a>
4. <a href="http://www.marcusoft.net/2013/02/NancyTesting4.html"
    target="_blank">Hat and shoeless testing with Simple.Data</a>(this
    post)
5. <a href="http://www.marcusoft.net/2013/02/NancyTesting5.html"
    target="_blank">SpecFlow and Nancy</a>

<div>

Let's dive right in a say hello to Simple.Data, if you haven't met him
already.

</div>

<div>

### Simple.Data

</div>

<div>

[Simple.Data](http://simple.data/) is a micro-orm. Or as [Mark
Rendle](http://blog.markrendle.net/) says: It's an ORM without any
Objects, there's no Mapping going on and it works against non-Relational
databases as well.
Simple.Data relies, just as Nancy, a lot on dynamics and allow you to
write data access as simple as:

<div>

As expected this code opens a connection to the database (as configured
in your .config-file, but you could supply a connection string if you
wanted). It then issues a SQL-query against the database with a
WHERE-part that search for Users with the given Email. Like this:

> SELECT * FROM Users WHERE Email = '@p1'

Simple right? Oh yeah - it's all in the name.  

</div>

### Simple.Data.Testing

Another likeness with Nancy is that Simple.Data have testing as a first
class citizen. There's some truly great test-support that you can [read
more about in the excellent docs](http://simplefx.org/simpledata/docs/).
Here's how some test-code that shows what I mean.

</div>

<div>

The important part here lies in the test code:

- Line 6-7 sets up an InMemoryAdapter and tells the static
    Database-object to use that adapter for subsequent calls to
    Database.Open(). This is a GREAT thing since we now, in our
    testcode, can change the behavior of the code in the production
    code.
- Line 10-11 adds a new object into the database. Hihi - you and I
    know that it's going against the InMemoryAdapter, since that's what
    we told Database on line 7. This was the first time we called
    Database.Open() and got a database object using the InMemoryAdapter
    back.
- Line 14 calls into our  method under test. When that method calls
    Database.Open() (SimpleDataMethodToTest.cs line 3) it ALSO gets the
    InMemoryAdapter back, since we set it in our testcode.
- The rest of the test method does our asserts.

<div>

With these testing capabilities you have the possibllity to test the
data access code. You can setup mock data per test method and doesn't
have to create a big testdatabase. This means that we can test the
entire stack downwards, to just before we do the jump over the network
(maybe) into the database.

</div>

<div>

All the way down... or just all the stuff that we have written.

</div>

<div>

</div>

<div>

For those wondering, yes - you can setup [joins, auto incrementing
key](http://simplefx.org/simpledata/docs/pages/Test/Configuration.htm)s
etc for your InMemoryAdapter.

</div>

</div>

### Hat and shoeless

<div>

As I just said we can now test the stack all the way down to the bottom
of our application architecture. And in the rest of the [blog posts of
this series](http://www.marcusoft.net/2013/01/NancyTesting1.html), I've
talked about how Nancy.Testing allows you to test your whole stack
upwards, just before the rendered HTML leaves the web server.

You might have heard the term "[headless
browser](http://blog.arhg.net/2009/10/what-is-headless-browser.html)",
that's a browser without GUI. Great for testing, but it still does a
network jump and configuring your application to use other objects for
testing is [demanding to say the
least](http://blog.stevensanderson.com/2010/03/09/deleporter-cross-process-code-injection-for-aspnet/),
but it can be done.

Combining Nancy and Simple.Data and it's testing capabilities we get
something that's really much easier and nicer: let's call it hat and
shoeless, shall we?
Hatless - in that we can test our whole stack and can just remove the
top-layer: the sending of the Response over the network and it's
rendering in the browser (that these days could be a lot, I'll give you
that :))
Shoeless - we Simple.Data testing we can test ALL our code, all the way
to and including the actual data access code. Just removing the final,
bottom layer (the actual call to the database) is removed.

</div>

### Examples

<div>

Yeah, I know, I know. Too much talk - too little code. I'll show you 2
examples on how this could work.
Here's the first one:

In this example we first configure the InMemoryAdapter to hold a new
FairyTaleFigure "Gollum" and then call into the Module that just returns
a string.

Let's crank up reality a bit. Let's do a module that uses a Repository
and returns a rendered Razor view.

<div>

There's nothing new in here, really. But let's go through it real
fast:

- In FullStack_Test.cs (that's the test code in there), we first setup
    a InMemoryAdapter with Joins and Autoincrementing keys and tell
    Simple.Data to use that adapter for all subsequent calls to
    Database.Open().
- On line 35-36 in the same file we configure the
    [ConfigurableBoostrapper](http://www.marcusoft.net/2013/01/NancyTesting2.html) to
    use our **production** repository. That's quite ok since we just
    told Simple.Data to use our "mock" the InMemoryAdapter.
- We then proceed to call into the SimpleDataModuleWithView, via the
    [Nancy.Testing.Browser](http://www.marcusoft.net/2013/01/NancyTesting2.html) object.
    That's calling the entire stack - but not doing network calls, mind
    you. We're cutting in just before the web server itself.
- The rest of the code is standard Nancy and Razor code. Mind that the
    Razor view (the .cshtml-file) needs to be set to ["Copy if
    newer"](http://www.marcusoft.net/2013/02/NancyViewTesting.html) in
    the Properties window, Copy to output directory in order for
    Nancy.Testing to be able to render it under test. Read more on this
    here.

</div>

### Summary

</div>

<div>

This is so cool! Testing the entire stack - in memory. Superfast, but
accessing all the (important) parts. I have to brace myself. But it's
really just combining two awesome frameworks that put testability
first.

As always my code can [be found
here.](https://github.com/marcusoftnet/DiscoveringNancyThroughTests)

</div>

</div>
