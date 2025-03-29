---
layout: post
title: Should I add bugs-scenarios in my specification?
date: 2012-03-07T19:55:00.001Z
author: Marcus Hammarberg
tags:
  - BDD
  - Specification by example
  - Agile
modified_time: 2012-03-27T13:17:19.985Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5573551079010100753
blogger_orig_url: http://www.marcusoft.net/2012/03/should-i-add-bugs-scenarios-in-my.html
---

Right now I’m very impressed with the way that two my colleagues ([Hugo Häggmark](http://www.hugohaggmark.com/) and [Tobias Karlsson](http://www.tobias-karlsson.se/)) has introduced [BDD](http://en.wikipedia.org/wiki/Behavior_Driven_Development) or rather [Specification by example](http://specificationbyexample.com/) at their client. They have in a very short time gone from people not speaking to each other (analysts and developers) to collaboration around the scenarios of their specifications and demos running from those specs. I’m officially impressed! [Another colleague](https://twitter.com/#!/toresta) even threw together a speech engine integration that speak the SpecFlow features as they are run. Silly but …Coolness!
I got a very interesting and I think common question from Hugo that I thought I’ll share here, since the answer might be useful to others.

> Hugo asked me if I update my specifications with any bugs found later on. Or if not – where do I keep them?

The reason for adding bugs in the same .feature file as the specification itself is of course compelling; over time you would get a long list of every change ever made to the specification. Every bug we’ve fixed and it’s always up-to-date and automatically verified against the system. Nice…. but are there some drawbacks?

### Bug scenarios – yes please

Firstly let’s agree on that creating [Cucumber](https://github.com/aslakhellesoy/cucumber/wiki/) style scenarios for bugs that occurs is a very good thing indeed. It’s a nice little work item and it automatically sorts the “I cannot reproduce”-problem. Also when the scenario is complete you have nice regression for bugs that you have fixed.
I also recommend this a good starting point for people who haven’t done test automation before. Start by automating a bug or two making sure that they don’t come back once you have fixed them.
But when it comes to adding them to the specification…

### Specification with key scenarios

In the excellent [Specification by example book](http://manning.com/adzic/), [Gojko Adzic](http://gojko.net/) comes back again and again to the concept of key examples. And that a specification (as thought of in Specification by example) in essence is made up with a user story and key examples that helps us understand the story.

It’s not every possible way that the user story can be played out… It’s key examples to help us collaboratively understand the story better.

So back to Hugos questions; should I add scenarios for bugs under the specification? No probably not – is my answer. The specification will, over time, be cluttered with a lot of scenarios and the nice idea of a user story with examples that gives clarifying examples is lost.

### So no bug scenarios then?

Aha – I didn’t say that! I still think that creating bug scenarios is a great idea, but it can be done in different .feature files. Then they might cut the system in a different way as well to better suit the description of the bug.

They can be tucked away in a different folder and [tagged with some tags](http://www.marcusoft.net/2010/12/using-tags-in-specflow-features.html) (@bugfix or @regressionTest) that you only run on daily builds, keeping your continuous build quick.

Maybe a folder structure for you feature-file could look something like this:

Specification (a separate Visual studio project probably)

- Specifications
- Fixes
- [Effective User Interface Testing](http://gojko.net/2007/09/25/effective-user-interface-testing/)
- ...
- ...

I’m sure your creativity is better than mine when it comes to making up different groups of features.

### How many key examples should a feature have then?

So one could wonder; how many scenarios / key examples is correct for a specification then? Well … being a consultant you know I have to say; It depends.

But I’m sure that 1 is to few and 10 is to many. Even 8 is stretching it and probably showing us that we should have a new feature instead. You should at least show one successful and one failure example of using the story (logging in successfully and logging in with failures for example).

Enough for everybody in the team to be sure that we all mean the same thing and agree on how it should work. It really comes down to what you are specifying and the complexity of the business logic.