---
layout: post
title: "Limiting WIP and some rules of thumb"
author: "Marcus Hammarberg"
date: 2017-12-29 20:58:40
tags:

  - Agile

  - Kanban
 - Lean
---

Writing a book ([psst - there's another one on its way](https://t.co/rO179xXeHS)) has changed many things for me and opens so many doors in my career. But my favorite thing is when I get to talk to people that have read my book, learned something and is applying kanban in their everyday life. Sometimes I get some really insightful and interesting questions.

Massimiliano Spolverini, for example, presented me with one of those questions just the other days:

> I have been reading your book the second time and I have found it brill. Though, there is a doubt playing on my mind which I cannot sort out.
>
> The 2nd rule of thumb to find a WIP limit (page 111) explains that when the WIP is set too high, then the team can see some work items not being worked by anybody, which no one is responsible for.
>
> On the other side, at the bottom of page 117, when the "*Drop down and give me 20*" approach is presented, it is said that "…*if too many work items are idle, you can go back up to the level you had before*". In other words, it says that if one sees idle work items, he'd better move back to higher WIP. Isn't this last statement in contradiction with the 2nd rule of thumb?

Massimiliano kindly let me answer the question on this blog and in this post I wanted to share some of my thinking about this situation. I don't claim to hold a one-and-only-answer but rather wanted to explain and expand a bit further.

<!-- excerpt-end -->

## Background and up to speed

The chapter, [Kanban In Action chapter 6](http://bit.ly/theKanbanBook), that Massimiliano is referring to is about limiting work in process (WIP) which is one of the basic tools for kanban practitioners.

In this chapter, we, me and [Joakim](http://joakimsunden.com), discusses some ways of finding a suitable WIP limit for your team. We start by giving two rules of thumb:

**If the WIP is too high - work will be idle**. This is when you in the morning meeting will hear about work that no-one has worked on

> I'd didn't get around to that one yesterday - I was busy with other things

This might suggest that you should lower your WIP limit a bit to improve the flow and focus.

The opposite situation is when **WIP limit is too low - workers will be idle**. In this situation you will hear people that have no work to do:

> The thing that I was doing is done and now I cannot start new work since we are up to our WIP limit already.

This is not a bad thing. In fact, this is a super opportunity to do one of many things that might help us and our work. Here are a few suggestions:

* Use this slack time to do lower priority work that will help our flow further, but we never get around to do: speed up build script, increase test-coverage etc.
* Help someone that is already working on something on our board, to improve the flow (and most likely the quality) of that item.
* Use this slack time to learn something that you think would be beneficial.
* Rest! For God's sake - take a break and get some air.




The "Drop down and give me 20"-experiment that Massimiliano is referring to is a nice experimental approach to finding a suitable WIP limit that [Dr. Donald Reinertsen presented at LKCE 2012](http://www.lean-kanban.eu/sessions/reinertsen/). The silly name is our feeble attempt to be funny...

<img alt="Finding a suitable WIP limit by decreasing in small steps" src="/img/dropdownandgiveme20.png" width="100%" />

The idea here is that we start with something that we know is way too much… **but** then agree to bring the WIP limit down little by little until we find a suitable one.

> until you start to experience problems

as we wrote in the [book](http://bit.ly/theKanbanBook).

I really like this approach because it firstly put us into a learning and experimental mode.  We set out to try things and see what works and what fails. Secondly, it clearly shows that there is no one WIP limit to be found. It's contextual and depending on timing, team constitution, type of work etc etc.

In short - you need to *continuously experiment and learn*. The end result is not a WIP limit to rule them all - it's an ever-improving flow.

However, I can also see the problem for M. Our explanation might have been a bit to shallow.

Let's take a step back before I try to give some guidance. Let's ask what WIP limits are (for).

## WIP limits are tools

After writing the book WIP limits have grown on me as a very powerful tool to control not only the smoothness and flow of the process but also the speed of improvements. By limiting WIP we are introducing a constraint in our process. In order to handle that constraint, we need to innovate, improve and support our process in new ways.

For example, consider eXtreme Programming. This methodology prescribes a very tight timebox of one week. Our WIP is limited to the amount of work that we can get **Done** in one week. This means that we need very good and fast collaboration within the team, we need to have high-quality work to be able to move fast, we need fast tooling around us so that we don't waste time waiting for build scripts to run, we need to work together so that everyone can help out etc. etc.

All of these good things come out of us limiting WIP.



Another aspect of thinking about WIP limits as a tool is that we need to **use** the tool rather than being slaves under it. I often point out to teams that I coach that they, themselves, are setting the WIP limits. Hence they can change it - up or down.

I remember a story from the excellent [Toyota Kata book](http://bit.ly/theKanbanBook) where a Toyota Sensei (Side-note: I would love to meet a Toyota Sensei. For my inner eye they are dressed like Obi-Wan, mythical beings for a nobler time… Sorry - back to the story) points to a workstation and exclaims:

> More WIP needed here!

The people around him start to laugh at the "obvious" joke. Surely he meant *less* WIP… but no. More work in process was needed because:

> This workstation cannot yet sustain this low WIP

Exactly that! The flow of value is what we are after. Limiting WIP is one tool to get there, but it's just a tool. By limiting WIP we will see the improvement opportunities more clearly. We might take the opportunity to improve or not. In fact, there is another good Donald Reinertsen quote about that:

> Value trumps flow. Flow trumps waste elimination

It's the flow of value we are after. Not the lowest possible WIP limit. I happen to ~~know~~ believe that limiting WIP is a very cheap and fast way to get better, faster and smoother flow of value.

Which brings me to my explanation and reasoning about the possible contradiction in the book.

## So what it is then…

Ok… let's see if I can explain myself here...

The second rule of thumb says that if WIP is **too low** then you will have workers idle. And then in the experimental, bring-down-in-20%-decrements, approach tells us to "…if too many work items are idle, you can go back up to the level you had before".

Well, although I have learned so much after writing the book, I would argue that both are correct, although a bit sloppy formulated maybe.

Because, as I eluded to above, having people idle might open up many awesome opportunities to improve … having everyone idle all the time is of course not great. That would soon lead to us being out of work. Have a couple people always ending up without work (for whatever reason) would not be good either. There's a balance to be found - and that is where you want your WIP limit to be.

This is where the experimental approach leads us. Let's say that we bring the WIP limit down to 3 items and we often experience that all 3 items are blocked by external dependencies. Sure - this is absolutely an opportunity for us to try to untangle the blockage and we should. [Do it! Do it!](https://www.youtube.com/watch?v=K4eScf6TMaM)

However… if this happens over and over then that might be an indication that our process cannot yet sustain this low levels of work, then we should at least try to increase the WIP limit to see if the flow of value improves. Maybe it's just a certain kind of work type that gets stuck - let's throw in a few more of another kind in the mix and see how flow changes.

When we wrote "…if too many work items are idle, you can go back up to the level you had before" it is a bit too vague. A better formulation would have been:

> Back it back up, with a few items

Meaning that the whole experiment goes like this:

* Start with your current WIP. 4 for example
* Double it. 8 for example
* Bring it down in 20% decrements on a bi-weekly basis.
* Once you start to see problems in your flow (from the book: "queues build up, or you see people idle between tasks"), bring the WIP limit back up a bit again. You don't want the entire process to grind to a halt.
* Try to improve your process to handle lower WIP and then bring the WIP down a bit more

That last part also indicates that we should have some way to see if the flow is better or not. But that's a topic for another blog post (psst - track lead time and throughput...)

## Conclusion and summary

WIP limits are tools. There's no right, or one-answer, for what a WIP limit should be for you and your team. It's contextual and depending on many variables. Experiment and monitor the flow of value to see if the WIP limit you are using now is helping you. WIP limits promote better, faster and smoother flow and help you find improvement opportunities.



Another way to formulate this comes from the grandmaster of Kanban himself, [David J. Andersson](https://www.djaa.com/);

> With WIP limit you control how much pain you want to inflict on the organization

As a thought experiment - imagine a factory that worked on building one single car. A lot of people idle, a lot of focus on that one car and every, single, tiny problem in the process would stop the flow of value completely.

On one hand that would be very good for finding problems, eliminating waste and improving flow. But on the other hand - that would be very very costly to have that many people waiting.



Massimiliano - awesome question! Thanks. I hope that I now could make our reasoning a bit clearer and show you that limit WIP is a tool to improve flow. Use the tool - don't let the tool use you.