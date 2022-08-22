---
layout: post
title: Comments on common board practices - It’s not a kanban board if you don’t have a WIP limit
author: Marcus Hammarberg
date: 2017-02-27 15:13:13
tags:

  - Agile

  - Kanban
 - Scrum
---

When kanban first came into common use and practice it was often posed as an alternative to Scrum. Well, as [Torbjörn Gyllebring](https://twitter.com/drunkcod?lang=en) told us many years ago, [kanban is not your process](http://www.slideshare.net/LESSConf/kanban-is-not-your-process). Kanban is a process improvement tool and works on whatever process you apply it to. It's one of the powers of the tool and the reason I like kanban so much.

However, for many early adopters of kanban, removing the cermonies of Scrum sometimes went overboard and we removed everything that constrained us and made us make tradeoffs. Kanban - love it! No planning, no sprints, no constraints - it's just our board and work flows as fast as it flows… Nice!

Well - it's not really a kanban board if you don't have a work in process limit. Let me explain a bit further.

{% include boardpractice-posts.md %}

<!-- excerpt-end -->

# Limitless boards

Most of the kanban boards I've seen actually has no limits of the amount of work that can be on them. It just becomes as much work as it needs to be for any given situation.

While this might seem compelling and "easy" at first it's actually bad both for you, your focus and the flow of the work that you are doing.

Also - it cannot really be called a kanban board if there's no work in process (WIP) limit on it. The [basic principles of kanban](https://en.wikipedia.org/wiki/Kanban_(development)#Principles), since it's inception, are:

* Visualize - aka have a board with your work visualized
* Limit work in process - make some kind of work in process limit
* Help work to flow - manage, prioritise and make other decisions to help work to flow over the board (through the process) faster and smoother

## Why do I comment on this?

Work in process (some people say "in progress") refers to the work that we are currently working with. Work *in* our process if you want. Or maybe more concretely - *on* our board.

It's generally understood and accepted that the fewer items we are working on at the same time - the faster each individual item flows through our process. Hey - [there's proofs for it too](https://en.wikipedia.org/wiki/Little's_law) - that can be hard to [grasp all of](https://agileramblings.com/2012/12/11/littles-law-its-not-about-the-numbers/) at first.

By having no WIP limit we are basically saying that we take on any amount of work. We should reflect over the fact that for each item we take on we are slowing down the progress of the items already on the board.

It would be like having open-ended sprint-backlog that anyone can add to as they felt the need. No sane Scrum team would allow that. One of the great things about Scrum is that we lock our focus down to a subset of functionality, that we think we can manage in the coming sprint. It focus us and we also get an easy way to say "No" to things, at least to a later sprint.

Let's not forget that just because we are working flow-based rather than iteration-based.

## What to fix/do instead?

The fix for this problem is in one regard very simple and in another regard a bit tricky. Let's do the simple part first.

Put in a WIP limit. Any type of limit will work. Here's a few common ways I've seen:

* Put a limit on a column, a step in your workflow, by writing numbers above that column. This is good if you have a bottleneck in your system that you want to make sure is working all the time. For example; all your work has to be approved by an external testing group.
* Put a total limit across the board; "We have at the most 8 items on the board at any given time". This make sure that we as a group don't start more work than we agreed on - shifts our focus to finish work rather than starting new
* Put a limit per user. A very simple way is to hand out a limited number of avatars/face magnets. Fredrik has 2 avatars and hence can only be on 2 items of work
  * A variant and addition to this would be to have a policy that we are always at least 2 people per sticky. This would lower the limit further

There are as many was as there are teams probably - you come up with something to visualise your limit.

But that is really the simple part - the harder question to ask is; *what is a good limit for us*

### What is a WIP limit?

A WIP limit should not be viewed as a rule or boundary that we cannot break. Instead I suggest that you view it as a trigger for discussion. Sure, there might be times where we break the limit - but at least lets talk about *why* first.

I like to view WIP limits as one of the best tools to create a smoother and faster flow that we have to our disposal. Let see how a WIP limit would be used in factory to highlight this.

Imagine a factory where my job is to mount doors on cupboards. Right now I get a pallet with 20 doors. The door-WIP-limit is 20 in other words. That's timed perfectly with the rate on which the door-less cupboard arrives to my station.

Now a lean sensei walks by and asks:

> How's thing flowing here? Everything alright.

I would answer something like:

> Yes sure. The rate of cupboards and doors is just about right now. It's been the same, 20, for ca 4 months and we are all very comfortable with ..

At this point the sensei would friendly but firmly interrupt me and say:

> That's nice and all but we are striving for a one piece flow. That's our true north. Let's try a WIP limit of 12 instead.

And of course I would be like:

> But, but … that means that I need to streamline the way cupboards comes to me. In turn that mean the we need a smaller stock of material, and then the door guys will have to be more agile and fast ….
>
> Aaaaah - I see what you did there, sensei. Thank you.

No problems is very bad in a factory that strives for constant improvements. If there are no problems they will look for ways to … "provoke" problems. One such tool is the WIP limit, as the silly story above shows.

### Guides

A very natural question is of course:

> That's nice and all but what should OUR WIP limit be then?

To which my consultant answer is

> It depends

I cannot tell you. Neither should you want me too. It's a tool to help your work in your context with your team to flow faster and smoother. It would be very arrogant for me (or any outsider) to think that I could suggest improvements to your process before I know about it.

However … there are a few guide-lines that I think can help you.

#### Stop starting - start finishing

First adopt the slogan from [Kanban In Action](http://bit.ly/theKanbanBook) (and other places) in your team:

<img src="/img/stopStarting.jpg" alt="Stop starting - start finishing" width="35%">

I mean; agree on the following:

> In this team we prefer to finish stuff rather than to start new things. If we can, we help each other to finish things over making sure that I'm being busy working on new things.

#### Lower is better

Also, we should strive for a lower WIP limit, rather than a higher. With fewer items in process each item will flow faster.

That said, there might be times when our process will hold many items for different reasons (long waiting times, many people involved etc) - but our efforts should always be to lower the number of items.

#### Indications

There's easy way to see if our WIP limit is too high or too low:

If the WIP limit is *too high - **work** will be idle*. Here you will see items on the board that is not being worked on for a number of days, because we are doing other things, also on the board.

If the WIP limit is *too low - **workers** will be idle*. This will be indicated by people going "I don't know what I'm going to do after this". Not that this state is not necessary something bad, but rather an opportunity to collaborate and help each other flow work faster. Remember that our work is problem solving that often is assisted by engaging more brains.

### The experimental approach

If you really don't know what to pick as your WIP limit I've found this approach, suggested by [Dr Don Reinertsen](http://www.leanproductflow.com/) very helpful

1. Count the number of items on your board right now, your *current* WIP, for example 6 items.
2. Double that number (i.e. 12 items) and make that your WIP limit. Write it across the columns of your board. This is now your new WIP limit.
3. Make a commitment in the team to lower the WIP limit with 20% (or something reasonable) every week, on Mondays for example
4. Continue this until you reach a point where you cannot follow the WIP limit anymore. For example WIP = 4 items.
   This might be a situation where you are all waiting for others, or people have "nothing to do" etc.
5. Now back WIP off a little bit, maybe to WIP = 5 items and start to try to resolve the things that are hindering you from lowering the WIP limit further
6. Once that is done - try to lower the WIP a bit again and see if it works better

I like this approach because it shows clearly about the real use of the WIP limit, as a tool that triggers improvements rather than a hard fast rule that we need to obey.

# Summary

Kanban is about three simple principles at its core:

- Visualize - aka have a board with your work visualized
- Limit work in process - make some kind of work in process limit
- Help work to flow - manage, prioritise and make other decisions to help work to flow over the board (through the process) faster and smoother

Without a WIP limit on the board there's nothing constraining us from taking on new work, nothing asking questions about priority and nothing pushing us from finishing the things we are doing.

Without a WIP limit on our board - it's not a kanban board. Make it one by introducing some kind of limit. It will help you. I promise.

If you liked this post there's more posts on the topic below

{% include boardpractice-posts.md %}