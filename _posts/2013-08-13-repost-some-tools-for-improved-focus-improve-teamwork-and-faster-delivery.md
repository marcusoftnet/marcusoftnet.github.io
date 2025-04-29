---
layout: post
title: Repost - Some tools for improved focus, improve teamwork and faster delivery
author: Marcus Hammarberg
date: 2013-08-13 15:23:54
tags:
 - Agile
 - Lean
 - Scrum
 - Tools
 - CodeBetter
 - Life of a consultant
---

### REPOST FROM CODEBETTER

I noticed that [CodeBetter](http://codebetter.com/marcushammarberg/) is slowing down. Maybe dying. I'm preserving [my post from there](http://codebetter.com/marcushammarberg/2013/08/13/some-tools-for-improved-focus-improve-teamwork-and-faster-delivery/), here to my site.

### Original post

At one of the teams I’m coaching right now at [Tradera](http://www.tradera.se/) (Swedish Ebay-branch) we are experimenting with increasing our focus on delivering completed work. We have had a big goal (technical upgrade of the complete site in a very short time) and there’s been some challenges to get the focus and team working together, towards this goal.  Which has led us to try to experiment with some new practices and visualizations (board and backlog etc) and is summed up with a new question that we ask ourselves at our daily standups (you’ll find it under the Daily Standup heading if you’re in a hurry :)).

These a just a couple of practices that together has proven useful for us. In this blog post we’ll take a look at each one. Our starting-point was that it’s more important that we complete work than making sure that everyone is busy, that is built from the [core ideas of lean](https://www.marcusoft.net/2013/05/low-wip-hairdressers-and-lean-operation.html). Hopefully you can get some ideas and insights from reading about this.

<!-- excerpt-end -->

## Backlog as a mind map

The first thing they did, that I really felt helped them a lot, was to draw their backlog as a mind map on the wall. With the overarching goal (a bit secret) in the center:

[![Backlog as a mind map](http://codebetter.com/marcushammarberg/files/2013/08/Screen-Shot-2013-08-14-at-08.13.56-.png)](http://codebetter.com/marcushammarberg/files/2013/08/Screen-Shot-2013-08-14-at-08.13.56-.png)

- There’s a couple of (very cute, little) dragons over there to the left, did you see them? They indicate stuff that scares us a bit, things that we know little about or things that we know that we will struggle with.

  [Work in progress means that this is the branch of the mindmap that we work on. Green circle means that it's done. And completely Done.](http://codebetter.com/marcushammarberg/files/2013/08/Screen-Shot-2013-08-12-at-13.25.49-.png)](http://codebetter.com/marcushammarberg/files/2013/08/Screen-Shot-2013-08-12-at-13.25.49-.png)

- Work in progress means that this is the branch of the mind map that we work on. Green circle means that it’s done. And completely Done.

- There’s indicators for what we are working on now, in the form of work-in-progress triangles

- We have indicated what is Done (see below) by green dots. It’s just a couple of items, since we just started to complete work, to the far right of the board.

Without knowing much about this team, you can enter into this room and get a pretty good overview about their work and the current status. They haven’t completed much, there’s a few dragons to be reasoned with and they are working with right now. Those simple visualization can often be enough to send comforting waves of trust to stakeholders around us.

**The backlog in the form of a mind map with the current status is a great way to communicate our status to others.**

## Done

We decided on using Done as a binary value. Work is either “Not Done” or “Done”. That’s all. There’s no “yeah, it’s Done i’m just going to … ” or “it’s mostly Done”. There’s not even a “In progress”

Done means that the item can be shipped. They might not be suitable to ship by themselves but they could be. In Scrum theses were called “[potentially shippable product increments](http://www.scrumguides.org/)“. I like that way of putting it. In eXtreme programming it’s called [DoneDone](http://www.jamesshore.com/Agile-Book/done_done.html), which means “Done, really Done”.

Note that this is not something that is pushed on the team from the outside (although I’ve been nagging them about it) but rather is a way for the team to make sure that we’re taking secure steps and don’t leave more work to “be worked on later”.

Imagine that you look at the board above and every items is a green half-circle. That wouldn’t tell you much. Everything is started – nothing is complete. It might even be the dreaded last 20% of the work that is left. You know, the part that take 80% of the time. There’s really no way of telling how much is left, or how far the team has come.

Now imagine that you enter the next room and see a board for another team. Here 50% of all the items on the mind map has a full green circle next to it. Those items are Done. Now you know that the team has done half of the work roughly. You might even suggest that some of that functionality can be released to your customer: completed flows like registration for example.

By not accepting things that is not Done we further enhance our focus on completing stuff rather than start new work. We prefer to complete items and flow them to production over that everyone is kept busy.

Another great thing about making sure that work is completely Done before we start new work is that our work in process is kept lower. With faster lead times as a consequence.

**Work status is binary – Not Done or Done. This makes sure that we keep our focus on completing stuff before we start new work.**

## Priority filter

The next thing we implemented was the actual board that the team uses to visualize the details of what they are working with now. We used [Corey Ladas](http://twitter.com/COREY_LADAS) excellent[article on Priority filters](http://leansoftwareengineering.com/2008/08/19/priority-filter/) ~~and ripped it right off~~ as an inspiration for this.

Here is how their board looks right now:

[This team uses a board built around priority filters.  Only 3 items are priority 1 and hence given our attention up to our capacity.](http://codebetter.com/marcushammarberg/files/2013/08/IMG_4021.jpg)](http://codebetter.com/marcushammarberg/files/2013/08/IMG_4021.jpg)This team uses a board built around priority filters.
Only 3 items are priority 1 and hence given our attention up to our capacity.

- Done – these are things that the team have completed. There’s no more work to be done on these
- Priority  1 – these items are of the highest priority and hence the things that we work on right now. Haha – just imagine if we would work on something that wasn’t highest priority. That would be so stup… now wait – that happens a lot…
  It’s limited to the capacity of the team and right now the team is experimenting with using 3 items as their WIP ([Work in process](http://en.wikipedia.org/wiki/Work_in_process)) limit.  This is done to further enhance their focus on the work at hand, but also has a positive effect on the lead-time, as [Littles law](http://en.wikipedia.org/wiki/Little's_law) teaches us.
- Priority 2 – these are the items that we will be working on next. It’s urgent and everything, but we don’t have capacity for it right now. We allow for six items in this column, twice the capacity of our prio 1 items.
- Priority 3 – are items that we think that we will work on next. These stand a big risk of being down prioritized as we close in on moving stuff up to prio 1.

Since we have limited the Prio 1 items to our capacity (of 3 items in this case) it means that new work cannot be started until a work item is completed and move into Done. We can then *pull* in a new item from Prio 2 (or maybe 3 or something else that was more important).

In fact this show that prioritization is tightly coupled to the time that we make the prioritization desicion. The question is really: “what’s most important *now*?” rather than “can you create a list of all items in prioritized order?” Who cares if an item is no 14 or 15 on that list. Things will have changed when we’re about to pick those up anyway. Don’t lock your business agility and opportunities into a long backlog that’s hard to change.

This leads the team towards another goal: smaller items. The faster we can complete the items the more prioritization opportunities we get. Selecting new stuff to work on every 3 months is scary and causes a lot of discussions. Getting a new opportunity twice a week does not. And we decide the size of each item.

We don’t really care about the order of the items in the column. There’s items that we work on, and the rest. That we might start work on later. I wouldn’t be surprised if the priority 2 and 3 columns will be just “Not prio 1″ later for this team.

## Daily standup

And now finally the new standup question I promised at the outset. At our daily standup we, as a team, ask ourselves only one question:

> What are hindering us from completing the prio 1 items today?

(You can see this question, in Swedish, under the Priority 1 column on the board above).

This is the goal of the team, right now. We have selected three items that we work on right now and we want to complete them before taking on more work.

That question above helps us to focus on completing work, faster, in some subtle ways:

- we promote team work: “what are hindering *us*“
- we focus on completing stuff: “to complete this”
- we prefer smaller items: “today”. Note that we ask ourselves if we can finish this item *today*the first day we’re working on the item too.

The question is also a great conversation starter since we have to talk about what’s left before the work item is complete and how we should tackle that today. What can we split, what can we share, are there things that we can leave for now and other discussions quickly starts around the board. The focus is shifted from the people in the team and what they do and have done, to the work and how to complete it.

There’s no reporting of what *you* did yesterday, what *you’re* going to do today or if there’s any hinderance for *your* goal. *We*are focusing on finishing these three items as fast as possible as a *team.*

**Each team member is given a lot of freedom, since the question to each and everyone translates to: “Can I help us complete any work today?”. If not – find something else that you’ll think will help us in the future. You have the freedom to make that decision yourself – we trust you to do something useful.  The only constraint is that you cannot start work that you cannot drop, pretty quickly, if we need you to work on our Priority 1 items.

Let’s take an example: let’s say that the only thing that’s left before an item is completed is design work. Let’s say that you are not a designer (like me for example). This means that you might:

- decide to start work on some of the Priority 2 items, so that they will be finished quicker when we start work on them later.
- Or you might start to examine one of our dragons so that we start to learn about the stuff that scares us for the future.
- Or you might build tools, automations etc that helps us to move faster as a team.
- Or you might sit down and learn some CSS so that you can start help out in design work in the future.

Again: you have the freedom to do what you think is best for us as a team. As long as you can drop that and come to our assistance to finish the priority 1 work when we need your competence.

**Our daily standup focus is on the team level. We, as team, help each other to complete the prioritized work as quickly as possible. If you cannot help with that – do something else that you think will help us.**

## Team-work

What if there’s work needed that no-one in the team is expert on? Let’s for the sake of argument say that we don’t have any testers in the team. What should we do then? Well … then we, as a team, will have to get together and test it to the best of our knowledge.

The team is assembled to solve the problem at hand. These are the guys that the one who formulated the team think are the best guys we can have to reach the goal. This doesn’t, necessary, mean that we have experts on all roles. But we’re a team and together we will “make it happen” (slogan of the [Navy Seals](http://www.forbes.com/sites/cherylsnappconner/2013/08/07/four-extreme-leadership-principles-of-a-navy-seal/) by the way).

## Conclusion

The main improvement opportunity we saw the need for, in this team, was focus. This manifested itself by everyone working on *their* own thing and as an effect a lot things were started but not much was completed. Our approach was to focus on teamwork, with fewer items in progress at the time and a razor sharp focus on completing those items. Even over keeping the people in the team busy.

You might not have the same situation at your place but I think you can probably use some of the tools that we have found useful for this team. Maybe just the question we used for daily standups, or the priority filter part or just having a discussion on what Done means.

Please let me know if you try anything out and about the improvements you made.

Thanks to Tradera for inspiring me and for letting me write about them. And to Andy that helped me proof-read this.
