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

I'm talking less and less about agile and even lean, these days. Instead the poison I'm selling now is flow. In all honestly, it might be better to put it like this:

> Opening peoples eyes for the benefits focus on flowing work smoother and faster, allivates discussions about lean and agile later. 

Flow is an eye-opener and shifts your perspective. Things that perviously was paramount (ensuring people are not idle, for exampel) becomes irrelevant or uninteresting. New ways, practices and innovation quickly spurs. 

But also new problems occur. One of the most common one is the fact that flow is severely hurt by tasks that has many dependencies. I think I talk to team about 4-6 times a week about this. 

In this post I will offer a few thoughts on how to handle this type of situations. 

<a name='more'></a>

### You say 'problem' - I say 'unrealised improvement'

First of all - finding something that hinders flow is the reason focusing on flow is awesome. Because that is not a problem we see, it is an unrealize improvement opportunity. If we fix this, we actually improve the flow of the system. We will deliver faster, learn faster and have opportunities to make decisions more frequently (psst - that is called agility). 

If you never find things that hinders your flow … then you are working with too many things at the same time. You should lower the number of things going on until some problems occur. This is what WIP (work in process) limits are: a tool for finding improvement opportunities.

Ok - it's a Good thing (tm) - but what is it? What are these dependencies that you are talking about?

### An example, if you please

Examples is a great way of clarifying thoughts and reasoning (I'll get back to that soon) so let's take one. 

Imagine a Team A that need some inhouse software to do their work. This software is developed by Team B. Someone from Team A needs a change and ask to get a feature change request into the backlog of Team B. 

The Product Owner (PO) of Team B is very nice and helpful and adds the ticket. Sadly Team B is bogged down with work and the feature change request gets down-prioritized for some weeks. But after 6 weeks Team B gets to work on it and finish it within two days. 

Finish, I said? No - it's now ready to be tested, what's known as User Acceptance Testing. This has to be done by someone in Team A, hopefully the person that ordered the change. Team B puts the ticket in the "Waiting for UAT"-state and … ah, well … waits. 

Well, actually the go over to Team A and tells them that the feature change is ready for UAT. Together with 23 other features that is already waiting. Sadly, now Team A is swamped with work, that time of the year. So the UAT ticket get stuck in "Waiting for UAT" for a few weeks. But after that Team A tests and approve the ticket and tell Team B to deploy it. 

The feature is deployed and works flawlessly. Everyone is cheering!

Or not really, because Team A says that they always end up waiting for, even important, feature changes for ever. Also, they get bothered with a lot of request to help Team B testing. Always bad timed and often it is hard for them to remember what the feature is about once they get around testing it. 

Team B answers "UAT" in unision when asked what their biggest problem is. Because they have a lot of items waiting for Team A in "Waiting for UAT". They laugh when they relate the record of 46 items waiting in that column. And that time Team A was screaming for more work to be started. 

Notice that I simplified the situation a lot now. First of all these were only two teams that together could move independently. Secondly there were not problems in the UAT. Thirdly anyone from Team A could do the testing and didn't have to bother someone from Team B with help testing the feature. Most cases I've encountered in the wild don't have this. 

### What to do? What to do? What to do?

My friends, this is easy to solve. It will not require new tools or (significant) changes in your processes. 

Here's a few things that would significantly improve flow in this situation:

Don't allow new things into the backlog if there's items waiting to be tested. At the very least don't start new work unless there's unfinished work in UAT. Finish that first, or potentially (and likely) throw the work away if it is too old and not relevant. Yes it happens. I threw away 90 items from the backlog of one team without any complaints

> Stop starting - start finishing



Just before Team B starts work on the feature request; check in with Team A to see if they are ready to do their part. 

​	**Team B:** "Hey, Team A people? We are about to start work on feature change request 19293945212123. We need you to do testing a few days. You ready?"

​	**Team A:** "Are you crazy? It's end of month. We cannot possible test now!"

​	**Team B:** "Ok - great. Then **I will not start this now since that would slow me down**. I can do something else in the meantime. Let me know when you're ready."

> Do not start work that you know will be blocked. Ensure flow to the best of your ability



When Team B start work with the feature sit down with Team A and talk about how this feature will be tested. Potentially come up with ways to speed up and improve quality of the tests - maybe we can automate the test? 

If you cannot get that time ("Because Team A is busy all the time and never want to talk to us ever" for example), try this: document your understanding of the feature as a few tests. 

"We have understood it as"

* You will check all values in X and if they are the same as the sum in Y its correct
* We should never see any negative values in Z
* For all the values in A, B, and C - they should be correlated with the end result of the previous months A, B, and Cs

Send this to Team A and do not start work until they agree with your statements. It is simply to risky. 

> Never be blocked
>
> > Robert C. Martin, aka "Uncle Bob"

### Swedish police passport department

The