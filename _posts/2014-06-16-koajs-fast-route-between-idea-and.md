---
layout: post
title: KoaJs - the fast route between idea and production
date: 2014-06-16T13:51:00.002Z
author: Marcus Hammarberg
tags:
  - Javascript
  - Koa - Lean
  - Agile
  - ContinuousDelivery
modified_time: 2014-06-20T07:44:31.696Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-4479719224435985617
blogger_orig_url: http://www.marcusoft.net/2014/06/koajs-fast-route-between-idea-and.html
---

A couple of days ago I had a great experience in why a modular framework
is a great thing, that I wanted to share in this blog post. You will
follow the EXACT path of my thinking. Yes, it might scare you but... it
will not take very long.

Before we start, I'm sure theres a number of times when a very modular
framework, like Koa Js and NancyFx for example, might be bad too - but
for the most part I think my experience is the most common one.

In my current job, management consulting for the Salvation Army
hospitals in Indonesia, we have seen the need to do a quick poll. Simple
questions like: "What did you like your stay?", "Are you happy at work?"
or "How was your meal?".
So I built a very simple little application, using
<a href="http://www.koajs.com/" target="_blank">Koa Js</a> and called it
<a href="http://koavote.herokuapp.com/" target="_blank">KoaVote</a>.
With it you can create your own questions and then use any browser to
vote. For example the security guards close to the exit could ask people
using their phones.

For the actual voting I used four smiley-faces from
<a href="http://pixabay.com/en/users/OpenIcons/"
target="_blank">here</a>. They are very nice but quite big 3-4 kb each.
This is actually a problem with the kind of network speeds we have here
in Indonesia. Especially on phone. I thought about that.

Let's jump into my head and see. This is now real time:
12:10:30 "Hmmm... those pictures are too big.
Maybe I should just use text instead. But that's butt-ugly.
And I don't know how to design.
Maybe they should get a faster connection. Yeah, that's a good idea...
But that takes time and will cost them.

Hmmmm... oh look - my coffee. "

... \[Drank it\]

12:26:05 "Ok, I have to use the pictures but I don't want them to
download it every time. What is that called again?
Man, this is really embarrassing that I don't remember. I sure hope
nobody notice that I don't know this.
Think, brain. Think!
Cache! That's the word. I wonder if that's built into Koa Js?"
12:26:25 - \[Typed:
"<a href="http://bit.ly/SNqQvj" target="_blank">koa js cache</a>" into
Google\]
12:26:28 - "Hey, look there's a ... of course there's a middleware for
that. koa-static-cache. Let's see what that is"
12:26:34 - \[Clicked link, waited for the
<a href="https://github.com/koajs/static-cache" target="_blank">GitHub
page to load</a>\]
12:26:45 - "Ok, this looks... looks pretty sweet. Ah, here's a good
example of setting the caching for a folder.
What's that maxAge-expression... Ah - they are caching it for a year.
let's try that, but for a month in my app
12:27:10 - \[Copied the first example from the README\]
12:27:15 - \[Open Sublime and my app.js file\]
12:27:30 - "Ok... let's see. What?! Why are they requiring 'path'? Do I
need to do that? Is that part of NodeJs, or something I install? What do
they use it for? ... Ah, it's just for the path. I'll do that with a
string concatenation instead. Ok, let's go."
12:27:50 - \[pasted in and moved the require statement to the top\]
12:28:05 - \[rewrote the expression to do string concatenation to
this:

> <span
> style="font-family: Courier New, Courier, monospace;">app.use(staticCache(\_\_dirname +
> '/public/img'), { maxAge: 30 _24_ 60 \* 60 });\]

12:28:35 - "Ok, that looked simple let's try this out"
12:28:40 - \[typed
<a href="http://www.marcusoft.net/2014/02/mnb-npm.html"
target="_blank"><span
style="font-family: Courier New, Courier, monospace;">npm
start</a> at the terminal and crashed on missing package\]
12:28:50 - "Oh, man! If I had a dime every time I forget to _npm
install_ things..."
12:29:00 - \[typed <span
style="font-family: Courier New, Courier, monospace;">npm install
koa-static-cache --save in the terminal. Waited for download\]
12:29:25 - "Ok, let's see if my test broke"
12:29:26 - \[typed npm test and waited for about 1 second\]
12:29:29 - "No - that worked just fine. Does the site work?"
12:29:33 - \[typed <span
style="font-family: Courier New, Courier, monospace;">npm start,
went to http://localhost:3000\]
12:29:38 - "Hey, it comes up. How can I verify if the images are cached
or not?... If I reload... yes, it's superfast, but it was superfast
before too. But did it come over the network? How... can I see that? Ah!
The Chrome dev tools has a network tab.
12:29:52 - \[open Chrome developer tools and the network tab\]
12:30:00 - "Hey look at that. The images was not sent over the network.
Let's push this - it looks awesome!"
12:30:05 - \[typed <span
style="font-family: Courier New, Courier, monospace;">git add -all and
then git commit -m "Added caching of images".\]
12:30:15 - \[typed<span
style="font-family: Courier New, Courier, monospace;"> git push
to push it to my
<a href="https://github.com/marcusoftnet/koaVote" target="_blank">GitHub
repo</a>\]
12:30:20 - \[waited for the slow network\]
12:30:40 - \[typed <span
style="font-family: Courier New, Courier, monospace;">git push heroku
master to push to
<a href="http://www.heroku.com/" target="_blank">Heroku</a>\]
12:30:42 - \[waited while Heroku pushed to production\]
12:31:05 - "Hey it's live! Let's test it!"
12:31:10 - \[opened
[http://koavote.herokuapp.com](http://koavote.herokuapp.com/) and
clicked on one of the test questions I have there. Waited until the page
loaded. Reloaded. Open Chrome dev tools\]
12:31:37 - "If this worked I'm worth a coffee. Again?! How many is that
now today. 1 in the morning then one when I got here and then Hey - look
it's up!"
12:31:54 - "Look no network traffic for the images! Success!"

And we're back out of my brain.
That took me about 5-7 minutes. From not knowing how to solve this, to
get a middleware, copy the code, run my tests, test run my site locally
and then push it to production.

To me this is really amazing. Yes, it's a small site, but the thing is
that doesn't matter. What's important here was that I had my tooling and
continuous delivery chain up and running. That's what made it fast.

I could have and idea and try it and then within minutes push that idea
out. If it was a bad idea (let's say that Heroku didn't support caching
for example) - I could have reverted it within seconds.

You know who else does this?
<a href="http://www.facebook.com/" target="_blank">Facebook</a>,
<a href="http://www.amazon.com/" target="_blank">Amazon</a>,
<a href="http://www.google.com/" target="_blank">Google</a>,
<a href="http://www.spotify.com/" target="_blank">Spotify</a>,
<a href="http://www.ebay.com/" target="_blank">Ebay</a> and
<a href="http://www.github.com/" target="_blank">GitHub</a> to mention a
few. They push small, tiny changes to production several times a day. If
you look carefully you can see buttons move or change shape between
reloads as you use the site.

Small changes often is better then big changes seldom. I've tried them
both. I know which one I like better.

UPDATE:
I wrote a <a
href="http://www.marcusoft.net/2014/06/koajs-making-make-file-test-push-and.html"
target="_blank">follow up to this post</a> showing how I made this even
simpler with a single command in a Makefile.
