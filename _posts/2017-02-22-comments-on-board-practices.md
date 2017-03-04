---
layout: post
title: "Comments on common board practices - blocked should not be a column"
author: "Marcus Hammarberg"
date: 2017-02-22 08:48:13
tags:
 - Agile
 - Kanban
 - Scrum
---

It's very interesting to see how a practice goes from a nice idea to best practice and over to tradition. In my community, the software industry, things move very fast so I've seen many examples of this; simple things like formatting of code, background colors of editor all the way to architectural patterns - all of these become default usages and tradition, and sometime "the way it's done". Sometimes people calls it [cargo cult](https://en.wikipedia.org/wiki/Cargo_cult) which refers to that I often do things without really reflecting over why.

When it comes to my field of practice; lean and agile there's bountyful examples of cargo culting, but in this series of post I wanted to examine a few very practical things that I often notices on how agile team uses their boards. 

It will be a little hit-list of my pet issues commonly found on agile/kanban-boards I've seen.

<a name='more'></a>

Here's the things I want to address, in no particular order:

{% include boardpractice-posts.md %}

Holy Moly! That's a plenty. I'll keep them all short and update the links to the posts as I write them. 

Let's start with a simple one - blocked should not be a column. 

# Blocked is not a column

Actually I could make this really short by refereing to an [old post I wrote a few years ago](http://www.marcusoft.net/2014/05/waiting-should-be-note-and-not-column.html) but I'll write down a few thoughts here. Maybe I've become wiser. 

On many boards I've seen there's a special area or even column called "blocked". We move stuff in there as items that we are working on becomes blocked by others.

![A board with a blocked area](/img/boardWithBlockedColumn.png)

Blocked in the case of a board means that work cannot continue with this item (represented by my sticky) until some other work is done. Most of the time this other work is done by someone outside our team but it could also be other work on our board. 

## Why do I comment on this?

While it's a nice visualisation to move the item to a separate area, it shows us that the work is now being blocked, it bothers me in, at least, three ways;

Firstly we move it *from* the current position on our board. That means that once the blockage is fixed we have to move it back (and *remember* where it should go). The information that the sticky's position held is gone. 

Secondly, and related, we don't see that the item is blocked in it's context. For example with a separate "Blocked"-column we can only say 

> We have 5 blocked items on our board 

If we left them in the column (see [the part on fixing below](http://www.marcusoft.net/2017/02/comments-on-board-practices.html#what-to-fixdo-instead)) they are blocked in we could instead say 

>There's 3 items blocked in testing, 1 in development and 1 in deployment.

That sends much more information and can actually helps us to both do some intelligent prioritisation but also start to reflect on why items often tend to block in "Test", for example.

Thirdly - moving the sticky to the blocked-column doesn't convey any information about the blockage itself; what is it, how is the resolution of the blockage going, or how long we have been working on this. 

## What to fix/do instead?

A simpler and better (in my opinion) to visulise blocked items is to leave it in place and put another sticky on top of the item, preferably in an attention-calling color (which color I leave as a creative exercise for you and your team). 

We can now write the reason for the original sticky being blocked as a description - or better yet what needs to be done before we can continue our work. I prefer the second, more goal-oriented approach. 

This does not only leave the sticky in it's place in the workflow, keeping that information ("work is blocked in test") but also conveys some information about why it's blocked. 

It can look something like this: 

![A sticky with a blocker](/img/stickyWithBlocker.jpg) 

For extra points we can [track the number of days](http://www.marcusoft.net/2017/02/visualizing-scope-creep.html) we have been waiting for the blockage to resolve. Maybe we have some escalation policies for how long we are going to wait before we take action. 

# Summary

That was the first post. I hope you liked it. I'll try to keep the other ones coming during the next couple of days. 

If you liked this post there's more posts on the topic here:

{% include boardpractice-posts.md %}
