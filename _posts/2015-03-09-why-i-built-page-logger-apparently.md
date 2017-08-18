---
layout: post
title: "Why I built page-logger... and how it made me money"
author: "Marcus Hammarberg"
date: 2015-03-09 15:49:29
tags:
 - Javascript
 - NodeJs
 - Koa
 - Agile
 - Lean
---

I wrote a little application called [page-logger](https://page-logger.herokuapp.com/) for purely selfish and lazy reasons. It was fast, quite fun, I learned a lot and apparently I could make MONEY by using it. Which I didn't thought of when I wrote it.

In this post I'll take you through some code, point to some things that I learned and finally some thoughts about learning from your data. I hope you like it.

<a name='more'></a>
# Why I built page-logger
I've been using [Blogger](http://www.blogger.com) for a very long time. From when I started to blog (2006... oh my) until early last year... OMG - I've been doing this for 9 years.

Oh, sorry... got lost in sentimentality there. Ok - last year I switched to [Jekyll](http://jekyllrb.com) hosted on [GitHub](http://www.github.com). That's worked out very well.

However - there's a nice feature of Blogger that I was missing. There's a lightweight Google Analytics built into Blogger. It's great for tracking how individual posts was received (read: did anyone read that?).

Yes, yes ... I'm sure that can be read out of Google Analytics too, but; firstly I don't know how, secondly I'm a coder and I wanted to build something. Hence: I tried to build it myself.

# How I built page-logger - and what I learned
My platform of choice (for now) is [NodeJs](http://nodejs.org) using the execellent [Koa](http://koajs.com) framework.

Basically the application fell out in two simple parts;

* An API reachable of HTTP that you can post pageviews to
* A simple site that shows the data

The site is very simple and traditional, so not of much interest (he said hoping that the rest would be interesting...), although I had great fun learning about [chart.js](http://www.chartjs.org/) - a great tool. Here I one [example on how I use it](https://page-logger.herokuapp.com/url/http%3A%2F%2Fwww.marcusoft.net%2F2014%2F01%2Fshare-your-internet-connection-via-wifi.html)

## The API

The API part is more interesting, and was exceedingly simple... or so it seemed. Here's the meat of the implementation, all of the code can be found [here](https://github.com/marcusoftnet/page-logger)

```javascript
var parse = require("co-body");
var monk = require('monk');
var wrap = require("co-monk");
var pageViews wrap(db.get("page_views"));

module.exports.storePageView = function *(){
	var postedPageview = yield parse(this);

	// Validating parameters needed (url and title)
	var toStore = {
		appname : applicationName,
		url : postedPageview.url,
		title : postedPageview.title,
		viewedAt : new Date,
		hits : 1
	};

	// Store in Mongo
	// Aggregating pageviews per day
	var existingPost = yield pageViews.findOne(
		{ $and: [
			{ url : toStore.url},
			{ viewedAt : {
				$gt : helpers.startOfDay(toStore.viewedAt),
				$lt : helpers.endOfDay(toStore.viewedAt)
			}}
		]}
	);

	// insert or update in database
	if(helpers.exists(existingPost)){
		yield pageViews.update(
			{ _id : existingPost._id},
			{ $inc: { hits : 1}},
    		{ upsert : true, safe : false}
    	);
	}
	else {
		yield pageViews.insert(toStore);
	}

	this.status = 201; //Created - we don't supply a way to get the resource back out
};
```

## CORS

Yeah, there's a small app.js as well that sets up a route for POST to "/api/pageview", but that is outside the interest of this post. See the [code](https://github.com/marcusoftnet/page-logger)

Now I ran into two problems; firstly I'm posting page-views from my [blog](http://www.marcusoft.net) at www.marcusoft.net to the domain of the [page-logger application](http://page-logger.herokuapp.com) page-logger.herokuapp.com. That's not ok if I remember correctly.

Secondly anyone can post to this endpoint and I will swallow it, potentially flooding my database.

[CORS](http://en.wikipedia.org/wiki/Cross-origin_resource_sharing) is a way to fix that. And with the amazing plethora of [middlewares for Koa](https://github.com/koajs/koa/wiki) this was supersimple to implement. [Koa-Cors](https://www.npmjs.com/package/koa-cors) is the telling name of the middleware I used;

```javascript
// app.js
var app = module.exports = require("koa")();
var cors = require("koa-cors");
var config = require("./config/index.js")();

// Configuration
app.use(cors()); // Yup, this is it!

// routes
var apiRoutes = require("./routes/apiRoutes.js");
app.use(route.post("/api/pageview", apiRoutes.storePageView));

// Start up
app.listen(config.port);
console.log("Started, with the following configuration: ");
console.log(config);
```

As you can see, on line 7, in it's simplest form CORS is just one line, telling our application to use it (<code>app.use()</code>). Now, what does that mean?

It simply checking the presence of a header called "Origin" that reflects all where the HTTP-request came from, and setting a "Access-Control-Allow-Origin" CORS header that is returned to the client. This is like the handshake of CORS.

## The client
Now, in my client, I had to set the Origin-header... I thought. But it turns out that header is set automatically by modern browsers as you do Cross-domain requests.

This means that the client really can be just this simple [JQuery](http://jquery.com/):

```javascript
function logPageView() {
    var pageViewData = {
        title  : document.title,
        url    : document.location.origin +
                 document.location.pathname
    };

    $.post(
    	"https://page-logger.herokuapp.com/api/pageview",
    	pageViewData,
    	function() {
        	console.log(pageViewData.title + " logged - no errors");
    	}
    );
};

```

Here I'm constructing all my required parameters from a the current document meaning that this function is easy to kick-off at the end of the page, once it's loaded. I could even put it into a .js-file that on the page-logger-site and just reference that from my blog. If I wanted to.

## Access limitations
I needed one more part to limit the access to my application and that was to only allow the applications / sites that I had given access. I did this as simple as possible by just storing the name of the sites I allow as [configuration parameters](http://www.marcusoft.net/2015/02/config-handling-in-node-and-heroku---with-secrets.html).

When a page-view is process I make a very simple validation against the sites I've listed in my configuration object (<code>config.clients</code>), that is just an array of parsed configuration string.

```javascript

module.exports.storePageView = function *(){

	// other code shown before

	if(!exists(this.get("origin"))){
		return setError(this, "Application needs to be supplied in the Origin-header");
	}
	var applicationName = getAppName(this.get("origin"));

	if(!arrayElementExists(config.clients, applicationName)){
		console.log('Denied: ' + applicationName);
		return setError(this, "Application not approved");
	}

	// other code shown before
};

function exists (value) {
	if(value === undefined)
		return false;
	if(value === null)
		return false;
	return true;
};

function getAppName (originHeader){
	var origin = originHeader || "";
	var protocolDelimiter = "://";
	var index = origin.indexOf("://");
	return index > -1 ? origin.slice(index + protocolDelimiter.length) : origin;
}

function arrayElementExists (arr, element) {
	return arr.indexOf(element)>-1;
}
```

And that takes care of this, in a very simple, straight-forward way. It most certainly can be more secure, but it works for me.

# What I gained by building page-logger
Ok, so I built a simple tool, that already exists, coding something that could be more secure, spending time creating it... I heard you all in one voice:

<blockquote>WHY?! Dear Lord. Why?</blockquote>

Well, first and foremost I did it to learn. And I learned a lot. GOAL #1 - Accomplished!

Secondly ... I've made money from this already. Yes. It's crazy. Money.

I went through the [report for the best pages this month](https://page-logger.herokuapp.com/www.marcusoft.net?filter=month) (see, easy URL access, public for all... #transparency for the win!) and found my top 5 posts.

I don't really like ads, especially not on a blog, but I thought I'd make a little experiment. First I added an AdSense ad at the bottom of the #1 [blog post](http://www.marcusoft.net/2014/01/share-your-internet-connection-via-wifi.html) on the blog.

This is very unobtrusive ad-placement and only on the places where it actually mattered - the #1 blog post. I ran that for one week. Then I took the next step of my experiment:

I extended that to the top 5 posts. Still very few posts overall and not on the first page of the blog.

And sure enough:

<img src="/img/adsenseReport.jpg" width="100%">

Yeah, it's ridiculously little money, but the improvement keeps climbing. But see at the improvements. I could do that with very little effort by listening to the data and change based on it.

I found that fascinating.

# Summary
All in all this was a fun little side project that thought me a lot. Just like I like them. I hope you found this useful and can build something better with the things you learned here.

Please tell me if you do.
