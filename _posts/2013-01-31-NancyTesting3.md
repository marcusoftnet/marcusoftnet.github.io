---
layout: post
title: "Nancy.Testing - test-dialogues with Requests and Response"
date: 2013-01-31T10:43:00.000Z
author: Marcus Hammarberg
tags:
  - Nancy
  - Tools
  - .NET
  - C#
modified_time: 2014-06-21T00:09:55.472Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-3281707504116832093
blogger_orig_url: http://www.marcusoft.net/2013/01/NancyTesting3.html
---

![Nancy Logo](http://nancyfx.org/images/logo.png)

This is the third post in my series on Nancy.Testing. It will focus a lot on the Browser and the Response object. Together with the Browser (and its ConfigurableBootstrapper), these objects make up the entirety of the Nancy.TestingFramework. Let's do the logo thing again, shall we?

The other posts can be found here:

1. [Intro to testing with Nancy](http://www.marcusoft.net/2013/01/NancyTesting1.html)
2. [The Configurable bootstrapper](http://www.marcusoft.net/2013/01/NancyTesting2.html)
3. [The Browser and Response objects](http://www.marcusoft.net/2013/01/NancyTesting3.html) (this post)
4. [Hat and shoeless testing with Simple.Data](http://www.marcusoft.net/2013/02/NancyTesting4.html)
5. [SpecFlow and Nancy](http://www.marcusoft.net/2013/02/NancyTesting5.html)

By now you're probably just looking for the code so let's dive right in.

### Browser

The Browser object is the one that you use to issue requests to the site you're testing. Most of the Browser configuration is done through the [ConfigurableBootstrapper](http://www.marcusoft.net/2013/01/NancyTesting2.html) and let's not go over that again.

But the Browser has a couple of other tricks up its sleeve too. With each method that you can use to issue HTTP Requests (Get, Post, Delete, Put, Options etc), there's configuration to be done too. Here's a real simple example that shows how you can configure your tests to do HTTPS requests:

By now you recognize the pattern with configuring your object through a lambda (`with => with.WhatHaveYou`). On row 8 and 21 we configure the Get-request to use a HTTP or an HTTPS request, that our module under test recognizes.

There's loads more you can do with each HTTP request, the most commonly used I would bet is the Form-posting abilities. Here's one example:

As you can see from lines 11 and 12 it's quite easy to populate a form to post. This example also showed off model binding in Nancy (line 28). In an internal class, in the test, no references to a web framework. Cool, huh?

In much the same manner you can send in values through the query string, cookies or via headers. It's very similar code and I've created a sample [here](https://github.com/marcusoftnet/DiscoveringNancyThroughTests).

That leaves some special things (except for AjaxRequest that's really special and I'll leave for you to examine on your own). First out is to create your HTTP Body on your own. Here's an example of doing that:

This gives you very fine-grained control of the content of the Body, and as you can see from this example (ripped directly from the Nancy.Testing.Test code) we're sending in some JSON in the body on line 11. That's handily taken care of by the handler and bound to our model (line 25).

You can also send JSON directly in the body. Very conveniently, Nancy.Testing also supplies a method for converting a class to JSON for you:

Let's now go to the other side of the request and take a closer look at the Response-object and see the help that Nancy.Testing gives us there. It's plenty!

### Response

There's loads of interesting stuff on the response object. First you can, of course, access all the properties and assert that expected data was returned. Here's a couple of examples:

Nothing really strange and surprising there. You can access the properties of the Response just as expected and do your own assertions against them. In these examples I'm simply accessing the Headers and Cookies collection. The rest of them behave in the same manner and are:

- Context - which gives you access to the NancyContext and properties as:
  - The Parameters collection
  - The CurrentUser
  - NegotiationContext
  - ModelValidationResult
  - ViewBag
- The Body itself which I'll talk about later
- The HTTP status code

### Other Response methods

There's also some special methods that checks for redirects:

And also for getting the Body into different formats and even deserialize it into model objects:

#### Body assertions

The Body property is a little gem in itself in that it has all the elements of the `<body>` tag as keys (it's a DynamicDictionary). Not only that - you can also search these with normal CSS Selectors. This gives a very nice experience checking for presence of tags, its content and id etc. I've put together some examples here:

But hey - there's more: the error messages are to die for. Here's one:

> "The expected value 'A second message with isd' was not a sub-string of the actual value 'A second message with id'."

Tester nirvana - right there! Thank the creators!

### Summary

Probably broke my long-blog-post-record there. So I'll end it now.

A lot of goodies in here for you to deep-dive in. Get my full [code here](https://github.com/marcusoftnet/DiscoveringNancyThroughTests).