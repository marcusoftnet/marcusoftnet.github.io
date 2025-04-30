---
layout: post
title: Conchango burndown chart is not working
date: 2008-03-10T10:17:00.007Z
author: Marcus Hammarberg
tags:
  - TFS
  - Scrum
modified_time: 2010-12-14T15:22:51.435Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-7494630480846630128
blogger_orig_url: https://www.marcusoft.net/2008/03/conchango-burndown-char-not-showing.html
---

OK - one of the new technologies that we are using in my [really fun
project](https://www.marcusoft.net/2008/03/focus-or-not.html)
is the [Conchango Scrum template for TFS](http://scrumforteamsystem.com/).
This has already cause me to scream out loud so I will most certainly
get back to it.

Let me get a couple of thing right first:

- I don't think this is a good way of doing
  [SCRUM](http://scrumforteamsystem.com/processguidance/v2/Scrum/Scrum.aspx).
  You miss a lot of the great interaction within the team when you
  need to do this kind of reporting.
- I think that the Conchango template is as good as
  it probably will get when you are forced to use tools like this. I
  do hope that it might even get [slightly
  better](http://www.codeplex.com/scrumdashboard)...

So - now that my personal thoughts about this is out of the way - here
is the problem I've encountered:

I have initiated a lot of [Product
Backlog
Items](http://scrumforteamsystem.com/processguidance/v2/Artefacts/ProductBacklog/UsingTeamExplorerWithTheProductBacklog.aspx)
(or well 5 of them). Then I created [Sprint backlog
items](http://scrumforteamsystem.com/processguidance/v2/Process/SprintPlanning/SprintPlanningWithScrumfTS.aspx)
for them and linked them together. But then I ran into problems - the
[Sprint work
item](http://scrumforteamsystem.com/processguidance/v2/Process/TheSprint/SprintsWithScrumForTeamSystem.aspx)
caused me a lot of worries.

As far as I can understand the Sprint work item is a representation of
all the work items being worked on in a sprint. However Conchango has
chosen to build these upon the
Areas and iterations that is inherited living in TFS. This is a
bit confusing... or maybe not but one of the reports are: All sprints
that returns 12 sprints when only 3 sprints is added to areas and
iterations.

Well - if I ever understand that I'll post the solution here.

However two things I have noticed about the sprint work item is these:

- You'll need to set Start and Stop Date for the sprint
- You'll need to set the state of the sprint to In progress

Failing to do these things will cause the burn down and other reports to
fail.

Also you'll have to be absolutely sure that the product
backlog items and sprint backlog items is connected to the sprint (of
course), but the right sprint (which is quite hard to figure out from
the query). Finally make sure that the sprint backlog items are
connected to the right sprint and the right product backlog item....

As you might notice I am a bit frustrated. A good documentation is also
missing which makes it the more harder to understand. I'll get back in
the question
