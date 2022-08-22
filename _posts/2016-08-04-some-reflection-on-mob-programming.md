---
layout: post
title: Some reflections after seeing mob programming in action
author: Marcus Hammarberg
date: 2016-08-04
tags:

  - Agile
 - Lean

  - Kanban
---

Since the first time I heard the term [mob programming](https://en.wikipedia.org/wiki/Mob_programming) it has intrigued me. I love things that challenges me and me perceptions.

The idea behind mob programming is deceptively simple and yet powerful: have all the team member (3-5 seems most common) working together on one keyboard, one computer and one feature at the time. Or as [Woody](https://twitter.com/WoodyZuill) more eloquently puts it:

> All the brilliant people in the same room working at the same problem at the same time

What struck me is that this simple idea solves many problems that I often see teams struggle with.

I've [written before](http://codebetter.com/marcushammarberg/2013/08/06/mob-programming/) but never been full time member in a mob. However just before the summer I saw two excellent examples in action, and I have number of friends that have been full time members of a mob for more than a year. My interest with this has led me to interview them often and deeply.

In this post I wanted to share some things that I've seen. Mind you this is only from the 5-6 mobs that I've been in contact with thoroughly. Other examples and variants are probably found. This is just my observation.

<!-- excerpt-end -->

Below when I talk about mobs I talk about the ones I've seen in practise; cross functional teams that turn ideas to working features in production that users are using, responsible throughout the process. I'm sure you could have a Dev-only team that delivers to Test, but I fail to see the purpose since that's basically just speeding up a part of the process.

## Peace-, thought- and purposeful progress

One thing that stands our for all the mobs that I've been seeing in action is that they work very purposeful and almost peaceful. Sometimes it's painstaking to watch - but always with high code quality as the driving force.

There's almost another feel in the room when work is being done: no stress - just correct, slow, ground winning work being done. It's like every keystroke is handled as if it was made of glass.

At first it made me nervous - come on guys! Hack away! But after watching the *outcome* of the work being done (as in the correct working features being used in production) and hearing about the throughput being achieved it filled me with fascination.

One team of 4 people had a counter part off-site. The offsite team didn't know how many they mob team were, but the guess was in the 40-50 people range. That team in particular was moving very thoughtful as I observed them. That team has a cosy sofa where the part of the mob not typing is sitting (slouching in some examples). *Very* relaxed feel.

I think this purposefulness comes from the way that programming in a group like this forces you to **externalise** your thinking. This is talked about to great effect in the excellent [Turn the Ship Around](https://www.amazon.com/Turn-Ship-Around-Turning-Followers/dp/1591846404) by [David L. Marquet](https://twitter.com/ldavidmarquet).

In a mob you cannot just type or think away on your own. It has to be verbalised and described to others. In doing so you have to put word to your reasoning and often this helps us to better understand the problem even before we've written a line of code. If you're alone programming - try [Rubber Duck programming](http://www.rubberduckdebugging.com/) to achieve something similar (although a bit more silly)

Even in the best teams I've been working with a feeling of stress and urge has from time to time manifest itself. The mobs that I've been watching have kept their cool - even when the heat is on.

## Truly working as a Team

One of my favourite article about mob programming is by [Jason Kerney](http://jason.teamkerney.com/) and is called [My first team](https://www.agilealliance.org/wp-content/uploads/2016/07/Mob-Programming-My-first-team.pdf) and it talks about my second observation; mobs are a great example of *actual* team work in practice.

Everyone is working together on the problem - there's no Us and Them, there's no "handing it over to Ops". It's just the team and the feature that needs to be completed.

For example, consider testing and contrast "normal work" with mob programming in these questions:

* When is a feature in test? How would you know that? How can you see that?
* When do we start to test? Who decides that? Who can change that?
* When is a feature completed? Who sets the standard? Who make sure that the standard is followed?
* If you take a short-cut in quality - who pays? Who notices?

Even in very tight teams that I've been working with it's often someone else (doesn't have to be a test but often is) that is testing the code I've written. In some cases that's even a rule. It creates a hand-over and already there is a gap between "developing" and "testing" that simply cannot exist in a mob.

I've never heard anyone in a mob talk about other people in the mob as "they" or "them". It's always "we" and "us".

I have heard people in normal team talking about the "testers in our team".

## Ownership

As I mentioned the teams I've witnessed and interviewed have full *ownership* of the application. They feel and act responsible for the application. You can hear it in the way they talk about *their* application. They are proud of it - it's their baby.

Often the ownership of the actual product might not be with-in the team, but all the teams that I've seen in action have a strong knowledge and interest in the product itself. Sometimes to the point that they know the business better than the business people themselves.

This interest of "how the product is doing" manifest itself with desire to measure and see how the work the mob is doing contributes to that. I saw a very cool counter showing number of payments being processed in the payment team at one company. It was simply ticking up number of SEK as the payment was processed. On a screen right next to the mob station where the application was developed. How's that as a close connection to the business?

I've seen metrics like that in other teams, but never being driven from the team themselves. This mob actually created this measurement without anyone asking because they wanted to know themselves.

## Problems

I asked a colleague ([Åsa](https://twitter.com/_asa)) about what kind of problems they have faced during the 1 year (plus) they have been programming. She had to think for awhile but then she told me two things, and both I think many mobs will face.

The first is the obvious acceptance in the organisation around the mob. Why should they sit around slacking all day? What about that sofa - why can't we have one of those? Those "mob-guys" - they seem to do nothing?

All teams I've heard that started to do mob programming have the same story to tell:

> We just started to do it one day, because it made sense to us. We didn't ask anyone. Once the throughput and quality that we delivered was apparent - no questions was asked.

That's what my [original blog post](http://codebetter.com/marcushammarberg/2013/08/06/mob-programming/) was all about. The seemingly weird thing that we are many people **not** typing and still a lot more get done. That is a hard thing to see past in many organisations. I think "just do it and let the results do the talking" is a great way. Sadly.

The second problem Åsa told me about was when someone in the team doesn't follow the *rules*. What if I go home and just hack together something that I think is better? How should the mob handle that? We did decided that all code is to be written in the mob, no didn't we?

It's interesting to hear about how the mobs are tackling questions like this. This of course comes down to personality and trust. Do I consider the code that I write better than the code in the mob? Or can I accept that the mob will write something different that I would write? Even accept that it's better? Or * *gasp* * worse even and still be ok with it since it's now known and understood by more people.

Just like with many practices there's of course people that will not like this way of working. I wouldn't recommend forcing anything on anyone. Mob programming included.

In fact - I hope that someone someday shows me something better. And that I will get amazed about that too.

## Never look back

I ask every person that I've met that's been in a mob full time for more than a month the same question as a final question;

> Would you want to change back to the way you worked before?

Until now I've never heard anyone answer Yes to that. More commonly the answer is something like:

> Going back?! No - then I'll rather quit the company. 

I've never heard that about new ways of working before.