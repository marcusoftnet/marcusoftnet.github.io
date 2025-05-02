---
layout: post
title: "Backlog and features"
author: "Marcus Hammarberg"
date: 2016-06-13 12:59:58
tags:
 - Agile
 - Lean
 - Life of a consultant
 - Kanban
---

A couple of weeks ago I tweeted:

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">I&#39;m not far from saying; if your <a href="https://twitter.com/hashtag/backlog?src=hash">#backlog</a> contains features you&#39;ve already failed. <a href="https://twitter.com/hashtag/impactmapping?src=hash">#impactMapping</a> <a href="https://twitter.com/hashtag/userstorymapping?src=hash">#userStoryMapping</a> <a href="https://twitter.com/hashtag/agile?src=hash">#agile</a> <a href="https://twitter.com/hashtag/lean?src=hash">#lean</a></p>&mdash; Marcus Hammarberg (@marcusoftnet) <a href="https://twitter.com/marcusoftnet/status/738254736189718528">June 2, 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

In this post I will explain what I meant. And also give a suggestion on how to do something better. I know it's better - I've tested it many times. Just this last hour to be exact :)

<!-- excerpt-end -->

I've seen problems with backlogs that contains a (long) list of features. It often manifests itself as priorities being changed, team being perceived as non-transparent and sometimes the team feel like they are not included in what is being built.

>There's no use checking what will come next - tomorrow that's changed anyway

is one thing I've heard my team member say. And

>Why did you build that now?

is a question that ends up being very hard to answer.

## What to do instead, mr Wiseguy?

The solution is very simple - draw your [backlog as a mind map](https://www.marcusoft.net/2016/04/fear-of-loosing-important-things.html#backlog-as-a-mindmap) instead of keeping a list of features. Preferably as an [impact map](https://www.impactmapping.org/).

Starting from *WHY* we are doing things and then linking the things we are doing with that *WHY*-statement is really powerful in itself.

Secondly - a picture says more than a thousand words and is so much nicer to *talk about* than a list of features. Here's an example mind map without too much revealing information:

![Example backlog](/img/exampleMindMap.png)

Let's pick this backlog on some information:

* The goal is in the middle of this mind map. 300 stores to some (scratched out) date. Ok that's what they are trying to achieve, their *WHY*. Nice and measurable. Need more details on how to measure of course but good enough to talk about:
  * The next layer of circles are the **actors** in the impact mapping model. *WHO* (or what in this case) do we need to change. There's few areas that the team considers "things that helps/risks us from reaching that goal"
  * The final levels is the *HOW* and *WHAT* we need to change these actors, or components in this case. We see examples like `Bypass XXX`, `Cluster` and `Error handling` that the team thinks are good ideas as to *HOW* to improve the area `Store O` (yes - had to blank some part out. It's a sub-system of our solution)
* See the small numbers on yellow stickies? That's the priority. Ok - now we see that Lost cart is number one. Wonder what that is - let's ask the team for details.
  * There's three guys (scratched out avatars) - working on it at least. That's ensuring
* Second priority is ... `Report Concurrency` - that's sound like a cool feature. It's linked to `Back Office Order` handling which is one area that needs to be addressed to handle 300 stores. Reasonable - back office need to be in shape of course.
* There's a priority 3 and 4 also.

Not reflected on this map is "What next" - but that could easily be achieved using a different color of numbers for example

## What has this helped you with?

Well, first of all communication. It's SO much easier to talk about this map and the ordering here than a list of features. Also the connection to the *WHY* in the middle is very good to discuss if that's the correct why and also for the things that the team does - if that is the correct thing to do *now* to support the *WHY*.

It basically answers the `Why are you doing this now?` question by merely being there.

Secondly this impact map have saved us time and effort already. See the big empty space above `Store O`, to the left? That's one of the things that the team just has completed. The `Store O` situation was the #1 thing that risked reaching `300 stores` - in the `Store O` case there was a some kind of performance problem.

The team decided to try a couple of approaches to solve that problem. It turned out that one of those (the erased part) was quick to implement *and* solved the problem. So well in fact that they could now switch priorities and have a new #1 priority.

## What's the problem here again?

What I've seen is that many organizations locks down to a list of feature way too early. In some cases there's 2 or 3 levels before it even reaches the product owner where specific features are discussed.

(Yes, yes... that's not really a product owner I know - but that's the reality for many product owners in big organizations)

The problem with this are many:

You are **always late** and behind. Hmmm... wonder why it's called a **back**log in the first place. Maybe because listing features is quicker than delivering them. And there's always (*always*) more to do than we have capacity.

You're **timing is consequently always off**. "Feature Y?! Now? That doesn't help me now - I needed that last summer"

The **real goal of the business is very subtle and hidden**, at best. Sometimes I've had a really hard time to find anyone in the entire organization that knows *why* we are doing this feature *now*.

A simple way to see this is to try to create an impact map by walking backwards from the list of features you are working on now. I guarantee that you will find some things that you work on that is not related to the goal - or feel very strained to try to connect to the goal. Now - that might be ok for a while - we draw them next to our mind map. But we should at least make it explicit that they are not contributing to the goal.

**Prioritization changes feels random** and haphazard to everyone that is not aware of the goals. With the goals known and visualized, on the other hand, I've seen team totally change their agenda and backlog without anyone thinking that it's at all strange.

In fact - presenting the backlog of a team as a list of feature means much less understanding and connection than to show it as a picture.

The work in the team is **super boring.** You are only using a fraction of their knowledge. Only doing what it says in the spec is not using the skills of problem solving or the innovation in the team. This was beautifully put by a team member in my current team:

>I'm used to people coming to me with problems - not solutions

## Summary
Quite simple: wait with putting features in the backlog as long as possible. Features (or the **WHAT** part of an impact map) are just means to reach a goal - not the goal.

