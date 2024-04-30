---
layout: post
title: Communication and rotting specifications
date: 2013-10-17T11:23:00.002Z
author: Marcus Hammarberg
tags:
  - BDD
  - Life of a consultant
  - Specification by example
  - Agile
modified_time: 2013-10-17T11:25:02.272Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-4899659258879319994
blogger_orig_url: http://www.marcusoft.net/2013/10/specification-by-example-is-about.html
---

Over and over again I've seen the main gain from using [specification by example](http://specificationbyexample.com/) emerge in the conversations you have around the specifications. I've even been known to tell people to just make sure to do the specifications on a whiteboard, take a photo of it and then don't use anymore of the practices. Just doing that will help an awful lot - I promise.

But lately I've come across a situation that have got me to think about the other end and what happens when we don't automate our scenarios. It's a continuity thing and it doesn't hang together.

If you read my blog before you know I'm a sucker for stories and let me illustrate my point with two stories.

### Only workshopping

![Image](http://spotifypresscom.files.wordpress.com/2013/01/spotify-logo-primary-vertical-light-background-rgb.jpg?w=122&amp;h=150)

The first story comes from a team at [Spotify](http://www.spotify.com/), that moved faster than any other I've seen. We're talking deciding how to improve our business in the morning, code it during the day and deploy it in the afternoon. I was assigned to coach this team and we came to talk about specification by example and gave it a try. I thought.

I got the team into a room (four people) and using their next thing to build (which actually was big in their numbers; two weeks worth of work) as an example we simply specified the business rules. As often it ended up a big table on the board. In the process (again as it often does) we found a couple of inconsistencies, better ways of doing things, and could actually skip a couple of cases.

The end result was a big table that I drew for them. We took a photo of it and I sent that to the team in an email. I then showed them [Cucumber](http://cukes.info/) and gave them some pointers to good things to read. And off they went.

A couple of days later I checked in with the team again and asked them: "Could you run some scenarios for me?". Their answer?

> Say what?! Ah - the automation stuff. Well, we skipped that. But the workshop was awesome - we learned so much about this. Thanks. The feature is actually close to finished. Both the coding and the testing has been super simple since we could just follow the "spec" in the photo.

They simply didn't *need* the automation part for their work. And since it probably shouldn't last for that long in production the specifications was short lived.

### The whole shabang, and a bunch of rotten specs

![Image](http://specificationbyexample.com/images/sbe-cover-150.jpg)

At another client they have gone all-in on specification by example. They wrote the specs together (learned a lot), refined them into their business language, automated them against their system, ran them often and also generated a nice documentation using [Pickles](https://github.com/picklesdoc/pickles). This had been going on for a couple of years and they had about 400 scenarios.

One day a tester came over to me and said:

> I love the pickles-site, it's so easy to read and search. But when I browsed through it I saw some cases that were missing and an error. Can I update those specifications through the Pickles-site?

(No you can't. Pickles is a read-only-generated documentation, for a good reason. You want the text in the scenario to be tied with the version that implements them. Sidenote)

Now... this was strange. How could it be errors in there? Well as it turns out the practices of writing and maintaining the automation of the specifications had been abandoned a year ago. It was too cumbersome and "took too much time". Besides "the automation was too brittle and was a hassle to maintain".

But now we came to realize a thing; the specifications had rotted. Just like any documentation that we cannot have checked for us continuously.

### Findings and conclusions

Now to the real reason of this blog post; No - you don't **have** to do the automation part. But if you don't you will end up with specifications that will be out of date the second someone changes the system (writes code in other words).

And yes - writing the automation part is hard, hard work. So what do we do when something is hard and complicated? We break it down into the smallest possible piece. Writing the automation of a scenario is not that hard (and will teach you a lot about your code) if you do it before and during the implementation of each new feature.

Keeping the other specifications (regressions) up to date could be hard work if the tests are brittle, for example, hitting the UI. Always keep maintainability as a top priority when writing your automation code.

Finally, slow running tests are a regression problem that should be addressed in the same manner as you do a bug that is introduced when developing a new feature. That's not me saying that. It's [@Holman](https://twitter.com/@Holman) in this [awesome talk](https://vimeo.com/43676958).

### Tips

So that was a bunch of bad news and more work for us to do... What can we do about it? Here's my short list of things that could help the situation.

#### Specifications are not tests

In [his book](http://manning.com/adzic/) [Gojko Adzic](http://gojko.net/) talks very little about testing and quite a lot about specifications. Yet a lot of us (yes, me too... probably in this post even) often confuse the two. I think that's because we use a testing framework to implement the specifications.

Let's take an example business rule: "if you buy three books, or more, shipping is free". If you had your tester hat on which cases (for the number of books) would you try?

| Number of books | Free shipping? |
|-----------------|----------------|
| 2               | No             |
| 3               | Yes            |

There's a difference in focus here. And by all means we might have to do all the other tests as well but they don't teach us more about the business rule in play.

#### Write once, run never

That heading is a bit misleading but I've heard about teams that for new features write the scenarios and automate them, but when the feature is implemented they throw the scenario away. Mind blown! Why would they do that?

They need the scenario(s) during the time they develop and test the feature but afterwards it isn't of that great use to them. Instead they keep a much smaller suite of features that shows the main flows in the applications and the most important (or complicated) business rules. Maybe always keep that specification suite to 50 features, for example.

If a new feature updates any of the main flows they, of course, go through the trouble of updating that suite of specifications.

#### Don't automate against the UI if you don't have to

UI automation is super cool and I still get a buzz from seeing my scripts clicking around in my application. But UI automation is inherently slow and brittle. You don't have to use it to verify your system. Maybe you can just verify this feature using your domain, or running your system but in a controlled environment, with mocked dependencies (see my [post on doing](http://www.marcusoft.net/2013/02/NancyTesting5.html) this with [NancyFx](http://nancyfx.org/), or if you can stand it; [watch me presenting this](http://skillsmatter.com/podcast/agile-testing/cuke-envy-a-dot-net-programmers-attempt-to-catch-up) instead).

Doing this will not only make your executable specifications run faster (which in turn assures that they are run... often) but they will be more resilient to changes in your application. The UI is the part of the application that changes the most, in my experience. UI automation means writing code to run the application. That means tying your automation code directly to the UI, in some way. Change the UI automatically means changing the UI.

Keep maintainability your first priority when automating.

### Summary

The greatest gain of specification by example is the improved communication. But the output of that communication rots pretty fast. If you want to keep your specifications relevant you need to automate them. If you automate your specifications you need to have them run fast, and be resilient to change in your application.