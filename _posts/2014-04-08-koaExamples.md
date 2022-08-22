---
layout: post
title: Marcus Node Bits - Let us flex Koa Js, shall we?
date: 2014-04-08T12:12:00.000Z
author: Marcus Hammarberg
tags:
  - Node
  - Javascript
  - Tools
  - Koa
modified_time: 2014-05-23T03:28:22.873Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-628425760225674799
blogger_orig_url: http://www.marcusoft.net/2014/03/koaExamples.html
---








The <a href="http://www.marcusoft.net/2014/03/koaintro.html"
target="_blank">first</a>
<a href="http://www.marcusoft.net/2014/03/koaGenYield.html"
target="_blank">two</a> post of this mini-series, we picked up the basic
on getting <a href="http://www.koajs.com/" target="_blank">Koa Js</a> to
start as well as understand what it's build from and the concepts behind
it. It's time to do something for real. Well over time, one might add.
This post is all about using Koa to build different websites and web
api's.

By using
<a href="https://github.com/koajs/examples/" target="_blank">Koas own
examples</a> I will show you how you can use Koa for a lot of common
tasks and scenarios. Let's dive right in.

### Middleware

The first thing to understand is that Koa is very modular. "Ok, got it",
you think. "No", I answer, "**very** modular! The bits are tiny." So a
Koa application is to a large extent made up by middleware you include,
that is not included per default. The list of
<a href="https://github.com/koajs/koa/wiki" target="_blank">middleware
is quite staggering</a> and will quite some time to learn and take in.
Luckily you don't have to learn all of them, and they are so tiny that
they one-by-one is not a problem.

You should also check out the
<a href="https://github.com/visionmedia/co"
target="_blank">co-project</a> that provide generator/yield style access
to a
<a href="https://github.com/visionmedia/co/wiki" target="_blank">VAST
amount of features and scenarios</a>.
<a href="https://github.com/visionmedia/co-monk"
target="_blank">Co-monk</a> is just one example, that we saw in the
<a href="http://www.marcusoft.net/2014/03/koaGenYield.html"
target="_blank">last post</a> and will meet again later in this post.

### Examples

I wanted to take a look at some of the
<a href="https://github.com/koajs/examples/" target="_blank">examples
Koa Js</a> provides and make some comments.
<a href="http://www.marcusoft.net/2014/02/mnb-git.html"
target="_blank">Clone the repository</a> and follow along. My plan is
that these examples will prove useful for me and you as we start to
build "real" things.

Yes, I have copied the example files out to separate gists. This is
because I don't trust linking directly to repositories. And the content
of the repository files might change too.

There's <a href="http://www.marcusoft.net/2014/02/mnb-packagejson.html"
target="_blank">one package.json</a> for all the examples, which is
awesome because that means that we can do "<span
style="font-family: Courier New, Courier, monospace;">npm
install" in the root and get all the examples. All examples must
be run with the <span
style="font-family: Courier New, Courier, monospace;">"node
--harmony" flag,
<a href="http://www.marcusoft.net/2014/03/koaintro.html"
target="_blank">as described earlier</a>.

#### Blog

The first example that I recommend that you look at is the /blog
example. Head into that directory and fire the site up (with "<span
style="font-family: Courier New, Courier, monospace;">node --harmony
index.js" or better yet "<span
style="font-family: Courier New, Courier, monospace;">nodemon --harmony
index.js").
Most of the action goes on in the single index.js file:

This site is very basic of course but shows off a number of features
(and hence middleware):

- On line 7 we're including <span
    style="font-family: Courier New, Courier, monospace;"><a href="https://www.npmjs.org/package/koa-logger"
    target="_blank">koa-logger</a> and make sure to use it on
    line 20 (<span
    style="font-family: Courier New, Courier, monospace;">app.use(logger())).
    This produce some very handy and nice output in the console. I use
    it for most of my sites.
- Routing we've seen before and it's very simple to use, since it
    reminds a lot of other frameworks like
    <a href="http://expressjs.com/" target="_blank">ExpressJs</a>. It's
    of course a package of it's own, <span
    style="font-family: Courier New, Courier, monospace;"><a href="https://www.npmjs.org/package/koa-route"
    target="_blank">koa-route</a>.
- With <span
    style="font-family: Courier New, Courier, monospace;"><a href="https://www.npmjs.org/package/co-body"
    target="_blank">co-body</a> <span
    style="font-family: inherit;">you can easily parse the content of a
    posted payload to an object. Note, on line 10 that the variable,
    from the require-statement is called parse. This is then used on
    line 62 to parse the request (<span
    style="font-family: Courier New, Courier, monospace;">var post =
    yield parse(this);)
    The "<span
    style="font-family: Courier New, Courier, monospace;">this"
    here might confuse you, shouldn't it be request? I have a little
    section on that below.
- This site uses a view engine to called
    <a href="http://paularmstrong.github.io/swig/" target="_blank">swig</a>.
    To use that a little module has been created (/lib/render.js) that
    is included on line 6.
    Using this little render-function we can render templated views as
    simple as shown on line 35. Notice how we're passing the data, as
    the second parameter (<span
    style="font-family: Courier New, Courier, monospace;">{ posts: posts
    }). This can then be picked up by the partial view
    (list.html) and looped over with <span
    style="font-family: Courier New, Courier, monospace;">{{ "{%" }} for
    post in posts %}
    <span style="font-family: inherit;">Read more about templates and
    supported engines on the
    <a href="https://www.npmjs.org/package/co-views"
    target="_blank">co-views npm-page</a><span
    style="font-family: Courier New, Courier, monospace;">.

All in all this is a very good entry example I think. A nice little
exercise could be to replace the in-memory storage with Mongo. Psst...
use <a href="https://www.npmjs.org/package/co-monk"
target="_blank">co-monk</a>, for that.  Let's deep dive into something
else. Let's look at error handling. UPDATE:
<a href="https://github.com/marcusoftnet/koablog-mongo"
target="_blank">I couldn't hold it in...</a>

### Where's the request and response, dude?

Let's break shortly from the examples, more are to come, and mention the
<a href="http://koajs.com/#context" target="_blank">API of Koa Context
object</a>. It's very well described on their site (follow that link),
but I dare to do some comments here for somethings that made me go Huh?
a couple of times:

First, the request and response is baked into the Context object. This
actually works better than you would think. <span
style="font-family: Courier New, Courier, monospace;">ctx.header
is just a shortcut to the header of the
<a href="http://koajs.com/#request" target="_blank">Request</a> object
and <span
style="font-family: Courier New, Courier, monospace;">ctx.status
hence is used to manipulate the status of the
<a href="http://koajs.com/#response" target="_blank">Response</a>
object.

You can get hold of some useful things from the Context object

- <span
    style="font-family: Courier New, Courier, monospace;">ctx.app
    is the application instance for your application.
- <span
    style="font-family: Courier New, Courier, monospace;">ctx.Request
    is the
    Koa <a href="http://koajs.com/#request" target="_blank">Request</a> object.
    Note the difference to the <span
    style="font-family: Courier New, Courier, monospace;">ctx.req
    which is the Node request object.
- <span
    style="font-family: Courier New, Courier, monospace;">ctx.Response
    and <span
    style="font-family: Courier New, Courier, monospace;">ctx.res
    is
    the <a href="http://koajs.com/#response" target="_blank">Response</a> and
    Node response

This makes for very succinct and terse code, since almost everything you
need comes from the context and can be found on the <span
style="font-family: Courier New, Courier, monospace;">this
object. For example, take a look at lines 62 and 67 of the
<a href="https://gist.github.com/marcusoftnet/9912981"
target="_blank">example above</a>. Parse the incoming request? <span
style="font-family: Courier New, Courier, monospace;">parse(this)
of course. Redirect the response? <span
style="font-family: Courier New, Courier, monospace;">this.redirect('/');

### More examples

Let's continue with some more examples that I think can be useful for
most of us.

#### ErrorHandling

Error handling is nicely baked into Koa. If you do nothing everything is
logged to standard output (stderr) unless the NODE_ENV is test. But you
can easily create a global error hook to do your own error handling.
Just do <span
style="font-family: Courier New, Courier, monospace;">app.on('err',
function(err){}); and you can do your stuff there.

Another thing that happens automatically is that a HTTP status 500 is
returned to the client, of course. Let's look at an example that does
this:

In this example we can also see error propagation in action.

Line 29-33 we have the global catch all error handler that logs the
error. Note the "advanced" (not really huh?) logging that has been made
for when NODE_ENV isn't test. In this particular case that would be the
exact same behaviour as the default behaviour.

Line 5-21 sets up an interesting try..catch block around ... Yes, around
what? Well next, of course. All the other middleware and request
handling. Powerful stuff!

- In this case we create a custom response, setting the body, status
    and type of the response.
- We also emit the error event so that our console log takes place. It
    wouldn't have done that otherwise since we handled the error
    manually.  

Line 24-26 is a function that responds to all the call to this
application.

The order of the calls had me thinking hard. And long. And then hard
again. But here it is:

1. The application set's up a try..catch around all the middlewares and
    requests.
2. Request comes in and is handled by the "catch all routes"-function
    on line 24-26
3. This function throws an error
4. That is caught by the try..catch function (line 5-21).
5. In this function we handle the error manually.
6. The final line of code in the try..catch function emits an error
    event
7. Which triggers the app.on('error') subscription. That logs the
    error.

I hope I got that right...

### What about testing?

We break again from the example to mention a few words about testing.
Like all Javascript frameworks worth its salt the support for testing is
excellent (still in awe of this Javascripters!) and Koa Js is no
exception.

Let's take the testing of the error handling example as an ... well
example. It
uses <a href="http://www.marcusoft.net/2014/02/mnb-supertest.html"
target="_blank">supertest</a> since it tests the entire stack. And
<a href="http://www.marcusoft.net/2014/02/mnb-mocha.html"
target="_blank">mocha</a> of course. Here's the test code:

Line 1 is important, this is where we get a reference to the
application. Simple stuff; just require the application. Ha!

Line 2 sets up a supertest request object by creating a supertest agent
and listening to the application.

The first test (line 4-10) is plain old supertest code, and outside the
scope of this article.

The second test is more interesting. Remember that the code we're
testing both returned a nicely formatted error but also emitted an error
event?

- Since we have a reference of the <span
    style="font-family: Courier New, Courier, monospace;">app
    (from line 1) we can now setup an subscription for the "error"
    event. But it should happens only once.
- Once it happens we check the .<span
    style="font-family: Courier New, Courier, monospace;">message
    of the passed in <span
    style="font-family: Courier New, Courier, monospace;">err-parameter.

- We also get the context (<span
    style="font-family: Courier New, Courier, monospace;">ctx)
    passed in and can check the status of that.

There's of course more to say about testing, but I'm safe to say that
the support in Koa got you well covered.

### And still more examples

I'll try to do some more examples. Starting with one that not yet is in
the examples repository.
<a href="https://github.com/koajs/examples/pull/27" target="_blank">Not.
Yet</a>. :)

#### Basic Authentication

There's a nice little middleware to do basic authentication
(<a href="https://www.npmjs.org/package/koa-basic-auth"
target="_blank">koa-basic-auth</a>) which makes basic authentication
this easy:

- Line 1 requires the koa-basic-auth middleware. Note that we call
    this variable <span
    style="font-family: Courier New, Courier, monospace;">auth
- Line 22 is the secret sauce. Here's we simply tell the <span
    style="font-family: Courier New, Courier, monospace;">app to
    <span
    style="font-family: Courier New, Courier, monospace;">use
    the <span
    style="font-family: 'Courier New', Courier, monospace;">auth
    <span style="font-family: inherit;">function, for the
    listed <span
    style="font-family: Courier New, Courier, monospace;">name -
    pass objects.  
- Lines 7-18 sees us use an similar try..catch for all the request

It's not pretty but it's quick and good enough for administration sites
etc.

#### Content negotiation

<a href="http://en.wikipedia.org/wiki/Content_negotiation"
target="_blank">Content negotiation</a> simply means that you can have
one route that answers for request for several content types. If you ask
for HTML you'll get HTML back and JSON when you ask for JSON etc.

Koa got you covered. Here's how you do it:

Arguably this example is a bit overlong... Here are the important parts:

- Line 36 set's up the content types we accepts, by using the <span
    style="font-family: Courier New, Courier, monospace;">app.accepts()
    function.
- Note that we store the response in a type variable that we then can
    use to filter the responses with.
- Line 38 checks that we got something we can use
- Line 43 is one example on how to check the type and then return the
    correct version.

I think this is not super-elegant, compared to
<a href="https://github.com/NancyFx/Nancy/wiki/Content-Negotiation"
target="_blank">other frameworks</a> I've use, but at least it's simple
to understand.

#### Store stuff

(in Mongo I should have added maybe...).
For this we use
<a href="https://www.npmjs.org/package/monk" target="_blank">monk</a>
and <a href="https://www.npmjs.org/package/co-monk"
target="_blank">co-monk</a> in combination, and I talked about this
shortly in the
<a href="http://www.marcusoft.net/2014/03/koaGenYield.html"
target="_blank">previous blog post</a>. This is not included in the
example repository either. You can find <a
href="https://github.com/marcusoftnet/KoaBlogPosts/tree/master/mongoDbWithMonk"
target="_blank">the code here</a>.
Let's do CRUD for an imaginary user object (the Koa-guys seems to like
that :):

Let's go through the production code first:

First stuff that's interesting is lines 9 and 11. Here's we require the
co-monk library and store that in a variable called <span
style="font-family: Courier New, Courier, monospace;">wrap. That
can then be used to create a collection-like variable for easy access,
as we do on line 11, we call is <span
style="font-family: Courier New, Courier, monospace;">users.

And exposes the users to our tests on line 14, <span
style="font-family: Courier New, Courier, monospace;">module.exports.users
= users;

<span style="font-family: inherit;">We use the
<a href="https://www.npmjs.org/package/co-body"
target="_blank">co-body</a> library to parse the requests into JSON
objects. Look at line 28 for example.

<span style="font-family: inherit;">The
<a href="https://github.com/visionmedia/monk" target="_blank">monk
interface</a> is exposed through the
<a href="https://www.npmjs.org/package/co-monk" target="_blank">co-monk
library</a>. This is awesome, since that means that we can have
interaction with our user collection like this:

- <span style="font-family: inherit;">Insert : <span
    style="font-family: Courier New, Courier, monospace;">yield
    users.insert(user);
- Find all: <span
    style="font-family: Courier New, Courier, monospace;">var res =
    yield users.find({});
- Find one: <span
    style="font-family: Courier New, Courier, monospace;">var res =
    yield users.findOne({\_id:id});
- Update via id: <span
    style="font-family: Courier New, Courier, monospace;">yield
    users.updateById(id, user);
- Update via other property: <span
    style="font-family: Courier New, Courier, monospace;">yield
    users.update({name: 'Marcus'}, user);
- Delete: <span
    style="font-family: Courier New, Courier, monospace;">yield
    users.remove({\_id:id});

See?! It's almost ridiculously simple! Very nice, short and sweet!

Ok, let's take a look that the test code:

First thing to notice here is the <span
style="font-family: Courier New, Courier, monospace;">removeAll-function
that we use in the <span
style="font-family: Courier New, Courier, monospace;">beforeEach
and <span
style="font-family: Courier New, Courier, monospace;">after-hooks:

- We're using the <a href="https://www.npmjs.org/package/co"
    target="_blank">co-library</a> here to wrap the functionality of our
    call in a generator (or "Generator based flow-control goodness for
    nodejs (and soon the browser), using thunks or promises, letting you
    write non-blocking code in a nice-ish way." from the npm-site).
- This is great because that means that we can yield stuff and use
    co-monk again. For example look at line 11. One line. Remove
    everything and yield to get the "async" behaviour we want.
- Note that the co-function takes the done-variable as parameter;
    <span
    style="font-family: Courier New, Courier, monospace;">co(...)(done);
    This is a bit of trickery that first tripped me up. I'm not sure I
    understand it fully but this works at least. And it makes sense in a
    way to; first to this (inside of the co-function) and then call
    done. A bit like promises, maybe.

Then on line 24-30 we do a normal
<a href="http://www.marcusoft.net/2014/02/mnb-supertest.html"
target="_blank">supertest test</a>, posting a user object to our API and
validating the result

Testing for a existing user is a bit trickier. We first need to insert
the user and then get it from our API. An easy way to do that is to wrap
it in a co-generator-function again. We wrap the whole it-block in one
co-function that:

- Inserts the user into the mongo db (line 34)
- Calls our API via supertest (lines 36-49)
- Validates the response (lines 40-42)

We use the same trick for the update test (lines 47-56) and the delete
test (58-66)

This testing was a bit hard to get going first but once I wrapped my
head around (well not completely maybe...) the co-function I think it
came out pretty nice.

#### Upload files

The final example is not something that you'll do everyday but something
that I'm needing in a little app I'm building; uploading files (and
streaming them back).

Here's the way to do that with Koa:

There's number of interesting things here, not all of them have to do
with file uploading:

Check lines 7 and 27; that's how you serve static files from a
directory. Looks a lot like
<a href="http://expressjs.com/" target="_blank">Express</a> right?
Simple but useful

This examples doesn't use routing... at least not the koa-routes we've
come to love. Instead the single route handling (lines 31-46) checks the
<span
style="font-family: Courier New, Courier, monospace;">this.method for
posts and just ignores everything that isn't.  

- This means that for the public-directory (that serves static files,
    if you remember) we get our index.html served

After our post-handling we redirect back to the root of the
application.

There's also little stab at a custom 404-page. On line 21 we check if
the request has a body and that it's not
<a href="http://restcookbook.com/HTTP%20Methods/idempotency/"
target="_blank">idempotent (?!)</a>, if not it serves up the 404.html.

Ok, that was a lot of good stuff that didn't even remotely had to do
with uploads. Let's look at the uploading parts:

First, line 8 sets up a <span
style="font-family: Courier New, Courier, monospace;">parse
variable, by requiring the <a href="http://npmjs.org/package/co-busboy"
target="_blank">co-busboy</a> library (man, for some of those name, I
guess that you had to be in the room when they were named...). This is a
little handy library that helps us to parse multi-part requests. File
uploads are always multipart (I think... at least mostly) and we are
legio that have forgotten '<span
style="font-family: Courier New, Courier, monospace;">enctype="multipart/form-data"'
on our forms.

With the parse-functionality that co-busboy gives us we can do "<span
style="font-family: Courier New, Courier, monospace;">var parts =
parse(this);". <span style="font-family: inherit;">This gives us
the different part of the the multipart request and we can then loop and
yield through each of them<span
style="font-family: Courier New, Courier, monospace;"> "while (part =
yield parts)"

co-busboy is a convoluted in that the parts that you parse out can be
one of the two types (read more on
the <a href="http://npmjs.org/package/co-busboy"
target="_blank">co-busboy</a> npm page):

- Either it is an array, and then it holds values in key-value pairs
    (key in <span
    style="font-family: Courier New, Courier, monospace;">part\[0\],
    value in <span
    style="font-family: Courier New, Courier, monospace;">part\[1\])
- If it's not an array (aka plain old form values), well then it is a
    stream. This comes handy just now.

With co-busboy we can now easily store the stream to disk:

- We create a writeStream (<span
    style="font-family: Courier New, Courier, monospace;">var stream =
    fs.createWriteStream('/tmp/' + Math.random() +
    part.filename);)
- pipe the <span
    style="font-family: Courier New, Courier, monospace;">part to
    the stream.  Since the <span
    style="font-family: Courier New, Courier, monospace;">part is
    a stream we just pipe it onto the writeStream.
    Yeah, you <a href="https://github.com/substack/stream-handbook"
    target="_blank">probably need to grok streams</a> to fully
    understand this (and Node I've heard). I absolutely hate them and
    never got to good terms with them. The article I pointed to is a
    great start and you can
    <a href="http://nodestreams.com/" target="_blank">lab with them in your
    browser here</a>.
    A writeStream is a "stream" (whatever that is...) for writing stuff.
    We pipe the part to the writeStream and it's written... Got that,
    Marcus?
- This writes the file to disk (to the path you provided when you
    created the writeStream).

That was not too hard, now was it?

#### Stream files back to the client

Ok, streaming files to the client was so super-easy that I just had to
include that here too:

By using the path Node module we can easily get the extension name of a
file as of line 12.

Streaming now becomes very easy and can reduced to a one-line (line 13).
Let's break it down:

- <span
    style="font-family: Courier New, Courier, monospace;">fs.createReadStream(path)
    simply creates a readStream (a stream for reading, Marcus...)
- this readstream is then assigned to the <span
    style="font-family: Courier New, Courier, monospace;">this.body
    property. Meaning that we stream the file back to the body.
- finally we save a reference to the stream to be used in the clean up
    (see next bullet)

Line 2 sees us require
the <a href="https://www.npmjs.org/package/finished"
target="_blank">finished</a>-library (that "Execute a callback when a
request closes, finishes, or errors") to a <span
style="font-family: Courier New, Courier, monospace;">onFinished variable.
I told you these things were tiny.

- This is then used on the last line of our request to ensure we close
    everything off in a nice, non-leaking fashion. Without callbacks of
    course :P

Short and sweet!

### Summary

The goal of this blog post was to walk your through a bunch of Koa Js
examples, that could help you get going and understand the Koa
capabilities faster. Some are from the Koa-people and some are from me.
I learned a lot by doing this very carefully and slowly. I hope you have
picked up somethings by reading this.

I'm planning to build a little application using most of the things
above. I will probably blog about that when it's done. With Koa that
should total to 29 lines of code, right? :)

Thanks for reading this!

I like Koa Js. I've written a couple of post about it. Here they will be
when they are published:

- <a href="http://www.marcusoft.net/2014/03/koaintro.html"
    target="_blank">Let's talk about Koa for a while, shall we?</a>
- <a href="http://www.marcusoft.net/2014/04/koaGenYield.html"
    target="_blank">Let's talk about yield and generators, shall we?</a>
- Marcus Node Bits: Let's flex Koa Js, shall we? (this post)
