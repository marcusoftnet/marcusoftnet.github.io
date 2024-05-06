---
layout: post
title: Marcus Node Bits - Package.json is a mighty tool
date: 2014-02-05T13:00:00.000Z
author: Marcus Hammarberg
tags:
  - MobProgramming
  - Javascript
  - Tools
modified_time: 2014-06-02T08:56:52.527Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-6766940189243715152
blogger_orig_url: http://www.marcusoft.net/2014/02/mnb-packagejson.html
---

I'm writing down some of the things I've picked up when I started to learn about [Node](http://nodejs.org/), [Express](http://expressjs.com/), and [Mongo](http://www.mongodb.org/). Here are all the posts in the series:

- [Doing stuff in the terminal is not scary at all](http://www.marcusoft.net/2014/02/mnb-terminal.html)
- [`npm` is not only for getting packages](http://www.marcusoft.net/2014/02/mnb-npm.html)
- Package.json is a mighty tool - this post
- [`git` is not that hard, but I need to refresh my knowledge](http://www.marcusoft.net/2014/02/mnb-git.html)
- [Callback function is cool stuff, and I even know how to write them](http://www.marcusoft.net/2014/02/mnb-callbacks.html)
- [`mocha` is cool both as framework and test runner](http://www.marcusoft.net/2014/02/mnb-mocha.html)
- [`should` is a nice way to do asserts](http://www.marcusoft.net/2014/02/mnb-should.html)
- [`monk` is an easy way to access mongo](http://www.marcusoft.net/2014/02/mnb-monk.html)
- [Express is best without generators](http://www.marcusoft.net/2014/02/mnb-express.html)
- [supertest is a nice way to test an api](http://www.marcusoft.net/2014/02/mnb-supertest.html)

This post is about the package.json file that is more than first meets the eye. All [node.js](http://nodejs.org/) projects with any self-respect has a package.json. All [npm-modules](https://npmjs.org/) must have one. It's a manifest file that holds various meta-data around the project. The file is, as the extension is revealing, just a JSON-file and hence easy to create in any text editor.

Some of the basic things that the file contains are:

- **name** - the name of the project (or package in the case you're building a npm-package).
- **version** - well, the version of the project.
- **description** - since js-projects *must* be named something that won't reveal their content, we need a description to tell people what the project is about. By the way, [deckchair.js](https://github.com/deckchair) is my favorite so far. Longing for noun.js, but it's still out for grabs as it seems...
- **author** - your name and contact information.

Node.js itself only understands name and version, by the way. The rest is meta-data that [npm](https://npmjs.org/) (node package manager) is using.

Other attributes I often end up using are:

- **dependencies** - this lists the other packages (and their versions) that your project is using.
- **scripts** - here you can create small build commands that npm can execute for you. The [next part of this series is about that](http://www.marcusoft.net/2014/02/mnb-npm.html).

This is a typical package.json for my projects (please note the update below after some excellent comments):

When I create a new project, I often create the package.json first of all. I fill out the things I know, and that's often the better part of the file, actually.

1. **sublime package.json** - create the file and open it with [Sublime](http://www.sublimetext.com/).
2. Copy in some template data, like [this one for example](https://gist.github.com/marcusoftnet/8763052).
3. Fill out the `name`, `description`, `version` (0.0.1) nodes of the package.json.
4. Create the `scripts` node and add scripts for starting the `app.js` file and test, with my [mocha switches](http://www.marcusoft.net/2014/02/mnb-mocha.html).
5. Create the `dependencies` node and add the things that I will be using for this project. Typically:
   - express - my web framework of choice
   - monk - if I'm going to have a db
   - mocha - my testing framework
   - should - nice assertions
   - and maybe something else.

Save the package.json and go to the terminal and go `npm install`. This will read the package.json and download and install all the dependencies into your `node_modules` folder.

If I'm adding new dependencies, I typically do that by adding them to package.json and rerun "npm install".

So the package.json is a manifest describing your project, a package manager specification that helps you update the dependencies, and a build script where you can define your own commands, all in one.

Here's an excellent interactive guide to the [package.json](http://package.json.nodejitsu.com/). If you like it static... you wouldn't do JavaScript, now would you? Any case, here's an [static page describing the package.json](https://npmjs.org/doc/json.html) file in a great way.

One final thing (as they said)... did you see that "startLocal" node under the scripts node in my package.json file above? It turns out that npm only understands a couple of scripts by default (test, start etc.), but if you want something else you can add them under the scripts node too, making your [package.json even more powerful](http://www.devthought.com/2012/02/17/npm-tricks/). You have to start these scripts like this:

`npm run-script startLocal`

**UPDATED:**  
From Mr. [Ullmark](https://twitter.com/Ullmark) I got some great tips on how to improve my knowledge. They are in the comments below, but I'll mention them here too:

- `npm init` - is an interactive tool that helps you build your package.json file. So you don't need a template to tweak but can let the tool work for you. Really nice!
- There's a `devDependencies` node in package.json, for all the things you need in development. These are testing-, assertion-, and mocking-frameworks for example. It's a good thing not to mix it up with the production dependencies for clarity and since a much smaller footprint on your production environment. [Read more here](http://blog.nodejitsu.com/package-dependencies-done-right/).
- Finally, my way to set up the test-command in the package.json required all the people that wanted to use the `npm test` command to have mocha installed globally (`npm install mocha -g`). Not everyone wants that. Build servers, for example... So I've updated it to a better version that uses the mocha I have in my project local `node_modules` folder.
