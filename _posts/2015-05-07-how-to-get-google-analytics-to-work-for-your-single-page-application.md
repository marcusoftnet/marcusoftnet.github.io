---
layout: post
title: "How to get Google Analytics to work for your Single Page Application"
author: "Marcus Hammarberg"
date: 2015-05-07 10:24:43
tags:
 - Tools
 - Life of a consultant
 - Javascript
---

One of the things that gets increasingly fascinating the older I get is the new stuff you pick up as you "do things for real". Right now we have been building a site for my [current organisation](http://ypkbksite.herokuapp.com).

We built a little CMS to drive content and the whole page is a Single Page Application (SPA). As we approached being finished we of course wanted to add [Google Analytics](http://google.com/analytics) to the site. Dead simple.

Or not maybe ... in this post I'll describe how we got it to work for our Single Page Application. Google Analytics default was is not built for that. And many descriptions you will find [out there](https://www.google.co.id/search?q=google+analytic+spa&oq=google+analytic+spa&aqs=chrome.0.69i59j69i64.5919j0j7&sourceid=chrome&es_sm=119&ie=UTF-8) is written based with a client-side framework in mind, like [Backbone.js](http://backbonejs.org). 

What I write about below only requires jQuery, and that's mostly for convience. 
<a name='more'></a>
As with most things I learn it's based on others knowledge that I just tweak and in this case I found a [GREAT article](https://mjau-mjau.com/blog/ajax-universal-analytics/) that contained much of the information I need, but didn't take me all the way. Go ahead and read it now!

# Infrastructure
The first thing we did, based on the article above, was to create a custom javascript function for Google Analytics tracking. Here is where we ended up:

{% highlight javascript linenos %}
function gaTrack(path, title) {
$.getScript('//www.google-analytics.com/analytics.js'); // jQuery shortcut
  window.ga = window.ga || function () { (ga.q = ga.q || []).push(arguments) }; ga.l = +new Date;
  ga('create', 'UA-YOURID', 'auto');

  var track =  { page: path, title: title};
  ga('set', track);
  ga('send', 'pageview');
};
{% endhighlight %}

* On line 1 we use jQuery (you can do this without jQuery if you check the end of the [mentioned article](https://mjau-mjau.com/blog/ajax-universal-analytics/)) to dynamically load the [Google Analytics](http://google.com/analytics) script
* Line 2 defines a <code>ga</code> function in our window
* Line 3 is where your insert your tracking code from [Google Analytics](http://google.com/analytics)
* On line 5 a little object with the page and title is created
* This is set and passed to the <code>ga</code> function which tracks it, asynchronously, to [Google Analytics](http://google.com/analytics)

# Using it
Now, this is where that article leaves us. And at least I felt a little bit abandoned at this point. Because now we need to use it... on A LOT of place. And I didn't really felt like writing a <code>onClick="ga()"</code> on every thing click-able in our page.

## The easy use
The first place we should use this function is on the main page of the application, in my case <code>index.html</code>. This is the tracking of your grandfathers, tracking the loading a new page. 

Here's my code for that, placed just above the <code>&t;/body&gt;</code>-tag:
{% highlight html %}
	<script>
      gaTrack("/", "Beranda");
    </script>
</body>
{% endhighlight %}

"Beranda" is Indonesian for "Home", which is how we will refer to this page. 

Well, that was easy.

## Catch'em all
However, the problem is that once the page is downloaded there is no reload of the <code>index.html</code>. That's the whole idea of a SPA, right? How to track all the client-side navigation then? 

First problem to solve is to catch all the things that's clicked on our page. Here jQuery comes to our help. For us, all things click-able are <code>a</code>-tags so we could write the following function:
{% highlight javascript %}
$("a").click(function(evt) {
  // tracking code here
});
{% endhighlight %}

However, there are other ways to track this, should you have other tags that recieve clicks. For example you could catch all clicks in the main div, or even body tag, if you give it an id or a class. Let's say that your main div is defined like this <code><div id="main"></code>, then you can write the following function to "catch" all clicks:
{% highlight javascript %}
$("#main").click(function(evt) {
  // tracking code here
});
{% endhighlight %}
## Now let's track'em
To track it we can simply use the <code>gaTrack(path, title)</code> we created before:
{% highlight javascript %}
$("a").click(function(evt) {
  var path = evt.currentTarget.pathname + evt.currentTarget.hash;
  var title = evt.currentTarget.title || evt.currentTarget.text;
  gaTrack(path, title);
});
{% endhighlight %}

On line 2 we simply pull the <code>pathname</code> and the <code>hash</code> from the <code>currentTarget</code> which is the item clicked. This will be the <code>page</code> that we send to Google Analytics.

Line 3 requires a little more explanation. Should the <code>a</code>-tag contain text we use that from the <code>.text</code> property. Here's an example of such a link:
{% highlight html %}
<a class="page-scroll" href="#articles">Artikel</a>
{% endhighlight %}

However, sometimes the <code>a</code>-tag wraps a lot of other things, divs and images etc. and in that case we will get that html-code in the <code>.text</code>-property. 

Here's such an example:
{% highlight html %}
<a href="#article-{{ article.slug }}" class="modal-link" data-toggle="modal">
    <div class="list-item-hover">
        <div class="list-item-hover-content">
            <i class="fa fa-plus fa-3x"></i>
        </div>
    </div>
    <img src="{{ article.imgURL }}" class="img-responsive" alt="">
</a>
{% endhighlight %}

The simple solution for us was just to add a <code>title</code>-attribute on the <code>a</code>-tag. This is a good practice anyway since that will displayed when the user hovers over an image for example. 

Here's an example on how that can look:
{% highlight html %}
<a href="#article-{{ article.slug }}" title="{{ article.title }}" class="modal-link" data-toggle="modal">
{% endhighlight %}

Now in our catch-all-click-handler we can check if the <code>title</code>-attribute is set and if not use the <code>.text</code>

{% highlight javascript %}
var title = evt.currentTarget.title || evt.currentTarget.text;
{% endhighlight %}

# Summary
With these simple functions we got very simple, client-side Google Analytics tracking on a granularity level of our choice.