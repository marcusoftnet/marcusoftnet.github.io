---
layout: post
title: KoaJs Making the make file test, push and all that
date: 2014-06-19T13:05:00.002Z
author: Marcus Hammarberg
tags:
  - Node
  - Javascript
  - Tools
  - Koa
  - Agile
  - ContinuousDelivery
modified_time: 2014-06-19T13:11:11.132Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-6635224330936661017
blogger_orig_url: https://www.marcusoft.net/2014/06/koajs-making-make-file-test-push-and.html
---




The last couple of days I have enjoyed the speed and easy-going-flow
that <a href="http://nodejs.org/" target="_blank">Node</a>,
<a href="http://koajs.com/" target="_blank">KoaJs</a> and
<a href="http://www.heroku.com/" target="_blank">Herkou</a> gives me.
It's truly blows me away and I have been tweeting stuff like:

> Once [@heroku](https://twitter.com/heroku) tool belt is set up the
> first time deployment is SILLY simple. I’m talking 20 seconds,
> including
> [\#mongodb](https://twitter.com/search?q=%23mongodb&src=hash)
> provisioning
> [\#amazed](https://twitter.com/search?q=%23amazed&src=hash)
> — Marcus Hammarberg (@marcusoftnet) [June 18,
> 2014](https://twitter.com/marcusoftnet/statuses/479243915606781954)

and

> Again: From idea (we should put this into prod now) to complete: 25
> min. [\#koaJs](https://twitter.com/search?q=%23koaJs&src=hash)
> [\#heroku](https://twitter.com/search?q=%23heroku&src=hash)
> [\#nodejs](https://twitter.com/search?q=%23nodejs&src=hash) Like last
> time: <http://t.co/GSvpuV4xsA>
> — Marcus Hammarberg (@marcusoftnet) [June 18,
> 2014](https://twitter.com/marcusoftnet/statuses/479247826224832513)

But... In one regard I have lied. I told
<a href="https://twitter.com/WoodyZuill" target="_blank">Woody Zuill</a>
(friend and role model) that I could push to production with a single
command. While that was true the command (<span
style="font-family: Courier New, Courier, monospace;">git push heroku
master) did just that. Push to Heroku. But I wanted it to test my
code, version it, push to GitHub and then push to Heroku. You know - all
the continuous delivery stuff.

I had to look into the "scary" domain of Makefiles. Untravelled
territory for me. I thought it was scary but it was just a bit weird and
I actually got something nice to work.

This post described what I did - and how I redeemed my statement to
Woody so that deploying to production is in fact one command (about 25
seconds).
The Makefile I created took inspiration from
<a href="https://github.com/visionmedia/co-monk"
target="_blank">VisionMedia's in co-monk</a> and this <a
href="http://andreypopp.com/posts/2013-05-16-makefile-recipes-for-node-js.html"
target="_blank">article</a>. And
<a href="http://chrisadams.me.uk/2012/10/21/understanding-make/"
target="_blank">I read this to sort out some quirks</a>, like .PHONY and
one-liners (for the record... both of those are really strange - get to
know them).

With the <a href="http://en.wikipedia.org/wiki/Make_(software)"
target="_blank"><span
style="font-family: Courier New, Courier, monospace;">make
utility</a>, found on LINUX and OS X systems you can very easily define
tasks and then chain them together to form more advanced commands. For
example this creates a task named <span
style="font-family: Courier New, Courier, monospace;">test that
runs <span
style="font-family: Courier New, Courier, monospace;">mocha with
a lot of flags that I couldn't care less of typing.

Ok, you say. I can do that with package.json and npm too -
<a href="https://www.marcusoft.net/2014/02/mnb-packagejson.html"
target="_blank">picked it up from you blog actually</a>.

Well, there are something that you wouldn't want to, or just can't do
inside a simple package.json script. For example, here's a task (that
I've ripped <a
href="http://andreypopp.com/posts/2013-05-16-makefile-recipes-for-node-js.html"
target="_blank">right off from here</a>) that increments the version
number, updates the package.json file and then commits those changes to
git.

It looks horrendous but it's basically executing a string of node code
to update the package.json and then just use ordinary git bash commands
to tag with the version number.
Oh, I ran into problems with this task since it's actually using a
<a href="https://www.npmjs.org/package/semver" target="_blank">NPM
package called semver</a>. Nothing strange with the package but it of
course needs to be installed in your node_modules-folder. Preferably you
do that with:

> <span style="font-family: Courier New, Courier, monospace;">npm
> install semver --save-dev

This stores the semver dependency in your package.json as a development
time dependency. Which is exactly as it should be.

I then created a couple of other small tasks with finally made me write
the <span
style="font-family: Courier New, Courier, monospace;">deployProd task.
The task does the following:

- runs my tests
- use the release-function defined above to create a new minor (0.X.0)
    release
- commits and tag that in git
- push to github
- push to heroku
- launches the site in my browser for verification

(This could be preceded by a build task if you're minimising,
transforming your code from CoffeeScript or TypeScript, or doing some
other mangling of the code.)

And thanks to <span
style="font-family: Courier New, Courier, monospace;">make's
built in-features the command halts if anything didn't worked as
expected, the test failed for example.

The task code? Well it's almost just reading the list above out loud.

> <span
> style="font-family: Courier New, Courier, monospace;">deployProd: test
> createMinorRelease pushGithub pushHeroku launch

Here's the entire makefile.

There! I'm not lying to Woody anymore. Feels great. For more than just
that reason. Because now I truly have 1 single command to deploy my
application properly.
