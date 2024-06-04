---
layout: post
title: Cucumber / SpecFlow pro tip - push HOW down
date: 2013-04-17T06:00:00.000Z
author: Marcus Hammarberg
tags:
  - Nancy
  - BDD
  - Test
  - Specification by example
  - Agile
  - SpecFlow
modified_time: 2013-04-17T06:00:09.379Z
thumbnail: /img/pushing+how+down.png
blogger_id: tag:blogger.com,1999:blog-36533086.post-8179040185480084998
blogger_orig_url: http://www.marcusoft.net/2013/04/PushTheHowDown.html
---

I've just attended my first ever [CukeUp conference](http://skillsmatter.com/event/agile-testing/cukeup-2013), that is given by [Skillsmatter](http://www.skillsmatter.com/) each year. It's organized by [Aslak Hellesoy](http://aslakhellesoy.com/) that created [Cucumber](http://cukes.info/) five years ago. It attracts a nice audience and community that share a lot of interest with me. For me it was extra fun to meet some of my heros and friends that I've followed and interacted with for quite some time ([Matt Wynne](http://blog.mattwynne.net/) and [Gaspar Nagy](http://gasparnagy.com/) to mention a few).

As always at conferences the learning is plentiful, even though my focus and nervousness was at my talk for a few hours. I especially like Matt Wynnes talk on [Cucumber Pro Tips](http://skillsmatter.com/podcast/agile-testing/why-your-step-definitions-should-be-one-liners-and-other-pro-tips). There's two excellent books ([The Cucumber Book](http://pragprog.com/book/hwcuc/the-cucumber-book) and [Cucumber recipes](http://pragprog.com/book/dhwcr/cucumber-recipes)) that Matt and friends has written that contains loads of tips and pragmatic hands-on descriptions for any Cucumber user. His talk was an extract from the books.

The biggest thing that stuck in my mind was: push HOW down. He has been talking about that before (very funny [here](http://skillsmatter.com/podcast/agile-testing/refuctoring-your-cukes)) to great effect in this excellent talk called ["BDD - as it was meant to be done!"](http://skillsmatter.com/podcast/agile-scrum/bdd-as-its-meant-to-be-done). That point was then something that run through almost every talk (including my in fact) on the conference. At least the once that I heard so far.

The main point is this; specification by example is way to clarify how the system should *behave* by using concrete examples. This can be done before any code is implemented and can clear out a lot of misunderstandings and misconceptions that have you go back and forth later in the process. Cucumber / SpecFlow can then be used to execute these scenarios, written in natural language, against code that flex your system to verify that the system *behaves* as expected.

### What do you mean HOW?

So far so good. However it's a very common pit fall to start to write your scenarios in script-form that rather shows you how the system should be operated rather it's behavior. So you end up with scenarios like this:

When all you really wanted to say was:

The first version has some merits:

- it's pretty easy to automate with a few generic [step definitions](https://github.com/techtalk/SpecFlow/wiki/Step-Definitions)
- the implementation is taking place already, HOW the system is to be implemented is shining through ... but that's not really the intent now is it.

The first version sucks because:

- it's almost impossible to see the "tree for the forest". What is this scenario describing?
- It's boring for any non-technical person to read
- It was meant to clarify but it just added confusion

The second version is better because:

- it clearly shows the (in this case very simple) behavior.
- It's understandable by everyone, even non-techies, even techies.

But the second version doesn't say anything about HOW the system or even the automation is done. That's just what we wanted but where did the HOW go then?

### Pushing HOW down

Well - we pushed it down. Further than you think too. As you probably well aware of each line in our scenario maps to a step definition. This is the code that Cucumber / SpecFlow calls when the scenario is executed. A SpecFlow feature looks something like this:

This is the method that get's called by Cucumber/SpecFlow as the scenario is executed. Great you think - let's keep the HOW there. Let's write automation code there and start interacting with our application. Well - no... keep pushing, if you believe Matt Wynne (and you should!). Try to keep your step defintion as simple as possible, preferable one-liners. These one-liners can interact with a DSL or Driver object that you use to interact with your system. This DSL is written, by you, especially for the step definition with test maintainability in mind.

Matt talks about this in both his books and to great effect in [this talk](http://skillsmatter.com/podcast/agile-scrum/bdd-as-its-meant-to-be-done) (and a bit more rude in [this one](http://skillsmatter.com/podcast/agile-testing/refuctoring-your-cukes)) as I told you before.

But, what does that Driver/DSL-thingy look like then?

### HOW into the DSL

The DSL is just a simple object that you write yourself that interacts with your system under test. As you write this you can make up the structure for it as it suits your need: [coding by wishful thinking](http://dsoguy.blogspot.se/2007/01/programming-by-wishful-thinking.html) I've heard that it's called. Make it useful for you - you make up the API for your purposes.

The DSL sets up data in the database (or in memory versions of it, or creates mocks), interacts with the system by executing the commands you're testing and finally does the assertions of the state of the system after the command is executed.

You should change this DSL/Driver object to suit your needs as your scenarios evolves. For example, from the start you might just need a couple of methods directly on the Driver object (Driver.WithDrawAmount(int amount)) but after a while you might want to expand it with sub-objects, overloaded methods etc.

Give the DSL a lot of love. This is also code. It can (and should) be given the same attention as the production code. You could even write tests for it on the unit level. If you don't maintain it you stand the risk that it rots, as all code does.

Here's an example method from my DSL at the talk I gave at the CukeUp conference:
Now wait a minute... I still don't see the HOW?! At least not if we're supposed to interact with a web page. Where is it?

### HOW in page objects

No - that's right. The DSL above is an example of using the [driver pattern](http://c2.com/cgi/wiki?BridgePattern). Most often we hear about this in the form of the [Page Object Wrapper](http://www.marcusoft.net/2011/04/clean-up-your-stepsuse-page-objects-in.html) that I've blogged about before. While this is a great idea I think that the DSL/Driver constructed above is better. It becomes a higher level Driver, that contains the Page Objects you might need.

If you don't have a higher level Driver you'll need to orchestrate how you call between the different pages right in the step definitions, making them more complicated and harder to maintain. A DSL/Driver object that in turns calls into the Page Object is a much better, and more maintainable solution, in my opinion.

And finally, here is the HOW:

Here we interact with the system to enter stuff and assert the output from the system. Of course drivers doesn't have to be run against web pages only. Here's another driver that interacts with the [Nancy](http://www.nancyfx.org/) [testing browser](http://www.marcusoft.net/2013/01/NancyTesting1.html):

### Conclusion and "was that really necessary?"

Yes, there's a layered architecture right there. Here's how it looks in all it's glory:

![pushing how down](/img/pushing+how+down.png)

1. Gherkin - the business readable scenario with focus on behavior. No HOW in here.
2. Step definitions - simple, easy-to-understand realizations of the scenario steps. Propagate into a DSL/Driver object that interacts with the system under test
3. DSL/Driver - the object that you write that interact with the system under test. Sets up data, interacts with the system and asserts the outcomes. Might interact with Page objects/drivers in turn.
4. Automation code - driver objects that performs the HOW (finally) in the interaction with the system. Enters input, reads and asserts values back from the system. Web page automation is found here.
5. System under test - the system that you are testing. The production code

It's not suitable for a single feature that you might throw away at the end of the sprint. But if you will maintain the tests over a period of time it will pay off. Tests that is hard to maintain will eventually not get run. Its a law of nature.

If you don't run your tests you have not only wasted the effort you put in writing them at the first place, you also waste an excellent opportunity to catch bugs and inconsistencies early.

I find this structure very helpful and I hope you do too.
