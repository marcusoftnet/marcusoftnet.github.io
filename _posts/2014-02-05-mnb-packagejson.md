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


<div>

I'm writing down some of the things I've picked up when I started to
learn
about <a href="http://nodejs.org/" target="_blank">Node</a>, <a href="http://expressjs.com/" target="_blank">Express</a> and <a href="http://www.mongodb.org/" target="_blank">Mongo</a>.
Here are all the post in the series:

- <a href="http://www.marcusoft.net/2014/02/mnb-terminal.html"
    target="_blank">Doing stuff in the terminal is not scary at all</a>
- <a href="http://www.marcusoft.net/2014/02/mnb-npm.html"
    target="_blank">npm is not only for getting packages</a>
- Package.json is a mighty tool - this post
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

This post is about the package.json file that is more than first meets
the eye.
All
<a href="http://nodejs.org/" target="_blank">node.js</a> projects with
any self-respect has a package.json. All
<a href="https://npmjs.org/" target="_blank">npm-modules</a> must have
one. It's a manifest file that holds various meta-data around the
project. The file is, as the extension is revealing, just a JSON-file
and hence easy to create in any text editor.

Some of the basic things that the file contains are:

- **name** - the name of the project (or package in the case your
    building a nom-package).
- **version** - well the version of the project
- **description** - since js-project *must* be named something that
    won't reveal it's content we need a description to tell people what
    the project is about. Btw
    <a href="https://github.com/deckchair" target="_blank">deckchair.js</a>
    is my favourite so far. Longing for noun.js, but it's still out for
    grabs as it seems...
- **author** - your name and contact information

Node.js itself only understands name and version btw. The rest is
meta-data that <a href="https://npmjs.org/" target="_blank">npm</a>
(node package manager) is using.

Other attributes I often end up using are:

- **dependencies** - this list the other packages (and their version)
that your project is using.
- **scripts** - here you can create small build commands that npm can
execute for you. The
<a href="http://www.marcusoft.net/2014/02/mnb-npm.html"
target="_blank">next part of this series is about that.</a>

This is a typical package.json for my projects (please note the update
below after some excellent comments):

When I create a new project, I often create the package.json first of
all. I fill out the things I know, and that's often the better part of
the file, actually.

<span
style="font-family: Courier New, Courier, monospace;">sublime
<span
style="font-family: Courier New, Courier, monospace;">package.json -
create the file and open it with
<a href="http://www.sublimetext.com/" target="_blank">Sublime</a>.

copy in some template data, like
<a href="https://gist.github.com/marcusoftnet/8763052"
target="_blank">this one for example</a>

fill out the <span
style="font-family: Courier New, Courier, monospace;">name, description,
version (0.0.1) nodes of the package.json

create the <span
style="font-family: Courier New, Courier, monospace;">scripts
node and add scripts for starting the app.js file and test, with my
<a href="http://www.marcusoft.net/2014/02/mnb-mocha.html"
target="_blank">mocha switches.</a>

create the <span
style="font-family: Courier New, Courier, monospace;">dependencies
node and add the things that I will be using for this project. Typically

- express - my web framework of choice
- monk - if I'm going to have a db
- mocha - my testing framework
- should - nice assertions
- and maybe something else

Save the package.json and go to the terminal and go <span
style="font-family: Courier New, Courier, monospace;">npm
install. This will read the package.json and download and install
all the dependencies into your node_modules-folder.

If I'm adding new dependencies I typically do that by adding them to
package.json and rerun "npm install". You can do

> <span style="font-family: Courier New, Courier, monospace;">npm
> install \[package name\] --save

which will update the package.json for you, but I don't do that.

So the package.json is a manifest describing your project, a package
manager specification that helps you update the dependencies and build
script where you can define your own commands, in one.

Here's an excellent interactive guide to the
[package.json](http://package.json.nodejitsu.com/). If you like it
static... you wouldn't do JavaScript, now would you. Any case here's an
<a href="https://npmjs.org/doc/json.html" target="_blank">static page
describing the package.json</a> file in an great way.

One final thing (as they said)... did you see that "startLocal"-node
under the scripts-node in my package.json file above? It turns out that
npm only understands a couple of scripts by default (test, start etc.)
but if you want something else you can add them under the scripts node
too, making your
<a href="http://www.devthought.com/2012/02/17/npm-tricks/"
target="_blank">package.json even more powerful</a>. You have to start
these scripts like this:

> <span style="font-family: Courier New, Courier, monospace;">npm
> run-script startLocal

UPDATED:
From mr
<a href="https://twitter.com/Ullmark" target="_blank">Ullmark</a> I got
some great tips on how to improve my knowledge. They are in the comments
below, but I'll mention them here too:

- <span style="font-family: Courier New, Courier, monospace;">npm
    init - is a interactive tool, that helps you build your
    package.json file. So you don't need a template to tweak but can let
    the tool work for you. Really nice!
- There's a package.json node called devDependencies, for all the
    things you need in development. These are testing-, assertion- and
    mocking-frameworks for example. It's a good thing not to mix it up
    with the production dependencies for clarity and since a much
    smaller foot print on your production environment.
    <a href="http://blog.nodejitsu.com/package-dependencies-done-right/"
    target="_blank">Read more here</a>.
- Finally, my way to set up the test-command in the package.json
    required all the people that wanted to use the <span
    style="font-family: Courier New, Courier, monospace;">npm
    test command to have mocha installed globally (<span
    style="font-family: Courier New, Courier, monospace;">npm install
    mocha -g). Not everyone wants that. Build servers for
    example... So I've updated it to a better version that uses the
    mocha I have in my project local node_modules folder

</div>
