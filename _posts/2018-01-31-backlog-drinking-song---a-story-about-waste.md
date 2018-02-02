---
layout: post
title: "Some thoughts on backlogs"
author: "Marcus Hammarberg"
date: 2018-01-31 09:56:52
tags:
 - Agile
 - Lean
 - Kanban
 - Scrum
---

I was asked to join a team for a backlog grooming session. We went into the room and opened the backlog in JIRA. It was exactly 99 items long. Not too shabby, but still... 99!? Ninety-nine items of work we hadn't done. Yet.

This of course triggered this jolly team to start singing and we soon where humming along:

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">99 tickets of work in the <a href="https://twitter.com/hashtag/backlog?src=hash&amp;ref_src=twsrc%5Etfw">#backlog</a><br>99 tickets of work<br>Take one down, pass it around, throw it out because it is not required anymore, even Done but we didn’t update JIRA or we might not understand what it says<br>98 tickets of work left in the backlog<br><br>15 minutes spent <a href="https://twitter.com/hashtag/agile?src=hash&amp;ref_src=twsrc%5Etfw">#agile</a></p>&mdash; Marcus Hammarberg (@marcusoftnet) <a href="https://twitter.com/marcusoftnet/status/955775870807040000?ref_src=twsrc%5Etfw">January 23, 2018</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

In this post, I wanted to share how we cut the backlog in half in  45 minutes. And then share some thoughts on backlogs that I have running in my head.

<a name='more'></a>

## Complete half of the backlog in 45 minutes

We went into the room wanting to groom the backlog to ensure that we understood what was the next most important thing to do. And that we understood that thing on a correct level.

But we soon realized that we couldn't see the forest for all the trees. We decided to clear the backlog up. We had simple guidelines for this cleaning. Remove everything that is:

* Wrong or outdated information that we couldn't make sense of
* Never should have been in there in the first place
* No one in the room understood what it was
* We will obviously not do in the foreseeable future

Basically, it was a simple question:

> Should this take up a spot in our backlog (using those guidelines)?

45 minutes later - 56 items were left. Half (ca) of the backlog completed or removed. We felt lighter. It was easier, but still not easy, to see the important items. Our Product Owner also was happier as he now had a more manageable list of things.

I was happy but in the back of my head I was thinking:

> Waste! Why was it in there in the first place?

I ~~think I~~ tweeted about it:

<blockquote class="twitter-tweet" data-partner="tweetdeck"><p lang="en" dir="ltr">Went into a room with a team. 99 issues in the backlog. Took out everything that was; <br>- wrong<br>- never should have been in there<br>- no one understood<br>- we will obviously not do<br><br>45 mins later - 56 issues left<a href="https://twitter.com/hashtag/backlog?src=hash&amp;ref_src=twsrc%5Etfw">#backlog</a> is inventory. It’s not free. <a href="https://twitter.com/hashtag/nobacklogs?src=hash&amp;ref_src=twsrc%5Etfw">#nobacklogs</a> <a href="https://t.co/RInDYIXWNa">https://t.co/RInDYIXWNa</a></p>&mdash; Marcus Hammarberg (@marcusoftnet) <a href="https://twitter.com/marcusoftnet/status/955792521682092032?ref_src=twsrc%5Etfw">January 23, 2018</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>


That was what we did as a team. I promised some thoughts on backlogs in general that this interaction spurred. Here you go:

## Some thoughts on backlogs

A backlog is defined by the [Scrum.org guide](https://www.scrum.org/resources/what-is-a-product-backlog) as

> As described in the [Scrum Guide](https://www.scrumguides.org/), the Product Backlog is an ordered list of everything that is known to be needed in the product.

It also says:

> A Product Backlog is never complete.

It does not, however, say: Everything should be in there until it's done. No. There's even a refinement meeting to ensure that the backlog is being groomed.

> Product Backlog refinement is the act of adding detail, estimates, and order to items in the Product Backlog.

Sadly I didn't find: "Remove unneeded things" in that description. Missing this part has caused many teams I've been in, a lot of pain. The worst case I've seen was a backlog of 579 items. In order. I kid you not. 186 is a little bit more important than 187. People were employed to keep track of that backlog.

### An ordered list whose order is not important

I think the fact that the backlog is a list is causing much of the problems that I've seen with backlogs. It gives you a sense that the order is important. It's not because once we get to pick something from the list there are many things that need to be considered in order to know which one to choose:

* What has happened since the last time we sorted the list
* New opportunities
* Other important work that has entered
* Incidents to consider
* Technical debt
* Team constitution
* Calendar, vacation etc

In the meantime, the order sends a strong signal of commitment and promises, just by being in order. This is first, then we will do this and then that … No. We won't. We want to, but we will most likely do it that order. Neither do you, dear creator of this ordered list of work.

I'm reminded of Dan North's quote:

> We fear uncertainty so much that we pick something that we **know** is wrong rather than being uncertain.

The order of the backlog items is at best unimportant. It could be a lie or faulty information. And in the worst case, it used to force decisions through, over using the information at hand to make better decisions - just because it's been in the backlog for a long time.

I once witnessed a team of 8 people work for 6 months with a horribly complicated integration of a new payment provider, into our e-commerce solution. When it was done we couldn't tell if the work was good or bad. The integration worked perfectly - it was quality work under hard conditions.

But was it good? We couldn't tell. We simply didn't know what the goal was. Did we expect bigger order, more customers, faster payments… We didn't know. We did it because:

> It's been in the backlog on the top 10 items for several months. The stakeholders are getting impatient.

### Behind, behind, behind

I have problems with the word "backlog" too. Here's the [Google definition](https://www.google.se/search?q=backlog+definition&oq=backlog+defi&aqs=chrome.0.0j69i57j0l4.2527j1j4&sourceid=chrome&ie=UTF-8) (not related to agile).

> an accumulation of uncompleted work or matters needing to be dealt with

Literally a log of work we have not yet done. We are behind. Before we started. There's no way we can ever get to a good spot.

> You completed feature 12? Great! Only an ever-growing list of undone work to go… Hop to it! Now. You are already behind.

That doesn't spur me on, I can tell you.

And it's not splitting hairs and calling one thing something else. Because you have to view backlog for what it is: inventory

### Inventory

Inventory is not free. There's a lot to read about this in any lean book worth its salt, but [here's a good starting point](http://www.allaboutlean.com/inventory-cost/).

Not everything on that list translates over to keeping a long backlog but here are a few things that stood out for me:

**Handling cost** - this was what we were doing, with the team that groomed the backlog at the start of the post. We had to take time to handle the backlog. After that meeting, no value had been created. The backlog was just cleaner. No customer ever thanked us for that.

Also, remember the time people, around the company, spend on handling backlogs. Just because they are long lists. Think about how much less time that would be, if the list was 10 instead of 100 items. Let's sort that under **Administration cost**

**Scrapping and Obsolescence** - this is a bit far-fetched but let's think about it like this: someone wrote that line into the backlog at some time. At this point, that feature would have been helpful. Every day that passes we are losing the opportunity to reap that features benefits (income, saving or what have you).

This is a poor-mans-version of the idea behind [Cost of delay](http://leanmagazine.net/lean/cost-of-delay-don-reinertsen/). There are [awesome books](https://www.amazon.com/Principles-Product-Development-Flow-Generation/dp/1935401009) written on that topic

**Value or Cost of Response Time** - "Yo! This new thing would be great to start next."
"Well, sorry. But there are 43 items that we have promised before you. But you are 44! Congrats"

The order of the backlog often becomes a jail and hinders us from being fast and flexible in priority, as we wanted when we started to use agile in the first place.

[The article](http://www.allaboutlean.com/inventory-cost/) summarise by saying

> Overall, the **cost of inventory is between 30% and 65% per year!**

Luckily it's not that bad for software. But we still spend a considerable amount of time talking, handling, planning and structuring the backlog. Just count the number of times you hear someone refer to the backlog in a day. You'd be surprised.

## Alternatives and … options ^^

Ok. Let the ranting stop and the suggestion start.

First of all - drop the list. Create a mind map instead. I've [blogged about this before](http://www.marcusoft.net/2016/06/backlog-and-features.html) and there are great tools for this, so I'll keep this very short.

Check out:

* [Impact mapping](https://www.impactmapping.org/), by Gojko Adzic - a purpose-built mind map that clearly shows how the things that we are doing connects back to the reason we are building it. One of my favorite tools!
* [User story mapping](https://jpattonassociates.com/user-story-mapping/), by Jeff Patton - another tool that helps you to break down things into small deliverables, without losing the sight of the overall problem we are trying to solve. Great for fleshing out "the simplest thing that could possibly work". Great book too!

Secondly;

> [Don't fear forgetting things](http://www.marcusoft.net/2016/04/fear-of-loosing-important-things.html). Per definition, important things will come back - if not they were not important.

Don't put things into a backlog just because you don't want to forget it. Do it or drop it. Or create a mind map of ideas on a whiteboard, so that you can relate it to things that you want to do.

Which brings me to the last point; Call it options rather than a backlog. Because that is what it really is. A bunch (not a list) of ideas that we might do later, should nothing more important come up, until then.

### But.. but… but…

I totally see that you, in most place I've been working in, need to communicate what you are working on and what is coming next - so do that. Hold a list of the next … 5 items we are going to do.

But do not hold a list of the next 450 items we are going to do. In order. We have tried that. Didn't work at best and cost us a lot of money in lost opportunities at worst. We called it waterfall.

And don't create a long list of good-to-haves. Create a short list of improvements with a limit. 15. For example. 15 improvements. When you want to add number 16 - take one (or 4) old ones out. I promise that it will make itself known again if it was important. Call me otherwise.

## Conclusion

I think we spend too much time in backlogs. Backlogs are inventory and should be kept to a minimum length. But not too short.

And not a list - because that implies an ordering that is hindering us from doing the right things now. We end up doing what we promised a long time ago instead.

And don't call it a backlog. Call it options instead.