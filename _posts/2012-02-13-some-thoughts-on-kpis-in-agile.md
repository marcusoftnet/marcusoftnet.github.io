---
layout: post
title: Some thoughts on KPI’s in agile organizations
date: 2012-02-13T08:00:00.000+01:00
author: Marcus Hammarberg
tags:
  - Life of a consultant
  - Kanban
  - Agile
modified_time: 2012-02-13T08:00:06.894+01:00
blogger_id: tag:blogger.com,1999:blog-36533086.post-5306069240380609300
blogger_orig_url: http://www.marcusoft.net/2012/02/some-thoughts-on-kpis-in-agile.html ---

At my current client I have been asked to suggest some
<a href="http://en.wikipedia.org/wiki/Performance_indicator"
target="_blank">KPI’s</a> (that’s Key Performance Indicators for us
non-business people). This is a bit scary for me of two reasons – I
don’t feel to at home with the task and I don’t feel at easy with many
of the KPI’s that I hear is being used.

Let’s read up on them first and then I’ll talk about the one I suggested
and why.
### What is a KPI anyway?

From the <a href="http://en.wikipedia.org/wiki/Performance_indicator"
target="_blank">Wikipedia page</a> we learn that it’s a “type of
performance measurement” and that “KPIs are commonly used by an
organization to evaluate its success”.

Ok – later down they actually had a
<a href="http://en.wikipedia.org/wiki/Performance_indicator#IT"
target="_blank">section for IT</a> that cited commonly used KPI’s as;
Availability, Mean time between failure, Mean time to repair, Unplanned
availability.

So far it sounded alright and sound to me. But I heard in the corridors
of my client rumors of people wanted to use velocity to be able to
compare teams.

### The dangerous measurement

One danger of starting to measure things is that people, organization
and the things they do start to try to fulfill that measurement. As the
old quote goes;

> You get what you measure

So great care must be taken to make sure that we don’t create an
aspiration to a behavior that we don’t want in our organization. If you
start to compare teams and their KPI’s against each other – pretty soon
you will have a A and a B-team. And hostile feelings between them.

And measuring
<a href="http://en.wikipedia.org/wiki/Source_lines_of_code"
target="_blank">Lines-of-Code (LOC)</a>, yes it still happens, is just
plain wrong. If you want more lines of code – go for COBOL. Less – I
would suggest PHP…

Lines of Code is used, I presume, because it’s hard data. It can be
counted. Where as the <a
href="http://agilefaq.wordpress.com/2007/11/13/what-is-a-story-point/"
target="_blank">story point</a> measurement is a relative measurement
(how one thing relates in size to another) and is not very precise. But
then again – is a team’s velocity really something that we want to
measure them on.

The velocity is of course something good to know and to plan with. For
the team. But to start tracking them and reward them on the performance.
And then compare that to another teams performance on their velocity… I
don’t know.

Finally, but this almost goes without saying, the value is not
important. The trend is. Just wanted to have it written out.

### My suggestions

Really when you think about it; what is the goal here? We want to
measure our effectiveness (as in doing the right things) not efficient
(doing it right).

Our goal, according all things Agile and the
<a href="http://www.agilemanifesto.org/" target="_blank">Agile
manifesto</a> is working software (in production). So let’s measure the
whole organization on that. The best way to do that is through
<a href="http://en.wikipedia.org/wiki/Lead_time" target="_blank">lead
times</a> I would say.

But I would also suggest that quality and respect for the individual is
taken into account. Here are my suggestions for KPI’s.

#### Lead time

The lead time is the time for a complete process, not just part of the
process as for example development or development and testing. No –
let’s take the whole value chain into consideration; from idea to
deployment.

Who knows – maybe just typing the code faster (as in more LOC per hour)
isn’t the big bottleneck? It might even be that the bottleneck is
something that we can change with a policy decision. Such as number of
releases per year, for example.

A problem arises here as the birth of an idea is very hard to pin down
to a certain date. So maybe the start tracking point should be the first
time something is written down in a backlog. Which in turn is a problem
as the first things written down is often quite big and just some rough
ideas, that might never be deployed fully. But as the organization
matures smaller things gets added to the backlog and the “start date”
gets more and more accurate.

The end time for lead time is considerable easier to track as it’s the
deployment date (and time!).

#### Quality

Of course just focusing on lead time could drive the organization to
speed up so much that the quality is suffering. So we need to keep track
of the quality of the product we are making. This is also a Lean core
value; to focus on quality.

You could imagine a whole array of KPI’s for this. And they are probably
not to hard to track either. Number of bugs in production is a start,
but I’m sure you can come up with many more fine granular ones.

#### Respect the individual

This is picked up from the
<a href="http://en.wikipedia.org/wiki/The_Toyota_Way"
target="_blank">Toyota Way</a> but is super important. What use is great
speed (short lead time) and great quality if you use up your people? And
let’s stop call them resources already!

This is another of those scary measurements as this will be subjective
in many case. You could measure pulse and blood pressure of course, but
that might be taking it too far :).

I suggest a simple survey that is sent out each month or every other
week. Here are few questions that we have been using at my team at
<a href="http://www.avegagroup.se" target="_blank">Avega Group</a>
(thanks to
<a href="https://twitter.com/#!/anderslowenborg" target="_blank">Anders
Löwenborg</a>):

-   On a scale between 1 and 6 how happy are you with Avega Group today?
-   What could we do to improve that number?
-   What is best right now?
-   What is worst right now?

Only the first one is “required” to answer. It has never taken me more
than 3 minutes to answer.

### Summing up

By using the lead time, quality and respect the individual KPI’s I’ve
suggested above I think that you get a nice mix of values that shows you
how your organization is doing right now. It might be a bit rough but
start with those and then focus on the problems that you find through
this.

And a final note – don’t invest too much time in implementing this in
the organization. If it takes long time to track (new codes to add on
time report sheets etc.) you’re actually wasting time for your customer.
If it takes time to implement in the organization you also stand the
risk to not dare to remove it. So you end up with more and more KPI’s,
narrowing the maneuverability for you organization to adapt and evolve
freely.
