---
layout: post
title: Are you coding for change or stability - the followup post
date: 2013-04-24T07:00:00.000Z
author: Marcus Hammarberg
tags:
  - .NET
  - Lean
  - Agile
modified_time: 2013-04-24T07:00:09.964Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-7663992142364497452
blogger_orig_url: https://www.marcusoft.net/2013/04/WhatDoYouOptimizeFor2.html
---

In my [last post](https://www.marcusoft.net/2013/04/WhatDoYouOptimizeFor.html), I shared two stories that got me thinking about what we code for: change or stability.

The post received unexpected attention, prompting questions that led me to reflect further. Here are some thoughts and answers to recent discussions:

### Mindset vs Practice

My initial post didn't emphasize the mindset aspect. Coding for change means anticipating future modifications and making them easy. It shifts how we approach coding, focusing on simplicity and adaptability.

Consider a thought experiment: imposing a constraint to rewrite code every few months. How would this change design, coding, testing, and documentation practices? While impractical, it prompts valuable reflections on code flexibility.

### "WHAT WAS CHANGED IN THE GAME SPECIFICATION???"

A question from Reddit referred to a game development scenario where we introduced a new player feature. We adapted our code to accommodate this unexpected change, leveraging existing infrastructure and generic constructs.

### Generic vs Simple

Early exposure to object-oriented programming led us to overemphasize generic design. However, experience taught me to value simplicity over complexity. Writing simple, understandable code facilitates faster changes.

Frameworks like NancyFx and Simple.Data support this approach, enabling the creation of small, easy-to-understand services. Embracing microservice architectures enhances simplicity and agility.

### Conclusion

Coding for change aligns with agile principles, prioritizing adaptability and simplicity. Embrace frameworks and practices that facilitate small, easy-to-maintain code. Keep evolving and challenging assumptions—change is inevitable and beneficial.
