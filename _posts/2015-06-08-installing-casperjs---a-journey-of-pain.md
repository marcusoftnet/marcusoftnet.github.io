---
layout: post
title: "Installing CasperJs - a journey of pain"
author: "Marcus Hammarberg"
date: 2015-06-08 09:56:23
tags:
 - Javascript
 - Tools
---

My friends on twitter keeps telling my that [CasperJs](http://casperjs.org/) is great ("da bomb") for end-to-end-testing. Since I've been doing a lot of that, [in .NET](http://www.marcusoft.net/2012/05/specflow-page-objects-and.html) I took a look and it looks great. 

I thought to myself: "Let's install it and play around. How hard can it be?" Well as it turns out... for me at least, the installing part was a pain. 

I'm on OS X Yosemite and I had nothing but problems. Yesterday I got it to work. This is my story. 

<a name='more'></a>

I started out from the [CasperJs](http://casperjs.org) [installation instructions](http://docs.casperjs.org/en/latest/installation.html), but soon ran into problems. Not with Casper but rather with: 

# The Phantom menace
[CasperJs](http://casperjs.org/) is, to my knowledge, just a wrapper around [PhantomJS](http://www.phantomjs.org/), a WebKit headless browser. So first we need to install that. 

When you go to their website there's actually no installation instructions (?) but rather [instructions to download](http://phantomjs.org/download.html). This gives us a big old binary, unzipped, in the <code>[path where you downloaded]/[name of zip]/bin/phantomjs</code>. 

At this point I felt a little bit stupid, since I wanted this to be globally available on my system. Like in a <code>/bin</code>-folder for my user or something. 

As it [turns out](http://superuser.com/questions/7150/mac-osx-conventional-places-where-binary-files-should-live) there is something like that. And it even has a good name, once you know where it is: <code>/usr/bin</code>. 

Now we can just copy the file there: 

```bash
$ cp ~/Downloads/phantomjs-2.0.0-macosx/bin/phantomjs /usr/bin
```

Restart your terminal (or wait till CasperJs is install) and now it works. 

## Yes yes ... I know about Homebrew
You can also supposedly install [PhantomJS](http://www.phantomjs.org/) via [HomeBrew](http://brew.sh/):

```bash
$ sudo brew update && brew install phantomjs
```

For example. For the life of me I couldn't get this to work. I'm blaming Indonesian internet speed. But that's an option. Should you for any other reason don't wanna use HomeBrew you now have an option. 

# CasperJs
At this point it was much smoother. Installing CasperJs is a breeze and can be done with HomeBrew again. And it worked on the first try for me: 

```bash
$ brew update
$ brew install casperjs 
```

On the second command you can add <code>--devel</code> to get the latests bits. I didn't do that but you can.

Restart you terminal again and then try <code>casperjs --version</code> to see that it works.

## Casper via npm
CasperJs is also installable via <code>npm</code> but I had problems getting that to play nicely. Most likely due to the messed up PhantomJs installations.  

It's just <code>npm install casperjs -g</code> to install it on your system. 

# Trying it out
Another, more fun, way to verify it is to write a small script. Like the example Casper provides, for example;

```javascript
var casper = require('casper').create();

casper.start('http://casperjs.org/', function() {
    this.echo(this.getTitle());
});

casper.thenOpen('http://phantomjs.org', function() {
    this.echo(this.getTitle());
});

casper.run(); 
```

Of course, before that, you need to create a new directory and then <code>npm init</code>. I could *not* get it to work when I <code>npm install casperjs</code> so I gave up on that. Here's the commands I ran.:

```bash
$ mkdir casperdemo && cd casperdemo
$ npm init
$ touch demo.js
```

In the <code>demo.js</code> file you enter the code above. And the you run it, of course, with <code>node demo.js</code>.... NO - that's wrong. 

You start the file with the <code>casperjs demo.js</code> command. Otherwise you will get an error like <code>Error: Cannot find module 'casper'</code>, which kind of make sense since it's not installed. 

When we go <code>casperjs demo.js</code> it works!

# Extra points - Nightmare

There's a wrapper API around Casper that is called [Nightmare](https://www.npmjs.com/package/nightmare). It looks nice. 

That's is just an npm package, so installing Nightmare is just going <code>npm install nightmare --save-dev</code>. 

Show it fail... (which it did for me of course) ... you can always try to reinstall phatomjs with <code>sudo brew update && brew install phantomjs</code>. 

With Nightmare installed you can write very fluent looking code like this: 

```javascript
var Nightmare = require('nightmare');
new Nightmare()
  .goto('http://yahoo.com')
    .type('input[title="Search"]', 'github nightmare')
    .click('.searchsubmit')
    .run(function (err, nightmare) {
      if (err) return console.log(err);
      console.log(nightmare);
      console.log('Done!');
    });
```


# Summary 
All-in-all this is probably the worst installation experience I've had on the Os X as a developer. I don't know why, more often it's super smooth. This was a lot of hick-ups. Now it works. 

And CasperJs (and Nightmare) looks great. 