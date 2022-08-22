---
layout: post
title: Sprint Planner Helper – Session 10
date: 2009-02-16T21:38:00.001Z
author: Marcus Hammarberg
tags:
  - Sprint Planner Helper
modified_time: 2009-02-16T21:38:46.665Z
thumbnail: >-
  http://lh3.ggpht.com/\_kkDJOSPNTLs/SZnc5EtJJUI/AAAAAAAAAhk/0-y3-n75kzI/s72-c/sprintplannerinitmodel_thumb%5B4%5D.jpg?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-5583006853510556248
blogger_orig_url: http://www.marcusoft.net/2009/02/sprint-planner-helper-session-10.html
---



You could call the last session my first “sprint demo”. What happened
was that I for the first time could see where this was going. And I (as
Product Owner) was not happy… I couldn’t even yell at the team (also me)
because it was quite a lousy order.

OK –what was wrong. Firstly – I was not happy about that certain actions
was only avaiable to certain roles (“As Product Owner”, “As Scrum
master”). I want the Sprint Planner Helper to be open and useful without
hindering you with role checking.

Then I was way to detailed in my model. Why do I even bother with the
ProductOwnerController. It’s just an attribute on the ProductBacklog, as
is the product by the way.

So I sat down in a meeting with the team, designer and the domain
experts (in this case me on all three accounts :)) and did some domain
modeling. I even sketched out a GUI which was really helpful in order to
get things in place.

Here is a crude overview of my model, in Power Point.

[<img
src="http://lh3.ggpht.com/_kkDJOSPNTLs/SZnc5EtJJUI/AAAAAAAAAhk/0-y3-n75kzI/sprintplannerinitmodel_thumb%5B4%5D.jpg?imgmax=800"
title="sprintplannerinitmodel"
style="border-right: 0px; border-top: 0px; display: inline; border-left: 0px; border-bottom: 0px"
data-border="0" width="244" height="179" alt="sprintplannerinitmodel" />](http://lh5.ggpht.com/_kkDJOSPNTLs/SZnc4jWhBzI/AAAAAAAAAhg/KUx5XFVwyLM/s1600-h/sprintplannerinitmodel%5B3%5D.jpg)

I also updated the product backlog – and augmented them with some data
found during my session (such as attributes and actions):

> The main objective is to create a tool that can help a team to plan
> out a sprint. The whole idea of the tools
> is that it should be very low threshold and open.

As user I can create a product that describes the product and the
product owner so that the purpose of the product is known.

1. Each product has a product backlog that describes what is left to
    do.
2. Each product backlog item requires at least an ID, description,
    initial priority.
3. Other properties are story points (how big is this compared to
    other) and a document with additional business rules.

As user I can update the information about the product and in the
product backlog so that it reflect the current situation. For example
prioritize the product backlog by changing the priority on the product
backlog item so that the team knows what is most important to the
product owner.

As user I can create a sprint that represent a sprint in which some
items of the product backlog is to be realized.

1. The sprint has a goal description and a start, stop and demo-date
    and the team members with availability (in % or hours) and focus
    factor (in %).
2. The sprint also contains a sprint backlog which initially contains a
    sprint backlog item for each product backlog item selected.
3. The sprint backlog contains summarized values for total number of
    hours and story points.

As user I can add sprint backlog item to the sprint during the planning
in order to decide on the details of the sprint backlog items and their
execution.

1. A sprint backlog item has an ID, Description,
    How-To-Demo-description, a list of Actions and a summarized total
    number of planned hours.

As user I can add actions to a sprint backlog item in order to find out
what to do to be done with the Sprint Backlog Item.

1. Each action has an ID, Description and hours (max 8 h)

As user I can update, delete and change Sprint Backlog Items and Actions
in order to easy plan the sprint.

As user I can print an initial burndown chart that shows the total
number of hours (y-axis) and the date for the sprint (x-axis) in order
to print it and use during the sprint.

As user I can print nice cards of all sprint backlog items and their
actions in order to put them up on the sprint task board. This might
include printing the actual task board...

And with that my nice progress almost blew up altogether… But just
almost. I have done some stuff that I can use. But I need to change
other stuff. I’ll start work on the first item in the list above which
means the product entity and repository.
