---
layout: post
title: How I do sprint planning
date: 2012-02-27T21:11:00.001Z
author: Marcus Hammarberg
tags:
  - Life of a consultant
  - Scrum
  - Agile
modified_time: 2012-02-27T21:11:43.344Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-6757288054780575445
blogger_orig_url: https://www.marcusoft.net/2012/02/how-i-do-sprint-planning.html
---

I haven’t done “proper” [Scrum](http://en.wikipedia.org/wiki/Scrum_(development)) in quite some time now, with the [Kanban](http://en.wikipedia.org/wiki/Kanban_(development))-ery going on. So when I got thrown into a sprint planning meeting the other day I was happy to see that I still remember how I used to do my sprint planning. Thought I write it down if I need to get back to it later.

I will probably upset some people as well… and might even get some feedback that can help me improve.

And of course, this is not my own thoughts – I’ve picked up some tricks here and there over the years and probably forgot about as many. Thanks everybody that I’ve learned from, especially [Öystein Stave](http://se.linkedin.com/in/stave) who helped me find my lost excel-sheet that we created together a long time ago.

### Time boxing and the three constraints

As everything in Scrum I plan sprints as a time box. That is I let the time be fixed and adjust the content accordingly. Most often I also fix the people and their percentage in the sprint. So in this triangle the features are the one thing that have to give when things doesn’t plan out:

![time boxing](/img/timeboxing_thumb%2525255B1%2525255D.png)

Ok – nothing new there. As probably in the rest of the post as well… : )

### Organizing the sprint planning

For me sprint planning falls into two discrete parts:

- The product owner explains the items he has as highest priority in product backlog so that the team knows WHAT it is
- The team picks and plans HOW to accomplish that during the next sprint.

When possible I try to have these two events on different days; for example the first part on an afternoon and the second part in the morning afterwards. Or even with a weekend in between. This will give the team some time to think about the items coming up. We don’t even have to remind us of doing that – it comes automatically.

This post will focus mostly on the second part; the planning of the actual content of the sprint.

### When are we done?

Given that reasoning we start our meetings by deciding WHEN we should be done? Time and date! This also sets the expectation and seriousness level with the team:

> “We will demo the result of the next two weeks; 14/4 0900.”

I write the start and end date on a white board. And while I’m at it we calculate the number of calendar days between those two dates. Be sure to remember to NOT count holidays and other days when everybody is away.

![time](/img/time_thumb%2525255B1%2525255D.png)

By doing this you can now also create the X-axis of your burndown chart, by simply plotting out the number of days and setting dates beneath. By doing so you also get a feeling of progress that is quite nice; “we’re getting somewhere people!”

![x-axis burndown](/img/xaxis%25252520burndown_thumb%2525255B85%2525255D.png)

### Who are with me?

We can now turn to the people-part of the time boxing triangle; WHO are the team that should accomplish this (this yet to be decided).

This can simply be done by asking the people in the room how many percent they can put into the project and if they are planning on being away during the sprint. We have a simple template that looks something like this:

![people](/img/people_thumb%2525255B6%2525255D.png)

In the comment section I note down things that might be important to us during the planning. Such as Person 1 only being able to do front-end work. This is just to remind us of not planning more days than 8 days for her.

We can now calculate the number of man hours (or days) in the sprint and then adjust for focus factor to get our estimated velocity. Focus factor is an arbitrary percentage that we think will be lost to “other stuff”. For example, being new to agile or introducing a new technical framework will probably lower the focus factor.

Here we have a discussion in the team on what is affecting our focus factor this sprint. In some teams we have set different focus factor for different members in the team but that is completely up to you.

I never allow teams to set anything above 80% since I think that is improbable that you can focus at the task at hand to anything more than that.

![velocity](/img/vecolicty_thumb%2525255B1%2525255D.png)

You could ask why we write down the “Optimal hours in sprint” but I have found it a useful exercise to see how much we “lose” to the other stuff. It have even happened that the team has done something about that to get more time to the sprint.

So now we know how much we *could* take on for this sprint. But maybe we shouldn’t.

### What should we do?

We can now turn our attention to WHAT we should during the sprint. Now the prioritized product backlog becomes very important to the team. This is also a part where the product owner is indispensable.

The WHEN and WHO part usually doesn’t take very long after a couple of sprints. Maybe 15 minutes with a prepared excel spread sheet ([attached](http://dl.dropbox.com/u/2408484/SprintPlanningTemplate.xlsx)). But now we need the product owner present to clarify and agree on things that we discuss.

#### What is done?

Firstly the team and product owner needs to agree on a definition of done. What does DONE mean for this team (in this sprint even). I usually write this down on the whiteboard or draw peoples attention to a flip-chart paper that hangs from the Scrum board. Here’s one example:

- The demo will be in the test environment
- The code will be coded and reviewed
- The code coverage for unit test will be greater than 80%
- The documentation will be updated
- Testing has been done to a level that we *could* *potentially* ship to production
- Automated acceptance tests has been written and implemented

Yeah you get we’re I’m going… You decide what is a level you can live with this iteration.

#### How do we accomplish this then?

Then we go through the list of items (user stories for example) from the product backlog, starting at the top prioritized and simply ask ourselves:

> “What more do we need to do in order to be DONE with this?”

Here I ask the team to only use 2, 4 and 8 hour tasks. This forces us to think really hard on what we’re going to do for a whole day. I also remind people that they can forget about being disturbed and losing focus in other ways since we already have adjusted for that above.

This is very much an iterative process so from time to time I go back to our definition of done and ask if there is anymore that need to be done before we’re DONE with this item.

When done we sum up the number of hours spent on the item and go on to the next, until we reach the number of hours we have to our disposal this sprint (180 in our example). When we get there, it’s seldom between two items. So then the team have to decide if they “dare” to over plan a bit to get a complete item done or if they should split it.

Also we tend to do detailed plan for a couple of items more, just in case it runs smoothly and we get more done than we thought.

#### Creating the burn down

Armed with that number we can now complete the burn down chart, but simply plotting in the number of hours the team have taken on, on the Y-axis. After that it’s a simple matter of straight writing to get the ideal burn down in place.

![burndown](/img/burndown_thumb%2525255B1%2525255D.png)

### Summary

So there is how I usually do sprint planning. After that is the best day of a sprint. You have everything planned out, just ready for you to start pulling and work from. I love that feeling!

I realize that for many agilistas (myself included) this feel quite heavy and is a lot of planning for 2 weeks of work. Now a days I rather do this on an item-by-item basis and don’t even do estimations in hours anymore.

But if you’re new to agile or if you want to be sure about the details this has worked out great for me many many times.

Please let me know if you have done it in another way or how I can improve this.

**UPDATE** Lost the file mentioned below. Sorry

Here is the excel spread sheet I use for calculations etc.
