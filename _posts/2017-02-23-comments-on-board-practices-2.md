---
layout: post
title: Comments on common board practices - Todo/Doing/Done is not your process
author: Marcus Hammarberg
date: 2017-02-23T08:48:13.000Z
tags:
  - Agile
  - Kanban
  - Scrum
---

Ok, got a few encouraging comments on the [first post](http://www.marcusoft.net/2017/02/comments-on-board-practices.html) so I'll continue this series. If for nothing else it's keeping to my orignal blog-idea to write things down to clear it up for me and not forget about it.

{% include boardpractice-posts.md %}

This time I wanted to talk about the column themselves, or maybe I dare to talk about the process they reflect. Our process for work!

<!-- excerpt-end -->

# Todo - doing - done is not your process

This is probably the best example of [cargo cult](https://en.wikipedia.org/wiki/Cargo_cult) in our community I can come up with; the names of the columns on the board. If you have any close to your office I urge you to take a look; I promise that the vast majority have column names like "To do"/"Next", "Doing"/"In progress" and "Done".

I'll leave the discussion about "Done" for another post.

The reason for these columns, at least for me, is that those were the column names used in early Scrum (®™) literature. It stuck because it's very generic, everyone can relate to those steps in a workflow. They are also fast to draw, should you need to make an example or starting point.

## Why do I comment on this?

The problem I see with Todo-Doing-Done-columns are that that's not what we do - or maybe better it hides what we are *really* doing. In particular, I have a problem with the "Doing"-column.

The columns of the board are a visualization of the steps in our workflow and by having a "Doing"-column we are hiding many different states that an item can go through, in one big area. This obfuscates state information about the work and makes it harder to reason about the work on the board.

For example with a bunch of stickies in one big "In progress"-column it's harder to see which are closer to being done, which just got there and if some part of our process is a bottleneck - it's just a lovely bunch of stickies.

## What to fix/do instead?

Luckily this is easy to improve on, or at least to give recommendations on how to improve on:

> Let the columns on your board reflect your actual workflow

Not the workflow that your cooperate guidelines say that you are working with but the one that you are working after. We want the truth, the whole ugly truth and nothing but the truth on the board.

The further from reality our board is the harder to make any real process improvement - because we are not improving reality.

### How to do this

Now, this can be hard. I have been working in places where people doesn't honestly know but instead asked me (a consultant, 3 days on the job): "How should our process be like"?

What I've found the easiest to do is to start from the end of the process and work your way backwards, keep asking *"What needs to happen before that?"* to find the steps in your process.

This emphasizes the focus on finishing things rather than starting new things, and also starts in a nice discussion on about what "Done" really means. In production, used by users, taken out of production?

You will be amazed how many discussions this raises and might find that you're getting nowhere. You are not. You are spending time learning about and clarifying the way you are working. If it takes a long time that means that you didn't look at that in the same way in the first place. That's time well spent in my book.

### But… isn't this a waterfall?

Inevitably there will be comments after the board is created that says something like "This looks like a waterfall process to me". For example, your board might have columns like "Ideas", "Ready to develop", "Design", "Code", "Code sharing", "Test", "Acceptance" and "In production" and I agree - reading that makes it look like a waterfall.

First; if that is our process that is our process, right? We have steps in our process and this is how it looks now.  Also - the speed that we go through these steps is the main thing. Taking small things through the process fast is better than taking big things through the process slow.

Secondly; this is a starting point. This *is* how we work now, we just created it together. The reason we created it like this is that we want to improve from reality. Now that we see the real process we can start to make tweaks to it and see if we improve, learn faster or gain more value from that.

### What is the stuff that is moving over the board?

This is a great question and really has to do with how far reaching your board is. Do we want to visualize "upstream" work (that's happening before "us") or is it just covering our team?

Typically upstream work contains bigger chunks of work that is broken down into smaller and smaller pieces. Sometimes these are referred to as epics or feature sets - and the things that is further downstream is user stories or even tasks.

Interesting enough those big things might never be "Done" as in 100% moved into production. This is a big win. That's why we do agile in the first place. We do enough out of a big thing to get value and then we are (should be?) so agile that we can change gears and do something else that is more important now.

All in all, it doesn't matter too much, but to make things clear make sure that we distinguish between different things on the board. Maybe have different sizes of cards for epics/features and stories/tasks.

## However

I've actually seen teams that end up in "Todo"-"Doing"-"Done" after starting in a more elaborate process. Or even simpler; ["Prio 3" - "Prio 2" and "Prio 1"](http://codebetter.com/marcushammarberg/2013/08/13/some-tools-for-improved-focus-improve-teamwork-and-faster-delivery/) (so important that we are working on it) for example

Two examples where this can happen are

* really fast processes like support functions - where items are on the board for less than a day and in certain steps on our board for just minutes or half an hour. No need to have an elaborate process for that - that just overhead.
* [Mob programming teams](http://codebetter.com/marcushammarberg/2013/08/06/mob-programming/) - these teams rarely see the need for a board in the first place; everyone in the team knows the state of the work anyway. I've seen other visualizations of work outcome and work lined up - but a board is often not needed. For all intents and purposes, a mob is working on only 1 thing at the same time, by definition. There's no big gain in visualizing that.

# Summary

Short and sweet;

> Let the columns of your board reflect your actual process. What are you doing in "Doing"

If you liked this post there's more posts on the topic here:

{% include boardpractice-posts.md %}
