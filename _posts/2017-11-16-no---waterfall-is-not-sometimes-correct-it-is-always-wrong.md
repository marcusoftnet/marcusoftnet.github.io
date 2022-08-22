---
layout: post
title: No - waterfall is not sometimes correct. It is always wrong
author: Marcus Hammarberg
date: 2017-11-16T10:41:45.000Z
tags:
  - Agile
  - Lean
  - Life of a consultant
---

Every other day I meet people and organisation that says something along the line of

> We're doing agile for some of our work, but other needs waterfall.

I'm getting increasingly annoyed with that statement. Waterfall (phases with big batches of work) is always wrong. You should get out of that thinking as fast as possible.

Any agile person reading this will not believe it. But believe it. Waterfall is _very much_ alive and being hailed in ~~most~~ many organisations today, in my experience. Especially on the business side of things.

<!-- excerpt-end -->

And please don't believe me about this. Take it from an authority. Let's pick … [Dr. Winston Royce](https://en.wikipedia.org/wiki/Winston_W._Royce). He's a good pick because he is the guy that coined the term _waterfall_ in the first place. In the seminal ["MANAGING THE DEVELOPMENT OF LARGE SOFTWARE SYSTEMS"-paper](http://www.txtscribe.me/athenaeum/waterfall.pdf).

Here's an extract of page 2 (!)

<Img src="/img/waterfall.png" width="100%" />

This is a diagram that I've seen copied more times than I care to count. People are still doing this. Yes. They do. Not only that - organisations are arguing that this is the only way to do certain things. And by the way, this thinking is applied to all kinds of projects - with the same kind of problems following.

Now, let's see what Dr. Royce has to say about the above picture. It's right there in the picture. The sentence after that very often-copied model.

> I believe in this concept, but the implementation described above is risky and invites failure.

He felt this when he wrote it, back in 1971. That's when systems had at most 2 users using them. Most of the software we wrote was batch-processing physical punch card. It's a long time ago, ok.

## Why is it bad then?

I (and many others) can talk about this for decades. Hey - that's what we have been doing since the [inception of agile](http://agilemanifesto.org/) back in 2001. But of the top of my head:

You are **maximising risk** exposure by doing big batches. Taking big decisions up-front, when you know the least. I'm a firm believer that no-one actually knows what will work best until we try it, see the result and then tweak it. Again - [don't believe me](https://blog.optimizely.com/2010/11/29/how-obama-raised-60-million-by-running-a-simple-experiment/).

It's much **harder to be predictable** since nothing is done until everything is done. Meaning that even the simplest thing will be slowed down by the most complex task. The hard discussions on the scope or deadline changes are taken later, **increasing the irritation** of the client.

You are **prolonging the time to return your investment** as much as possible. By doing big batches you ensure that anything that could have been used (and tested) early will not be used until everything can be used.

We get very **few, and late, opportunities to learn**. We are doing fewer and bigger releases (**increasing the risk in each release**, by the way) which mean that feedback comes to us late and slow. This makes it much harder to learn or improve the product.

**Thinking is not required**. People in the waterfall are not utilised to their full potential. You get handed a specification to implement (or build) and questioning it at a later stage is slowing the progress of the project. Hey - if you find a big problem you are risking the entire thing from succeeding. Psst - [it _very_ seldom does succeed](https://www.infoq.com/articles/standish-chaos-2015).

With fixed deadlines you are forcing people to **minimise quality and take shortcuts**. This creates problem further down the line as the focus has been keeping deadlines rather than to make a quality product that will last and be easy to continue to work.

## What to do instead?

Read everything on agile… and then apply it.

This is a topic WAY to big for this post, but as a hint:

* Strive to take small ideas to "used by users" fast
* Adopt a hypothesis-driven approach to development of things - where you pose a hypothesis and then come up with _the smallest possible experiment to try to see if the hypothesis was **wrong**_
* Optimise for learning
* Use the full potential of your working force by having autonomous teams that can take small ideas to production (used by users) fast.
* Change ([yes I said it](http://www.marcusoft.net/2013/10/YesITalkAboutChange.html)) your current process frequently. It's only "best so far" and was designed for how your context was at the time it was designed.
* Make your work visualised
* Limit the number of things you work on at the same time, as an organisation. The lower number you get to the faster it will be. Don't trust me - [trust math on this](https://en.wikipedia.org/wiki/Little%27s_law).
* Change your project plan for [incremental delivery](https://en.wikipedia.org/wiki/Incremental_build_model)
* And many, many more things that should go into a book

### Yes, but for [big thing that we don't think can be done in a lean/agile way] it doesn't work

This is the obvious and common objection. Got it three times this week alone. So far… It might sound like this:

> Yeah sure, but when you're implementing SAP you cannot do that in small increments.

To that statement I will no just add:

> Yet. No you (we) cannot do that yet. Let's see how we can get there.

Lean was invented by Toyota and a man called Taichii Ohno. All this work was guided by trying to shorten lead time through a faster and smoother flow of value. Famously summarised in this quote:

> All we are doing is looking at the timeline, from the moment the customer gives us an order to the point when we collect the cash. And we are reducing the timeline (by reducing the non-value adding wastes)

Here's an example, I've [blogged about this before](http://www.marcusoft.net/2017/08/changing-the-die-that-cant-go-faster.html) but I'll repeat it here:

Taiichi Ohno (and in turn Toyota) let their strive for a faster flow change things that were considered constants.

At the time (and still, I presume) you make cars from a roll of steel that then is stamped into the required parts for the model needed. These dies, of course, are very heavy and sturdy since you, quite literally, are stamping things out of steel. Also, they need to be extremely precise as smallest problem would replicate throughout all the parts stamped out.

Changing a die to stamp out another part was very time consuming and hard work. It took a full day to change them and that was considered a constant.

Now with the focus on higher flow and flexibility, required by the limited buying power and demands in the Japanese market - a day to be able to change die was not enough. So with relentless, and typical Japanese/Toyota, dedication Mr. Ohno started to improve the change mechanism.

After 20 years (!) it was down to just 3-minutes. Toyota could now easily switch dies back and forth to fast and smoothly create the particular car parts required. The batch size and inventory were kept to a minimum while flow was intact.

This is the famous [Single Minute Die Experiment](https://en.wikipedia.org/wiki/Single-minute_exchange_of_die) and beautifully illustrates my point. When Ohno started his journey no one would ever think about the 3-minute die-exchange. He totally changed the way they used and operated the dies. Much as agile has totally changed the way we do software development.

He did this because he was [guided by the value](http://www.marcusoft.net/2017/09/values-to-guide-us.html) of a faster flow, shorter lead time.

## Summary

Waterfall is always wrong. It optimise for risk and failure. [Believe the guy that invented the concept](http://www.txtscribe.me/athenaeum/waterfall.pdf).

You are still using it because you have not found a better way. Yet. But a better way is there for you to discover. Go find it! You customers are waiting for you.