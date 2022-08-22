---
layout: post
title: Meteor and the 'Uncaught SyntaxError: Unexpected token Y' error
author: Marcus Hammarberg
date: 2015-06-05 10:39:14
tags:
 - Javascript
 - Tools
---

Right now my head is spinning from the awesomeness that is [Meteor](http://meteor.com). I am somewhere in between "This is too much magic to really believe..." and "Wow - why have I ever built anything with anything else before!".

Just a short little post about an error that have caused me problems. Here's the error, that most likely pops up in your browser console:

<code>Uncaught SyntaxError: Unexpected token Y</code>

<!-- excerpt-end -->

# TL;DR - Reload your browser
This is a Javascript parsing error, when trying to parse a very helpful error message from Meteor. Just reload the page and you'll see the message.

# Longer ... but still short and sweet

## The background
Meteor is super helpful in many ways. Creating an app is just three small steps:

```bash
meteor create myPrecious
cd myPrecious
meteor
```

That last one is very special. That starts the application and live reloads the page for every change you make. So you litterally write that <code>meteor</code> command once and then open a new tab / window where you install packages, add files etc. It's always running.

The moment you make any changes in your application any browser pointing to it is reloaded too. Yes, Meteor has built in [LiveReload]().

## The tripping-up
But this helpfulness is what trips me up. Because now Meteor is running away in the background and I never look there again. When I mess up a <code><template></code> tag, for example, I will not see the helpful message it spits out:

```bash
=> Errors prevented startup:

   While building the application:
   client/components/poll-form.html:26: bad formatting in HTML template
```

Instead I only get a blank page in my browser after the change, and when I look in the console I see a JavaScript error: <code>Uncaught SyntaxError: Unexpected token Y</code>.

## Fix it with reload. Yes, manually!
Now, this is the first time you actually need to reload the browser manually. Which quite frankly, feels really cumbersome (!) after being spoiled by Meteor all this time. Imagine that.

Once you reload the browser all is clear and helpful again. This is the text that Meteor sends to the client.

```bash
Your app is crashing. Here's the latest log.

=> Meteor server restarted
Errors prevented startup:

While building the application:
client/components/poll-form.html:25: bad formatting in HTML template

Your application has errors. Waiting for file change.
```

The <code>Unexpected token Y</code> is the start of <code>Your</code>, that JavaScript tries to make sense of.

# Summary
Should you see the <code>Uncaught SyntaxError: Unexpected token Y</code> remember the old days and just reload the browser window. It's a hassle I know :)