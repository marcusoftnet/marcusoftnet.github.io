---
layout: post
title: Theory of Constraints and Specification by Example
date: 2011-05-27T18:41:00.001Z
author: Marcus Hammarberg
tags:
  - BDD
  - Kanban
  - Agile
modified_time: 2011-10-20T12:58:46.684Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5183569694525573431
blogger_orig_url: http://www.marcusoft.net/2011/05/specification-by-example-and-theory-of.html
---

Since I first encountered [Specification by Example](http://specificationbyexample.com/) (or [BDD](http://en.wikipedia.org/wiki/Behavior_Driven_Development) as it’s also known), I felt it had a natural alignment with Lean thinking and related theories. Today, I want to explore how the [Theory of Constraints](http://en.wikipedia.org/wiki/Theory_of_Constraints) can be applied through Specification by Example to enhance the system development process.

#### Standing on the Shoulders of Giants

This post reflects my own thoughts and tries to piece together insights from various experts. I owe much to pioneers like [Dan North](http://www.blogger.com/www.dannorth.net), [Eliyahu Goldratt](http://en.wikipedia.org/wiki/Eliyahu_M._Goldratt), and [Gojko Adzic](http://gojko.net/), among others.

### Theory of Constraints

Last year, I read the insightful book, [*The Goal* by Eliyahu Goldratt](http://www.amazon.com/Goal-Process-Ongoing-Improvement/dp/0884271781). Goldratt’s Theory of Constraints (TOC) asserts that every system has at least one bottleneck that limits its overall performance. Improvements to other areas are less effective if they don't address the bottleneck. 

Here’s a simple example:

> Imagine Marcusoft Welded Steelplates, a plant that manufactures specialized steel plates. The plant has several machines: one cuts the plates, another welds parts on, a third paints them, and the final machine finishes the edges. However, the paint machine often struggles with inconsistently shaped plates, leading to waste. To resolve this, you would first optimize the use of the paint machine by ensuring it only receives plates it can handle, and then address the root cause by adjusting the initial cutting and welding processes.

While this example illustrates a physical system, the principles can be applied to system development as well.

### Theory of Constraints in System Development

In software development, the common bottlenecks are often thought to be in requirements, testing, or development. However, the real bottleneck may be more subtle.

Consider this thought experiment (courtesy of [Liz Keogh](http://skillsmatter.com/expert-profile/agile-testing/elizabeth-keogh)):

> Imagine your entire development environment, including code, documentation, and infrastructure, is lost in a disaster, but your team remains. How long would it take to recreate the project from scratch?

You might estimate 25-50% of the original time because:

> - You would now have a better understanding of what needs to be done.
> - You could avoid previous pitfalls and mistakes.

This scenario highlights that the real bottleneck is our ignorance. System development is inherently a process of discovering and addressing unknowns.

### [Specification by Example](http://specificationbyexample.com/)

Specification by Example involves defining system behavior through concrete examples that illustrate expected outcomes. These examples, created collaboratively with the team, serve as acceptance criteria and living documentation. They help clarify requirements and guide development and testing.

### Using Specification by Example to Address the Ignorance Bottleneck

If ignorance is the bottleneck, the goal is to address it directly:

1. **Discuss Examples Early**: Engage the team in discussions about how features should behave before they are analyzed, implemented, or tested. This helps identify potential issues and reduces rework.
2. **Reduce Waste**: By addressing knowledge gaps early, you minimize the waste associated with later rework and corrections.

### Conclusion

While much of this reflects existing wisdom, articulating these ideas has been a valuable exercise for me. As Dan North aptly put it:

> It’s no [silver bullet](http://en.wikipedia.org/wiki/History_of_software_engineering#1985_to_1989:_No_silver_bullet) – but it’s a good start!

The key takeaway is recognizing and addressing our ignorance about what we don’t know. Specification by Example helps mitigate this bottleneck by fostering early discussions and providing clear, actionable examples. This approach can be a powerful tool in the system development process.
