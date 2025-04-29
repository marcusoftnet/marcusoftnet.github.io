---
layout: post
title: Sprint Planner Helper – Session 11
date: 2009-02-21T22:30:00.001Z
author: Marcus Hammarberg
tags:
  - Sprint Planner Helper
  - TDD
modified_time: 2009-02-21T22:30:40.161Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5399120244865118545
blogger_orig_url: https://www.marcusoft.net/2009/02/sprint-planner-helper-session-11.html
---

It’s been a while since I last worked on the project. Abbe has been quite sickly, and I haven’t had much time. No worries – it's all a hobby. 😉

### Progress Update

Since my last update (which was only 2 x 15-minute sessions), I’ve managed to produce a list of Products on my webpage with a new layout:

This progress made me realize that I should have included some disclaimers regarding the UI. I created a specific CSS class for the product list, which will help later on. My focus now is on functionality, not aesthetics.

### Model Enhancements

I also discovered that my model could be improved with additional features such as status for the product items and aggregated values for progress tracking. I used Test-Driven Development (TDD) to implement these changes and integrated them into the GUI. This process was quite time-consuming due to some challenges with LINQ.

For those dealing with similar issues, here's an [excellent resource](http://msdn.microsoft.com/en-us/vcsharp/aa336746.aspx) on LINQ that proved helpful.

More updates to come as I continue working on this project!
