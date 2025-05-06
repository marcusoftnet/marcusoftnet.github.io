---
layout: post
title: On Constraints
date: 2013-01-15T10:17:00.001Z
author: Marcus Hammarberg
tags:
  - Lean
  - Life of a consultant
  - Agile
modified_time: 2013-01-15T10:17:16.159Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5048683139140827296
blogger_orig_url: https://www.marcusoft.net/2013/01/on-constraints.html
---

As always it's hard to boot up all processes in a new year. The blogging process apparently was down prioritized by my internal product owner. Well - he'll have to stand back: I'm on it again.

For quite some time I have pondered constraints. They fascinate me quite a lot. Especially the ones that we take upon ourselves. In fact: I would go so far as to say that nothing good comes from having no constraints. Let's go back a bit in my thoughts and see if I can clarify why.

In reality, this post is just a couple of examples of self-imposed constraints and what good they can have.

### Toyota and TPS

First let's stop, again, at Toyota. Why did they invent [TPS (Toyota Production System)](http://en.wikipedia.org/wiki/Toyota_Production_System)? What drove them there? It's a quest that they've been on since the 50s and never will be done with.

Put simply; they had to. Due to a constraint that faced them after the second world war. Having a car factory in Japan after World War II was constrained to say the least. They didn't afford any stocks, they had to produce the car in a single flow from the customer order all the way to the customer driving away from the factory.

They had to **change** the way they worked in order to be able to flow value this way. The constraint was simply: no stocks or waste. Now you make it work. In the start, that was hard work and took ages. But they persevered and kept their eyes on the goal: one-piece continuous flow without waste. Without the constraint of being bombed to smithereens they would not have looked into this TPS in the first place. I think. Not before long.

Toyota could also have resigned from the fact that they couldn't do that. But they didn't. No instead they went: "So... no warehouse, he says. Well, that means that we have to change how we do stuff around here to accommodate for that little fact..."

### Agile roll-outs

I dread the "rollout" in the heading above and also the effect it will have on any agilistas out there. But I have been involved in quite a few "roll-outs" in my career. That is: implement agile in an organization.

They seldom work. Why? There's no big constraint forcing the organization to move. I wrote about this before and called the [constraint a "or else"-reason](https://www.marcusoft.net/2012/10/agilechangetop51.html).

But often efforts like this fail, simply because it doesn't really matter. If the project fails or goes way over budget, someone gets yelled at or maybe (very seldom at least in Sweden) gets fired. That means that trying new ways of working is just syntactical differences on the same thing.

> "Yeah, yeah... user story or use case - we know the drill. Let's do as we always do, people. No hurry".
>
> "I know we should deliver incrementally but we really need to know everything before moving on. The process is that way, see?"

Now imagine a scenario where it was out of business if we didn't deliver faster. Or if the constraint was in time; "the stuff that's ready for this date gets shipped. No exceptions!" Now we have a real reason to do something fundamentally different from what we usually do.

In order to overcome the constraint (that might be real or made up mind you) we **have** to do something differently. We **have to change** the way we work or do things.

In most organizations where I've seen transitions to agile fail it has always to do with too much resources. Success or failure is not a big thing. It will continue anyway. Sure we celebrate success but we wouldn't change fundamentally how we work to get it.

### Immutability

[Immutability](http://en.wikipedia.org/wiki/Immutable_object) is a programming term meaning roughly: once you created something you cannot change it. Period. Immutability is often found with the [functional programming](http://en.wikipedia.org/wiki/Functional_programming) paradigm but can be used elsewhere.

I know! First time I thought: "Well, that was handy. Why create it in the first place, then? Data change right?"
Yes - it does. But with the **constraint** of that you cannot change an object after it's created we have to think differently on how we design our code. That led us to solutions like side-effect free functions and returning new data structures from methods instead of changing object we sent into that.

All of this simplified a whole array of problems that have with [parallelism](http://en.wikipedia.org/wiki/Parallel_computing) and distribution. Which in turn gave us simple solutions for architectures that scale, run in the cloud and things like that.

It all started with the self-imposed constraint of immutability. In order to cope with it - we had to change the way we work. Out of that came great stuff.

### "I'll change that in a week"

When I went to university, we had a course in object oriented programming. It was basically a 4 week hand-in programming task: we were to create a game and got the requirements the first day. As we went out of the room, where the professor gave us the requirements he called out: "Oh that's right. I almost forgot: I will be changing some foundational part of the requirement after 2 weeks. Now go."

So we now had a **constraint:** we knew that something was about to change, but now what. We had to handle that constraint in some way. Every line of code we wrote was scrutinized and challenged for replace-ability (which is the [trademark of good agile architectures](http://video.javazone.no/talk/49367318) by the way).

### Time boxes and WIP Limits

Finally (I'm probably boring you to death by now) why on earth do we do sprints or time boxes in agile methods? Why so short as 2 weeks? 1 week? That's just hard.

Or why on earth limit our work in process to just 4 items in Dev? We used to do 8 - and that worked just fine.

Exactly - that is hard. And that's what we want. We use the self-imposed constraint to force ourselves to improve. It's the thing that pushes us to think differently and improve. Doing 2 weeks sprints will show you problems in your process quickly. The same with lowering WIP - that won't work for starters (if it does - lower it even more).

We want those problems, in order to change the way we work to improve our workflow.

### Conclusion

With no constraints, you have no incitement to improve. Constraints force us outside our comfort zone and push us to improve in order to handle the constraint. The constraints might not exist naturally - but you should put one in place anyway. It's the little nagging thing that helps us remember that we should improve.

This blog post is probably old news for a lot of you, but I found myself coming back to constraints again and again. It's the foundation for improvements.

Now the only question remains: what should we improve towards? What is our goal?

But that's another blog post. For now I leave you with: It depends ...
