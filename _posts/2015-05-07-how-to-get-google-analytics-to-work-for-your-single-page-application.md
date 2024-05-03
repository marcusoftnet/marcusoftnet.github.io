---
layout: post
title: "How to Get Google Analytics to Work for Your Single Page Application"
author: Marcus Hammarberg
date: 2015-05-07 10:24:43
tags:
 - Tools
 - Life of a consultant
 - Javascript
---

One of the things that becomes increasingly fascinating as I get older is the new knowledge acquired while "doing things for real". Currently, we have been building a site for my [current organization](http://ypkbksite.herokuapp.com).

We built a little CMS to drive content, and the whole page is a Single Page Application (SPA). As we approached completion, we naturally wanted to add [Google Analytics](http://google.com/analytics) to the site. Sounds simple enough.

Or maybe not... in this post, I'll describe how we got it to work for our Single Page Application. Google Analytics default setup is not built for that. And many descriptions you find [out there](https://www.google.co.id/search?q=google+analytic+spa&oq=google+analytic+spa&aqs=chrome.0.69i59j69i64.5919j0j7&sourceid=chrome&es_sm=119&ie=UTF-8) are written with a client-side framework in mind, like [Backbone.js](http://backbonejs.org).

What I write about below only requires jQuery, and that's mostly for convenience. 

As with most things I learn, it's based on others' knowledge that I tweak. In this case, I found a [GREAT article](https://mjau-mjau.com/blog/ajax-universal-analytics/) that contained much of the information I needed but didn't take me all the way. Go ahead and read it now!

## Infrastructure
The first thing we did, based on the article above, was to create a custom JavaScript function for Google Analytics tracking. Here is where we ended up:

```javascript
function gaTrack(path, title) {
  $.getScript('//www.google-analytics.com/analytics.js'); // jQuery shortcut
  window.ga = window.ga || function () { (ga.q = ga.q || []).push(arguments) }; ga.l = +new Date;
  ga('create', 'UA-YOURID', 'auto');

  var track =  { page: path, title: title};
  ga('set', track);
  ga('send', 'pageview');
};
```

- Line 1: We use jQuery to dynamically load the [Google Analytics](http://google.com/analytics) script.
- Line 2: Defines a `ga` function in our window.
- Line 3: Insert your tracking code from [Google Analytics](http://google.com/analytics).
- Line 5: A little object with the page and title is created.
- This is set and passed to the `ga` function which tracks it asynchronously to [Google Analytics](http://google.com/analytics).

## Updated Version

After some great comments by [Jim Geurts](https://twitter.com/jgeurts?lang=en), I understand that our solution went against the recommendations from the Google Analytics team. Our code, and I quote Jim, "creates a new tracker every time you track a pageview." I don't fully understand the implications of that, but somehow, as Jim kindly informed me when I asked, we need to create a tracker only on the first load of the page. Here are two new functions that do that:

```javascript
function gaInit() {
  $.getScript('//www.google-analytics.com/analytics.js'); // jQuery shortcut
  window.ga = window.ga || function () { (ga.q = ga.q || []).push(arguments) }; ga.l = +new Date;
  ga('create', 'UA-62590784-1', 'auto');

  console.log("Initialized");
  return ga;
};

function gaTrack(path, title) {
  var track =  { page: path, title: title};

  ga = window.ga || gaInit();

  ga('set', track);
  ga('send', 'pageview');

  console.log("Tracked");
};
```

- Created a new `gaInit` function that returns the object it initializes, the `ga` object.
- In the `gaTrack` function, it checks if the `window.ga` object is present. If not, it calls `gaInit()` to create it, initializing `ga` just-in-time and only the first time.

# Using It

Now, this is where that article leaves us. And at least I felt a little bit abandoned at this point because now we need to use it on A LOT of places. And I didn't really feel like writing an `onClick="ga()"` on every clickable thing on our page.

## The Easy Use

The first place we should use this function is on the main page of the application, in my case `index.html`. This is the tracking of your grandfather's, tracking the loading of a new page. Here's my code for that, placed just above the `</body>` tag:

```html
<script>
  gaTrack("/", "Beranda");
</script>
</body>
```

"Beranda" is Indonesian for "Home," which is how we will refer to this page.

## Catch'em All

However, the problem is that once the page is downloaded, there is no reload of the `index.html`. That's the whole idea of a SPA, right? How to track all the client-side navigation then?

The first problem to solve is to catch all the things that are clicked on our page. Here, jQuery comes to our help. For us, all things clickable are `a`-tags, so we could write the following function:

```javascript
$("a").click(function(evt) {
  // tracking code here
});
```

However, there are other ways to track this if you have other tags that receive clicks. For example, you could catch all clicks in the main div or even body tag, if you give it an id or a class. Let's say that your main div is defined like this: `<div id="main">`, then you can write the following function to "catch" all clicks:

```javascript
$("#main").click(function(evt) {
  // tracking code here
});
```

## Now Let's Track'em

To track it, we can simply use the `gaTrack(path, title)` we created before:

```javascript
$("a").click(function(evt) {
  var path = evt.currentTarget.pathname + evt.currentTarget.hash;
  var title = evt.currentTarget.title || evt.currentTarget.text;
  gaTrack(path, title);
});
```

On line 2, we simply pull the `pathname` and the `hash` from the `currentTarget`, which is the item clicked. This will be the `page` that we send to Google Analytics.

Line 3 requires a little more explanation. Should the `a`-tag contain text, we use that from the `.text` property. However, sometimes the `a`-tag wraps a lot of other things, divs, and images etc., and in that case, we will get that HTML code in the `.text` property.

The simple solution for us was just to add a `title`-attribute on the `a`-tag. This is a good practice anyway since that will be displayed when the user hovers

 over an image, for example.

Now, in our catch-all-click-handler, we can check if the `title`-attribute is set and if not, use the `.text`.

# Summary

With these simple functions, we have very simple, client-side Google Analytics tracking on a granularity level of our choice.
