---
layout: post
title: "Supertest: Verify database after request"
author: "Marcus Hammarberg"
date: 2015-05-05 10:07:10
tags:
 - Tools
 - Javascript
 - NodeJs
 - Koa
---

One thing that I often find myself want to do is to check the database after I have created a resource. For example:

* Post some data to /user
* Verify that I get 201 Created back
* Check that the data in the database looks ok

I have had *such* a hard time finding a stable way to do this. I know that I have a little bit of a special tool chain but still... it should not be this hard. 

But last night, after weeks searching for this, I got it to work. I'm so excited to share this with you. 

<a name='more'></a>

# Tools

I'm using the following tools:

* [Koa](http://koajs.com) as my web framework of choice. Of course. 
* And with comes a desire to use [generators and yield](https://www.youtube.com/watch?v=egLUa6urd6I) where ever I can, because [callbacks make me tired](http://codebetter.com/marcushammarberg/2014/05/07/beyondcallbacks/). 
* [supertest](https://github.com/visionmedia/supertest) for testing
* [co-monk](http://npmjs.org/package/co-monk) for generator friendly database access
* [mocha](http://npmjs.org/package/mocha) for testing
* [should](http://npmjs.org/package/should) for assertions

If you want to tag along as I build this example out, [grab the code from this tag](https://github.com/marcusoftnet/UserApiWithTest/tree/v1.1). 

# The start
Here's the test I'm starting from, you'll find it in /test/user.post.js:

{% highlight javascript linenos %}
describe('POST to /user', function(){

	var test_user = {};

	beforeEach(function (done) {
		test_user = helpers.test_user;
		helpers.removeAll(done);
	});

	afterEach(function (done) {
		helpers.removeAll(done);
	});

	it('creates a new user for complete posted data', function(done){
		// Post
		request
			.post('/user')
			.send(test_user)
			.expect('location', /^\/user\/[0-9a-fA-F]{24}$/) // Mongo Object Id /user/234234523562512512
			.expect(201, done);
	});

	// and some other tests
});
{% endhighlight %}

There's a [testHelpers.js file](https://github.com/marcusoftnet/UserApiWithTest/blob/v1.1/test/testHelpers.js) where the <code>test_user</code> object is defined. 

We clean the database, before and after each test (lines 5-12). Overkill maybe but at least clean

The interesting part is of course the test from lines 14-21. It's a good test. Well-defined and even checks the location returned with a regular expression to match a MongoDb Id. But... this could still not have put any data into the database. It's unlikely but we don't know. I don't like that. 

Running the tests <code>npm test</code>, before we start, makes sure that this work. 

{% highlight bash %}
... other tests ...

POST to /user
✓ creates a new user for complete posted data 

... other tests ...

6 passing (100ms)
{% endhighlight %}

Ah well... I changed the status code from 200 to 201 in the example so that needs to be updated in the [userRoute.js](https://github.com/marcusoftnet/UserApiWithTest/blob/v1.1/userRoutes.js)... but then it works.  

# The humble start ... by using .end()
What we want is to after the request has finished check the state of the database. And [supertest](https://github.com/visionmedia/supertest) actually exposes a excellent place to do that; [.end()](https://github.com/visionmedia/supertest#endfn).

And that takes a function. Let's by just using the end function. Like this: 

{% highlight javascript linenos %}
it('creates a new user for complete posted data', function(done){
	// Post
	request
		.post('/user')
		.send(test_user)
		.expect('location', /^\/user\/[0-9a-fA-F]{24}$/) // Mongo Object Id /user/234234523562512512
		.expect(201)
		.end(done);
});
{% endhighlight %}

This is just making the test a little bit clearer to read. "And then end the request and test by calling done" was basically what we said.

Rerunning the test to make sure it works, of course. 

# Our own function
But we wanted to *do* something after the request as ended. Luckily we can by adding a function of our own as parameter to the <code>.end()</code>. Here's the trivial example of that:

{% highlight javascript  %}
.end(function () {
	done();
});
{% endhighlight %}

Too trivial. Let's instead look up some data and verify that the <code>test_user.name</code> actually has been set in the database. Here's what we want to say:

{% highlight javascript %}
var userFromDb = yield users.findOne({ name: test_user.name});
userFromDb.name.should.equal(test_user.name);
{% endhighlight %}

(The <code>users</code> collection is defined in <code>testHelpers</code> and in our file we have a the following at the top, for easy access <code>var helpers = require('./testHelpers.js'); var users = helpers.users;</code>.

Note that you have to require and install [should](http://npmjs.org/package/should) to make this work)

Ha! Trivial again... I said... Until I remember that yield cannot be called in a non-generator function. Let's try and you'll see. Here's the code that will not work:

{% highlight javascript %}
.end(function (){
	var userFromDb = yield users.findOne({ name: test_user.name});
	userFromDb.name.should.equal(test_user.name);
	done();
});
{% endhighlight %}

Running the tests again (<code>npm t</code>) and will get this error that I've [blogged about before](http://www.marcusoft.net/2014/04/WhenIGotGenerators.html)
			
{% highlight bash %}
var userFromDb = yield users.findOne({ name: test_user.name});
				                       ^^^^^^^^^^
SyntaxError: Unexpected identifier
{% endhighlight %}

Basically it tries to say: "I don't know what you mean 'yield'" but it cannot express itself particularly good. 

<code>yield</code> can only be used in a generator function. A generator function is denoted with an asterisk and has to be called by some one that asks for the <code>.next</code> value it returns. <code>mocha</code> doesn't do that. You can try by adding an asterisk at <code>.end(function *(){</code> but it will just hang the test. 

This is where [co](https://github.com/tj/co) can help us. co is a little tool that simply brings: 

<blockquote>Generator based control flow goodness for nodejs and the browser, using promises, letting you write non-blocking code in a nice-ish way</blockquote>

Yes, exactly. I don't get that either. Still. But I think I can use it. Because basically it means that you can wrap a generator function with <code>co</code> and then execute the co function as a *normal* function. 

This is how it would look, after you have added a <code>var co = require("co");</code> at the top of the file and <code>npm install co --save-dev</code>
{% highlight javascript linenos %}
.end(function () {
	co(function *() {
		var userFromDb = yield users.findOne({ name: test_user.name});
		userFromDb.name.should.equal(test_user.name);
	})(done);
});	
{% endhighlight %}

## Detour - broken example code
You don't have to read this part if you didn't start from my [code](https://github.com/marcusoftnet/UserApiWithTest/tree/v1.1). But it will provide you with deeper understanding once you're through it.

At this point my example code breaks ALL over... This has to do with it being based on old versions of the packages I'm using. I went through <code>package.json</code> and set the version to <code>"*"</code>. For example: <code>"co": "*",</code>. 

That's a bit dangerous but works for now for me. 

### UPDATE: Too stupid
In fact, that is too dangerous. Let's fix it properly instead. Another way is to remove all dependencies from the <code>package.json</code> and then reinstall them from the terminal. Make sure to use <code>--save/--save-dev</code> to store it in <code>package.json</code>. 

I've updated my <code>package.json</code> in that manner now. Here's the the two command I ended up running:

{% highlight bash%}
npm install koa koa-route co-body co-monk monk --save
npm install mocha co should supertest --save-dev
{% endhighlight %}

And now my <code>package.json</code> better represent the state I was actually running in at the time. Thank you [Danny](http://stackoverflow.com/users/4804849/danny) for that push to be better!

## Back to the detour
Once that is done... all tests still fails. This time it has to do with <code>co</code> completely changing it's behavior to return a promise. Luckily all the failures are in the same function: <code>testHelpers.removeAll</code> and can be solved by just moving the call to <code>done</code> inside the function, like this: 
{% highlight javascript linenos %}
module.exports.removeAll = function(done){
	co(function *(){
		yield users.remove({});
		// and other things we need to clean up
		done();
	});
};	
{% endhighlight %}

And now only 4 test still fail. These are the test using <code>co</code> in the old way. Most likely we invoke the <code>co</code> construction function directly (<code>co(...)();</code> for example). This is not how it behaves now when <code>co</code> returns a Promise. The fix is just to remove the <code>();</code> at the end of a call. Here's an example from <code>user.del.js</code>

{% highlight javascript %}
it('deletes an existing user', function(done){
	co(function *() {
		// Insert test user in database
		var user = yield users.insert(test_user);
		var userUrl = '/user/' + user._id;

		// Delete the user
		request
			.del(userUrl)
			.expect(200, done);
	}); // this line looked like this before: })(); 
});
{% endhighlight %}

And we're back. Test are passing and we are using the latest version of our tools. 
Praise God for test when you update your infrastructure. And many other times too.

# Back to the code at hand - let's assert it
Before we run the tests, let's go through the updated <code>.end()</code> function. Here it is again so that you don't have to scroll:

{% highlight javascript linenos %}
.end(function () {
	co(function *() {
		var userFromDb = yield users.findOne({ name: test_user.name});
		userFromDb.name.should.equal(test_user.name);
		done();
	});
});	
{% endhighlight %}

There's a couple of things to note:

* On line 2 we wrap our generator function with co
* Line 3 gets the <code>userFromDb</code> by calling our generator friendly <code>users</code> collection in <code>testHelpers.js</code>. 
* Line 4 checks the name to match the name of the <code>test_user</code> we posted. Admitting the check is a bit strange since we used that value to pull the data from the database too. But at least it would fail if we failed...
* Line 5 calls done
* And line 6 doesn't invoke the function, since <code>co</code> returns a Promise. See above, if you dare.

<code>npm test</code> and it ... fails?! We get a timeout... Now why.

Quick side note. I spent circa 2 months in this state. Not know what to do, hacking around, not verifying etc. etc. 
But I'll spare you this. It was horrible. I don't ever want to go back.

# Promises, promises, promises

Remember that <code>co</code> returns a Promise? 

<blockquote>... Now, co() returns a promise.</blockquote>

We can use that to our advantage, but let's think for a short while. A Promise is basically saying "This will return... I promise... but not just yet." That's great in many many case and the killer feature of Node to start with, although implemented in Callbacks. Brrr... This is allows for asynchronous behavior and freeing up the main thread and all of that stuff that was what made us all love Node from the start. 

But in a test we actually *want* it to execute now. And there's an easy, and standardized way to do that: use the <code>.then()</code> function of the code implementing the Promise, which <code>co</code> does. 

<code>.then()</code> just takes a function that we execute after the Promise has returned. <code>done</code> is a perfect candidate for us.

Here's how it would look: 
{% highlight javascript %}
.end(function () {
	co(function *() {
		var userFromDb = yield users.findOne({ name: test_user.name});
		userFromDb.name.should.equal(test_user.name);
	}).then(done);
});	
{% endhighlight %}

AND. IT. WORKS! Tears of joy are streaming down my face as I realized... 

# Or did it... failing for the right reason
Well... for some reason I doubted this from time to time. And I changed the test to this: 

{% highlight javascript %}
.end(function () {
	co(function *() {
		var userFromDb = yield users.findOne({ name: test_user.name});
		userFromDb.name.should.equal("This is not the name you are looking for");
	}).then(done);
});	
{% endhighlight %}

Rerunning the test... and it hangs... 

{% highlight bash %}
Error: timeout of 2000ms exceeded. Ensure the done() callback is being called in this test.
{% endhighlight %}

Yup... spent another two weeks here. 

Well, it turns out that errors are not handled by <code>.then()</code> unless we tell it how. <code>.then()</code> takes two parameters, like this: <code>.then(fn, fn)</code>, the first function gets called on success, the second on failure. When the test fails there's not function to call and hence <code>done()</code> doesn't get called.

That's what the second parameter, also a function, does. Like this for example:

{% highlight javascript %}
.end(function () {
	co(function *() {
		var userFromDb = yield users.findOne({ name : test_user.name });
		userFromDb.name.should.equal("This is not the name you are looking for");
	}).then(done, function (err) {
		done(err);
	});
});	
{% endhighlight %}

And now we get the failing test we (read: I) was looking for during all that time: 
{% highlight bash %}
AssertionError: expected 'Marcus' to be 'This is not the name you are looking for'
+ expected - actual

+"This is not the name you are looking for"
-"Marcus"
{% endhighlight %}

Now I actually was crying. True story. 
But I was also on such a high that I got an idea. I seem to remember, from my time programming F#, that many functional languages have short cuts for functions that only take one parameter. Basically it's passed implicitly or how you could explain it. 

On a whim I just took the function out and changed it into this: 

{% highlight javascript %}
.end(function () {
	co(function *() {
		var userFromDb = yield users.findOne({ name : test_user.name });
		userFromDb.name.should.equal("This is not the name you are looking for");
	}).then(done, done);
});	
{% endhighlight %}

Basically saying to the second done-parameter; take the <code>err</code> object and pass it to <code>done</code>, in this case which is failing the test. 

And now it works AND is readable and short.

# TL;DR; - summary.
I wanted to check the state of the database after doing a request. This can be done using the <code>.end()</code> function of [supertest](https://github.com/visionmedia/supertest). 

Since I used [co-monk](http://npmjs.org/package/co-monk) I wanted to be able to do that using <code>yield</code> and generators. This means that I need to wrap my generator function with [co](http://npmjs.org/package/co). 

co, since version 4.0.0, returns a promise. This perfect for users of [mocha](http://npmjs.org/package/mocha) since it allows us to use the <code>.then()</code> function and pass the <code>done</code> variable to both the success and failure functions of <code>.then(fn success, fn failure(err))</code>.

The test in it's entirety is displayed below. My code is [checked in here](https://github.com/marcusoftnet/UserApiWithTest), under [tag 1.2](https://github.com/marcusoftnet/UserApiWithTest/tree/v1.2).

{% highlight javascript %}
var co = require("co");
var should = require("should");
var helpers = require('./testHelpers.js');
var users = helpers.users;
var request = helpers.request;

describe('POST to /user', function(){

	var test_user = {};

	beforeEach(function (done) {
		test_user = helpers.test_user;
		helpers.removeAll(done);
	});

	afterEach(function (done) {
		helpers.removeAll(done);
	});

	it('creates a new user for complete posted data', function(done){
		// Post
		request
			.post('/user')
			.send(test_user)
			.expect('location', /^\/user\/[0-9a-fA-F]{24}$/) // Mongo Object Id /user/234234523562512512
			.expect(201)
			.end(function () {
				co(function *() {
					var userFromDb = yield users.findOne({ name : test_user.name });
					userFromDb.name.should.equal("This is not the name you are looking for");
				}).then(done, done);
			});				
	});
});
{% endhighlight %}

YESSSSSS!
