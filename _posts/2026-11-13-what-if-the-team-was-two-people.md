---
layout: post
title: "What if the team consisted of two people?"
author: "Marcus Hammarberg"
date: 2026-11-13 04:00:00
tags:
  - Agile
  - AI
  - Product mindset
---

The focus in product development now is a lot on output and making the individual product engineer more efficient. But in most interesting products I've been involved in building the challenge is really in how we coordinate and manage many people together.

Until now this has been done in teams of 4-10 people usually. With the advent of more building power at our fingertips, that kinda breaks down. When you can hash out a new feature in hours rather than weeks, our practices doesn't make sense. Or we still use them and increase the work and contextual loads a lot.

I think there are better ways and I think those way will challenge us, our ways of working and steering. It will be awesome!

Yes this is a follow up to [What if the sprint was 1 day long?](https://www.marcusoft.net/2026/11/what-if-the-sprint-was-one-day.html)

<!-- excerpt-end -->

## Disclosure

I've been working in and with teams my entire life. A lot of the things that I'm about to present as problems are things that I have tried to get teams to do, and do well.

The world is shifting. It's scary and I'm questioning my worth and value, every other day. And (not BUT) hence I think that we, rather than double down on practices that was good at a time, dare to question and reshape them into practices that is suitable for the work we are actually doing.

## Problems

Painting the following section in a bad light. I've seen this work MUCH better, but below is a more a typical situation in most teams I've encountered.

In a team of 4-6 people we need to synchronize and keep each other up to date with what others are doing. We probably ask others for review ([interrupting their work](https://thinkinglabs.io/articles/2023/05/02/non-blocking-continuous-code-reviews-a-case-study.html)), through PRs that will not be merged until the review has passed.

The daily standup is a way for us to sharpen the focus of the team to help each other get the work done. In [the best case](https://www.marcusoft.net/2017/02/comments-on-board-practices-6.html) - many daily standups are synchronization meetings where everyone one reports what they did. Just to keep our team in the know.

Planning needs to be done to ensure that we can distribute the workload in the team, so that not a few people have loads and others have nothing to do.

A lot of our retrospectives work has to do with how we cooperate with each other and how to do that better.

The meetings we do hold involves the whole team, of course, and hence becomes both costly (6 x hourly rate / hour) and also cognitive hard (is everyone heard, I zone out when Marcus is talking).

When we report, present and demonstrate things we have built during a period of time. We summarize and prepare information to be digestible by others in short period of time. And doing that preparing takes time, and is a process where information is lost.

We have tools in place to keep track of the work we need to do. Handovers happens by one team member or stakeholder writing things in a ticket for another to (hopefully understand and) pick up.

All of these "problems" has to do with that we are doing work in bigger batches (see [earlier post](https://www.marcusoft.net/2026/11/what-if-the-sprint-was-one-day.html)) but also due to the way we have shaped our teams; bigger teams that coordinate with teams and stakeholders around them - also in bigger steps and batches.

Let's see if we can challenge these problems and what new challenges that gives us.

## Suggestion - work in pods

What if the team consisted of two or three people? This is out there as ideas that companies are trying. They call them Pods, so I'll use that.

2-3 product engineers that have agents, harness, software factories, specification driven development and all of those things ready to go in order to move really fast.

No standup is needed. Why - it's just us at this table.

No ticket system is needed. We can inform on a much higher level than writing tickets. For example, which goal we are pursuing now, and how we are making progress on that goal. A [backlog as a mindmap](https://www.marcusoft.net/2016/06/backlog-and-features.html) is one way, outcome-based KPIs is another.

Retrospectives should really happen continuously. At SALT we encouraged our mobs to do [a retro per day](https://www.marcusoft.net/2019/05/reflection-on-a-daily-retrospectives.html). It can be as simple as asking "What worked best today - [how do we do more of that](https://www.marcusoft.net/2023/03/my-screensavers-turn-up-the-good.html)?" or "What ate our time today - how can we do less of that?". Or we have a conversation on the way home.

Planning would probably just be a session in the morning, setting the goal for the day. Ensuring that we understand it correctly, and maybe/probably even interacting with an AI to specify and answer clarifying questions together.

In doing this we would have a finished increment of the product each day, per team. Through strong harnesses, deterministic checks and CI/CD practices the thing that each team has built will be merged and integrated. Potentially even released. This decrease the risks and hassle of bigger changes.

To further push that thinking we would use [trunk-based development](https://trunkbaseddevelopment.com/) and do away with PRs altogether. With tight cooperation in the pod we continuously review the code, design choices and decisions made.

## Challenges

All of this is very doable practically. The challenge comes in how we steer this. Paraphrasing the words of [David L. Marquet](https://www.youtube.com/watch?v=OqmdLcyES_Q) this is not hard, but we have been programmed, and have systems in place, to Take Control and Attract Followers. If you want teams to be able to harness the power and speed of using AI to build products you instead need to give control and create leaders.

To unleash that power you will need to move the authority to the information. You pods will need to know what they are building and why, because they will make decisions about this several times an hour. Checking in with their product owner on planning and demo days is just to slow. That's a few decisions bi-weekly.

If we don't want the pods to build the wrong thing, and not to constrain their speed and power we instead need to lead by intention, so that they know as well as you what better looks like.

That's said - we should not fly blind and there's no reason to do so. Visualizing data has long been the starting point for any work where we aim to speed up the lead time. Let's do that here too.

Each pod can easily visualize where they are working the backlog and how they are progressing towards their outcome-related KPIs. Trust for product teams is created by delivering. Small increment often towards the goal is a great way to build trust.

Another challenge would be to slice the areas of work into parts that each pod can work on independently. Books has been written about this, so I will just mention that with smaller things being built and integrated more frequently we have an easier time to merge and integrate too.

## Existing solutions

As I wrote this I realized that there are many other approaches that does this in one way or another.

### Mob Programming (Software teaming)

Much of my experience comes from [mob programming](https://www.marcusoft.net/tags/#mob-programming) (software teaming) where a whole team is working together at the same time on the same feature. That works amazingly well and for experienced teams, just about all the things that I wrote about above comes through and the challenges has been addressed.

A mob don't do standups, planning (weekly etc), or pull requests. The way they work allows for much faster interactions than that.

I think that with an AI as one of the team members, the mob teams can be smaller and still be effective. This directly introduces some of the coordination and steering challenges between the pods that I wrote about earlier.

A lot, if not most, of the literature on mob programming is about how to get the mob effective. And in all honesty, an effective mob can do so much that they can own entire products or feature areas. Who knows, maybe it's the same for pods enhanced with AI agents?

### CollabAI

This a new method that I've just [read](https://thecollabaibook.com/) and heard about that marries the thoughts of [mob programming](https://www.marcusoft.net/tags/#mob-programming) (well actually [mobAI](https://www.youtube.com/watch?v=Fh_FDGiTvcg) which is another thing) with a strong focus on using AI.

CollabAI uses the work of Joe Justice to scale:

- The inverse Conways Law - branded as [Justice Law](https://www.formalmind.com/blog/joe-justice-interview/) pushes you to define the independent module or apps you want in the system and then define the teams around it. As they did in Tesla, the independence release cadence and deployment of the modules is a key to make it work.
- The operating part, I particularly like, which they brand as Digital Self-Management (DSM), where data is made available to everyone and becomes the GPS for decisions we make. I've seen it work at Spotify and other places. But it requires engagement and trust at scale
- The work is then visualized on a Justice Board (I wonder if he has enough things named after him yet...). This part also sits very well with me, since the visualization is a great way to ensure what know and share what is being worked on.

CollabAI is one of the first methods I've seen to explicitly outline how AI is incorporated in the flow.

### FAST Agile

[FAST Agile](https://www.fastagile.io/) (Fluid Adaptive Scaling Technology) Agile takes collaboration, fluidity and agile practices and turn them up to the max. With FASTAgile we allow teams to self-organize, work in very short iterations and shared ownership for quality and product.

The main ideas comes from [open space technology](https://en.wikipedia.org/wiki/Open_space_technology) and uses many XP practices to enable fast delivery with high quality.

FAST is ultra-lightweight in prescription and description of process and as such requires (and creates) an engaged team and Product Manager that really owns the product vision and has decision power to make changes on the spot.

One thing that stands out is that FASTAgile focus heavily on Product Discovery, rather than the strong focus on delivery. This means that we tear down the wall between designers and developers and treat all work as normal work, done together.

One of the things that I love with FAST is that it is so lightweight that it's easy to adjust to your context and needs. The synchronization, coordination and steering happens all in the FAST Meeting which is the one dictated meeting. I can totally see the benefits of this, but also see some problems when you have product owners that cannot attend often.

### ShapeUp

[ShapeUp](https://basecamp.com/shapeup) is an opinionated agile method from the creators of BaseCamp, Hey and Ruby on Rails. It takes pretty different approach to digital product development that puts the product in focus, where many agile method (quite honestly) have started from software development.

ShapeUp is iterative and not that descriptive but gives a few guidelines and leaves many of the details up the team. In that regard, it can be viewed as a guide rather than a method.

ShapeUp has some radical ideas built-in such as no backlogs, value-based estimation through the concept appetite and formalized Slack periods.

One thing, right now, that ShapeUp fails on for me is that the iterations are 6 weeks + 2 weeks of cooldown. That is too slow in a world where we can build a new feature in a day or less.

That's said - a lot of the ShapeUp thinking is in the right place and the heavy focus on value for the end user, appetite over estimates and strong focus on collaboration across skills all sits well with me, and how I think we would work in the future.

## Some thoughts of the existing methods

Of these methods, I kinda like FAST Agile's approach best as it has scaling to pretty large groups (did they mention 150 people) built into their approach. It means that we can create new pods each day or two and keep growing as the need arises.

In order to get any of these methods to work properly a strong technical foundation is needed, where frequent and effortless integration of the work happens many times a day. I would think that a trunk-based approach, with non-blocking code reviews, would be a really good starting point to promote a great flow.

## Alignment without control

Here's how I would do this, borrowing from experience and the methods above

## How do we plan?

I would track the work on outcome level, not keep a backlog. The idea in the ShapeUp's bets is nice, but a bit too large. What I'm thinking about sits right between the size of an epic (haha - those used to be weeks or months, remember) and a user story. It is easy to go too fast, especially in the early phases. Some agentic workflows I have used and built could easily crunch 100 user stories in a day.

The most important part is to be clear about intent and goals of the things that we are building. A "fat marker sketch" (ShapeUp) and one pager describing the goals should be enough after awhile.

I think we can seed the thinking by thinking in hypothesis and experiments, or by asking things like `If this was a great success - how would that be seen?`

## Who is doing what?

After doing away with tracking a lot of details for each work item, the way to keep track on which pod is working on what can be done on a higher level. A simple kanban board with cards for features per pod would get us very far. The Justice Board is one way to do that seems like a good start.

[FAST's Opportunity Maps](https://creately.com/guides/using-opportunity-mapping-for-growth-and-success/) is another way to track the strategic level work. This would be the thing that I would try first.

## How often do we meet the PO?

With 15 pods one PO can’t, so the PO becomes the source of intent, either embedded or a small shaping group. In the words of David L. Marquet, we need to `move the authority to the information` ([and not the other way around](https://www.marcusoft.net/2014/06/move-information-to-authority-and-not.html))

Synchronizing on intent and outcome, lowers the need for detailed follow ups, but at the same time we need to a frequent feedback loop from the pods. In the intent-based leadership that David Marquet set up the leader give the high level and the response is the intent for what is going to be done. This would be one good synchronization point before we build something, and can be done on a level that keeps each pod going for a week or so.

The other feedback mechanism is to show what is built and we can do that very frequently, showing progress by the day or shorter in some cases. Here the access to the product owner and stakeholders will set the cadence. Giving an exact definition of how frequently they should meet feels strange, but the higher the risk the more frequent you want to meet.

One of the most impactful changes I've made was to ask a PO to read their emails for 30 minutes each morning close to a team. That solved just about all the synchronization needs that team had. The first day and week even, they talked a lot. The next week the conversations was down to a few minutes, with the occasional demo / planning session. No extra meetings were needed.

## Review

ANother place where we are already experience work piling up is in the review. Reviewing the built feature, the code and the expected results is where we can check the output of the agents. But they work much faster than us.

A lot of automated checks can help us part of the way, but at the end of the day the humans are responsible for what has been done, and hence we would want to know, understand and sign off on what has been done.

I think we should view this as a good think. This is the ["Slow is smooth, smooth is fast"](https://www.marcusoft.net/2025/01/quality-is-not-slow.html) motto in practice. Fast and sloppy is not really fast, even though it feels like it.

## How do we do discovery?

I've never understood why discovery has been dislocated from other work. I love how FAST is treating this just like any other type of work and involve team members as needed. ShapeUp have this in mind as well, but make a point of different skills taking lead.

For me, much of the discovery can be done as part of the building. We can even try out several different versions as prototypes or even fully built features, with the cost of building going down.

One thing that should probably be treated differently is when discovery involved user research, interviews and tests. This naturally has a different cadence. If we use the FAST approach we can allow pods to form around such an initiative too.

## Stakeholder reporting

I'm a strong believer that data for reporting should be created by the way we work and not take extra time from where we want to spend our time. Until now this has required process engineering (ask me about the Singaporean hospital or the Scania product line, for more on this) but with AI we can generate the reports from the context and the agent conversations.

More and more I see comments like `I asked Claude to generate this video demoing the the feature` or `Here's a graph of the impact, that I ask the agent to put together`.

One thing that gets interesting about this is that the reporting can be done in a pull-fashion, just-in-time. Rather than pushing the reporting to the stakeholders at given time, just-in-case.

## Dependencies

In order to enable effective pod work we need clear boundaries. Scania, SpaceX and WikiSpeed has shown us that this can be done with hardware, so surely we can do this in software!

This require clear in setting up module boundaries, so that each module can be developed and deployed independently. But also strong CI/CD that helps us integrate often and effortless. Trunk-based development has been doing this for a long time and ensures that the quality of main (trunk) is to a state where it always can be released.

## Cross-pod learning

Within in each pod, learning happens to micro reflections during the day. I am a fan of asking `What went great today - how do we do more of that tomorrow?` and similar at the end of the day, but hey schedule a retro weekly if needed.

Across the pods we need to be a bit more structured and schedule learning, or hackathon. We can also solve it dynamically by encourage that we switch members in the pods from time to time. From [pair programming we get the "promiscuous pairing"](https://en.wikipedia.org/wiki/Pair_programming#Learning) that encourage the learning to be shared, just by keep working normally.

## When pods drift

Pods are given great freedom but needs some constraints to ensure that we do not evolve to far away from each other in the greater team. In Cynefin the concepts of constraints is for exactly this. Governing and enabling constraints sets the boundaries for the pods work and output. A good example of this is the idea of a [true north from Lean](https://artoflean.com/reference/true-north/) and the [Golden Path](https://cloud.google.com/blog/products/application-development/golden-paths-for-engineering-execution-consistency) for engineering.

Intent alone will be sensitive to the interpretation of each pod and we need some other structure around the work to nudge people in the right direction.

## Summary

Oh man, this post grew too long. But as I wrote it my feeling of that the best is yet to come increased. I think we have the opportunity really flex the speed of building to learn faster by shortening the feedback loop and make the teams smaller. Of course, a change like that would affect our current ways of working. In this post I tried to think about how that could work.
