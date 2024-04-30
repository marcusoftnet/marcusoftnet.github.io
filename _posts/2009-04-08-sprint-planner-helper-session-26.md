---
layout: post
title: Sprint Planner Helper – Session 26
date: 2009-04-07T20:12:00.001Z
author: Marcus Hammarberg
tags:
  - Sprint Planner Helper
modified_time: 2009-04-07T20:12:48.614Z
thumbnail: http://lh4.ggpht.com/\_TI0jeIedRFk/SduzvZvPLtI/AAAAAAAAAEI/HNFcB9fkQnU/s72-c/aggregates_thumb%5B1%5D.jpg?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-2791464324153723923
blogger_orig_url: http://www.marcusoft.net/2009/04/sprint-planner-helper-session-26.html
---


I have come to realize that I am not working… Not very flattering that I
has taken me about 2,5 months to come to that conclusion but here I am.

So I will probably slow down the pace for this project. I have not done
loads so far but I felt a bit pressured to “produce” and that not the
kind of feeling I would like to have on my parental leave. So a bit slow
– and still only when it’s fun!

OK – the thing today is to find aggregates and create repositories for
the Sprint domain object.

When it’s comes to aggregates I still find them quite hard to grasp. The
mainstream definition seems to be “things that must exists together” and
the most common example is the Order-OrderLine relationship.

But for my Sprint I have a list of SprintItems each with a list of
ActionItems. And if feels quite strange to get the complete thing each
time I bring up a sprint. Feels to heavy. So I’ll start with the
aggregate being the Sprint, Team and SprintItems and then another
aggregate for SprintItem and ActionItems.

I am not sure that this is good
<a href="http://en.wikipedia.org/wiki/Domain-driven_design"
target="_blank">DDD</a> but I’ll start of like this. My modeling is done
in PowerPoint, and if you follow my code (on
<a href="http://sprintplannerhelper.codeplex.com/" target="_blank">this
project @ CodePlex</a>) you’ll find it in the modelling.pptx-file.

\[PowerPointing in progress\]

[<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/SduzvZvPLtI/AAAAAAAAAEI/HNFcB9fkQnU/aggregates_thumb%5B1%5D.jpg?imgmax=800"
title="aggregates"
style="border-right: 0px; border-top: 0px; display: inline; border-left: 0px; border-bottom: 0px"
data-border="0" width="334" height="252" alt="aggregates" />](http://lh5.ggpht.com/_TI0jeIedRFk/SduzuzXmYuI/AAAAAAAAAEE/X2nz_6PLsDM/s1600-h/aggregates%5B3%5D.jpg)

OK – that was the thinking part. Now I need to add repositories for
these aggregates. That is mostly inheritance and tests. Simple tests… :)

\[Coding in progress\]

Ok – that took some time. But now I have the tests in place and
everything is dandy to get started on the UI for the sprint-part of my
domain.
