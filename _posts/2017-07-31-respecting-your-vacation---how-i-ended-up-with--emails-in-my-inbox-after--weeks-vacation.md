---
layout: post
title: Respecting your vacation - how I ended up with 0 emails in my inbox after 4 weeks vacation
author: Marcus Hammarberg
date: "2017-07-31 11:56:08"
tags:
  - Life of a consultant
  - Agile
  - Lean
---

Sweden is an amazing country in many regards. One of the best is the by law required 5 weeks vacation per year. I know because I just came back from four of them.

However, in this day of eternal connectivity, social media and culture of responsive being awesome I sometimes have a hard time winding down and really get into vacation mode.

This year was different.

First I went on a 8 week social media fast, which helped me slow the tempo down quite a bit before my rest started.

I also tried a new way of handling my Out-of-office reply in my work email. This post is about my strategy to handling that.

<!-- excerpt-end -->

## What?! What have you done? Why?

The reason you are on vacation is to rest from work. That means that you are better off not switching your brain back into work mode every other hour because an email is popping into your inbox.

I, for one, need about 1 week to unwind and flush workstuff out of my system. If I’m reminded of work from time to time it will be as if I'm not on vacation at all. I will never reach unwinded state

Also, consider the situation when you get back here. A normal day here I get 5-15 email (yeah, that’s not a lot — lucky me! Replace with your numbers as needed) and I will be out for about 4 weeks. That’s 200 emails, most of which are either not important or out-dated when you get back. If all of them are waiting for me when I get back I need to wade through many emails where most of them is not interesting nor important.

Speaking of important; if the emails are truly important, for example contains an important task for me to do, I will be reminded to do so. If not - it was not important. Per definition emails that not get re-sent are:

> Not important enough to ensure that Marcus did it / got the information

I also created an Out Of Office reply that informs each person sending me an email that I actually will not read that email and that they will have to re-send it once I’m back if they want me to see it.

## How set this up (using Gmail)

Below follows a description on how I set this up using Gmail. I'm sure you can figure out how to do this in your email system, using this as inspiration.

### Out of Office reply

![Out of office settings](/img/ooo.jpg)

1. Open Gmail and login

2. Open Settings (Gears-icon -> Settings)

3. Way down on the General-tab you will find “Vacation responder”.

4. Fill it out to your liking. Above is my vacation responder - you can probably do much better

5. Save - very easy to forget

### Set up a catch-all-filter

Before we start - this is a bit hacky and I’m not proud of how this turned out… But it will work for me and for now.

1. Open Gmail and login

2. Open Settings (Gears-icon -> Settings)

3. Go to the “Filters and Blocked Addresses”-tab

4. Click the “Create a new filter”-link.

5. There’s no “catch all incoming emails”-feature in Gmail filters so we’re going to do a hack by matching all emails not containing a very unlikely string. Like this:

   ![Creating a catch all filter](/img/catchAllFilter.jpg)

6. Click the “Create filter with this search”-link in the bottom corner

7. Set up the rules for your filter. I'm moving my emails from the inbox and adding a label called "VacationEmails", so that I can easily find everything that has been filtered out.

   Again - here are mine but I’m sure you can be much more creative when doing your filter

   ![Creating the filter](/img/creatingFilter.jpg)

8. Click “Save filter” (or Update filter if you’re editing it) to enable the filter.

### "Fun" with filter hacking

Now for the [Sad Trombone](https://sadtrombone.com/?autoplay=true)-moment… You can’t control the order of the filters. And they are executed in the order they are listed.

For example here are my filters (I even tried to redo the filter to look for the last letter in the alphabet to get it to sort lower… no luck)

This means that my “catch all”-filter will fire first and … catch all.

![A catch all filter that is too catchy](/img/filterOrdering.jpg)

But there’s a hack; exporting your filters and reorder them locally… Here's how to do that:

1. Select all filters and click Export
2. Open the downloaded “mailFilters.xml” and reorder the `<entry>` nodes, so that your “catch all”-filter ends up in the end.
3. Remove all the filters in Gmail by Selecting All and then hit “Delete” (and confirm the deletion)
4. Now click the “Import filters”-link and upload the file with the reordered `<entry>`-nodes from step 2 above
5. Enjoy the reordered list of filters
6. Go to vacation and be FREE!

## Meeting the "But I cannot do that, you know"-argument

Yes I know. Your job is so that you cannot just turn off your email. Sure, people would get angry. Yes, yes - there's issues popping up at anytime that you need to consider and act on.

But - stop and think for a while. Who, of all those senders (including automatic / robotic ones) cares for you and your well-being? Will anyone of those think:

> Hmmm - I better not send that now, because Marcus sure need his vacation. He felt really tired before he left. And by God, it is in the law to have un-distrubed vacation. The man need his rest!"

I'm betting not that many.

Finally - there's a hidden improvement opportunity in doing this. If you start to talk about turning on a feature like this during your well-earned (and *by law required to be un-distrubed*, I will not re-iterate this again now. Promise) vacation, questions will arise:

> If she's not around, who will take care of X in the meantime?

> What if customer Y calls about their contract? How should that knowledge spread?

> If he is not here, where can I read up on how to restart job Z?

All of these are knowledge spreading, pain sharing, improvement finding opportunities waiting to happen.

As with many things, these problems and issues that we see coming by introducing a new (better?) way of working - are in fact improvement opportunities waiting to happen.

## Conclusion - how did it turn out?

I came back from my vacation this morning. The inbox was empty. Not once was I disturbed nor did I think about the work emails.

Two "important" emails snuck by me:

* One with a planning for the upcoming period. Someone told me it was sent and I picked it up in about 1 minute from my filtered folder (all emails with the label "VacationEmails")
* A person close to me is going to change position. At lunch someone told me. I then could find that email pretty fast and read up on the details.

The team(s) around me has coped perfectly without my intervention during this time.
