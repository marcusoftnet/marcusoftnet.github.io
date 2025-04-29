---
layout: post
title: Theory of Constraints and Specification by Example Part II
date: 2011-06-01T20:55:00.001Z
author: Marcus Hammarberg
tags:
  - BDD
  - Kanban
  - Agile
modified_time: 2011-06-01T20:56:45.817Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-2318944997718944184
blogger_orig_url: https://www.marcusoft.net/2011/06/theory-of-constraints-and-specification.html
---

Following up on my previous post about [Specification by Example](http://specificationbyexample.com/) and [Theory of Constraints](http://en.wikipedia.org/wiki/Theory_of_Constraints), I’ve received insightful feedback from colleagues, particularly Håkan Forss, whom I greatly respect.

### The Five Focusing Steps

Håkan pointed out some valuable perspectives on the Theory of Constraints' [five focusing steps](http://en.wikipedia.org/wiki/Theory_of_Constraints#The_five_focusing_steps):

1. **Identify the Constraint**
2. **Decide How to Exploit the Constraint**
3. **Subordinate All Other Processes to the Above Decision**
4. **Elevate the Constraint**
5. **If the Constraint Moves, Return to Step 1**

#### **Assuming the Goal of the Organization**

The first step is to articulate the goal. In system development, this might be phrased as:

> Develop a system that meets the needs of the users

Understanding the goal of your project can help direct the focus of improvement efforts and influence how trade-offs are managed throughout the process.

#### **Identify the Constraint**

In physical systems, identifying constraints is often straightforward—like observing queues or bottlenecks. In knowledge work, such as software development, identifying constraints is more abstract.

Using techniques like [root cause analysis](http://en.wikipedia.org/wiki/Root_cause_analysis) can help understand why work is stalled or redirected. Visualization tools like Kanban boards can also make constraints more apparent by showing where work is piling up or where there are gaps in the process.

#### **Exploit the Constraint**

This step involves making the most of the existing resources rather than immediately adding more. For instance, if lack of knowledge is identified as a constraint, you should:

> Acknowledge the knowledge gap and align your process to discover knowledge progressively.

This approach aligns with agile practices, such as frequent releases and iterative development, where feedback loops help address gaps in knowledge and understanding.

#### **Don't Let Inertia Become the Constraint**

Håkan's critique highlighted the risk of assuming that lack of knowledge is always the constraint. This is a valid concern; the constraint could be elsewhere, and misidentifying it could lead to ineffective improvements. The key is to remain open to discovering the real constraints rather than assuming they are already known.

### Conclusion

Håkan’s feedback was incredibly valuable and prompted deeper reflection on these concepts. While the lack of knowledge often presents a significant challenge in system development, it's crucial to approach each project with an open mind and avoid presuming where the real constraints lie.

The insight is that Specification by Example can be a powerful tool to address many issues related to knowledge gaps, but it’s not a one-size-fits-all solution. As the saying goes, it’s “no silver bullet – but it’s darn close!”

Thank you, Håkan, for pushing the conversation forward and helping refine these ideas.
