---
layout: post
title: "Flow and dependencies"
author: "Marcus Hammarberg"
date: 2018-02-15 13:18:08
tags:
 - Lean
 - Agile
 - Kanban
---

I'm talking less and less about agile and even lean, these days. Instead, the poison I'm selling now is **flow**. In all honesty, it might be better to put it like this:

> Opening peoples eyes for the benefits focus on flowing work smoother and faster, alleviates discussions about lean and agile later.

Flow is an eye-opener and shifts your perspective. Things that previously was paramount (ensuring people are not idle, for example) becomes irrelevant or uninteresting. New ways, practices, and innovation quickly spur.

But also new problems occur. One of the most common ones is the fact that flow is severely hurt by tasks that have many dependencies. I think I talk to teams about 4-6 times a week about this.

In this post, I will offer a few thoughts on how to handle this type of situations.

<!-- excerpt-end -->

### You say 'problem' - I say 'unrealized improvement'

First of all - finding something that hinders flow is the reason focusing on flow is awesome. Because that is not a problem we see, it is an unrealize improvement opportunity. If we fix this, we actually improve the flow of the system. We will deliver faster, learn faster and have opportunities to make decisions more frequently (psst - that is called agility).

If you never find things that hinder your flow … then you are working with too many things at the same time. You should lower the number of things going on until some problems occur. This is what WIP (work in process) limits are: a tool for finding improvement opportunities.

Ok - it's a Good Thing (TM) - but what is it? What are these dependencies that you are talking about?

### An example, if you please

Examples are a great way of clarifying thoughts and reasoning (I'll get back to that soon) so let's take one.

Imagine a Team A that need some in-house software to do their work. This software is developed by Team B. Someone from Team A needs a change and ask to get a feature change request into the backlog of Team B.

The Product Owner (PO) of Team B is very nice and helpful and adds the ticket. Sadly Team B is bogged down with work and the feature change request gets down-prioritized for some weeks. But after 6 weeks Team B gets to work on it and finish it within two days.

Finish, I said? No - it's now ready to be tested, what's known as User Acceptance Testing. This has to be done by someone in Team A, hopefully, the person that ordered the change. Team B puts the ticket in the "Waiting for UAT"-state and … ah, well … waits.

Well, actually they go over to Team A and tells them that the feature change is ready for UAT. Together with 23 other features that are already waiting. Sadly, now Team A is swamped with work. It is that time of the month. So the UAT ticket gets stuck in "Waiting for UAT" for a few weeks. But after that Team A tests and approve the ticket and tell Team B to deploy it.

The feature is deployed and works flawlessly. Everyone is cheering!

Or not really, because Team A says that they always end up waiting for, even important, feature changes forever. Also, they get bothered with a lot of requests to help Team B testing. Always bad timed and often it is hard for them to remember what the feature is about once they get around testing it.

Team B answers "UAT" in unison when asked what their biggest problem is. Because they have a lot of items waiting for Team A in "Waiting for UAT". They laugh when they relate the record of 46 items waiting in that column. And that time Team A was screaming for more work to be started.

Notice that I simplified the situation a lot now. First of all, these were only two teams that together could move independently. Secondly, there were no problems in the UAT. Nothing needed to be rewritten or changed, in my example. Thirdly anyone from Team A could do the testing and didn't have to bother someone from Team B with help testing the feature. Most cases I've encountered in the wild don't have this.

### What to do? What to do? What to do?

My friends, this is easy to solve. It will not require new tools or (significant) changes in your processes.

Here are a few things that would significantly improve flow in this situation:

Don't allow new things into the backlog if there are items waiting to be tested. At the very least don't start new work unless there's unfinished work in UAT. Finish that first, or potentially (and likely) throw the work away if it is too old and not relevant. Yes, it happens. I threw away 90 items from the backlog of one team without any complaints

> Stop starting - start finishing



Just before Team B starts work on the feature request; check in with Team A to see if they are ready to do their part.

​    **Team B:** "Hey, Team A people? We are about to start work on feature change request 19293945212123. We need you to do testing a few days. You ready?"

​    **Team A:** "Are you crazy? It's the end of the month. We cannot possibly test now!"

​    **Team B:** "Ok - great. Then **I will not start this now since that would slow me down**. I can do something else in the meantime. Let me know when you're ready."

> Do not start work that you know will be blocked. Ensure flow to the best of your ability



When Team B start work with the feature sit down with Team A and talk about how this feature will be tested. Potentially come up with ways to speed up and improve quality of the tests - maybe we can automate the test?

If you cannot get that time ("Because Team A is busy all the time and never want to talk to us ever" for example), try this: document your understanding of the feature as a few tests or examples on how it should behave. Like this:

"We have understood it as

* You will check all values in X and if they are the same as the sum of Y. If so it is correct.
* We should never see any negative values in Z
* For all the values in A, B, and C - they should be correlated with the end result of the previous months A, B, and Cs"

Send this to Team A and do not start work until they agree with your statements. It is simply too risky.

> Never be blocked
>
> > Robert C. Martin, aka "Uncle Bob"



You can probably come up with other things that are better suited for your situation. The goal is to let the workflow as smooth and fast as possible. It could mean that not start it too early, or spend waiting/queuing time to ensure that the workflows smoother.

### Swedish police passport department

Let me take another, unlikely example that I ran into the other day.

I need to renew my passport and started to check how to go about doing that. It was surprisingly awesome from a flow perspective:

* I got to book a time slot, a few weeks from now. I got 10:20 as my designated time.
* Once there I was instructed to take a queueing number and sit down
* When I sat down, I had further written instructions:

  * Get an identity card ready
  * Make sure your looks is as you want it
  * You will be asked to leave fingerprints - get ready
  * Etc
* When it was my turn the whole process took about 4 minutes to complete
* I will get notified when my passport was printed


I was out of before I knew what happened.

Notice how all the steps in the process above was there to ensure smooth flow;

* I and a suitable, limited number of other people got that time slot. Once enough people had booked that time slot it was full. They don't want 100's of people at the same time, even though 100's of people wants to have their passports

* When I got there, even though I had a time slot, they arranged another buffer of work. In this time I could prepare and they knew how many people they had to **actually** server. Maybe some didn't come here, maybe some came on the wrong day etc. This ensures a smoother flow for us waiting

* They prepared me so that I had my things ready when it was my turn to use the "register for passport"-service. Once I was using that limited capacity - they wanted to ensure that quality work was done. Hence they prepared the work (me and my stuff in this case) before I was allowed in.

I was truly impressed to see this focus on flow and the experience was actually quite enjoyable for me as a customer as I felt like water running through the service. Flowing if you like.

## Conclusion

Focusing on flow will give you new outlooks on problems. You will see new opportunities to improve flow and speed of execution. Bottlenecks will present themselves in the form of queues and wait time (remember the "Waiting for UAT"-column from our first example).

Resolving these problems is not expensive or hard - it just requires you to work a bit different around the bottleneck to ensure that time spent in that state is not waste.

There's so much more to learn and read about this that this post is almost embarrassing to me. But I wanted to share some simple learnings that I've been teaching the last couple of weeks.

I hope you found them useful too.