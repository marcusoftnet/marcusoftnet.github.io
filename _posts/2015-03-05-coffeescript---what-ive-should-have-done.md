---
layout: post
title: "CoffeeScript - what I've should have done"
author: "Marcus Hammarberg"
date: 2015-03-05 09:57:09
tags:
 - Javascript
 - Tools
 - NodeJs
---

The blog post I [wrote yesterday](http://www.marcusoft.net/2015/03/node-with-coffeescript---not-a-piece-of-cake.html) was from my experience at the time. I even ended the post with a call out for better ways.

And sure enough, twitter to the rescue:

<blockquote class="twitter-tweet" data-conversation="none" data-cards="hidden" data-partner="tweetdeck"><p><a href="https://twitter.com/marcusoftnet">@marcusoftnet</a> Marcus.. I just use the Coffee command that you installed earlier? No need to compile at all..</p>&mdash; Erwin van der Koogh (@evanderkoogh) <a href="https://twitter.com/evanderkoogh/status/573117296555655169">March 4, 2015</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

As a side, this why I hang out on twitter. There are brilliant people there that will push you towards ever better. Thanks Erwin for this.

So... what does that mean for my post yesterday... Let's find out:

<a name='more'></a>

First of all - nothing I wrote will cause you problems but it's a bit cumbersome and maybe not the CoffeeScript-way... I think.

# What worked
All the things I wrote under the "Initialize project and more" and "Run tests" headings is a ok way to get up and running with CoffeeScript on Node.

Doing that again means that you now have (see the [other post](http://www.marcusoft.net/2015/03/node-with-coffeescript---not-a-piece-of-cake.html) for details):

* Created a CoffeDemoTheCoffeeWay directory
* ```git init``` in that directory
* ```npm init``` in that directory
* ```npm install mocha should --save-dev```
* created a ```test``` directory and a ```spec.coffee```-file in that directory, with a simple test in it
* added this test command in your ```package.json``` scripts/test-node: ```mocha --compilers coffee:coffee-script/register -R spec -u bdd -w```
* run npm test and seen your test pass

# What could have been better
The part on writing and running .coffee-files could vastly be simplified by simply running the <code>coffee</code> directly.

Create a index.coffee file in the root (<code>touch index.coffee</code>) and add the following code:

{% highlight coffeescript %}
module.exports.greeting = greeting = (name) ->
	"Hello #{name}!"

console.log greeting "Marcus"
{% endhighlight %}

Now you can start this application directly by simply invoking <code>coffee index.coffee</code>. Doing that will result in printing the greeting:

{% highlight bash %}
Hello Marcus!
{% endhighlight %}

Our start command in the package.json can also be simplified a lot in other words:

{% highlight javascript %}
"scripts": {
    "test": "mocha",
    "start" : "coffee index.coffee"
  }
{% endhighlight %}

# Testing our system
Now we can continue as I wrote to test our system under test like this:

{% highlight coffeescript %}
sut = require '../index.coffee'
should = require 'should'

describe 'Writing Node with CoffeeScript', ->
	it 'is easy to get started testing... or is it?', -> true
	it 'can access exported functions in other modules', ->
		sut.greeting('Marcus').should.equal 'Hello Marcus!'
{% endhighlight %}

# More improvements
So, that's cool, but maybe we need to distribute a JavaScript version of the code as well. Now we are really into what should be put into a build system like [grunt](http://gruntjs.com/), [gulp](http://gulpjs.com/) or even [make](https://blog.jcoglan.com/2014/02/05/building-javascript-projects-with-make/), but for the sake of brevity let's just create another npm script-node. In it we can now reuse the compile command from the previous post.

Here's how the all my scripts look in the package.json-file.

{% highlight javascript %}
"scripts": {
    "test": "mocha",
    "start" : "coffee index.CoffeDemoTheCoffeeWay",
    "build" : "coffee --compile --output dist ."
  }
{% endhighlight %}

This will compile all the .coffee files in the root (and sub directories) and put them in the <code>dist</code> folder.

# Summary
See... I told you in the header of this blog:

<blockquote>Sharing is learning</blockquote>

By sharing something I learned a better way. Thanks again Erwin!