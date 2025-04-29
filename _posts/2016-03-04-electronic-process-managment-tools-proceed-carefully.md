---
layout: post
title: "Electronic process management tools - proceed with care"
author: "Marcus Hammarberg"
date: 2016-03-04
tags:
 - Agile
 - Lean
 - Life of a consultant
 - Tools
 - Scrum
 - Kanban
---

I'm a fan of physical boards. But I have to say: many of the tools I've used are amazing (like [JIRA](https://www.atlassian.com/software/jira), [LeanKit](http://leankit.com/) etc.) in that they support working with the tool in a great way: shortcuts, intelligent search and great design.

But I can't get around the fact that I don't think that they support me and my teams. Already now I can hear defenders of these tool racking up arguments and showing me better ways to do the things that I've experienced as problems.

This post is not about that. This problem is about the general notion of any tool has it's limits and that I run into more of them in electronic tools than I do using physical board.

Also this is my experience - your mileage may vary.

<!-- excerpt-end -->

## Glimpses of misuse
As I have done for a few posts; let me give a few glimpses of situations when I felt that JIRA (in this case, could be any electronic tool like that) has actually not only slowed us down but been harmful.[^1]

## Epic, label - who cares?

I was sitting with an architect in our team. Let's call him Oscar. We were adding a story for some tasks that needed to be done around Database work.

On our board there were other times that had a nice little label that said "Performance" or "Backend". Oscar wanted to tag this story in the same way.

So we added a label and it didn't show up. It turned out that "Performance" and "Backend" was actually Epics (?!). Of course we added a new Epic called "Database work".

"Database work" is not an epic, of course. But we did it anyway. We only wanted some tagging to show up on the kanban board where we displayed items. This was the simplest way to get it done.

## States and process

In JIRA there's two levels of states. There's one that is configured in the underlying work-flow and one that is set on each board where the items are displayed.

In our installation the work-flow states are "Todo" (displayed in Dark blue), "In progress" (Yellow) and "Done" (Green). So far so good. You can also create board that have more detailed states, which makes sense. Here's our, current, board:

![An example board](/img/overview_board.png)

As you can see the "In progress" (Yellow) work-flow state goes on for quite some time. Which is correct. But not very informative. The states on our board is pretty long running as they are.

Now there's also another nice screen showing the releases and the state of the items in the release. Since every item on this view will be Yellow for most of it's existence this view is not helping us. At all.

![Release overview](/img/release_state.png)

I don't have the sufficient permissions (yes, big corp) to change the work-flow and the board itself is too detailed. I now need to create a report that filters and finds... basically work around the system to be able to state the obvious; the is summarized states of our work for the upcoming release.

## Let's import all of the backlog - it's good to have it in there

The product owners in our team have a great long backlog; about 530 items all in all. It took me quite some time to realize why, but it's because most of those items are just user request that been uttered (some are 6 years old) in meetings. It's politically important to keep them on the backlog.

In JIRA (and other tools) there's a nice import function which allows you to import many items at once. Guess what the product owners wanted to do...

We had many encounters where I tried to convince them not to import it into JIRA. What struck me as remarkable was that even though we tried just a few and saw, that in fact the Excel-file that they were using up to now supported their ways of working much better... they still wanted to import it.

I managed to convince them not to in the end. And we now only add new items as they are about to get started.... or close to that at least.

The reason they wanted to import although the support was worse for their work was the same as the reason Sir Edmund Hillary wanted to climb Mount Everest

<blockquote>It's there!</blockquote>

## Change

I've fiddled around a lot with the states in our project in JIRA lately. We're just getting started so it was bound to happen.

When I did I trashed 4 or 5 boards that other teams had created. Because I move items, changed names of states etc.

More times than I can care to remember I've heard screams in the office:

<blockquote>WHAT?! Where's all our stuff?</blockquote>

The problem with this is: the whole *purpose* of kanban (and most other agile method) is to change your purpose. That's what it's for. Help us to easier see whats hindering our flow, so that we can change our process for an even better flow.

If changing the board, late in the process (after using for a long period), causes disrupts or leading us to jump through hoops to get by... Well that's no tool I'd like to use. That's doesn't happen with my post-its.

## My two biggies

Quick out of complaints/rant mode. I don't like it there. And still think that JIRA and others are amazing pieces of software.

Let me just break my two biggest issues with electronic tools down and give some constructive recommendations.

## A tool is just a tool

For ever tool you ever use you have to ask yourself:

<blockquote>How does this support me better than my current ways?</blockquote>

It can of course be worth investigating even though you don't know if it's better but still you need to remember that you're supposed to use the tool - not the other way around.

Any tool has it's limits. A saw is great for cutting wood, but crap when it comes to driving nails through wood. You can write a book with Excel, but Word is better. Scrum is awesome when you can keep scope in sprints untouched, but fails if you have the need to add new stuff during the sprints.

Every electronic board tool I've used has had some kind of strangeness to it that I've bumped into after awhile; why can't we group stuff on the "kanban type" of board like we do on the "scrum" type, what if I want to split this column, can I turn the card on their side, I want to add a little icon on top, I can't add a WIP limit on this column, etc. etc.

In all honesty there's *of course* limits like that with physical boards as well. For example; automatic calculation of performance data is not present, you can't do 3D stuff as easy as you could have done electronic (which I've yet to see btw), keeping track of discussions and documents, etc.

But the limits of a physical board don't limit me as often as the limits of an electronic tool.

## Master data problem

The one problem that you need to look out for and that still bites me every time is the problem of master data; where's the true state of an item? In JIRA or on the physical board.

Most developers and testers I've met prefer physical boards over electronic versions. And most scrum masters, project managers, product owner etc I've met is the other way around. My experience.

But *every single one* of them dislikes reporting states in two systems. It's messy, quickly gets out of sync and introduce uncertainty of the state of items.

There are of course times when an electronic board have benefits over a physical, like remote work. But it's not a given - [read my report from a team with a remote worker that opted for a physical board anyway](https://www.marcusoft.net/2012/10/improving-presence-of-remote-worker-in.html)

## Trade offs

Here's a few things that I've used that is the best trade-offs so far:

* Decide on one master. Preferably a physical board
* Create a simplified work-flow/process in the electronic tool. For example "Not started", "Started", "Done"
* If you use more than one team let them decided their own process and stages on their board. Encourage them to change as they see fit
* Use the electronic tool as a repository for documentation of discussions, keeping track of attachments etc.
* Put as little as possible into the electronic tool. Just enough to support your reporting needs. No need to put smaller sub-tasks, defects during development etc.

## Dream tool

Thinking about it I would probably create an electronic tool that is just a big white-board that you can draw what-ever you want on (like columns, lines etc).

On this you can create cards that you can move around anywhere you want. Further you can upload any kind of images that you can resize to fit on top, like avatars and other markers. On each item you can attach documents and some conversation / discussions.

There could be an area on the board where you pull items that are completed. Lead time is counted from the time you put it on the board until you pull the item down to that area.

 [^1]: Funny story - I actually considered naming this post "JIRA considered harmul", but then I would have a really hard time not ranting. And I DO NOT want to do that.
