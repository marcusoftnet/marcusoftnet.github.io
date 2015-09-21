---
layout: post
title: "Requiring the os - runtime-js"
author: "Marcus Hammarberg"
date: 2015-09-20 16:31:47
tags:
 - JavaScript
 - Koa
 - Tools
---

This is my second attempt to write this post. It's not that the post itself is hard to write but the concept makes my head ... go ouchie. That tend to happen to my head when I see potential quantum leaps.

Instead of the fancy intro I had planned, I'm just going to give a short introduction, point you to an [awesome article](https://medium.com/@iefserge/runtime-js-javascript-library-os-823ada1cc3c), tell you how to get this to run. 

So what is **it** then? Basically [runtimejs](https://www.npmjs.com/package/runtimejs) is a tiny, unikernel OS that you can bundle together with your application, as a dependency to your application. Which is basically what a OS is, right? Our application needs some libraries like [koa](http://www.koajs.com), a runtime-platform (like [Node](http://nodejs.org)) and an OS (like [Linux](http://www.linux.com)) that the platform can run. 

What if that last part just was a dependency like normal to our application? Like this: 

    "dependencies": {
        "a_small_little_os_just_for_me": "latests"
    }

That would be so cool. Let me show to get that to work for a Koa application

<a name='more'></a>

# Create the application
I've created a very basic, but not trivial Koa application (using ```npm init```) and then this single file: 

{% highlight javascript %}
var koa = require('koa');
var fs = require('co-fs');
var app = koa();

app.use(function *(){
    var phrases = yield fs.readFile('phrases.txt', 'utf8');

    var phrasesArray = phrases.split('\n');
    var phrase = phrasesArray[Math.floor(Math.random() * phrasesArray.length)];

    this.body = phrase + "!";
});

app.listen(9000);
console.log("The app is now listening - try it on http://localhost:9000");
{% endhighlight %}

It's just a little Hello world app that gets it's greetings phrases from a ```phrases.txt``` file, found in the same directory as the app. 

# Depend on a OS
Let's me introduce you to an operating system that I almost guarantee you have not heard about: [runtimejs](https://www.npmjs.com/package/runtimejs). It's a [language-specific unikernel operating system](https://medium.com/@darrenrush/after-docker-unikernels-and-immutable-infrastructure-93d5a91c849e). 

Basically that it's tiny and dedicated to run just a certain type of application. In our case Node-applications. Let's run our application on that, shall we? 

Do this: at the top of our ```index.js``` file add this line:
    
    var runtime = require('runtimejs');

This of course mean that we need to install ```runtimejs``` as a runtime dependency to our app; 

    npm install runtimejs --save

Sadly, after that if we try to run it we fail. With a scary error message (```kernel is not defined```). While this seems like we broke our entire machine at first, it's actually easy to understand when you have stopped hyperventilating. 

We just said that the app now depends on the ```runtimejs``` operating system. But you are running it on something else. Me on OsX, you might be on Linux or Windows. The ```kernel``` object that ```runtimejs``` is looking for is simply not there. 

But we're going to fix all of that now.

# Run from an image
To get this too work we need two development-time tools. Let's install them and I'll see if I can explain what it does: 

    npm install runtimeify runtime-tools --save-dev

[runtimeify](https://www.npmjs.com/package/runtimeify) (OMG those names... let's try something new, shall we?) takes our code and creates an "ramdisk" image with the runtimejs operating system and our application on it. Basically creates a tiny disk with the OS and the application installed on, ready to run. 
The command to do so is this: 

    runtimeify index.js -o [name of disk]

Since I'm into scripting with [npm](http://www.marcusoft.net/2015/08/npm-scripting-git-version-and-deploy.html) and [package.json](http://www.marcusoft.net/2015/08/pre-and-post-hooks-for-npm-scripting.html) right now, let's create a command called ```image:create``` and add it to our scripts in the ```package.json``` file: 

    "image:create" : "runtimeify index.js -o appImg"

The second tool above, ```runtime-tools```, is a Node wrapper around a virtual machine emulator called [QEMU](http://wiki.qemu.org/Main_Page). That's about everything I know about QEMU... think of it as a lightweight VirtualBox, Parallels or VMWare and then go "la la la la la" - that's what I do. 

To start an image in QEMU using the ```runtime-tools``` we should have another script in ```package.json``` don't you think? Here it is:

    "image:start" : "runtime-qemu ./appImg" 

Quite simple: just the ```runtime-qemu``` and then the name of the file we created with the ```image:create``` script. ```runtime-qemu``` is the name of the executable for ```runtime-tools```, a bit unfortunate naming there. You can check it with ```ls node_modules/.bin``` should you forget it. 

## Install QEMU
This of course require us to have QEMU installed. Easiest is to do that with Homebrew 

    brew install qemu

Use ```sudo apt-get install qemu``` if you are on Linux. Or [download an executable from here](http://qemu.weilnetz.de/) if you're on Windows. Check the [install instructions here](http://runtimejs.org/getting-started/).

This part is, of course, only required if you don't have QEMU installed already. 

## Run it
Now, we create a command to launch our application in a image. 

    "start" : "npm run image:create && npm run image:start"

This will, the first time, download a 10Mb file for the entire OS. Secondly the command will add your application and finally launch it with QEMU. 

The entire scripts-node of my ```package.json``` now looks like this: 

{% highlight javascript %}
"scripts": {
  "image:create": "runtimeify index.js -o appImg",
  "image:start": "runtime-qemu ./appImg",
  "start": "npm run image:create && npm run image:start"
}
{% endhighlight %}

Fingers crossed. 

Ah well... actually - I've done that before. I know it fails. For some reason Koa needs [bluebird]() to run on the ```runtimejs``` operating system. Don't really know why. Install it with ```npm install bluebird --save``` for better WOW-factor in the demo. 

# Try it
And now... ```npm start```. 

It should start up after a little while (5 min for my Indonesian connection... 10 secs for you guys) the ```runtimejs``` OS is downloaded and the application is started. In a separate OS. On a separate image.

For subsequent launches this takes about 3 seconds. Even on Indonesian Internet connections, because it's all local. 

First head to a browser and direct it to [http://localhost:9000](http://localhost:9000). You should see a greeting phrase. Reload it and it will randomize over the ones in the ```phrases.txt```. Fun fun fun!

<img src="/img/runningInQemu.png" alt="">
Now, check your windows. If you look carefully you should see a QEMU emulator running. That's you operating system and your applications little cozy environment. Just for your application. Just enough. 

Finally - shut the application down with ```CTRL-C``` as normal. Notice that QEMU is shutting down too. 

# Summary
Ok - at this point I was gasping for air. It's so cool. Without leaving the current environment, NodeJs, I can bundle my application up with the dependency it has on a operating system. A small, unikernel operating system. A language specific, library, require-able operating system. 

This image can now be pushed to a cloud host. You have already tried the runtime locally. It's the same as production runtime... because it's actually the same image, same disk running in the production environment. 

It's also a tiny operating system, with only the services you need included. 

Me thinks... they are onto something here. I think we will see much more of stuff like this in the future.

## A couple of things
- Right now you can only use port 9000. Because that is the default port that QEMU uses
- I have not investigate where I can push this. But that should be any host for that allow me to run qemu, or that can host those images directly
- My code can be [found here](https://github.com/marcusoftnet/helloRuntimeJs)

## Read more
This [article was great from the creator of runtime-js](https://medium.com/@iefserge/runtime-js-javascript-library-os-823ada1cc3c)

More about runtimejs itself is [found on their site](runtimejs.org). As they say all of this is very early stages of development and much of it can change but still... 

[Here's a discussion on unikernels](https://medium.com/@darrenrush/after-docker-unikernels-and-immutable-infrastructure-93d5a91c849e) and docker and a lot of stuff that I cannot understand really. 