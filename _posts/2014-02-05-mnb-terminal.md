---
layout: post
title: Marcus Node Bits - Doing stuff in the terminal is not scary at all
date: 2014-02-05T07:00:00.000Z
author: Marcus Hammarberg
tags:
  - MobProgramming
  - Javascript
  - Life of a consultant
  - Agile
modified_time: 2014-06-02T08:56:52.504Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-2426962620931304334
blogger_orig_url: http://www.marcusoft.net/2014/02/mnb-terminal.html
---




I'm writing down some of the things I've picked up when I started to
learn
about <a href="http://nodejs.org/" target="_blank">Node</a>, <a href="http://expressjs.com/" target="_blank">Express</a> and <a href="http://www.mongodb.org/" target="_blank">Mongo</a>.
Here are all the post in the series:

- Doing stuff in the terminal is not scary at all - this post
- <a href="http://www.marcusoft.net/2014/02/mnb-npm.html"
    target="_blank">npm is not only for getting packages</a>
- <a href="http://www.marcusoft.net/2014/02/mnb-packagejson.html"
    target="_blank">Package.json is a mighty tool</a>
- <a href="http://www.marcusoft.net/2014/02/mnb-git.html"
    target="_blank">Git is not that hard, but I need to refresh my
    knowledge</a>
- <a href="http://www.marcusoft.net/2014/02/mnb-callbacks.html"
    target="_blank">Callback function is cool stuff, and I even know how to
    write them</a>
- <span
    style="color: #0000ee; text-decoration: underline;"><a href="http://www.marcusoft.net/2014/02/mnb-mocha.html"
    target="_blank">mocha is cool both as framework and test runner</a>
- <a href="http://www.marcusoft.net/2014/02/mnb-should.html"
    target="_blank">Should is a nice way to do asserts</a>
- <a href="http://www.marcusoft.net/2014/02/mnb-monk.html"
    target="_blank">monk is an easy way to access mongo</a>
- <a href="http://www.marcusoft.net/2014/02/mnb-express.html"
    target="_blank">Express is best without generators</a>
- <a href="http://www.marcusoft.net/2014/02/mnb-supertest.html"
    target="_blank">supertest is a nice way to test an api</a>

This post is about the terminal and how I got to use it more and more,
with just a couple of simple commands.

I'm a Microsoft developer and is used with Visual
Studio. Very nice, very integrated environment with shiny buttons, menus
or key shortcuts to execute.

The terminal (yes, I'm on OS X - but embrace the CMD if you're on
Windows) windows was a lonely void space for me. But I've now embraced
it. And after awhile I picked up a small number of commands that got me
around.

This is what I do when I start a new node project:

- <span
    style="font-family: Courier New, Courier, monospace;">clear -
    to get rid of all the stuff in the window when I start. I like my
    terminal nice and clean.
- <span
    style="font-family: Courier New, Courier, monospace;">pwd -
    to know which directory I'm in. And it has nothing to do with
    passwords, it's "present working directory"
- <span style="font-family: Courier New, Courier, monospace;">cd
    \~/Projects/NodeStuff - to get to my Node directory in my
    Project-directory, where I've stored all the Node stuff
- <span style="font-family: Courier New, Courier, monospace;">mkdir
    TheNewProject - to create a new folder for "the new project"
- <span style="font-family: Courier New, Courier, monospace;">cd
    TheNewProject - to get into TheNewProject-directory
- <span style="font-family: Courier New, Courier, monospace;">mkdir
    test - to create a test directory
- <span style="font-family: Courier New, Courier, monospace;">touch
    package.json - to create a package.json file. See
    <a href="http://www.marcusoft.net/2014/02/mnb-packagejson.html"
    target="_blank">this post</a> for more on that file and it's awesome
    capabilities.
- <span style="font-family: Courier New, Courier, monospace;">sublime
    . - to open the current with sublime text 2. You can of
    course open it in another editor too.  

Until that point I've only been in the terminal window. This takes me
about 10 - 20 seconds to do, depending on how long it takes for me to
find the "\~"-button on my keyboard (ALT+^-button on Swedish keyboards,
remember that Marcus!).

Oh yeah, I'm running the terminal in a window that covers the screen
from top to bottom and about half the window in size. And I'm using the
slick Pro-profile that gives it a nice transparent look.
