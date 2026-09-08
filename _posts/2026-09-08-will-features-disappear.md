---
layout: post
title: "Will features disappear?"
author: "Marcus Hammarberg"
date: 2026-09-04 04:00:00
tags:
  - Agile
  - Product mindset
  - AI
---

I was just in a meeting where we rattled of a few basic features to build on top of a database. It sounded a bit like this:

- Ok - let them browse the projects by name
- And by tags, of course
- Sure, and probably filter by location
- Wouldn't it be cool if they could see how many other companies in their industry have been involved in the projects in our database?
- Oh - and then, just for fun; let's put an LLM in place so that they can chat with the data, so to speak.

And at this point I just realized that the other features were now redundant. Because with our database hooked up to a LLM Chat that is operating on the data using an MCP server, all those questions would be possible to answer.

Are features not our main deliverable any more?

![Run MCP](/img/runmcp.png)

<!-- excerpt-end -->

## Disclaimer

Ok, ok. I do NOT know how the future will play out. And what I'm about to write will most definitely not be applicable for all features.

But ...

## History

I've been thinking about welding and punch cards - and that has helped me think more freely about where we are heading. And what my value will be in that world.
As long as I have been in professional software development (1998, for those of you that is counting) the main way we have delivered software in has been _features_. A way for the user of our application to do their work faster, better, easier, more or less ([The Daft Punk metrics](https://youtu.be/gAjR4_CbPpQ?si=pVtUlyfI8ZPSPnKq)). And the UI itself is also a feature - I will get back to this.

Sure there's been a lot of infrastructure and refactorings etc. but at the end of the day the features of the app has been the discriminating trait that makes users like an application or not. And what our clients and stakeholder has asked us to do.

## Features in the AI world

When the features was rattled off in the meeting above the other developer in the room (Joanna) and myself was going; `easy`, `fast`,`we can use the built in`,`oh shit - that will be a tricky join`.

When the LLM was suggested my initial reaction was; `no problems - that will be easy` but then I realized that interface _could_ be able to answer all needs that the earlier features listed.

For most of the needs a list in text or just light styling it might even be good enough to use. If you give the chat access to a design system (also through a MCP. Have you seen my t-shirt?) then we can nudge the LLM to spit out the result looking as we want it.

We could even generate the entire UI on the fly - aptly named [generative ui](https://generativeui.github.io/). Then the chat can generate fully functional UIs that let's you manipulate the data to your hearts content. Right in the chat or as a separate UI somewhere

## So no features ever again?

I'm the first to say that this will probably not be the only or even predominating ways that features are delivered. However, in the case above we were guessing how our users wanted to slice the information to get their job done in a good way. When we do not know that we can instead give them the general interface of a chat and let them ask for it.

But very often we might want to control details about how the interface is used and enabled. For example, which data are you allowed to see, is it even ethical to, is this useful etc. There's a long list of scenarios where we want to control the details.

But there another long list of bread-and-butter-functionality we just want to enable and here the concept of a feature make less sense. People might even use it in a way that we didn't anticipate.

One good thing with enabling a more general access to the data is that we can track what and how people are asking for the data to be shown, filtered, sliced and diced and learn from it. It's not too far fetched to think that the chat agent tracks this and then we can use this as input to our development agents to build a proper UI.

## Is chat really the best way to interact with a computer?

Ever since I first interacted with Chat GPT for the first time in 2023 (or when was it? AGES ago in AI terms) I thought that there has to be a better way to interact with the super powers of an LLM than to chat with it like we did in MSN Messenger. (And talking to it doesn't make a big difference).

Do I really want to chat about the data in my context? Apparently since nothing better has emerged yet, but it feels like we could do better.

The generative UI is one step in the direction I was envisioning, but I feel like we are still so early in the AI paradigm shift that we are thinking about how to use it in terms of the old way of doing things.

I'm often reminded of this picture

![Horse powered train](https://upload.wikimedia.org/wikipedia/commons/c/c9/B268828_Masseranos-Patent-Impulsoria.jpg?utm_source=en.wikipedia.org&utm_campaign=imageinfo&utm_content=original)

This shows the [Impulsoria](https://en.wikipedia.org/wiki/Impulsoria) that was an early train.

> The Impulsoria was a locomotive constructed in 1850 that was powered via a gearbox by one-two to four horses on a treadmill following a design by Clemente Masserano. It undertook trials in London in 1850 and was exhibited at The Great Exhibition in 1851.

Since we haven't yet invented engines but (apparently) trains - we used the old way of driving machines on the new world. In hindsight that looks stupid and naive, but at the time I'm sure it made sense. (The gearbox for more than one horse had me in stitches)

I'm thinking that our AI usage is in this stage too.

## Summary

A lot of the value that we are now creating as feature will probably be possible to enable in other ways, and hence the concept of _feature_ will be less and less prominent.

I hope it is replaced with output, impact and value. An LLM that allows me to ask the questions I need and returns the result as text might not be pretty but it solves my problem and is a lot of impact for pretty small effort.
