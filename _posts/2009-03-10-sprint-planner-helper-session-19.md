---
layout: post
title: Sprint Planner Helper – Session 19
date: 2009-03-10T09:02:00.001Z
author: Marcus Hammarberg
tags:
  - Sprint Planner Helper
  - TDD
modified_time: 2009-03-10T09:02:21.374Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5960309740071822887
blogger_orig_url: http://www.marcusoft.net/2009/03/sprint-planner-helper-session-19.html
---

After my [refactoring yesterday](http://www.marcusoft.net/2009/03/sprint-planner-helper-session-18.html), the function that re-prioritizes product backlog items was reduced to swapping priority points on two items.

So that’s what I’ll do today. [TDD](http://en.wikipedia.org/wiki/Test-driven_development) through a function that swaps priority points for a product backlog item and the item before (prioritize up) or after (prioritize down) it.

*Coding in progress*

That really was an old-time programming problem. Fun! But now I have TDD’ed a priority swap algorithm. That was all I managed to get through today. Some progress, I think.

Now all that is left is to reach this functionality from the GUI and reload the list after it’s done.
