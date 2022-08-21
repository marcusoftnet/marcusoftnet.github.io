---
layout: post
title: Conchango burndown chart is not working
date: '2008-03-10T11:17:00.007+01:00'
author: Marcus Hammarberg
tags:
  - TFS -
Scrum
modified_time: '2010-12-14T16:22:51.435+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-7494630480846630128
blogger_orig_url: http://www.marcusoft.net/2008/03/conchango-burndown-char-not-showing.html
---

OK - one of the new technologies that we are using in my [really fun
project](http://marcushammarberg.blogspot.com/2008/03/focus-or-not.html)
is the [<span>="blsp-spelling-error">Conchango</span> Scrum template for <span>TFS</span>](http://scrumforteamsystem.com/).
This has already cause me to scream out loud so i will most certainly
get back to it.

Let me get a couple of thing right first:

-   I don't think this is a good way of doing
    [SCRUM](http://scrumforteamsystem.com/processguidance/v2/Scrum/Scrum.aspx).
    You miss a lot of the great interaction within the team when you
    need to do this kind of reporting.
-   I think that the <span>Conchango</span> template is as good as
    it probably will get when you are forced to use tools like this. I
    do hope that it might even get [slightly
    better](http://www.codeplex.com/scrumdashboard)...

So - now that my personal thoughts about this is out of the way - here
is the problem <span>="blsp-spelling-corrected">I've</span> encountered:

I have <span>="blsp-spelling-corrected">initiated</span> a lot of [Product
Backlog
Items](http://scrumforteamsystem.com/processguidance/v2/Artefacts/ProductBacklog/UsingTeamExplorerWithTheProductBacklog.aspx)
(or well 5 of them). Then i created [Sprint backlog
items](http://scrumforteamsystem.com/processguidance/v2/Process/SprintPlanning/SprintPlanningWithScrumfTS.aspx)
for them and linked them together. But then i ran into problems - the
[Sprint work
item](http://scrumforteamsystem.com/processguidance/v2/Process/TheSprint/SprintsWithScrumForTeamSystem.aspx)
caused me a lot of worries.

As far as i can understand the Sprint work item is a representation of
all the work items being worked on in a sprint. However <span
id="SPELLING_ERROR_5" class="blsp-spelling-error">Conchango</span> has
<span>="blsp-spelling-corrected">chosen</span> to build these upon the
Areas and iterations that is inherited living in <span
id="SPELLING_ERROR_7" class="blsp-spelling-error">TFS</span>. This is a
bit confusing... or maybe not but one of the reports are: All sprints
that returns 12 sprints when only 3 sprints is added to areas and
iterations.

Well - if i ever understand that <span>="blsp-spelling-error">i'll</span> post the solution here.

However two things i have noticed about the sprint work item is these:

-   You'll need to set Start and Stop Date for the sprint
-   You'll need to set the state of the sprint to In progress

Failing to do these things will cause the <span>="blsp-spelling-corrected">burn down</span> and other reports to
fail.

Also you'll have to be <span>="blsp-spelling-corrected">absolutely</span> sure that the product
backlog items and sprint backlog items is connected to the sprint (of
course), but the right sprint (which is quite hard to figure out from
the query). Finally make sure that the sprint backlog items are
connected to the right sprint and the right product backlog item....

As you might notice i am a bit frustrated. A good documentation is also
missing which makes it the more harder to understand. I'll get back in
the question
