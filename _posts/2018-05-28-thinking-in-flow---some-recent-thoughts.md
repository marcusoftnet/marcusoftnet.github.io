---
layout: post
title: "Thinking in flow - some recent thoughts"
author: "Marcus Hammarberg"
date: 2018-05-28 20:47:34
tags:
 - Agile
 - Lean
 - Kanban
---

I talk a lot about flow these days and I'm continuously fascinated how many good things follow by shifting our focus to supporting a better, faster and smoother flow.

In this post, I just wanted to share a few thoughts that have been on my mind lately. 

<!-- excerpt-end -->

### Flow of what?

<img src="/img/donkey-in-air-cart.jpg" width="100%" />

This picture above is my favourite picture on the net. I have done a 2-hour lecture on lean with this as the only slide. 

I will not go into all details, that can be observed and learned from this picture, but note how much value that gets delivered. You can tell but I'm sure that poor animals legs are plenty busy, running for his life with fear. That business doesn't help much. None of the bags on the trolley gets delivered. 

At this point I often ask:

> What is the simplest and cheapest way to solve this problem? 

You'd be surprised how often people, seriously, suggest to buy a donkey more. That is easy, inhuman (inanminal?) and also expensive.  

The answer I look for is:

> Take some of those bags of. 

Of course. Simple. But that then begs the next question: 

> Which bags? 

Ah! That's not only harder but much more interesting. Because we want to take off the bags that don't provide value quickly, the ones that are far so that we can get the quick deliveries first. Or maybe the ones that are too odd addresses so that we can fulfil complete orders to the prioritized addresses first. Or maybe the most fragile ones should be delivered first so that we have handled the riskiest. Or maybe ...

The list could be long on what is the smartest thing to do - but note that all of these questions is about improving the **flow of (business) value**. Not a single one of the (interesting) questions have to do with resource utilisation. 

What made that shift? Well, that is easy to see by looking at the picture: 

> There's a maximum or even optimal capacity that the trolley can be loaded to. 

Quite simply; we (well… physics rather) put into place a work in process limit. That is the magical thing that started to ask all those questions about flow of value. Without that limit, we would just push as much as possible onto the trolley. 

In fact, disregarding that limit is hard to imagine even, but maybe if we put stuff on loading bay without caring about the donkey (`That's the donkey's problem, I don't care`) could be one way to imagine that. 

Shifting our focus to flow automatically (or at least very easy) shifts our focus to the value that we are delivering. 

### Finishing things is better

In [Kanban In Action](http://bit.ly/theKanbanBook) we lead with one of my favourite sayings:

> Stop starting, start finishing

The meaning of this is that we should put our efforts into finishing things rather than to start things. For example; imagine that you finish some work - not you ~~should~~ could:

1. See if there's any work that you can finish
2. See if there's work that you can help someone else to finish
3. Try to remove or alleviate a blocked item
4. See if there's work that you could do to ensure a faster and smoother flow later (more on this below)

Basically - whatever you can do to help finish work is preferred over starting new work. This has been summed up beautifully by [David Joyce](https://leanandkanban.wordpress.com/about/):

<img src="/img/theMoreWeFinish.jpg" width="100%" />

Seriously. I have said this to people and they thought I said something smart and profound. Deep nodding and sighs of `Yes. That *is* true.`  has been uttered. 

We are here to take ideas to things that users can use. That what the [Agile principle means with working software](http://agilemanifesto.org/principles.html): 

> Working software is the primary measure of progress.

Working software - software doing work for people that need it. 

We don't do more of that by starting more things. We, hopefully, get more working software by finishing stuff. 

By focusing on flow we also natural focus on finishing things. 

### System improvements and mindset

> The problem is in User Acceptance Testing. **They** are so slow

If you hear stuff like this then you systems thinking sense should tingle so that every bone rattles. This is not systems thinking and optimizing for flow. Focusing on the difference between "us and them" is a slippery slope down to local optimizations. 

For example:

Ok - let's say that UAT (User acceptance testing) is slow and a lot of items get stuck there. If we have a flow perspective it's now:

* Natural to go over to them and see if we can help to improve the flow of the ticket
* Start to ask ourselves - why is UAT slow? Maybe we didn't give UAT the best opportunity to be fast, by not ensuring that the quality of the work was good enough. 
  One of the most impactful changes I ever made was to add a policy (literally one bullet on a whiteboard) to the "Development"-column. Before Development was considered Done we now also `Installed the item in test environment`. 
  Ha! Turns out most testing sessions was halted or slowed down by the fact that the code was not (properly) deployed. 
* Maybe we can make some changes to improve flow in UAT. I can come up with many ideas but here are two:
  * What if we kick off the reports that we know they are going to check for them? Hey - we could even run it and check it ourselves. That means that instead of 
    `OI! UAT-people! Code is ready to be UAT'ed` 
    we could go 
    `OI! UAT-people! Code is ready, I've run report 1,2,3 and 6 and they look good. Anything else I could check to next time to make your life easier and UAT even faster?`



Another example that come up was, clumsily, tweeted by me the other day like this: 

<blockquote class="twitter-tweet" data-partner="tweetdeck"><p lang="en" dir="ltr">Don’t pull work that you already know will not flow smoothly. Prep it first<br><br>Or more positive note; only pull work you know will flow smoothly <a href="https://twitter.com/hashtag/lean?src=hash&amp;ref_src=twsrc%5Etfw">#lean</a> <a href="https://twitter.com/hashtag/kanban?src=hash&amp;ref_src=twsrc%5Etfw">#kanban</a></p>&mdash; Marcus Hammarberg (@marcusoftnet) <a href="https://twitter.com/marcusoftnet/status/1001083818718253062?ref_src=twsrc%5Etfw">May 28, 2018</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

What I meant, but failed to express clearly was this; if you want to ensure a smoother and faster flow - then don't pull things that you, before you start know will slow you down. 

I've seen many things like that lately:

* Items that have dependencies on teams that we know have no time to work. Better not start that work now. Or even better rework it so that the dependency is not affecting the flow; maybe some parts can be completed separately? 
* Start work that we know are not well prepared; where we might not even know *why* we are doing things for. Don't pull that no - flow will suffer. 

Not pulling those items make we can spend our precious capacity to work that will flow faster and smoother. Now that postulates that we are the bottleneck in the system where this item is flow. 

According to [Theory of constraints](https://en.wikipedia.org/wiki/Theory_of_constraints) (and common sense), every system has one bottleneck that slows down production. Improving the flow through the bottleneck means that we are improving the flow of the system. Improving the flow in other parts of the system, than the bottleneck, will not improve the overflow and could potentially hurt the flow of the bottleneck. 

If we are not the bottleneck (hey - it might be the UAT guys) we could pull things that we know might not flow. It's ok for now as we are not the bottleneck. 



Let me share one last example, this time not from IT. I was at a bank office the other day. In the olden days, we used to have to go *to* a certain building to conduct banking business, youngsters. 

While I was there, there was a queue of people. Naturally. As I was patiently waiting my turn a bank employee came walking towards me and the other people waiting. He asked me: `What are you here for?`. I stated my business and he replied `Ah - cool. They have to do a credit check-up for that. I can do that while you wait.`

He took my information and went off to do the credit check. Once it was my turn he swung by the counter and gave the clerk a paper: `I ran the credit check for you. Here you go`. The errand took a few seconds to complete with that credit check done. 

(I asked him if they were doing lean and he gave me a blank stare ... No - never heard of. `Well, you, my friend - get flow!` I said to bewilder him even more)

See how he was ensuring flow of value once it was my turn. Interesting enough he was not assigned a counter. He just had slack time. In which he prepared the work to flow smoother. Nice work! 

### Conclusion

The simple act of shifting our focus to improve flow (of business value) leads to many great things. These were just a few that I've noticed, literally, the last couple of weeks. 