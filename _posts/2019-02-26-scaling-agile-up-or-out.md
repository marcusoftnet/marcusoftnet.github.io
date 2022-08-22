---
layout: post
title: Scaling agile - up or out
author: Marcus Hammarberg
date: 2019-02-26T16:34:46.000Z
tags:
  - Agile
  - Lean
  - Life of a consultant
---

Friend: `So in short - they too need to scale their agile initative.`

Marcus: `Oh - cool! Up or out?`

Scaling agile has to be the term that I've seen most discussions, posts, comments and conversations about the last couple of years.

And [Google](https://trends.google.com/trends/explore?date=all&q=agile%20scale) seems to agree - it at is peak or going there right now.

But very seldom I've heard an explanation to what kind of scaling that is meant: do you want to scale up or scale out?
My guess is that many times people talking about scaling agile mean scaling **UP** but worse I think that most times we have not decided. That is not really wise because it's two very different problems to solve.

In this post, I wanted to reason a bit about those tradeoffs.

<!-- excerpt-end -->

## Computers
The distiction between scaling _up_ and scaling _out_ is something that I first picked up in computer science when it comes to solving performance issues. I'm gonna try to make a description here that requires no previous knowledge of computers. Bare with me - it's just a short analogy

Imagine that we have web site running on a server. It's now becoming hugely popular and we get loads of people hitting the website. This is great, but the server is buckling under the load. Each page takes longer and longer to show and we need to do something now.

Now we could:
**scale up** - by beefing up the computer; more memory, more and faster CPUs, more disc. This will work, but after awhile, if the site load increase we will soon hit a barrier where the server cannot be beefed up any further. Also it's quite an expensive fix to the problem.

Instead we could then **scale out** which means that we buy a new server, or 10 new servers and distribute the load between them. This is from a hardware perspective much cheaper (most of the time - espesically now a days when you can "buy" a new instance by moving a slider at a cloud provider) but put new demands on the structure of our application. For example; what if we want to remember who is logged in? Before, with one server, we could store that in the memory of the server. Now with more than one server ... this is not so great. It's not guranteed that the user get to the same server for each new page. Hence the memory of one server is not on another server.

Also we need someone to decided how to distribute the load (aka the load balancer). Should we distribute the load randomly per page request, or should we set up some parts of the application on one server and other parts on another server. Which goes where? Why?

As you probably see scaling up or scaling out has two very different problem sets and each solution has different potential trade-offs and solutions.

## Agile teams
Now imagine that we have a hugely sucessful agile little team; the payment team. They have made wonders not only building, but also developing and running all the payment services in our company.They are 5 people, including the product manager for the payment services.

Obviously we want this success story to spread. To all the 200 people in the organisation.

### Scaling up
**Scaling up** in this context could obviously mean that we make one big team or even double the team in size. But that doesn't make much sense, in most cases I've seen.  We are hopefully past that stage of agile maturity.

No **scaling up** might, and often does, mean that we:
  * fit the agile teams that we create into our current system, where we have layers of decision-making, planning and budgeting before the team is involved. The team can then be _autonomous, agile and nimble_ within the boundaries that we give it.
  * add the current ways of working as a extra layer on top of the team so that it fits into the structure that we have created already.
  * add extra people into the team, in order to fit it into our current structure. Examples I've seen is the requirement specialist, a customer proxy (and even a customer proxy proxy), "make it look like RUP"-guy (oh, how I wished I made that one up), architects or documentation specialists. None of those are wrong in themselves, except mayb the RUP-reference, but these are competences - not people or even roles.

**Scaling  up** in this context, for me, means to take whatever the team did and beef it up until it fits whatever the organisation around it did before this team was successful. Just as with computers **scaling up** is quicker, but cost much more (for the team), and eventually reach a tipping point - where the things that made that team successful in the first place, is not present anymore.

Notice how these questions, problems and solutions are all focusing on how to change the team to fit the organisation and current ways of working.

### Scaling out
Ok - let's try to take that successful team and instead **scale it out**. That would mean that we create many, small autononmous and independent teams, operating after not the same practices but the same principles that made the first team successful. Each team, with their unique context and individuals would find their own ways of working to create valuable outcome.

The challenge now becomes one of leadership:
* How would each team know what they should do? Psst - give them an impact/outcome-oriented goal (`More customers!`, for example)
* How would we know progress and follow up their progress?
* How would we synchronize work and releases across teams?
* What about dependencies between teams - who are in charge of keeping them together?
* What kind of supporting roles do we need around the team for it to work effectively?
* What kind of decisions are the team not allowed to make (for example around their technology or ways of working)?

Answering these questions (and many more) is way beyond the scope of the this post, but we can now see a change in the questions we are asking when we want to **scale out**. In order to support **scaling out** we now shift our focus on how to change the _organisation and current ways of working_ to make the teams thrive.

This is a bigger change in how we do stuff today, and probably takes longer to achieve. But when those problems are solved and we have that environment in place, we can continue to **scale out** for a long time without having to restructure our organisation from the bottom up. Much like **scaling out** an application requires that we restructure it to be **scaled out**

## Summary
When talking about scaling agile make sure that you understand each other before changing things; do you want to scale up or scale out. That is two different things and each have their unique challenges and benefits.
