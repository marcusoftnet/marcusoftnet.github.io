---
layout: post
title: Nancy.Testing - A Closer Look Through Her Testability
date: 2013-01-24T08:00:00.000Z
author: Marcus Hammarberg
tags:
  - Nancy
  - Tools
  - .NET
  - Testing
  - Agile
modified_time: 2014-06-21T00:09:55.461Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-2536136940455319768
blogger_orig_url: https://www.marcusoft.net/2013/01/NancyTesting1.html
---

![Nancy Logo](http://nancyfx.org/images/logo.png)

For quite some time, I've been a fan and proponent of a .NET web framework called [Nancy](http://www.nancyfx.org/). She describes herself as a "a lightweight, low-ceremony, framework for building HTTP based services on .Net and Mono," and she looks like the picture on the side.

There's much to admire about Nancy (a working web app in a tweet is really cool) and the code and features are pure quality from start to finish, much to the work that [@theCodeJunkie](http://thecodejunkie/) (Andreas Håkansson) and [Grumpy Dev](https://twitter.com/Grumpydev) (Steven Robbins) is putting in, with the help of a growing and engaged community.

The thing that really blew me away when I first saw it was the testing abilities of Nancy. She's built for testing from the word Go, and that gives us some nice features to play with.

I thought I'd devote a couple of posts to the testing abilities of Nancy; here's what I have planned:

1. [Intro to testing with Nancy](https://www.marcusoft.net/2013/01/NancyTesting1.html) (this post)
2. [The Configurable bootstrapper](https://www.marcusoft.net/2013/01/NancyTesting2.html)
3. [The Browser and Response objects](https://www.marcusoft.net/2013/01/NancyTesting3.html)
4. [Hat and shoeless testing with Simple.Data](https://www.marcusoft.net/2013/02/NancyTesting4.html)
5. [SpecFlow and Nancy](https://www.marcusoft.net/2013/02/NancyTesting5.html)

The underlying idea here is to get to know Nancy better, through tests. Join me if you want. The speed of the blog posts will be much dependent on how the book writing goes (Kanban In Action...). At the time of writing, I have the first two posts prepared, and the rest in my head.

### Why is Nancy easy to test?

Nancy is a web framework built from the ground up, which means that it has no dependencies on System.Web or any of the web-stuff in the .NET framework. Those parts have been notoriously hard to test (mocking the complete Request-object is a nightmare that still haunts many of us).

Not only that - the creators of Nancy have themselves worked with testing as a main feature of the framework, probably even test-first. This has led the framework to be very testable from the outset. To connect back to my [post on constraints](https://www.marcusoft.net/2013/01/on-constraints.html): they constrained themselves to test everything, which made them create a very testable framework. Thank you, constraint!

There are two levels where this testability shines through to great effect:

- Everything can be replaced! Nancy is built to replace every part of her - even core properties such as the NancyEngine itself (you can imagine what that does...). This is a dream for someone who needs to mock stuff out.
- The [Nancy.Testing](http://nancy.testing/) framework helps you to test the complete stack of a Nancy-application, without touching slow and expensive resources such as the network.

That last part requires an explanation I think. When you create a Nancy.Testing.Browser you need to pass in a Nancy.Bootstrapper.INancyBootstrapper. That might be seen as cumbersome but it gives you some great advantages and is not really hard as this example will show you:

```csharp
// Example code here
```

Moreover - this will actually test **everything**, the complete Nancy-stack. Without hitting the network. Yes - I know. I didn't get that first either. But let's look what possibilities that gives us first, and I'll try to explain it better afterwards.

As you can see from that example we can supply a fully populated Request-object, with all the context we need for our Request (headers, options, body you name it).
Executing that request (with the Get-method in this case to perform a HTTP-GET) returns a Response-object. That response contains the generated view from the Nancy-module, meaning that it's been through the complete Nancy-stack, except that it haven't gone through the network, hit any web servers etc. And still you can access and search the generated view with [CSS Selectors](http://www.w3.org/TR/CSS2/selector.html) as you would normally do in a web automation tool. It's web automation with the web part ripped out - some people call this a [headless browser](http://blog.arhg.net/2009/10/what-is-headless-browser.html).

#### Contrasting with ASP.NET MVC options

If you were to test the same thing with an ASP.NET MVC application you are faced with two options:

- Test the controller directly. This is nice since the controller is just a class. You can supply dependencies and control the way it's called to test what you want. But you get back a View-object. The templated view is not executed, so you don't know how the page is generated.
- Which brings us to option number 2: test against the view. To do this you will have to fire up a [browser automation tool](https://www.marcusoft.net/2012/05/specflow-page-objects-and.html) that first needs to start. Then the application is "deployed" in your local IIS or Casini web server. When that is booted up the first call to your application is made, routed, the view generated and the HTML returned. In short - this takes a lot of time, and slows down both testing and the feedback loop.

### Summing up Nancy testability

[Nancy.Testing](http://nancy.testing/) gives you a great way to test your complete stack, with full control of its execution. This in turn gives you the opportunity to write small specific tests, without a lot of setup to get to the right page on the site etc, and a really fast feedback-loop.

### The basic setup

Here follows the steps I went through to get started testing a new application.

1. Created a new Solution, [NancyTesting](https://github.com/marcusoftnet/DiscoveringNancyThroughTests)
2. Added class library for test, DiscoverNancy.Tests
3. Nuget Nancy.Testing ([Install-Package Nancy.Testing](http://nuget.org/packages/Nancy.Testing)) into the test class library

.
4. Installed my test framework of choice: xUnit ([Install-Package xUnit](http://install-package%20xunit/))
5. Wrote my first test
6. That failed of course since the application and route don't exist. But if failed with an error stating: "Xunit.Sdk.EqualException: Assert.Equal() Failure Expected: OK Actual: NotFound"
7. So, the route was not found. I need to create the NancyModule that holds it. That's the famous Fit-In-A-Tweet-Module:
8. With that in place, my test passed.

This was of course a very simplistic example, and I'll be showing you more advanced examples later. But it shows a lot of the testability of Nancy already. For example, I have yet to move the SimpleModule into a hosting environment and I can still test the whole stack...

### The moving parts

In this post we have touched on all the parts of the Nancy.Testing-framework, but very briefly. I thought I'd list the important classes and concepts here and give a high-level description of it:

- Nancy.Testing.Browser: This is the main object of the testing infrastructure in Nancy. The class that you use to call your application. It has methods for performing all HTTP Requests (GET, POST, PUT... you know them) and returns a response object.
- The Request object: As said above, our way to access the routes and functionality in the Nancy Module under test. With the Request object, we can send in all the context (Forms, Querystring, and headers) that's needed to test out our application.
- The Response object: Gives us the ability to assert the content of our response, may it be simple status codes or complex views that are generated from our application.
- Bootstrapper: The [Bootstrapper](https://github.com/NancyFx/Nancy/wiki/Bootstrapper) is the thing that wires together a Nancy application. From a testing point of view, there's great news here. The bootstrapper is needed to create a Browser object and through this, we can control most of the environment, that the NancyModule we are testing, is executing under.

### Summary

In this first post of this series, we took a quick look at the marvelous testing capabilities of Nancy. We talked about why it's so easy to test, and we briefly looked into the moving parts of Nancy testing.

In subsequent posts, we will dive deeper into these concepts and see how we can bend them to our will, creating an excellent testing environment for our applications.