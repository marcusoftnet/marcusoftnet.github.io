---
layout: post
title: The Kondo software quality index
author: Marcus Hammarberg
date: 2019-03-20T18:16:46.000Z
tags:
  - Agile
  - Lean
  - Life of a consultant
---

Before I start I want to give credit where credit is due:

One of the things that I love most about being a consultant is all the amazing people I get to meet at my different client; brilliant, fun and experienced-oozing people that I don't see or meet online or at conferences. They are out there. [Scott Hanselman](https://www.hanselman.com) calls them [Dark Matter Developers](https://www.hanselman.com/blog/DarkMatterDevelopersTheUnseen99.aspx).

This blog is sparked from one of them; Yngve! Thanks!

At this client (where Yngve works as an infrastructure architect) we were struggling to measure software quality. The teams felt like they never got the time to take care of technical issues that have been lying around forever, that they were forced to tack on "yet another new feature" and that we had no good way to communicate this.

We needed a quick way to measure and track this - such as our non-technical coworkers understood what we meant.

We came up with the Marie Kondo-index for software quality.

<!-- excerpt-end -->

Measuring quality is notoriously tricky ([amazing blog post here by Gojko](https://gojko.net/2012/05/08/redefining-software-quality/)) and getting it in an understandable format, that also can be visualized felt almost impossible to pull off.

But here's the thing; if you asked anyone in a team they would immediately know the state of the systems:

> System B? Oh, that is crap through and through.

> Website X? That's in a pretty good state.

Developers and people working around a system generally know and they are (mostly) in agreement. You could see and hear it in how they talked about the systems. Face-palming and shivering in the worst cases and spontaneous invitations to my editor to show the cool thing we built.

They know. And they want to do something about it, but we can't show it.

So I suggested that we could track, inspired by [How to measure anything](http://www.marcusoft.net/2014/12/what-ive-learned-from-how-to-measure-anything.html), how *proud the developers felt* over the product they were building.

This is also closely related to the [XP value of simplicity](http://www.extremeprogramming.org/values.html), that in the end says:

> … We will create something we are proud of and maintain it long term for reasonable costs.

And it was at this point that Yngve, with his dry wit, stepped in and just said:
> You mean: "Does it spark joy?"

Yes, that is exactly what I mean. Hence the Kondo-index was born.

## Marie Kondo primer

If you now think:

> Who, on earth, is the Kondo-person he is referring to all the time?

then this section is for you.

<img src="/img/mariekondo.jpeg" style="width:50%">

[Marie Kondo](https://en.wikipedia.org/wiki/Marie_Kondo) is Japanese women that have quickly become an Internet celebrity. She is all about organising your stuff and home and can right now be watched on [Netflix](https://en.wikipedia.org/wiki/Tidying_Up_with_Marie_Kondo)

She oozes joy and inspiration that you cannot defend yourself from. She is in a word: lovely!

This is summed up in her catch-phrase
> Does it spark joy?

Part of her method to organise your home is about you having fewer things. Hence you want to throw away unnecessary things. One way to find those things is to:

* Put them all (all your clothes for example) in a big pile
* Pick them up one by and one and think, really think, Does this spark joy?
  * If yes - keep this gem of clothing and put it back in its box
  * If no - thank the shirt and put it in a box for donations

That's basically all you need to know about Marie Kondo and her organising method, to understand the rest of this post.

She is sweet as sugar and you just want to pick her up and have her with you. You didn't need to know that, but it's true.

## Marie Kondo and software quality indicator

So when Yngve suggested:

> How much joy does __it__ spark?

As a quality metric, it hit a nerve directly. It's the perfect question to ask.

We are trying a few different ways to do this:

* Ask the team to vote (1-5) if *it sparks joy* on a regular basis and create a compound index using the median value, or a graph showing all votes
* Ask the team to vote (1-5) if the different parts of the system and maybe create a compound index over all the systems
Two things on tracking this index, from my [Pirate Code post](http://www.marcusoft.net/2015/10/the-visualization-pirate-rules-of-rs-bungsu.html)

First, is this a quality metric? No - but it is an indicator of quality. If quality is amazing, you will see people talk about their stuff, with other teams, among each other - and they would look proud and happy. If quality is bad … you would not see that happening. People would not talk about the system, at least not in good terms.

Second - we measure to learn and hence focus on trends and learning. I don't care too much if the Kondo-index is 3.6 or 2.1. I do care that we do something about the value dropping off over time. And I do want us to recognise and celebrate the value going up.

## Summary

In Extreme programming, the value of simplicity talks about pride of our work being a key value. We can use our appreciation of the things that we build as an indicator of quality.

One useful and fun way to do this is to ask the team:

> Does it spark joy?

About the code. Track this on a scale (1-5 for example) and ask this at regular interval to get an indicator about how code quality is progressing.
