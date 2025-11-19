---
layout: post
title: Repost - Mob programming – full team, full throttle
author: Marcus Hammarberg
date: 2013-08-06 08:32:58
tags:
 - Agile
 - Lean
 - Tools
 - CodeBetter re-posts
 - Mob programming
---

## REPOST FROM CODEBETTER

I noticed that [CodeBetter](http://codebetter.com/marcushammarberg/) is slowing down. Maybe dying. I'm preserving [my post from there](http://codebetter.com/marcushammarberg/2013/08/06/mob-programming/), here to my site.

This particular post makes me very proud to repost here, since it's apparently one of the first posts ever written on mob programming, not by [Woody Zuill](https://twitter.com/WoodyZuill) - the father of the concept.

## Original post

One of the things that fascinates me with our industry is that you can learn new stuff, things that throw your current ideas on end and even provokes you – every day. For my first blog post here I thought I share such a concept that have surfaced to my mind the last couple of months.

Being offered to blog for CodeBetter was nothing I expected and I’m deeply humbled, a bit proud and somewhat nervous. So I thought the best way of handle those feelings was to just write about something that provoked me a lot when I first learned about it, and probably will provoke you too. This way we get to know each other, I thought :).

In this post we’ll take a look at [mob programming](http://mobprogramming.org/) – a concept that made me ask the same questions that I have had to answer for agile practices that we take for granted today, like [pair programming](http://codebetter.com/gregyoung/2013/07/18/pair-programming/) and limiting work in process. The post has two parts; first I’ll quickly introduce the concept of mob programming and then have a little discussions on the implications of using it. Hopefully provoke you a bit in the process and maybe tempt you to try it out.

But beware: mob programming is only for those that really want to deliver stuff really, really fast. And with the highest quality possible. The rest of us cannot handle it.

<!-- excerpt-end -->

## Mob programming – what is it?

![Mob Programming](/img/MobProgramming_A_Rich_Tradition.png)

From <http://mobprogramming.org/> (c) Andrea Zuill

The basic concept of mob programming is simple: the entire team works as a team together on one task at the time. That is: one team – one (active) keyboard – one screen (projector of course). It’s just like doing full-team pair programming.

Just as in [pair programming](http://en.wikipedia.org/wiki/Pair_programming) you have a driver that uses the keyboard and focus on the details (writing the code, following our coding standards etc.) and the rest of the team acts like navigators that focus on the higher levels (are we solving the right problem, what’s next etc.) as well as helping the driver when needed.

As in pair programming we rotate drivers on a regular basis. There’s different strategies for this; ping-pong-pairing means that you write a failing test and then pass the keyboard over to the next person that fulfills that test and writes a new failing one before returning the keyboard. That might not be feasible for your ~~team~~ mob so then you can use a timer to manage the rotation. Every 15-20 minutes for example. Find an interval that works for your mob and experiment to refine it.

There’s  more to tell and subtleties to mob programming but that’s better told by the man that came up with the concept [Woody Zuill](http://twitter.com/WoodyZuill) over that the [mob programming web site](http://mobprogramming.org/). Actually – there’s not very much more that you need to get going. [Here’s a time lapse video](http://youtu.be/p_pvslS4gEI) that shows a team doing 8 hours of mob programming (takes about 4 minutes to watch) that shows mob programming in action.

## Mob programming – why is it interesting?

At this point you probably have a lot of questions and some of you, like I did the first time I learned about it, grew angry and said: that’s simply not [efficient](http://www.dailyblogtips.com/effective-vs-efficient-difference/)!

Let’s answer that argument in two steps. Not it’s not efficient… if you’re into the business of having maximizing the number of keystrokes per developer. But if you’re into delivering fully working features with the shortest possible lead time, well then there’s actually no quicker way.

### Lead times

Let me clarify what I mean. Imagine that we have a team with all the resources needed to take a feature from idea to production. We have developers, testers, BA’s and designers. We’re using [continuous delivery](http://en.wikipedia.org/wiki/Continuous_delivery) and can push to production as often as we like. When this team works with one single feature, that feature moves from idea to production (what Lean-folks call lead time) at maximum speed.

For every question that pops up, there’s someone ready to answer. We don’t have to wait for anyone to come into the room to solve it. Everything that comes up can be answered and dealt with immediately, we don’t have to stop one line of thought and “come back to it later”. We just do it. Now.

“But, but … that means that a lot of people is sitting around … not typing” – I said around this point. Yes – that’s exactly what it mean. But you’re not in the keystroke / minute business, now are you?

Have you been [waiting at the emergency](https://www.marcusoft.net/2013/02/suggested-visualization-for-sachsska.html)? You know what I mean; you’ve been sitting there for hours upon hours when all of a sudden a real emergency happens: the ambulance comes with someone that doesn’t breathes. That poor person (it went well, no worries – I just made it up) just flies through the ER and gets treated in seconds.

What’s the difference in how the ER staff acts? For normal, non-urgent cases, hospitals often try to make sure that the staff is kept busy, especially those expensive doctors. In fact, at least in Sweden, the hospitals are so scared of doctors ending up idle, that queues of waiting patients are built in front of them. When the emergency occurs everyone (almost) drop what they are doing and rush to the ER. There’s an abundance of staff around the stretcher, until the patient is stable. In the latter case the lead time of the patient is critical and so we value short lead time over maximizing staff utilization.

I better stop the ER/Hospital analogy here since it gets political around this point and I’m not into that.

So, what is critical for us? Staff utilization, keystrokes per minute, lines of code per minute or moving features fast through our process into production? That’s shouldn’t be hard to answer in most cases.

### “The man in the mirror”-argument

The other thing that made me take a good stare at myself was that I was lining up the same arguments against mob programming like the ones that I have had to answer over the years when it comes to pair programming.

- “but, that cannot be effective?”
- “so every other programmer will just sit around doing nothing?”
- “do you have any studies that shows that this is superior?”

These are questions that I haven’t been able to answer and therefor have asked stakeholders to put trust us in. Now that I’m introduced to a new concept I’m questioning it in the same way. Where’s the trust now? Where’s my sense of “try it”? Shame on me.

Finally I’ve seen mob programming in action, tried it a couple of times and *knows* that it works. One of those episodes was at my current client. One team had started to work on a major change in the domain model. I’m talking real foundational stuff – like introducing the concept of a Product into a domain that was really around products but didn’t have that concept in place today. That kind of changes thats referred to as “heart surgery”.

For a couple of weeks (months even) nothing was produced, not much new stuff was learned and they didn’t get anyway. One day it was suggested that they lock themselves into a room for three days to “dive in an get their hands dirty”. So they blew their schedules free and went into a room, the whole team with just one computer and a projector (now, [where have I heard this before](http://mobprogramming.org/)…).

Three days later they came out with a working skeleton of the thing they were about to build. They even demonstrated it to those interested (EVERYONE) before leaving the room.

## Conclusion

I’m not saying that mob programming is for everyone, neither is pair programming. It might not be for all types of task either – things that you just can “type” out and not think to much about is probably not suitable for mob programming.

But I am saying that getting your team into a room, with one computer and one screen, the whole team working together on one feature – that there is no more effective way to get that feature out.

It’s not maximum efficient when it comes to resource utilization – but we’re not in the keystrokes business, right?
