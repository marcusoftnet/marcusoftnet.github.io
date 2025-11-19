---
layout: post
title: Getting Visual Studio 2012 Test Explorer to work with NUnit, xUnit, and SpecFlow
date: 2012-09-04T07:00:00.000Z
author: Marcus Hammarberg
tags:
  - BDD
  - .NET
  - Visual Studio
  - SpecFlow
  - TDD
modified_time: 2012-09-04T07:00:07.749Z
thumbnail: /img/Screen+Shot+2012-09-02+at+21.18.46.png
blogger_id: tag:blogger.com,1999:blog-36533086.post-5998573811657878660
blogger_orig_url: 'https://www.marcusoft.net/2012/09/getting-visual-studio-2012-test.html'
---

Yes, this is another "hey, this is a cool feature of Visual Studio 2012" post. If you know all about the new Test Explorer and how to get NUnit, xUnit, and by association [SpecFlow](http://www.specflow.org/) to work with it - you can stop reading here. For me, it took a while to get up and running.

I don't remember where I first read about it, but I remember that I was happy to read that Visual Studio 2012 comes with a new [Test Explorer](http://msdn.microsoft.com/en-us/library/hh270865.aspx). What's really cool about it is that it's no longer limited to just [MsTest](http://en.wikipedia.org/wiki/MSTest) tests, but can run NUnit, xUnit ... you name it.

This means that my SpecFlow tests can be run from the new Test Explorer as well. You know, all SpecFlow actually does is translating the [Gherkin](https://github.com/cucumber/cucumber/wiki) lines you write into unit tests of your framework of choice. It should just work.

So they said...

Imagine my disappointment when the test explorer just reported "No unit tests found in solution" over and over again.

So after a while, I picked up that you (of course!) need to install adapters for the unit test frameworks you want to have the Test explorer to pick up.

That's quite easy. You go to Tools -> Extensions and Updates and search the Visual Studio Gallery (you'll find it under the Online-tab in the dialog) for NUnit, xUnit, or whatever framework you're using. What you are looking for are Test adapters for Visual Studio 2012. Like these:

![Adapters](/img/Screen+Shot+2012-09-02+at+21.18.46.png)

When that is installed I was again happy to see that Visual Studio picks up my SpecFlow specifications and I can run them from the test explorer.

## But wait, there is more

When I started to use the Test Explorer I found a couple of nuggets in there too, for us SpecFlow-users:

- Double-clicking a test takes you too... The specification and not the generated test. Thank you very much, Mr. Hidden pragma (#line hidden).
- You can run only failed, or passed for that matter and even a shortcut for rerunning the last test run. It seems like TDD practices are getting a firm footing at Microsoft...
   ![Test Explorer](/img/Screen+Shot+2012-09-03+at+20.43.51.png)
- There is, from the Test menu, an option to rerun the tests on every build. So it's a bit like a poor man's [MightyMoose](http://continuoustests.com/) and [NCrunch](http://www.ncrunch.net/) test runners.
    ![Test Runner](/img/Screen+Shot+2012-09-03+at+20.47.40.png)

These small things made me happy and my productivity boost a bit again. Once I knew how to get it to run with the test frameworks I normally use.

I like it!
