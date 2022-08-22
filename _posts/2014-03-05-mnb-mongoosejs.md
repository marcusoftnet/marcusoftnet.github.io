---
layout: post
title: 'Marcus Node Bits: Ok then, Moogose is pretty
sweet'
date: '2014-03-05T08:00:00.000+01:00'
author: Marcus Hammarberg
tags:
  - MobProgramming - Javascript
  - Tools
  - Agile
modified_time: '2014-06-02T10:56:52.500+02:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-2091121684384294337
blogger_orig_url: http://www.marcusoft.net/2014/03/mnb-mongoosejs.html
---


<div dir="ltr" style="text-align: left;" trbidi="on">

I often blog too early. I get excited and want to tell everyone as soon
as possible. I whip together a demo and then write a blog post about my
experience. Sometimes that is a bit too early. Sometimes you need
another look to really appreciate a tool, or to realize that it doesn't
do the job.

In my <a href="http://www.marcusoft.net/2014/02/mnb-monk.html"
target="_blank">blog post about Monk</a> (which I still think is
great... Monk, that is, not the blog post) I wrote that I didn't like
<a href="http://mongoosejs.com/" target="_blank">Mongoose</a> that much.
That was too early to say. I have now used it for real and I think I
like it.

Let's me redeem my bad Mongoose-conscience and write a ~~short~~ post on
what I've picked up when trying it...
<a href="http://github.com/aptitud/AptiTalk" target="_blank">for
real</a>.

The thing that ticked me off and actually made me
turn away from Mongoose on the idea-stadium was the fact that it needs a
typed model. To me, at the time, this seemed to go against the whole
idea of simplicity and dynamicallity (yeah, made that word up... but I
mean focus on dynamic stuff; I can store object that doesn't have
exactly the same properties in the same collection for example) that can
be seen through
<a href="http://www.mongodb.org/" target="_blank">Mongo</a> and
<a href="https://github.com/LearnBoost/monk" target="_blank">Monk</a>
for example.

<div>


As always with Node frameworks Mongoose is really simple to install:

> <span style="font-family: Courier New, Courier, monospace;">npm
> install mongoose

Optionally passing (<span
style="font-family: Courier New, Courier, monospace;">--save) to
update your package.json file.


</div>

<div>

Here's an example on how to create a new thing (in this case a Post in
the <a href="http://github.com/aptitud/AptiTalk"
target="_blank">AptiTalk</a> application):

</div>



<div>

Let's go through it in detail, since it's not the most basic example
(that can be found on
the <a href="http://mongoosejs.com/" target="_blank">Mongoose</a> homepage -
no use restating that here), but rather part of an API I wrote for our
application:

</div>

<div>

On line 1 we are requiring mongoose as normal

Line 3 - 9 declares our model. There are a lot of things that you can do
here, like setting constraints (<span
style="font-family: Courier New, Courier, monospace;">{type: Date,
default: Date.now} and <span
style="font-family: Courier New, Courier, monospace;">{type: String,
required: true} are a couple that springs to mind). You can then
use built-in <a href="http://mongoosejs.com/docs/validation.html"
target="_blank">Mongoose validation</a> to validate that. I have not and
I will tell you more about why later. 

Line 11-25 is where the storage takes place

On line 12 we create a new Post object. That is a new instance of our
Mongoose model. 

Lines 13-16 sees us setting some values on it. 

Line 18 calls the <span
style="font-family: Courier New, Courier, monospace;">create()
<span style="font-family: inherit;">method of the Post-object.
This can be thought of as a static method on the class rather than on
the instance. I will not try to explain this with prototypes etc in
Javascript. I think I understand it but dare not explain it. <a
href="http://www.amazon.com/JavaScript-Good-Parts-Douglas-Crockford/dp/0596517742"
target="_blank">Read JavaScript the good parts.</a> Twice.

-   <span style="font-family: inherit;">The  <span
    style="font-family: 'Courier New', Courier, monospace;">create()has
    the follow signature: <span
    style="font-family: 'Courier New', Courier, monospace;">create({doc},
    callback)or <span
    style="font-family: 'Courier New', Courier, monospace;">create(\[{doc},
    callback\])so you can add one or many objects.

<span style="font-family: inherit;">Lines 19-23 is my callback function.
In fact I could have called the <span
style="font-family: Courier New, Courier, monospace;">.save()<span
style="font-family: inherit;"> method on the <span
style="font-family: Courier New, Courier, monospace;">post<span
style="font-family: inherit;"> object I new'ed up on line 12, but I
prefer this approach. 

-   To my callback I always get any errors as first param and then the
    document or documents created, updated or whatever as the second
    param. 
-   In my case I get the inserted post back with a generated id

The callback checks for errors and returns success or failure via two
methods I have created for that. 

<div>

That's quite a lot of code you say. The good news, I respond, is that
the model of course only needs to be declare once. And the rest of the
operations you need (finding, updating, removing etc.) looks very
similar indeed. Here's a list of them in action:

</div>

</div>



<div>

###

### Testing Mongoose

<div>

Testing Mongoose is pretty straight forward. If you can live with
"integration"-tests that is. As I'm a recently converted C# developer
doing JavaScript mostly now I find myself searching for concepts and
implementations that I maybe shouldn't be looking for. 

</div>

<div>



</div>

<div>

So for a long time I tried to mock the database out. Using a "tightly
shut" abstraction like Mongoose I found this very hard indeed. I can
mock out Mongoose itself... but then my tests are testing nothing. 

</div>

<div>



</div>

<div>

(Mocking though, I should add, is pretty sweet in a dynamic language
like JavaScript. You can just supply your own implementation in the
test. Basically overriding the real implementation just for the test)

</div>

<div>



</div>

<div>

It all ended up with a real good comment from one of the best JavaScript
devs I know
- <a href="https://twitter.com/CarlBergquist" target="_blank">Carl
Bergquist</a>:

</div>

> "How short are your feedback loops? Hit the database already!" (or
> something like that) 

Hitting the database with Mongo and Mongoose is really really fast.
Mocha is reporting the tests that take longer than 100 ms as warnings
and it very seldom reports any warning for me. I sucked it in and
stopped trying mocking stuff out. I simply run my tests against a test
version of my database.

However that mean cleaning stuff up before and after your tests, since
you cannot guarantee the order the tests are run in.
Here's a an example test of adding a post:

Sorry about all those files, the original is a bit bigger and I had to
refactor it a bit.
Almost forgot... check out line 16 in testHelpers.js. You need to
connect to Mongo and since you cannot guarantee order I had to write a
little check to see if the connection was open or not... One of those
"doing it for real"-things that I talked about in the beginning of this
post ^^.

### ORM or Data Access framework?

</div>

<div>

Ok, so why did I diss this awesome framework the first time around?
Because I didn't even thing about a ORM, I just wanted data access. For
a number of years I've just used very
<a href="https://github.com/markrendle/Simple.Data"
target="_blank">simple tools</a> and shy'ed away from the complex as
much as I could. When I saw that I needed to create a model, and that
Mongoose hid all things Mongo from me... I was a bit hesitant. 

</div>

<div>

Now, when I've used the tool I feel much better. It's worth the ...
"toll" I pay by creating models etc, I think. The API that Mongoose
exposes is very nice and powerful and I have yet been near running into
a situation that I cannot handle. 

</div>

<div>



</div>

<div>

In short - I should have looked harder and longer. ORM can be
ligthweight too, apparently. Thank you Mongoose for showing me that. 

</div>

</div>
