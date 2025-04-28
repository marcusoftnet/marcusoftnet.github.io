---
layout: post
title: "Nancy.Testing - executable specifications through the full stack, in memory"
date: 2013-02-07T13:55:00.003Z
author: Marcus Hammarberg
tags:
  - Nancy
  - Tools
  - .NET
  - Specification by example
  - C#
  - SpecFlow
modified_time: 2014-06-21T00:09:55.466Z
thumbnail: /img/Screen+Shot+2013-02-07+at+13.24.53+.png
blogger_id: tag:blogger.com,1999:blog-36533086.post-3220746848691426022
blogger_orig_url: http://www.marcusoft.net/2013/02/NancyTesting5.html
---

![Nancy Logo](http://nancyfx.org/images/logo.png)

When I showed the code from the [last post](http://www.marcusoft.net/2013/02/NancyTesting4.html) to a colleague ([@HugoHaggmark](http://www.twitter.com/HugoHaggmark)), he remarked: Nice - but that's no unit test. And he's absolutely right.

A unit test should test a unit. The tests in the last post, and the test that Nancy.Testing allows us to easily write, flexes the whole stack of our application. In memory (which is super cool) but the full stack. That's no unit test.

This can still be VERY useful and in this post I'll show you how to put one of my favorite tools, [SpecFlow](http://www.specflow.org/), in front of what we wrote in the last post, to get an executable specification. Not only that - I'll do it in a manner that lets you swap it and hit the HTML page if you wanted to.

As the tradition calls - let's look in wonder at Nancy's silhouette. If you came here and want to read up on what we have spoken about so far, the other posts in the series can be found here:

1. [Intro to testing with Nancy](http://www.marcusoft.net/2013/01/NancyTesting1.html)
2. [The Configurable bootstrapper](http://www.marcusoft.net/2013/01/NancyTesting2.html)
3. [The Browser and Response objects](http://www.marcusoft.net/2013/01/NancyTesting3.html)
4. [Hat and shoeless testing with Simple.Data](http://www.marcusoft.net/2013/02/NancyTesting4.html)
5. [SpecFlow and Nancy](http://www.marcusoft.net/2013/02/NancyTesting5.html) (this post)

In this post I'll introduce you, short - very short, to [Specification by example](http://www.specificationbyexample.com/) and [SpecFlow](http://www.specflow.org/) and some practices that make automating your application ... bearable.

### Specification by example and SpecFlow

[Specification by example](http://www.specificationbyexample.com/) is a way to analyze how your application should behave, by posing concrete examples. You do this together with the business or client in order to understand what they need. By doing so, you can come up with a solution that is more in line with what they have envisioned. You're increasing the possibility that you are building the thing **right**.

As a nice side effect of having these discussions with the client you end up with a lot of examples that can easily be used as test cases to validate your code. Using certain formats and tools (hm, SpecFlow hm), you could even have these examples executed against your system.

That means that you could run the examples you talked about against your system and they will tell you if you have implemented the feature as discussed or not. Your examples have become an **executable specification**.

This was a super short introduction to the vast subject Specification by example (aka [behavior Driven Development BDD](http://en.wikipedia.org/wiki/Behavior-driven_development)). If you haven't heard about it before I encourage you to check it out. It changed my life - and will change yours too if you give it a chance. It's a more fun way to do better code!

Specification by example is not about the tools. It's actually mostly about the conversations that you and your client have around the examples. So to honor that very important fact - let's talk tools:

The tools I'm talking about here are tools that let you take the examples you talked about with your client and execute them, in a format that the non-technical client can read and understand. One of the more prominent tools like that is called [Cucumber](http://www.cukes.info/) and the .NET implementation of that is called [SpecFlow](http://www.specflow.org/).

Simply put, the flow of [SpecFlow is like this](http://www.specflow.org/specflownew/):

1. You write your examples in a .feature-file, using the [Gherkin](https://github.com/cucumber/cucumber/wiki/Gherkin) language. It's basically lines starting with Given, When or

 Then and then any English (or 40 other supported languages) line. "Given the database is empty" for example.
2. When you save the .feature-file, SpecFlow generates a test, in a framework of your choice behind the scenes (in a .feature.cs-file). The .feature-file can now be executed by a test runner.
3. For each line in the .feature-file ("When I log in" for example), SpecFlow will look for a method with an attribute like `[When("I log in")]` over it and execute it.
4. SpecFlow will continue to execute all the lines in the .feature-file. Just as for normal unit tests, it will report success if no error is thrown and failure otherwise. As you probably know, or understand, Asserts in test frameworks throw errors when the assertion fails.

Summing up, this simply means that each row, or step, in your .feature-files, that contains your examples, is mapped to a corresponding step definition, a method that defines what should happen in the step. For the step "When I log in" we automate the application to do login.

SpecFlow has excellent support in Visual Studio and is completely free.

### Maintainable test code and Page wrappers

When I first heard about specification by example I, like many others, wanted to automate as much as possible. And that's a good idea - surely you'd want your specifications to be run against as big a part of the system as you possibly can.

But that means, for all the people not using Nancy, we have to automate against the UI. That's not very pleasant since it moves a lot (in other words: gives you brittle tests) and testing the UI means that you have very little control over the execution of a test. Finally, testing against the UI is slow. In short: you'll mostly end up [shooting yourself in the foot](http://gojko.net/2010/04/13/how-to-implement-ui-testing-without-shooting-yourself-in-the-foot-2/) (thanks [Gojko](http://gojko.net/)) and finally resign with not using the tests.

There are some ways to get around some of the maintainability issues and structuring the test code a bit. The best one I know is what's known as the [Page Wrapper](http://www.marcusoft.net/2011/04/clean-up-your-stepsuse-page-objects-in.html). It's basically encapsulating access to a page in a separate class with all the UI automation logic.

This wrapper (that you write) can be thought of as a [Domain Specific Language (DSL)](http://en.wikipedia.org/wiki/Domain-specific_language) that you use to automate your application. What's great about this is that your step definitions are lightweight and simple to write - you just delegate into the automation layer where all the automation happens. Not only that, but you could write a new DSL that for example didn't automate against the UI, without changing the .feature-file or the steps. Cool - huh? This can be seen to great effect in [this excellent talk by Matt Wynne](http://skillsmatter.com/podcast/agile-scrum/bdd-as-its-meant-to-be-done).

Of course, it would be even better if we could skip the top layer, the UI, [the hat if you will](http://www.marcusoft.net/2013/02/NancyTesting4.html), and just test the application logic and not the rendering in the browser. If only ... now wait a minute here - that's exactly what Nancy.Testing gives us.

That just leaves us with test data that is inherently difficult to set up when hitting the production code. That [would be your shoes](http://www.marcusoft.net/2013/02/NancyTesting4.html) and can also be handled with [Simple.Data](http://simple.data/), as described before.

We now have all the parts for what I wanted to talk about in this post. Longest intro ever, but there's some background in there as well, to my defense.

Let's do a diagram over this:

![Example Diagram](/img/Screen+Shot+2013-02-07+at+13.24.53+.png)

The green boxes are code that you need to write (oh, well you need to write the .feature-file as well but that's not really code, right?). The rest of the picture is the frameworks work for us.

### Example

Let's see how I've stitched this together. Mind you - this is my take on it. There's probably other ways to do this but this worked for me with reasonable complexity. The example has quite a lot of moving parts for such a small test, but that pays off in the long run. Trust me on that one.

For our example we will take a look at the behavior around creating new fairy tale figures. Here's my feature:

```
Feature: Creating a fairy tale figure

  In order to expand the world of fairy tales
  As a lover of fairy tales
  I want to create new fairy tale figures

  Scenario: Create a fairy tale figure without hangarounds
    Given the database is empty
    When I create a fairy tale figure named "Gandalf" with evilness "Low"
    Then I get redirected to the list of fairy tale figures
    And I see "Gandalf" with evilness "Low" in the list

  Scenario: Create a fairy tale figure with hangarounds
    Given the database is empty
    When I create a fairy tale figure named "" with evilness "High" and 3 hangarounds
    Then I get redirected to the list of fairy tale figures
    And I see "Sauron" with evilness "High" in the list
    And I see "Uruk-hai" with evilness "High" in the list
    And I see "Nazgûl" with evilness "High" in the list
```

As you can see, there's just a little introduction at the top, stating the reason for this functionality. What then follows are two distinct scenarios with concrete values. In the first one, we're focusing on creating a fairy tale figure with no hangarounds. Sad one.

In the latter, we create another figure (note that we don't care about the name and hence don't use one) and make sure that the hangaround gets registered and is as evil as their master.

Before we can take a look at the step definitions there's a little infrastructure you should know about:

Here's we're using a SpecFlow event called BeforeScenario that is executed before ... you guessed it: each scenario. That gives us an excellent place to do some cleaning. In this case, we're setting Simple.Data up to use the InMemoryAdapter.

Now let's dive a step deeper and take a look at the step definitions:

```csharp
[BeforeScenario]
public void BeforeScenario()
{
    Database.UseMockAdapter(new InMemoryAdapter());
}

[Given(@"the database is empty")]
public void

 GivenTheDatabaseIsEmpty()
{
    // Nothing to do here
}

[When(@"I create a fairy tale figure named ""(.*)"" with evilness ""(.*)"" and (\d+) hangarounds")]
public void WhenICreateAFairyTaleFigureNamedWithEvilnessAndHangarounds(string name, string evilness, int hangarounds)
{
    // Automation logic here
}

// More step definitions here...

```

These are the methods that SpecFlow calls for us for each step in the .feature-file. As you can see, it's really nothing strange here. Notice that the step definitions can take in variables that are extracted via regex from the steps in the .feature-file. Pretty useful.

On the first line, we create a FairyTaleModuleWrapper that hands us a nice API to interact with the functionality of the module. In fact, that's the kind of API to automation that you always wanted, right? Just what you want: methods to register and validate results. I wonder how the automation looks like. Who's writing that now again? We? Better get to it.

Now we're talking: here's the automation code we have seen [examples from throughout the series](http://www.marcusoft.net/2013/01/NancyTesting1.html). Let's walk through the code. It's a mouth full but by no means complicated.

On lines 6-15 is the constructor of the wrapper. Here we set up a Nancy.Testing.Browser indicating that we'll be using the FairyTaleFigureModule to test against. We store the browser object in a private field since we'll be using that all over the class.

- On line 13, we're setting up the dependency for the module, our FairyTaleFigureRepository. As before, we're using the production repository since we have already mocked out the data access with Simple.Data (see the BeforeScenario method above).

Line 17-36 is a method used to perform the actual registration. The signature takes in the Name of the figure and the evilness of it and finally a number of hangarounds.

- Line 21-26 creates and posts the form with all our data. I use a couple of helper methods to create some values for the form. In one case in a very, very ugly way. All help to make that nice is appreciated.
- We then verify that we got redirected (line 34) to the right place
- and finally do a GET to the newly created fairy tale figure. The results of the GET are stored in the `_latestResponse` variable for use in later methods.

The rest of the methods (lines 38-64) are small verification methods in which we assert against the stored response (`_latestResponse`) and verify that the name and evilness of the figure got rendered on the page properly. Or that all the hangarounds are as evil as their master.

The final part is just my small private helper methods to create the form. Nothing particularly exciting there.

As I said - that's a mouth full when you first look at it. The number of lines in that code has partly to do with my formatting and my comments. The actual code is not that hard and built on everything we've talked about in [this series](http://www.marcusoft.net/2013/01/NancyTesting1.html).

That just leaves the production code:

```csharp
// Production code example here...
```

Just a few notes on this:

- I'm trying to keep the code in the "routes" to a minimum and hand it off to private methods. I think that's a good idea for readability.
- Not proud of the code in `BindHangarounds` but I hope that someone will correct and help me write something more ... Nancy-like there
- The repository is opening the Simple.Data database in its constructor. You probably don't want to do that in real life. Better might have been to inject it into the constructor. In any way, there's where the InMemoryAdapter is starting to get used by Simple.Data (the Database.Open()-stuff)

### Summary

There you have it. Testing the entire application stack, from a human (and business) readable format, with the help of SpecFlow, all the way to the ends of the data access code (with the help of Simple.Data). All in memory. I don't think that can be done in many other frameworks (at least not on the .NET stack). Color me impressed!

That brings us to an end of this series. I've learned a great deal about both Nancy and testing Nancy. I can now reveal that when I started to write these blog posts I had some problems grokking it. That was why I jumped in at the deep end like that.

Now that I know a bit more I can only say that I'm continuously being impressed with Nancy and her awesome testability. Great stuff indeed.

Oh yeah - almost forgot. [The code is up here.](https://github.com/marcusoftnet/DiscoveringNancyThroughTests)