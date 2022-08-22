---
layout: post
title: "Comments on common board practices - Done? There is no Done"
author: "Marcus Hammarberg"
date: 2017-02-23 12:48:13
tags:

  - Agile

  - Kanban
 - Scrum
---

This comment is closely related to the [comment about columns](http://www.marcusoft.net/2017/02/comments-on-board-practices-2.html). In this post I'm more specifically want to talk about the "Done"-column. The last column on most boards. I'm on a crusade to rename Done all over the world.

{% include boardpractice-posts.md %}

Let's do it! Done-column - you're going down!

<!-- excerpt-end -->

# Done - what is that?

I claim that there is not "Done"-column. This is something that grown on me over the last couple of years and I think under the influence of the idea of rapid learning as the main gain, from [Lean Startup](http://theleanstartup.com/).

## Why do I comment on this?

When I first started to do Scrum I remember the great discussions that clarified a lot about what the Definition of Done. I think that is a really sound discussion to have because it would help us to get a common view on which standard our work should be up to before we release it.

But, if I think about it; putting tested code into production … is that *done*. Done as in - I don't care more about it. And if Done doesn't mean that I can drop it, shouldn't it still be on our board? But when should it go off the board then?

Once the feature is in production it's hopefully being used by someone. Once that happens it might be other things we need to do to keep our work useful and relevant. It's not done.

When working in an iterative incremental approach, that modern product development team often does in a software setting, means that we are putting small increments of a feature into production frequently. We do that to *learn* what works well and what didn't work that good.

Often we need to track data around how the feature is doing somehow so that we know what is going on. And, more importantly, if we need to take some actions to help our users further.

Finally - if the features in the column are "Done"; what is the reason we have a big area for tracking them. Sure we should count them as we complete them, but keeping Done-items on the board; what is that needed for?

In short - can a feature really be done? Other than be taken out of the system altogether?

## What to fix/do instead?

Well, I've seen a few different approaches to try to solve this problem.

The first thing to recognize is that not all work needs to be treated in the same way; for example, some tasks that we do are actually done after we have completed them. We refactor a module into better code - deploy it and it works and we are done.

But for the most part, we sure want to follow-up the feature in production for a few days or weeks at least.

One approach that I've seen teams do is to simply rename the last column to "Follow-up". Which basically just means

> Let's keep our eyes on these features for awhile and make sure they work as intended

Other teams have gone further and called the column "Collect metrics-data" or something like that. Here one approach would be to state when we should pick the item out of the column and then hold a little retrospective meeting to learn from the metrics collected.

![Example sticky collecting learning data](/img/stickyCollectingMetrics.jpg)

# Summary

Try to come up with a better name for the last column in your flow than "Done". More specifically - remember that items in production will teach you a lot about how they behave and work. Don't miss the opportunity to learn from that.

If you liked this post there's more posts on the topic here:

{% include boardpractice-posts.md %}
