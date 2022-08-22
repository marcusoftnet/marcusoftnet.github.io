---
layout: post
title: Frequent releases and no urge to finish
author: Marcus Hammarberg
date: 2016-04-08 07:07:25
tags:

  - Agile
 - Lean

  - Kanban
  - Life of a consultant
---

Yesterday we had a couple of very interesting discussions in the team, that got me thinking on being clearer around the purpose of kanban.

In this team we have made a lot of changes lately to try to improve our lead times and throughput. One simple thing that we changed and that made a significant improvement was to simply release more frequently. When I first arrived here the releases were done every 6 weeks. Going to every 4 was just a simple change, and increasing frequency to ever 2 weeks was a very natural next step that no one objected to either.

But then a question came...

<!-- excerpt-end -->

<blockquote>There's no urge to finish stuff now. With this frequent releases stuff will never get done</blockquote>

This puzzled me for awhile but then I realized that it was a worry about a reasoning like this: `well... well... that feature didn't make this release either. No worries - there's another release in a week or two... Yaaaa-aaaawn.`

Now, not that I think that the folks in my team would ever reason like that but let's see what kind of mechanisms that kanban has to offer to handle this, using a few simple principles and practices that I've often used.

# Stop starting - start finishing
The first thing you can agree on in your team is that we prefer to finish things over starting new things. You can use the catchy slogan:

<blockquote>Stop starting - start finishing!</blockquote>

This sounds trivial and obvious but it turns out to be something that you need to put some effort in. Because it's much easier to leave something as "almost done" than to finish it completely.

But that's is for one thing. Not the hundred things that we promised to do to the 6.1 release. And it's much nicer. Don't miss that opportunity.

# Walk the board - right to left
A very simple practice that I've seen work really well is in your morning meetings enumerate the work on the board, rather than to get a status report per individual.

Start on the item furtherest down the process, closest to being Done. In most cases, in the western world, a board visualization enumerate work states from the left to the right. Done is to the far right. Start there, closest to Done, and walk backwards. This is an "old" lean principle to gain flow: start at the customer and work your way backwards.

The longer time the item has been in the process the more time we have invested in it, probably. So we want to make an effort of finish it so that we can "cash in" on that investment.

Stuff completed, but not in production is helping no-one. Or in the words of [Woody Zuill](https://twitter.com/WoodyZuill):

<blockquote>Software not used by users is truly useless</blockquote>

One powerful question you can ask in the stand-up, to focus your attention is:

<blockquote>What is hindering us from finishing this today?</blockquote>

You might end up spending less time on the items early in the process (to the left) on your board. But that's ok, right? Because that's the things that you invested little time in so far. And they are not close to being complete.

# WIP limits
A final practice that puts focus on finishing things is our old friend work-in-process-limits. In fact this is one of the most basic features you'll need to have in place, in order to even be able to call it a kanban system.

With a WIP limit in one column your system will back up and be filled with items waiting to progress if there's a blockage downstream. For example; if there's 2 items being tested and the WIP limit is 2, we will not add more things into test until those 2 are tested.

![Board with WIP limit 2](/img/testwip2.PNG)

Let's now say that the test-environment now is shaky, for a couple of days for example. That means that things starts to back up. According to the WIP limit in Test we cannot pull new stuff into Test. A queue will form in front of the bottleneck column Test.

![Items backing up](/img/backingup.PNG)

Once that bottleneck is resolved (the environment is working again) stuff can start to flow again. We now get the chance to focus our efforts to clear up the items in test that have been waiting. There's no use starting new stuff since there's long list of items that we not yet have tested.

![Resolving the bottleneck](/img/resolving.PNG)

We get that gentle urge to finish things.

# Summary
Decoupling the releases from the delivery is an great way to get calmness in your process. Stuff gets done when it gets done and we release it when it is up to the right quality. Should we miss a release, there's no biggy - another release is soon coming.

However - this is not a reason not to have a focus on finishing things. Adopt the principle of Stop starting - start finishing. Walk the board from the right to the left to focus on the things that are most close to being Done. Use WIP limit to keep your focus to flow your items through your process