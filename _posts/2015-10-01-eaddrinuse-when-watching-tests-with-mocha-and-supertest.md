---
layout: post
title: "EADDRINUSE when watching tests with mocha and supertest"
author: "Marcus Hammarberg"
date: 2015-10-01 07:01:16
tags:
 - Javascript
 - NodeJs
 - Tools
 - Koa
---
You are happy to meet me among the living. The error I'm describing nearly killed me with frustration, and if that didn't happen I was about to help it by finish myself off. 

No worries though - I found the solution. Hence I'm alive and can tell the story. 

This is the error, that haunted me into the wee hours of the night, in all it's glory: 

    1)  Uncaught error outside test suite:
     Uncaught Error: listen EADDRINUSE :::3000
      at Object.exports._errnoException (util.js:837:11)
      at exports._exceptionWithHostPort (util.js:860:20)
      at Server._listen2 (net.js:1231:14)
      at listen (net.js:1267:10)
      at Server.listen (net.js:1363:5)
      at Application.app.listen (node_modules/koa/lib/application.js:70:24)
      at Object.<anonymous> (index.js:10:5)
      at Object.<anonymous> (test/site.spec.js:1:73)
      at Array.forEach (native)
      at StatWatcher._handle.onchange (fs.js:1285:10)

I got that error from [```mocha```](https://github.com/mochajs/mocha/) when watching my tests with the ```--watch``` flag. But only when I ran that watching command as a npm script from ```package.json```. Yeah, it was pretty complex to sort it. 

<a name='more'></a>

# TL;DR - Just tell me how to fix it
Make sure that your tests doesn't listen "twice", one time in the test (```require("supertest").agent(app.listen());```) and one time in the actual app (```app.listen(3000);```).

This can be accomplished, in the application, by checking for a ```module.parent```, that not is present when the application is executed. Like this: 

    if(!module.parent){ 
        app.listen(3000); 
    }

# My application
I'm using the simplest of Koa application to demo my problems: 

    var app = module.exports = require("koa")();
    
    app.use(function *(){
        this.body = "Koa says Hi!";
    });
    
    var port = process.env.PORT || (process.argv[2] || 3000);
    port = (typeof port === "number") ? port : 3000;
    
    app.listen(port); 
    
    console.log("Application started. Listening on port:" + port);

# A little longer explanation, but still not border-line-killing-yourself
[Supertest](https://github.com/visionmedia/supertest) is an amazing testing tool, especially suitable for [Express](http://expressjs.com/) and, my favorite, [Koa](http://koajs.com/) applications.

To construct a supertest ```request``` object that we can use to test our application, we can pass it a http-server. In Koa (and Express) this is actually what the ```app.listen()``` method returns. They are not 100% the same, so beware about the difference. Check [this post](https://realguess.net/2015/03/29/supertest-listen-at-random-port/) for more on that. For the purposes of this post, they are the same.

You can pass a port number to the ```app.listen()``` method. If you don't a *ephemeral port* will be used. Meaning it last for a very short time, for example during one request. Again read [this post](https://realguess.net/2015/03/29/supertest-listen-at-random-port/) for more.

The problem happens when we run tests without closing the server, as is the case when we are watching our tests. Like I did in my test:

    var app = require("../");
    var request = require("supertest").agent(app.listen());
    
    describe("Our amazing site", function () {
        it("has a nice welcoming message", function (done) {
            request
                .get("/")
                .expect("Koa says Hi!")
                .end(done);
        });
    });

Now the ```require("supertest").agent(app.listen());``` will get a port number but since I'm running the test continuously it will not shut down. The next time I run my tests, the ```require("supertest").agent(app.listen());``` will be executed again. I will get the ```EADDRINUSE``` since it's already running. 

So this works fine when you run it once, because then the whole testing process dies. But if you run it over and over it breaks.

# Solutions
What can we do to fix this then? 

## Solution 1 - close the server manually
The most brute-force approach is to close the server manually. To do that we need to get hold of the server that we started. After reading this [Japaneese, Coffee-Script based example](http://blog.takeshun.net/gulp-mocha-supertest/) - (yes - I was desperate, it was late) I modified my application to this,basically just exposing the server object created by the ```app.listen()```: 

    var app = require("koa")();
    
    app.use(function *(){
        this.body = "Koa says Hi!";
    });
    
    var port = process.env.PORT || (process.argv[2] || 3000);
    port = (typeof port === "number") ? port : 3000;
    
    var server = app.listen(port); 
    
    console.log("Application started. Listening on port:" + port);
    
    module.exports = {
        server : server,
        app : app
    };

I then updated the test to close the server ```after``` the tests are run:

    var app = require("../").app;
    var server = require("../").server;
    var request = require("supertest").agent(server);
    
    describe("Our amazing site", function () {
        after(function (done) {
            server.close();
            done();
        });
    
        it("has a nice welcoming message", function (done) {
            request
                .get("/")
                .expect("Koa says Hi!")
                .end(done);
        });
    }); 

That works, since I now manually close the server I'm listening to. 

At this point, you'd think that you could do better than this by simply do it all in the test (leaving the application alone), like this: 

    var app = require("../");
    var server = app.listen();
    var request = require("supertest").agent(server);
    
    describe("Our amazing site", function () {
        after(function (done) {
            server.close();
            done();
        });
    
        it("has a nice welcoming message", function (done) {
            request
                .get("/")
                .expect("Koa says Hi!")
                .end(done);
        });
    });

Here's we are closing the server that the ```supertest``` agent is using. 

But no - this still gives the dreaded ```listen EADDRINUSE```. 

There's a simpler way...

## Solution 2 - Only listen when started directly
In my [search](https://github.com/koajs/koa/issues/328) for a solution, someone pointed me to the [Koa internal tests](https://github.com/koajs/koa/blob/master/test/application.js). They are often using a construct like this: 

        var app = require("koa")();
        app.use(function *(next){ this.body = "Hello"; };
        
        it("has a nice welcoming message", function (done) {
            request(app.listen())
                .get("/")
                .expect("Hello")
                .end(done);
        });

[This is cool](https://github.com/koajs/koa/blob/master/test/application.js). We create the server just for the request in question, where I'm reusing the same request object, over and over. 
However - there's a little thing here that is not "real-life". They are also writing their entire Koa application in the test. Yes - Koa is that small. 

What do I do that they don't? Can you see it? There's only one ```app.listen()``` in their code. 

So what I wanted is a way to do ```app.listen()``` in my application **only** when I'm not testing. Or, put differently; **only** when I start my application for real. 

And I got [excellent help to show me how](https://github.com/koajs/koa/issues/328). Here's my updated application:

    var app = module.exports = require("koa")();
    
    app.use(function *(){
        this.body = "Koa says Hi!";
    });
    
    var port = process.env.PORT || (process.argv[2] || 3000);
    port = (typeof port === "number") ? port : 3000;
    
    if(!module.parent){ app.listen(port); }
    
    console.log("Application started. Listening on port:" + port);

Now I can keep my test just as I had it when I stared: 

    var app = require("../");
    var request = require("supertest").agent(app.listen());
    
    describe("Our amazing site", function () {
        it("has a nice welcoming message", function (done) {
            request
                .get("/")
                .expect("Koa says Hi!")
                .end(done);
        });
    });

This solution is good enough i think. A very little conditional start the app to listen only when it's started outside tests. Ok. 

I could also have started to listen within each request if I wanted, that would make it look like this: 

    var app = require("../");
    var request = require("supertest");

    describe("Our amazing site", function () {
        it("has a nice welcoming message", function (done) {
            request(app.listen())
                .get("/")
                .expect("Koa says Hi!")
                .end(done);
        });
    });

# Summary
IT WORKS! Tears a flowing down my cheeks and I laugh uncontrollably. 

First of all the community around these tools are GREAT. Thanks everyone that helped me! 

Secondly, the thing that still bugs me is that I only had the problem when I was running the script from npm. 
Running ```mocha -w``` from the prompt worked as I had it from the start. Moving that to a ```package.json``` script (```"watch:test" : "mocha -w"```) fails... 
I don't understand why. 

But when I've implemented my solution above, both scenarios (npm or mocha) works.
