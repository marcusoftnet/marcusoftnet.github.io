---
layout: post
title: "Move the information to the authority considered harmful"
author: "Marcus Hammarberg"
date: 2016-10-03 20:18:21
tags:
 - Lean
 - Agile
 - Life of a consultant
---

I'm a big fan of [David Marquet](http://www.davidmarquet.com/) and his [Turn the Ship around book](http://www.davidmarquet.com/books/) that shows on excellent form of leadership but also challenge the way organizations are viewed and managed.

My favourite quote is a simple one:

> Move the authority to the information

I like it so much that I've already 2 years ago wrote a [blog post about that idea](http://www.marcusoft.net/2014/06/move-information-to-authority-and-not.html), outlining why this is a good thing and how we can save a lot of effort and time in moving the information back and forth.

The other week I realised that there's other, more subtle and viscous wastes in continuing to move the information to the authority (as we do now). In this post I will describe what that is and how to avoid it.

<!-- excerpt-end -->

I've often been working in quite big organizations and something that often happens there is that you need help from higher levels above to solve problems that is hindering our flow.

Maybe and example clarifies what I mean - this story is made up but very close to reality where I have been working over the years;

## Move the information to the authority

Let's say that you want to start to deploy code more frequently to production. Within your team that is not very hard to do, but since the actual deployment is done by another team and needs to be cleared by a Change Management Board on Tuesdays each week you have a problem.

No-one in the "deploy to production" team or the "Change Management Board" have the authority to change the way they work just to help you. They are measured and followed up on other metrics than the one that your product is measured on.

You need to take this higher up. To the management team. They make the decisions in matters like these, cutting across departments.

In order to present this information in a correct way you need to **summarise** the information, calculate a **business case** and present some certainty of **positive** improvement (or they will not look at it) and finally **get time** with the correct people in a meeting where they are ready to make the decision.

Since they only meet for 1 hour per week (if you are lucky) they will have a lot of things on their agenda. That means that you need to digest and be concrete in the information that you present - making **only the important** parts stand out.

It also has to be **simplified** so that the people in the management team can understand it without having the deep knowledge of the problem at hand.

In the meeting some details around your business case is not clear so you will have to **redo** some part of the decision material to further explain and clarify the situation, context and need.

On the next weekly meeting your point is #13 out of #25 and a decision is made that a project group will be assembled to look over the situation and come up with a new policy for how deployments can be done faster *by the deployment team*. That project is to report back to the management team within 4 weeks.

Also the (outsourced) deployment team will be inquired on why they are so slow and their on-site representative will be asked to produce a list on actions to help them move faster.

On your way out of the meeting you get a sinking feeling that you may not have got decisions for the right thing by the management board. Did they really grasp the situation? It was not moving the deployment team faster that really was the problem, but that was all you had time to talk about in the short time span. Your next slide had other, more important things.

Next time you decide to [work around the system](http://www.marcusoft.net/2014/11/goodpeople.html) instead of going the correct way. Surely that has to be better

## Problems

Oh my Lord that made me depressed. I've been in there many times.

Here's a funny picture of a cat hacker to lighten up the mood a bit

![Cat Hacker](/img/cathacker.gif)

You ok?

Ok - let's try to analyse the problems we saw here.

### Depressing

Well first of all you get depressed by banging your head like this against the administrative wall of Kafka. It does not spark innovation and joy, or what do you think?

If you are subjected to this kind of slowness for long you will start to whine and talk badly or sarcastically about your own organisation.

I'd rather work in a place where I'm proud of what we do.

### Time taken - Cost of Delay

Then there's the obvious loss of time in all wait-states here. First of all we are waiting for the decsion to be made and maybe cannot continue our work until it's done (or worse work around that waiting by building workarounds into our system…)

Worse; what if that decision actually would give us value (du-uh - I sure hope so). That value is delayed. This can be calculated as [Cost of Delay](http://www.leadingagile.com/2015/06/an-introduction-to-cost-of-delay/) and is a really good way to measure the cost of waiting.

### Lost in translation - making decisions on flawed information

Let's be fair to the management team here. They, most likely, didn't set this system up. It's not really their fault that they are the only once that can make decision.

Let's try to be in their shoes.

On the meeting in question 25 different items that requires your decision was brought to your table. All of them important and all to be decided within the 45 minutes you have for "decision board" or whatever it's called.

How can anyone take in sufficient information, understand the complete problem and context to make wise decisions for all those point? In short; you can't.

The only sane thing ([or …](/2016/10/move-the-information-to-the-authority-considered-harmful.html#move-the-authority-to-the-information)) to do is to ask for simplifications, summarisations, briefs and then trust that that compilation of all the context, information and situations on the floor is done correctly and then … make the *correct decision*

Whatever decision you do make it seems to always cause people to be upset or angry with the decision you made. They say; "they simply don't get it"

### "I'm only writing reports"

There are people whose only job is to move information from one point to another. Many people. I know - because I've met them. Hey - I've been them.

If their (mine) kids ask them what they do for work the answer:

> I'm an emailer
>
> I'm an powerpoint creator

Their job is to summarise, simplify and concretise information, situations, context and problem that one group have, a group that they are not working in, to present to another group of people, that is not in that situation either, so that the second group can make a decision to help the first group.

It's weird. Hey, even that sentence is weird, but that might be my bad english.

### Where's the gemba - no presence and understanding

The poor management team are not on the place where the work is being done. Because they are busy in meetings deciding no how to solve problems on the job being made on the floor.

In lean terms; there's no managers gemba. Gemba is Japansese and literally means "the real place" which detectives used to say that they are at the crime scene.

Not being at the shop floor means that you are [not gemba, not at "the real place"](https://www.wikiwand.com/en/Gemba) where work is being done. If you are not someone has to describe that situation to you in order for you to fully understand it.

Typically, in order to fully understand a situation, you need to be there a long time.

That's why there's [many famous stories](http://indolean.blogspot.se/2008/01/ohno-circle-learning-through-genchi.html) from lean companies where managers observe a work place for a long time, even work there from time to other. I've heard stories about big companies (Amazon?) where every employee are required to work in the support function for a week each year - just to get a feel for the pains of the customers.

## Move the authority to the information

That sounds bad. And sadly I've witness this more times than I care to remember.

Let's [turn the ship around](https://www.amazon.com/Turn-Ship-Around-Turning-Followers/dp/1591846404) a bit. Let's play with the idea of moving the authority to the information.

But how would that work? Surely we don't want people to just make decisions how they like… And that's not the idea either.

This is something that I often hear people tripping up on when talking about moving authority below; it's not about letting people do whatever falls into their mind - it's about letting them make decisions as it the CEO was standing right behind them. As if they had the values, mission and vision in their DNA and then made the decision.

And, as [David Marquet says in his famous TED talk](https://www.youtube.com/watch?v=OqmdLcyES_Q);

> …if that's another decision than you envision it's a **better** decision. Because they **have the information** at hand.

For me the idea of "moving authority to the information" is building around three values:

**Trust** - as in showing people that they are trusted by **giving control** to them. "I trust you to make the best decisions - you are now in control of deploying to production when you see fit"

**Transparency** - let them know that the **information will be transparent** and open for everyone to see. "Every deployment will be logged like so that we can see who did what" - check out any big open source project at [GitHub](http://www.github.com) and you'll be able to track every single change ever made.

Another example; at my company, [Aptitud](http://www.aptitud.se), all invoices for things that employees buys will be sent to everyone in the company. Sure you can buy a TV and call it a "computer related working device" - but remember that everyone will see it.

**Accountability** - if you make decisions you will also face the consequences. At Amazon this is summarised in the slogan ["You build it - you own it"](http://aronatkins.github.io/2014/12/23/you-build-it-you-own-it.html). You will have to take **responsibility** for the things you do. Just likes adults do in real life.

These three go together; demanding transparency without trust is just micromanaging, trusting without any accountability is irresponsible, hold people accountable without giving them authority is cruel.

## Summary

Moving the information to the authority is dangerous, slow, break down peoples engagement down and leads to flawed information that is hard (or impossible) to make good decisions from.

This is what we spend a lot of time doing in many organizations today. There's a simpler, faster, more fun and engaging way.

> Move the authority to the information.
