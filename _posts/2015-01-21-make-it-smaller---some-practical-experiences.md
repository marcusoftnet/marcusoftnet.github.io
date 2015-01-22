---
layout: post
title: "Make it smaller - some practical experiences"
author: "Marcus Hammarberg"
date: 2015-01-21 11:26:54
tags:
 - Lean
 - Agile
 - Salvation Army
 - Life of a consultant
---

One of the "clients" I work with right now is a hospital. We have tried to turn their performance around and they are improving immensely. In fact - I think they will be just fine. I did *not* think that just 4 months ago.

One of the things that we have talked with the management team about is trying to do smaller things often and act on the feedback we get from that. Nothing new ... in software development or other lean practicationers, but in this setting. I hear eyelids popping open everyday.

How does that look? What have we done? Most of the work we have done has not directly with health care to do but rather change management and business in general. Very practical stuff mostly. In this post wanted to share two of our current projects (or Focus areas as we call them) where our approach made a big difference.

<a more='more'></a>

# The parking lot
The first focus area is to redo the parking lot outside the hospital. This quite a big area (80 x 15 m), sloping and with very bad condition of the paving stones on the ground. Big holes, broken paving stones and just plain ugly.

## First things first

The first thing we always do is to define the focus area:

- We give it a name: "Fix the parking lot" in this case
- We answer the question [Why](http://www.marcusoft.net/2015/01/things-i-say-often-why.html). Why are we doing this change: "To support safety and ease of access for all our visitors and make a better first impression", for example
- We define a Definition of Done: "When the parking lot is fixed and cars have parked on it without problem"

Now we begin to talk on how to reach that goal. I allow no improvements to be worked on without answering Why and Definition of Done. As it turns out sometimes the Why is not what you'd think. And other times people have widely different Definitions of Done.

## Make it smaller
This time we realized that we needed help from a outside contractor. So the first order of business was to ask a couple for quotes. They come back with something that was a lot more than we expected. It was 100 money for the entire parking lot.

So we tried to do something smaller. Instead of doing the entire parking lot in one go we suggested to approach the work in 4 smaller phases. We simply divided the parking lot up in 4 sections naming them Phase 1 - 4.

Now we asked again for a quote for the first phase.

## Advantages
This gave us a number of advantages:

We have better control of the **progress** of the project. Once the first phase (which might be just a couple of days) is done, we can decide to do Phase 4. Phase 4 is a very important section of the parking lot since it's outside the emergency entrance. We now have to opportunity to do that phase when it suits us (during a weekend) instead of being in the hands of the contractors schedule.

In the same manner we are **less risky** in this approach. Should anything go catastrophic wrong we can change our plans or cancel after just the phases we have done so far.

We have better control of **quality**. For the first phase we pick a contractor. If we are not happy with the quality of their work we can switch to another contractor for the other phases.

We can control the **speed**. If we wanted to we can start two phases with two contractors. Or slow it back down again by just running one phase at the time.

We spend **less money** up front. Yeah, of course. 100 money and we divided it to 4 phase of 25, 30, 20 and 25 each. Since we are not sure on the contractor let's start with the 20 money phase so that we're not spending too much up front.

We can **keep** 3/4 of the parking **open** while we are renovating one phase. Compare this to doing a big concrete block over the entire parking lot. It's been suggested. That would mean closing the entire parking lot for the entire project running time.

# Accreditation

Another BIG project we are doing is about accreditation. Basically some kind of quality certification. There's a 200 page book from the Indonesian government guiding the hospital on how to get Accreditation.

In this book there are 4 target areas listed, that you need to go through. Each of them contain 9-20 goals that the hospital needs to meet.

To understand the rest you need to know something about Indonesian culture; everything is controlled by documents, Standard Operating Procedures (SOP). And people only do what is in the SOP. Nothing else. Because then they get yelled at. For not following the SOP. It's really strange to understand for a western.

Let me tell you a story to exemplify:
when we got here we were shocked over the state of the hospital. It was really bad. We asked the nurses why they didn't clean. No answer. We asked the Director; Well... it's not in the SOP for nurses to clean.
So we put it in.
And they started to clean. No whining, no questions. Because now it was in the SOPs.

Finally the SOPs are VERY detailed. In one hospital there's ca 1000 SOP controlling the work. Permission to gasp for air over this level of *implemented* control.

## Scoping the project

Back to the project; that makes 4 targets x 9 - 20 goals each x 1000 SOP that potentially needs to be updated revised and implemented. A BIG project.

When everything is documented and implemented we can ask for an audit from the Accreditation Department of the Indonesian Government. After that - it is done.

The hospital have said that they can do this in 6 months. How can they say that? They know nothing about how long this will take.

## Approach

The first feeling you get when you see a pile of work like this is just PHE-EW! That will take forever. But how do you? How **will** you know?

Right now we don't even know the best way to approach this. Should we do all the work for one target, or should the "work" run through all the targets?

The only secure way I know is to do something small completely done, see how long that took and then try to make a guess of the rest.

My suggestion, not yet implemented though, would be to find the smallest part we can single out from the pile of work we have ahead. Preferably something that all targets need to consider. We can then do that little part, considered all the targets for it and then implement it. It's now "Ready for Audit".

How long did that work take? For example 5 days.
How many work items like that do we have? For example 980.

Now we can wing a guess, if all the work was just like this, it will take: 5 x 980 = 4900 days.
Great! Now we know this. We also know that this just a prognosis based on 1 data point. Very very unlikely to end up like this. Could be more, could be less.

Now we can start to act to make this go faster, to change the process, to do things smarter etc. Maybe there's a stupid idea to work with work items running through the entire chain. Maybe it's better to do this Target by Target and let the all the work for one Target become completely done before we move on to the next?
How can we test that? Hint: what is the smallest thing we can do to verify this approach? Can we do only part (one goal for example) of one target?

## The faster work is the work you don't do
Often when I reason like this people get very disappointed.

<blockquote>4900 days?! We will never be done... There's no use.</blockquote>

Let me tell you my favorite story about having to much work to do, for the planned schedule;
I was a contractor for a number of years for a big Swedish Insurance company. They had a lot of applications written in an old technology (Visual Basic 6). Microsoft announced that they planned to discontinue the support for this product with 1 year. So the insurance company decided to migrate all their applications to VB.NET.

They counted the number of applications that they needed to migrate: 254.

Their first reaction?

<blockquote>254 applications?! We will never be done... There's no use.</blockquote>

But then they did something amazingly simple and smart. They checked logs and stats to find out which of these application actually was used, and how much they were used.

A new list with "only" 70 applications came out. And it came out in prioritized order. The application that was used the least we could do last.

Much nicer! Much more approachable! And an improvement and simplification for the future too.

# Conclusion

Please note that the management group said that nothing of this can be done this way.
They always do. Almost all the groups I've worked with at one point or another say "It's impossible. We cannot change that", when we try to challenge some strong held truths of the process or company.

It's not impossible. You can change that.
I promise.