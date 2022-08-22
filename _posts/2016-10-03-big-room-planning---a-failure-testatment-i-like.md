---
layout: post
title: Big room planning - a workaround that can be useful
author: Marcus Hammarberg
date: 2016-10-03T20:19:48.000Z
tags:
  - Agile - Lean
  - Life of a consultant
---

I've just completed my first ever big room planning meeting (a type of exercise made famous by [SAFe](http://scaledagileframework.com) in their [PI Planning](http://scaledagileframework.com/pi-planning/)). That was quite an excerises and I'm totally worn out. But also immensely impressed by the team and the amount of learning that took place in the room today.

It was quite noisy at times but after 8 hours we went home with our sights aligned and a much better feel for what we will do the upcoming period (5 weeks in our case).

Still I could not get one thought out of my head. It stuck there a few days back and won't get unjammed:

> This big room planning stuff is really an anti-pattern and should be eliminated

In this post I want to explain why and also tell you why I still think it was great.

<!-- excerpt-end -->

## Investments

In order to prepare for the meeting we have held a lot of preparation meetings:

* A few just to set up the preparing
* One introduction meeting with everyone involved
* One prioritisation meeting to get the backlog in order
* One meeting with product owners to clarify what is required from them during the meeting
* And a number of individual conversations

All in all most of these meetings has been good and useful, especially the prioritisation meeting that was needed to get the backlog in a good shape and prioritized so that we knew which items of the backlog, that was going to be addressed in the planning meeting.

We then held the meeting itself, involving about 25-30 people in our teams and ca 20-25 people from groups around us that we need to get our stuff out of the door. Some of these people were high-ranking people that (in case) we needed to resolve prioritisation issues and dependencies.

Today I've spent the better part of 8 hours trying to summarise and document what was said during the meeting. I'm not quite done yet so maybe a few hours more before it's done.

All in all - quite an investment to get our sights aligned and our work planned. We planned for 5 weeks ahead, which is much shorter than recommended by SAFe (8-12 weeks) but still enough that we didn't know for sure what is going to be delivered in the end of the session.

## This is not needed…

As you might have seen on this [blog I'm re-reading the Toyota Kata book](http://www.marcusoft.net/2016/09/that-will-not-work-here-and-toyota-kata-mindset.html) and it refreshed my sight on what is different in the mindset of lean companies, such as Toyota;

> They always seek to optimise and solve problems on the systemic level

Getting everyone together in a big room like this, investing in all those meetings, preparation work and effort during the day is just a workaround of a process that cannot handle fast flow of small items.

The fact that we need to get everyone (45+ ppl) together in a room and put all other things aside for 8 hours straight to plan the upcoming 5 weeks in a batch is a testament to that our process and organisation, in it's current form, cannot support a faster flow. We have to meet like this in order to exchange the information needed, and that is only feasible to do in big batches.

That said - I think that the exercise that we ran today was really good and helped us a lot. Many, many things were clarified during the day, some groups had their first ever common planning and it was the first time we got a business context for the things that we were about to start working with. All good things.

But in the same breath I want to emphasise that we should try to find other, less intrusive, more flow-oriented ways of doing our planning - since flow is what we are after.

This practice would not last long in companies that want to optimise flow - rather they would seek to find ways to do the planning just-in-time for smaller items at the time. Since that is in the vision of the production (in Toyotas case; 1x1 piece flow).

In fact this is a really fork in the road for how different organisations work with improvements. Many organisations would be happy with the big room planning and simply claim that it was the best that can be done.

Organisations that optimise for flow would of course not stop there - they would find an even better way, working with even smaller batches, trying to reach even faster, even smoother flow, maybe even resulting in reorganise the entire company if needed. [Read my post on Toyota Kata](http://www.marcusoft.net/2016/09/that-will-not-work-here-and-toyota-kata-mindset.html) for an example of that mindset

## What to do instead, mr wise-guy?

It would not be fair to list everything that is bad with one approach without at least hint what could be done instead. But in doing so I'm actually not following my own (and lean literature in general) advice; experiment in small steps and see improve towards the vision.

But here goes; here's a suggestion that requires no changes in organisation and a lot less overhead in setting meetings up. We have parts of this in place already in my current team and I long for the time when we can do this smoother than a big room planning.

We've created a kanban board for the high-level stories (we summarise those in a one page format stating the hypothesis, size, metrics and other important facts about the feature) that are lined up for development.

From this point this is just my thinking out loud, but I'm sure this would work in a smoother, cheaper and faster way than to call a big expensive meeting every X weeks.

This board could be augmented with Work in process (WIP) limit on the number of stories in development and a simple pull mechanism for pulling more stories to work on just-in-time. It could look something like  this:

![An example ideation kanban board](/img/ideation_kanban_board.png)

### Ideas

To the far left there's a space for ideas and things that might be interesting further down the road, right now we just keep them there for reference and inspiration.

### Prepare

In the next column ("Prepare") we have decided to spend time on the item in question, so we create one of those OnePagers out of our idea. We start to do investigations (could be lengthy if needed), but just enough to understand if it's worth continue with or not. Right now I have simplified this a bit for space; I only have a WIP of 3 - where these items might be long running and we need a higher WIP, there's only one column - that could be more if needed (working/done or something) etc. You get the idea I hope; this is the step where we prepare for the next.

### Up next

The next step, "Up next", is the business value prioritized backlog. Here the work needs to be well-enough prepared so that the team doesn't end up in big problems when they start to work with it. That is very lofty and vague but true; some stories could just be the hypothesis and we'll leave the rest to the team - others need a lot of thoughts, preparations and negotiations even.

In my example I have a WIP limit of 6 items in the "Up Next"-column. The higher the limit the longer from when we commit to when the team starts to work with it ("the bigger fridge" if you like). But since the items are in prioritized order we could easily change priorities as needed.

As the team finish a feature they get capacity for another one (they do right now in my example, since they have 4 items in "Doing" with a WIP of 5 - did you see that?). When that item is pulled a meeting *can* be called with the people that is needed to explain and handle that item. This is the "big room planning" but for one item; only the people needed to clarify, clear up, plan and find dependencies for this particular item is needed.

However it might be that calling that meeting is cumbersome and needs to be planned in advance. That's what the dotted line is for. Here's how it works:

*  The team pull items from the top
* Once the third item is pulled into "Doing"-column a need to refill the "Up next" column occurs
* We move the 3 remaining items up to the top of "Up Next". They are now top of backlog
* We call a "big room meeting" for the next 3 items to be put at the end of the column
  * There's no hurry since we have 3 more items to work on
  * We only need to call the people needed to do a "big room planning" for the next 3 items.

The system needs trimming of course; what should the WIP limits be? how often can we call meetings? how long does it take to call a meeting? etc are questions to be taken into consideration.

The lower WIP limit the columns have the faster the flow of work will be, but it will also mean that waiting times (for people to have time to help us plan for example) will hurt our flow more. Higher WIP limit will allow for more disturbances but give a slower flow.

## Summary

I think that a "big room planning" is a really good exercise and I saw the other day that we could learn **a lot** in just a few hours. I like it!

However it's clear to me that "big room planning" is a workaround for a process that cannot handle a fast flow. We should move away from it as fast as possible. It should be viewed as a workable intermediate state that we should move away from as fast as possible.

There. Some thoughts after my first PI planning.