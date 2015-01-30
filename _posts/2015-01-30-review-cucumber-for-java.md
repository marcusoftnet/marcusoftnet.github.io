---
layout: post
title: "Review: Cucumber for Java"
author: "Marcus Hammarberg"
date: 2015-01-30 13:14:25
tags:
 - Agile
 - Specification By Example
 - BDD
 - Tools
---

Imagine that you want to learn a new technology or tool. Who would you want to learn that from, and how? For me I'd want to sit down and pair program with the creator (not The Creator, but you get what I mean) of the tool, and then someone who has vast experience implementing this and finally someone who knows this tool well on my platform. Preferable all three together.

This book is exactly that. It's an opportunity for you to learn Cucumber from Aslak Hellesoy (the creator of [cucumber](http://cukes.info)), Matt Wynne that has consulted and trained on the tool for a long time and Seb Rose that have build the Java Implementation.

Now, the important thing to remember about Cucumber is that it's not about the tool. Specification by example (BDD) is first and foremost a communication and collaboration technique that doesn't really need a tool. I've got a lot out of just "specifying with examples". But soon you want to verify your specifications and then Cucumber is great choice.

The author stresses this point throughout the book and make the reasons for Cucumber and human-readable tests (as opposed to JUnit test) very clear.

The books consists of 3 parts; the first gives you the basic knowledge about the tool but also the basic understanding of the process and how to use the tool. The second part is a "worked example" that goes beyond the basic. Not only do we get to know more about Cucumber and it's capabilities but also how to make sure that you are building a structure for you glue code that is maintainable over time. Also - there's more in this part on the process and what works and not.
The final part is more in the form of patterns and recipes and gives you techniques and approaches to handle common scenarios and situations, such as using Dependency Injection frameworks, testing web applications and APIs and running cucumber in a continuous integration tool.

Throughout the book there's a very nice "this is not that hard really"-tone that I enjoyed throughly.

Even though I'm not a Java programmer (and through the examples in this book, I hope never will be either.... GOD some of it is verbose) I got a lot out of this book. I am a long time user of Cucumber on the .NET platform (SpecFlow as it's known there), I even built part of the tool on that platform. Still I learned new things, tricks in the tool and ways to work with the tool that I haven't tried before.

I cannot recommend this book enough. In fact, I'd recommend the book to anyone working with Cucumber, regardless of platform. It's the best treatment I've seen on the tool.

Thank you!

Below you'll find my detailed, but rough, notes that I wrote as I read the book.

<a name='more'></a>

# Chapter 1
Nice whirlwind tour of BDD, it’s purpose and it’s history. Also hints how BDD can be used to bridge the communication gap and build trust.

# Chapter 2 - First taste
Lovely gentle tour that still shows much of the workflow, toolchain. “Gentle rhythm” of outside-in development.

By using the command line tooling we also get a nice little peek into how the tool is built and works. It can get messy (especially on a Kindle) but I like it.

# Chapter 3 - Gherkin
Also talks about the communication and process in its core. Gherkin is just the tool - not the center of our attention. Nice!

Huh? Didn’t know that you can replace the Given/When/Then with asterisks. #learningInProgress

Not only a reference but valuable tips along the way. Like sitting down with an experienced contractor and take part of his knowledge: by the way, if you do X then Y will cause problems when this grows - trust me I’ve seen it happen!

# Chapter 4 - Step definitions
Nice transition to the next natural step - step definitions. The Maven stuff made little sense to me, hard to read on the Kindle too, but that’s probably easier to understand for a java-guy. And if your following along.
Still shows both the syntax and how the tool is put together as well giving helpful advice and pointers.

Nice tips on regular expression and help to demystify them, step-by-step approach to building up your knowledge is very much appreciated here.

I like the deep dives on how Cucumber executes and parses scenarios. Knowing this will be very helpful for understanding “strange” behaviors.

# Chapter 5 - Expressive scenarios
“after all if your features aren’t easy for nonprogrammer to read, you might as well just be writing your tests in plain old code”.
The one sentence that most people hating Cucumber don’t get - it’s not a automation/testing tool; it’s a communication tool

The concrete, reality vetted tips and advice continues to rain down on us as we learn more and more about the expressiveness of Gherkin.

The focus of the chapter is to improve the readability of the feature and that’s intermixed with the API of Cucumber on how to get that to work. Great for me as a developer, and helpful pointers on what I can skip if I’m not.

Reading code and especially lined up tables in Gherkin is a mess when reading on the Kindle.

Great tip on the ability to add descriptive text under almost every Gherkin element. This improves understanding and readability.

Another great tip not to refactor in absurdum. This is not programming. Duplication that increase readability is ok.

There’s more great tip and advise on how to use subfolders and tags to organize and order your features. This is invaluable to get right as you get more and more features.

# Chapter 6 - Keeping your cucumbers sweet
Oooooh - this will be a great chapter; problems that you might run into!

Great pitch with the symptoms connect to it’s underlying problems. These are then described and explained. This will be very very helpful for me and probably many others too.

Amazing chapter! Well worth the book itself. Littered with solid, vetted advice and solutions to common problems and objections.

Read this twice!

# Chapter 7 - A worked example, part I
Now they put everything we learned into action creating a real world example. This closely resembles some of the lectures that Matt Wynne has given at Skillsmatter and that I learned so much from. I’m guessing that a lot of aha-moments will be had here.

In the process we also are introduced to a few new concepts like transformers and good habits for structuring your automation code.

# Chapter 8 - More on hooks and automation
In chapter 8 we are introduced to automation. This is a huge topic and it’s easy to get lost in implementation and framework details. I think the authors steer well clear of this.

Building on the previous example we are gentle introduced to a very good habit about structuring your code so that it’s less brittle as the scenarios becomes plentiful. It’s done so softly that you barely notice it.
You just end up with a very robust way of automating your application.

Hooks are also introduced and proven a very powerful feature in the teams where I’ve used Cucumber.

# Chapter 9 - Asynchronous
In this chapter the author tackles the age-old question for any author or presenter: “Yeah, that nice, but it’s too simple. I want some real world scenarios”.

The problem with doing that, of course, is to balance the level of real-world with the space and readability for ALL users.

I think it works in this case, but I’m betting that many would still cause this too simple. The techniques described is great and works well when waiting for a web page too. Maybe that would have made good second “realistic” example.

The weakest chapter so far for me. But that’s mostly a testimony to the greatness of the other chapters.

# Chapter 10 - Database
YES! Here’s the real deal. The topic in this chapter is one that I’ve seen almost all team starting out with automation trip up on. Looking forward to see what it holds

Now we need a bunch of tools and the introduction is kept brief but not too short. Still… it’s pretty heavy stuff for people new to the technologies, like me. But I got through it.
I would STRONGLY advice anyone really want to understand this to work along.

The chapter is driven by failures in our test. For developers used to TDD this is no biggie but I thought to myself that there are many step from first introduction of a database to the scenario passing again. Maybe nothing to anything about, but it sets a bit of a sad tone.

Love the introduction of techniques to manage the database. The one I’ve mostly ended up with is truncation, especially since it works nice in combination with migrations.

Great chapter - one that I will come back to often

# Chapter 11 - Dependency injection
The working example is over and we go into recipe mood. These last parts will prove very helpful for reference for Cucumber users.

The first topic is Dependency Injection. This topic surprised me at first since this is built-in in SpecFlow. Though very simple I have yet to hit a wall in using it.

In Cucumber for Java you have to point out the dependency injection FOR CUCUMBER that you want to use.

For the life of me, after reading this chapter, I cannot see how anyone want to use anything else than the recommended pico-cointainer. The configuration and obtrusive code changes that the other described options implies was nothing short but hideous.

Using DI in your step definition is very powerful technique to keep your step definition lean and clean and I’d advice everyone to learn this well.

# Chapter 12 - Working with Web applications
Cucumber first was used in the Ruby community and with Ruby on Rails web applications is “back at moms street” for Cucumber. Looking forward to see what the book teaches us here.

This chapter is a deeper dive into Selenium WebDriver and it’s API. We also get a glimpse of some more “advanced” techniques of modern web browsers, such as AJAX-calls for validation.

Through this the author shows us some good practices around automating a web browser. Personally I’ve mostly seen team shy away from this more and more as they keep using Cucumber, and by just glancing at the topic of the next chapter I realize that the authors are leaning to the same thing.

# Chapter 13 - Keeping your features fast
This chapter contains a lot

# Appendix installing Java
Boy, that was dense! I’m no Java user and don’t think I want to be either. I understand the reasons behind having small JARs but it makes a hard thing to stitch together for first time users, I reckon.
# Review