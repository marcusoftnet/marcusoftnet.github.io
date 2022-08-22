---
layout: post
title: Order points, value, flow and waste
author: Marcus Hammarberg
date: 2015-05-03 15:03:25
tags:
 - Lean

  - Agile
  - Life of a consultant

  - Kanban
---

As I [wrote about earlier](http://www.marcusoft.net/2015/05/stuff-i-said-coaching.html) I've just returned from 3 days of coaching at [Nintex](http://www.nintex.com) in Kuala Lumpur.

Once I stood in front of the teams (6 teams, 40 people) and then got a chance to coach them individually I was struck by the trust that Nintex showed me. They really could not check me too close, what I said, how I nudged the teams etc. Me and Christian, their head of engineering, had synced up in emails and other conversations. And we see eye-to-eye on many things... But still. Trust. It's a good train - get on it!

There was one thing that we talked about in the teams that I didn't really manage to make my reasoning clear about. It's pretty common, powerful and interesting so I thought I'd share this idea with you and try to give an better explanation around what I really meant.
<!-- excerpt-end -->
# Order point explained
The concept I talked about was something we in [Kanban In Action](http://bit.ly/theKanbanBook) called "Order point". It's a way to replenish your backlog just-in-time. This can be contrasted with doing it at the start of an iteration or sprint (if you are doing Scrum).

Here's how it works, illustrated in a cartoon. Read top left to lower right, row by row.
<img src="/img/orderpoint.jpg" style="align:center; width:100%">
1. Notice that the Todo (or Inbox or whatever you call it) have a work in process limit of 6 items. And that there's a dotted line under the third. This is your order point. Where that order point should be place is a topic for my discussion below.
2. As we start to work off items we pull from the top
3. Pull work item by work item into our process as we go.
4. When the third item is pulled a card is revealed. This is a true kanban card that is very similar to the cards used in manufacturing industry to pull new work. Let's see it in action here on the board
5. On the card are instructions on how to pull more work from the Product Owner or "upstream stakeholders" to use some lean terminology. How you do this is of course up to you and your process.
6. While we wait for that to be done, the product owner to give us the next work items, the meeting to be held etc, we just continue with the other 3 items. Move them up and just keep pulling from the top
7. Just as before
8. We keep taking the once at the top
9. And before long the backlog is filled up again with 3 new items.

This is very close to how the first ever kanban system for software development was created in Bangalore, by the way. In that case they actually had 4 upstream stakeholders that got a signal that more work was needed. Those 4 people got together and agreed on the next items to add to the Inbox.

Although this can seem like a small thing it opens up some questions that might be bigger. For example; if we don't plan for more items at the start of an iteration - why should we have iterations at all? And if we stop doing that... hey let's stop do retrospective and planning, and maybe even daily standup.

# No no no ... that's not what I said
I'm sure you realize that using this technique doesn't mean that we throw all good things we're doing overboard. The only thing we see here is that "planning / replenishing" can be disconnected from dates, and ran just-in-time instead of on a bi-weekly schedule, where we might end up with no room for more work. Or sitting idle a couple of days before planning.

We should still, in true "start where you are" / kanban fashion, continue to do the practices we find useful until we find otherwise. For example, in that just-in-time-meeting we do all the planning practices we have used before. The only difference is that we just do them for the items at hand.

An alternative to have an order point based on number of items would be to have a tighter planning schedule, say weekly. In that weekly meeting we just fill our backlog up to a set level; say 6 items. If we go into the meeting with 5 items that means that we only need 1 more. Going in with an empty column means that we need to plan for 6 items.

Also I did NOT say; iterations are bad. I did say explore the possibilities of planning just-in-time. This is not the #noIterations hash tag defined.

# In fact ... thinking about lead time
Lead time is defined as the time it takes for work to go through the entire process. From idea to production for software, in other words. Cycle time is another metric and that's defined as the time it takes for _part_ of the process. For example; how long time did we spend developing this feature, or developing and testing.

At this point two things strikes me: I can decide how "far" my cycle time should be and my lead time is often cycle time in a bigger process.

One story that I often tell is the story about my first ever Scrum project. It's also the story about what got me hooked on agile in the first place. Here's an extract from our book:
<img src="/img/cycleVsLeadTime.png" style="float:right" width="50%">
<blockquote>
	To better understand the difference between lead and cycle times, consider the first Scrum project that Marcus took part in. The team consisted of six happy developers, and we created working software every third week. The cycle time of our development was therefore three weeks. But was that helpful to the business?
	<p>Not that much. When we were “done” after six sprints, we learned that a three-month testing phase was waiting for all the work we had done. And after that, we missed the quarterly release cycle by one week and had to wait another three months before releasing our software to the users.</p>
	<p>Sadly, that didn’t matter much for our total lead time, because we understood that the requirements for the application had been written a year and a half be- fore we even started.</p>
	<p>The cycle time (considering development only) for a single feature was three weeks, but the lead time for that same feature was two years and four months.
	</p>
	<p>That’s the difference between cycle and lead time. Although reducing the development cycle time may be useful, the big improvement opportunities can be found elsewhere.</p>
</blockquote>

The fact that our cycle time in development was great in this case was insignificant when it comes to the overall lead time, I'm sure you all agree.

## Order point once again
Bringing it back to the "order point" technique again it might be good for us to pull in new work as we require but what does it do to the overall lead time?

Let's do a thought experiment, by pushing the limits a bit. Let's say that we have a WIP limit of 1 and hence will call the Product Owner every time we pull new work. That would be very disruptive for her most likely, at least if she have other duties. We might see her behavior change to feed us bigger and bigger items to "get us off her back".

Or consider that it might be hard to actually get one item ready for us, that might take some time. In this case the overall lead time will go up and it will render the team idle.

On the other hand... bring the WIP limit up to 50 would make our meetings with the product owner happen very seldom and we end up in a waterfall-like situation. We don't want that either.

## What to do?
From the situation above two quotes spring to mind that can guide us here. First:

<blockquote>Flow where you can, Pull where you must
<footer>Jeff Liker</footer>
</blockquote>

This quote emphasize that work should flow through our value chain, quick and without interruptions. This is what lean practitioners seek. Creating a little buffer of work, as an iteration really is, might actually be good for the overall flow, considering the _entire_ process.

The "pull when you must"-part tells us to only bring in more work in our process when we are sure that flow is not hindered and all other options are depleted.

But how should we know when to do what? The second quote helps us with that:
<blockquote>
	Value trumps flow. Flow trumps waste elimination
	<footer>Don Reinertsen, <a href="http://www.amazon.com/The-Principles-Product-Development-Flow/dp/1935401009">The Principles of Product Development Flow</a></footer>
</blockquote>

In this great book, that I need to reread soon, we get this interesting quote. I've used this a number of times to explain what waste is and how it should be treated. When I (and others) started out with lean I fell into the wast-reduction trap. I went Games-of-throny on my boards / processes: "ALL WASTE MUST DIE!"

## Waste
Let me tell you about waste: if a carpenter is attaching a board to another board; raising the hammer is waste, lowering the hammer is waste, hitting the nail is waste - driving the nail into the boards are value.

Or this, that provoked me crazy the first time I heard it: "daily stand-ups are waste". Once you (as I had to do) calmed down, consider the the following; If it's not waste it's value, so let's do more of it. In fact, why not have stand-ups all day long?

Again I understood that the real world is a little bit more complicated than I first hoped. "ALL WASTE MUST DIE" is too simplified.

Going back to the Don Reinertsen quote we see that Flow is worth striving for, more than waste reduction. Basically; if you can Flow, quick and uninterrupted with a little wast - go ahead!

And "Value trumps flow". If we can get value without flow - by all means go ahead. Very few customers want "flow" or "3 months worth of software development". Most of them are interested in software features that helps them to solve their problems. See [earlier post on measuring impacts](http://www.marcusoft.net/2015/05/stuff-i-said-coaching.html)

# Summary
In my consultancy I've found very few rules and techniques that you can apply without thinking. I think that why it's called _software_ development. We need to use our _software_ aka the brain to be successful.

This is one of those. "Order point" can be really powerful and help your team to get a better flow, but applying it just because it is cool or helps us might be rushed.

What kind of impact does this have on upstream / downstream processes?
Maybe it's better with a bigger buffer of work in our process to ensure an overall smoother flow?
Maybe it should be smaller?

For every change we consider let's also consider it's implications. In value, in flow, in lead times, on cycle time, in behaviors etc.