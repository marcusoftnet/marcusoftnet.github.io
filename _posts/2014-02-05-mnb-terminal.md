---
layout: post
title: Marcus Node Bits - Doing stuff in the terminal is not scary at all
date: 2014-02-05T07:00:00.000Z
author: Marcus Hammarberg
tags:
  - Node
  - Javascript
  - Life of a consultant
  - Agile
modified_time: 2014-06-02T08:56:52.504Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-2426962620931304334
blogger_orig_url: https://www.marcusoft.net/2014/02/mnb-terminal.html
---

I'm writing down some of the things I've picked up when I started to learn about [Node](http://nodejs.org/), [Express](http://expressjs.com/), and [Mongo](http://www.mongodb.org/). Here are all the posts in the series:

- Doing stuff in the terminal is not scary at all - this post
- [`npm` is not only for getting packages](https://www.marcusoft.net/2014/02/mnb-npm.html)
- [Package.json is a mighty tool](https://www.marcusoft.net/2014/02/mnb-packagejson.html)
- [`git` is not that hard, but I need to refresh my knowledge](https://www.marcusoft.net/2014/02/mnb-git.html)
- [Callback function is cool stuff, and I even know how to write them](https://www.marcusoft.net/2014/02/mnb-callbacks.html)
- [`mocha` is cool both as framework and test runner](https://www.marcusoft.net/2014/02/mnb-mocha.html)
- [`should` is a nice way to do asserts](https://www.marcusoft.net/2014/02/mnb-should.html)
- [`monk` is an easy way to access mongo](https://www.marcusoft.net/2014/02/mnb-monk.html)
- [Express is best without generators](https://www.marcusoft.net/2014/02/mnb-express.html)
- [supertest is a nice way to test an api](https://www.marcusoft.net/2014/02/mnb-supertest.html)

This post is about the terminal and how I got to use it more and more, with just a couple of simple commands.

I'm a Microsoft developer and am used to Visual Studio. Very nice, very integrated environment with shiny buttons, menus or key shortcuts to execute.

The terminal (yes, I'm on OS X - but embrace the CMD if you're on Windows) windows was a lonely void space for me. But I've now embraced it. And after a while, I picked up a small number of commands that got me around.

This is what I do when I start a new node project:

- `clear` - to get rid of all the stuff in the window when I start. I like my terminal nice and clean.
- `pwd` - to know which directory I'm in. And it has nothing to do with passwords, it's "present working directory".
- `cd ~/Projects/NodeStuff` - to get to my Node directory in my Project-directory, where I've stored all the Node stuff.
- `mkdir TheNewProject` - to create a new folder for "the new project".
- `cd TheNewProject` - to get into TheNewProject-directory.
- `mkdir test` - to create a test directory.
- `touch package.json` - to create a package.json file. See [this post](https://www.marcusoft.net/2014/02/mnb-packagejson.html) for more on that file and its awesome capabilities.
- `sublime .` - to open the current directory with Sublime Text 2. You can of course open it in another editor too.

Until that point, I've only been in the terminal window. This takes me about 10 - 20 seconds to do, depending on how long it takes for me to find the "~" button on my keyboard (ALT+^ on Swedish keyboards, remember that Marcus!).

Oh yeah, I'm running the terminal in a window that covers the screen from top to bottom and about half the window in size. And I'm using the slick Pro-profile that gives it a nice transparent look.
