---
layout: post
title: "Some useful practices for flow oriented standup meetings"
author: "Marcus Hammarberg"
date: 2016-12-21
tags:
 - Agile
 - Kanban
 - Lean
---

A [daily stand-up](http://www.martinfowler.com/articles/itsNotJustStandingUp.html) is a really common and very good practice among many agile teams. 

It was popularized by [Scrum](https://en.wikipedia.org/wiki/Scrum_(software_development)) but is very useful in almost any setting. 

Over the last 4-5 years I've seen how many of the initial practices and recommendation have change a bit. For me the primary factor for these changes has been the focus on flow. 

In this post I wanted to share a few of the things I've seen changed and also a reason as to why. There's a sentence in this post that (almost) got me fired ... so this will be valuable for us all, so that we don't end up in that situation again. 

<a name='more'></a>

I'll headline each topic with a sentence that I've heard teams I'm working with, use the last couple of weeks, in their daily stand-ups. Sentences previously was unheard or didn't make much sense. 

# "How can help our finish that work?"

When Scrum made "dailies" popular it was mainly centered around *The 3 questions*:

* What did **you** do yesterday?
* What will **you** work with today?
* Are there any hinders for **your** work?

Anything in particular standing out in those questions, you think (hint: it's in bold...). Yes, exactly; the focus is on the person. 

There's a blog post on this topic called [Watch on the baton - not the runners](https://leankit.com/blog/2015/05/business-flow-watch-baton-not-runner/) that speaks about this in a great way. But shortly; with a lean strategy for our work we are more interested in that the work flows than that everyone is being kept busy. 

I cannot count the number of times I've heard (and I am one of them) heard Scrum Master (&#8482;(™)) end the daily stand-up with: <code>Does everyone have things to do today, then? Good - let's do it!</code>

Well... that is actually not important. At least not **as** important as work flowing. For example [mob programming](codebetter.com/marcushammarberg/2013/08/06/mob-programming/) is not keeping everyone busy but it's very effective. 

>In our daily we are mainly focused on work flowing - not that everyone are busy. 

A easy way to shift this focus without a big fuzz is to start to enumerate the work on the board. See below for more on how to do this.

As a side note; I once said "It's not primarily important that everyone is being busy". A quick chat with the CEO that overheard me, and 3 weeks later I was on another assignment. Good for me. Good for them. 

# "Let's walk the board from the right"

We go through the items on the board one by one starting with the one closest to production (or ... "Done"). This means that we start to talk about the thing that is almost completed. Should the meeting run long and we need to stop we have at least talked about those items.

The things that is closest to be released are probably where we should spend our focus and efforts the most on the day. Things that we just started to work with are also important but not urgent time-wise. 

As good lean-practitioners we rather finish stuff than start new stuff so our focus is rightly place in the part of our process that is closest to production. This is things that are almost "Done" and we should promote work that helps completing them.

This is also related to a principle of lean improvements; start closest to the customer and work your way backwards from that point. If we see recurring problems close to production, close to completing things (like for example manual deployments) it is well invested time to try to smooth and speed that flow up. 

# "No problems so we don't need to talk about it"

I once had a huge (40+ people) team that was using a single kanban board. Each morning meeting everyone gather around and ran a morning meeting that took ca 5 minutes. This was what happened: 

* I started in the right-most column, starting from the right, see above
* I pointed to each sticky on the board and simply asked: <code>Any problems hindering our work from flowing with this?</code>
    * If there was nothing to be said I went on to the next
    * If there was problem I just asked: <code>Who do you need help to resolve that problem?</code>
        * A few people was called out and I asked them to get together after the meeting

The focus should be put into **resolving** problems with our flow of work - not with things is actually working as expected. <code>I working with this and it will probably take a day more since there's a lot of mapping code to be written</code> is not as important as something that is hindering the flow of the work. 

Should we get stuck discussing something in our meeting we should let it be things that helps our work to flow better. Not to hear report about the work being done (that is of course interesting too - but less important compared to things that is hindering our work from flowing)

# "There's too many things on our boards"

Teams that want things to flow fast wants few items on their board. There's [mathematical proofs](https://en.wikipedia.org/wiki/Little%27s_law) for why that is a good idea, should you be interested in why.

But that means that teams that are focus on flow want few things on the their boards. In fact, I increasingly often hear my teams worry about "doing to much (at the same time)" and many boards contains just a few items. 

I often muse over how many (big) projects are reporting progress:

* "yeah - there's a lot of things in progress"
* "I have many things going on right now"
* "We are so busy - i have a good vibe"
* "We are about 60% done - the project is on Green"

Especially that last one is troublesome I think. Many projects run into the green-green-green-red reporting problems. Why? Because the last 10% of the time is where 80% of the work needs to happen. Maybe. Or more. Or less. In short - we don't know what we haven't completed yet. 

Therefore I tweeted this the other day:

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Don&#39;t ask &quot;how much is done&quot;. <br>Ask &quot;what can I use in production now?&quot; <a href="https://twitter.com/hashtag/workingSoftware?src=hash">#workingSoftware</a> <a href="https://twitter.com/hashtag/agile?src=hash">#agile</a> <a href="https://twitter.com/hashtag/lean?src=hash">#lean</a></p>&mdash; Marcus Hammarberg (@marcusoftnet) <a href="https://twitter.com/marcusoftnet/status/809726873467027456">December 16, 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

I don't care how many things are going on, or how many percent done we are. What is used in production and what is not - that's the only real progress measure. See the [7th principle of the Agile Manifesto](http://agilemanifesto.org/principles.html)

# "I don't like the name of our 'Done'-column"

Speaking of Done. I hear more and more of the teams I'm working with skipping that column altogether. There's no Done. Our feature is in Production, being used by users, sure but that doesn't mean that it's Done, now do it. 

At the very least we should check if the reason (maybe even with a metric) we built this thing in the first place was fulfilled. If you're using [Lean Startup]() ideas you may have done an *experiment* to (dis)prove a *hypothesis*. The experiment most probably is not *Done* until you have run the feature for awhile. And the outcome of the experiment is some kind of learning that in turn might render new features. 

Some of my teams have a column for "Evaluate" or "Learn". And I've see sections on the board (or screens) for metrics that we are gathering to learn. I'm hoping to soon see another list at the end "What we learned from feature X being deployed"

# "What's hindering us from putting this into production now"

One last one, that is a few years old in all honesty, that really put a big focus on flow. In one team (8 people) we only had two columns "Not Done" and "Done" (yes yes I know... this was before I learned about the "Done"-column). The team allowed for only 3 items on their board. 

Their daily stand-up consisted of only one question that we asked for each work item on the board: 

>What is hindering us from putting this into production now? 

The first day the answer was something like <code>Well... we don't really know what it's supposed to do yet...</code>. Ok - great then find that out so that we can get it into production soon. 

Then later the answer might have been <code>There's still some testing to be done</code>. Awesome - let's do that testing so that we can get it to production. 

The focus was laser sharp and kept the team in sync - and the meeting short but valuable. 

# Summary

The best thing about all these things is that they are new. I'm picking up new stuff more or less every month. In a few years I hope that all of these things feels as old as <code>What did you do yesterday?</code>. 

What are your best tricks for a great, flow-focused, stand-up? Please share in the comments. I'd love to learn some new stuff.