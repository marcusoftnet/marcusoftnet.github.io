---
layout: post
title: Sprint Planner Helper – Session 10
date: 2009-02-16T21:38:00.001Z
author: Marcus Hammarberg
tags:
  - Sprint Planner Helper
modified_time: 2009-02-16T21:38:46.665Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5583006853510556248
blogger_orig_url: https://www.marcusoft.net/2009/02/sprint-planner-helper-session-10.html
---

You could call the last session my first “sprint demo.” What happened was that I could finally see where this was going. As the Product Owner, I was not happy – I couldn’t even yell at the team (also me) because the result was quite poor.

### What Went Wrong

Firstly, I was not happy that certain actions were only available to specific roles (e.g., “As Product Owner,” “As Scrum Master”). I want the Sprint Planner Helper to be open and useful without hindering you with role checks.

Secondly, I was too detailed in my model. For instance, why bother with a `ProductOwnerController` when it's just an attribute on the `ProductBacklog`? The same applies to the `Product` attribute.

### The Solution

I had a meeting with the team, designer, and domain experts (in this case, me on all three accounts) to do some domain modeling. Sketching out a GUI was really helpful in getting things in place.

Here is a crude overview of my model, in PowerPoint:

I also updated the product backlog and augmented it with data from the session (such as attributes and actions):

> **The main objective is to create a tool that can help a team plan a sprint. The tool should be very low-threshold and open.**

#### User Stories

1. **As a user**, I can create a product that describes the product and the product owner so that the product’s purpose is known.
   - Each product has a product backlog describing what is left to do.
   - Each product backlog item requires at least an ID, description, and initial priority.
   - Other properties include story points and a document with additional business rules.

2. **As a user**, I can update the information about the product and product backlog to reflect the current situation. For example, prioritize the product backlog by changing the priority on the product backlog item so that the team knows what is most important to the product owner.

3. **As a user**, I can create a sprint representing a sprint in which some items from the product backlog are realized.
   - The sprint has a goal description, start and end dates, a demo date, and team members with availability and focus factors.
   - The sprint also contains a sprint backlog, which initially contains a sprint backlog item for each selected product backlog item.
   - The sprint backlog contains summarized values for total hours and story points.

4. **As a user**, I can add sprint backlog items to the sprint during planning to decide on the details of the sprint backlog items and their execution.
   - A sprint backlog item has an ID, description, how-to-demo description, a list of actions, and a total number of planned hours.

5. **As a user**, I can add actions to a sprint backlog item to determine what needs to be done to complete the Sprint Backlog Item.
   - Each action has an ID, description, and hours (max 8 hours).

6. **As a user**, I can update, delete, and change sprint backlog items and actions to easily plan the sprint.

7. **As a user**, I can print an initial burndown chart that shows the total number of hours (y-axis) and the date for the sprint (x-axis) to use during the sprint.

8. **As a user**, I can print nice cards of all sprint backlog items and their actions to put up on the sprint task board, including printing the actual task board.

### Next Steps

Despite the challenges, I have made progress. I need to change some things and will start working on the first item in the list: the product entity and repository.
