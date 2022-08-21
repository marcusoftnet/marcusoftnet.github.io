---
layout: post
title: TF 20017 - The area or iteration provided for
field 'IterationPath' could not be found date: '2008-02-29T15:52:00.005+01:00'
author: Marcus Hammarberg
tags: - TFS -
Scrum modified_time: '2010-12-14T16:22:51.440+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-6994981790785680649
blogger_orig_url: http://www.marcusoft.net/2008/02/tf-20017-area-or-iteration-provided-for.html
---

OK - the first problem i ran into when using the Conchango template
was the first thing i ever did in the project - create a sprint "work
item". This type of WorkItem represents a sprint and hold all the sprint
backlog items that is to be done in the sprint.


What i wanted was to give the sprint a name when the error message "TF
20017 - The area or iteration provided for field 'IterationPath' could
not be found"


Well after almost a complete day of surfing and phoneing and scratching
of heads i found the error. The name is not a textbox but rather a
dropdown! More specifically the sprints in the Conchango template is
constructed around the notion of areas and iteration paths. The have
created a few for you, out of the box.


These make up the sprints for the project and hence needs to be named
(or selected in that box rather)
\[projectname\]/\[Release\]/\[Sprint\].


The name and organisations of these can be changed and manipulated by
right clicking the project in Team Explorer and choosing Team project
settings-\>Areas and iterations.
