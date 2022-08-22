---
layout: post
title: "Some questions about estimation and plannning"
author: "Marcus Hammarberg"
date: 2021-05-22 10:36:18
tags:

  - Agile

  - Kanban
  - Life of a consultant
---

One of the most amazing things about my current job as a teacher and "head master" at [Salt](https://www.salt.study) is to see amazing people take my material and make something more amazing with it. Or when see people start to venture down avenues that helped me (in this case agile, lean and no estimates) so much.

I got a question from [Øyvind Ege](https://www.linkedin.com/in/oyvind-ege/) - a brilliant developer from a class last spring/summer. And with his permission I will here publish his question and my response.

I hope you find it useful.

<!-- excerpt-end -->

## The question


Hi Marcus! Øyvind here from the summer 2020 class. I was hoping you could answer some questions I had about Agile!

I have the pain and pleasure of being both the full-stack developer and "Product Owner" (I guess, at least I am charged with "estimating" and "writing the specifications") of a greenfield project. I thought "I have no idea how this works" and went to read your blog, which led me to [#NoEstimates and the book by Vasco Duarte.](http://noestimatesbook.com/about-the-book/)

Vertical slicing, prioritization by the client, and data-based forecasting -- so far so good. But here is my question: if an architectural and layered approach to development is discouraged, how can we avoid rewriting the backend, for example SQL tables and relationships, when we encounter RTSs that radically expand the ambitions of the project and might require different architecture? Do we deal with these problems, and rewrites, as and when they arise, or should we try to "plan" at least a bit of the architecture in advance?

For a bit of additional context: we would like to have a set of "core service" packs available for purchase by clients, with an additional premium "organizational package" that would connect these services into a web of services, with key data flowing between them. In keeping with the idea of client value, the client would want us to prioritize the core functionality packs first.
Not sure if that is helpful -- trying not to reveal too much proprietary stuff.
Would be tremendously grateful for any advice with this :slightly_smiling_face:
Øyvind

## The response


Hi Øyvind!

This is a big question and we might need to have a face2face chat over this.

But “shortly”
  - Agile techniques has sometimes been misinterpreted as “don’t plan at all”, which I think is a misconception. For me it’s all about making adjustments so that we can iterate and learn faster and faster. This gives us more flexibility - i.e. we become agile.
I would take [Dan Norths](https://dannorth.net/) advice going into a project like this and [optimize for discovery]( https://dannorth.net/2010/08/30/introducing-deliberate-discovery/).

Hence - I would spend some time in planning the architecture and make some high-level plans for how the thing is going to be built. But remember; you don’t know yet, since you most certainly will discover things along the way. Hence - just plan for what you know/need now and be ready to change. In other words - every document you write, decision you make - make it easy to change. [Read this](http://www.marcusoft.net/2013/04/WhatDoYouOptimizeFor.html)  that was one of my aha-experiences.

So, summarize: do plan - but not too much. Make decisions that helps you to move faster. Defer details until later. Example - you might decide: all our services will use REST over HTTP and we will expose a GraphQL endpoint for our front-ends to use. But no further than that. Leave HOW until later, as much as sensible.



Ok - now for the second part, which is trickier from a political perspective. Don’t spend a lot of time estimating. Those estimates will be wrong anyway :smile:

Instead take [my advice here](https://www.marcusoft.net/2019/03/kanbanstats-an-average-improvement.htm) l ([starting here](http://www.marcusoft.net/2019/01/kanbanstats-simplify-process-stats-get-started.html))  and track good data often.

For the political part I often use this reasoning:

> We don’t know how long this is going to take, but if we can get one month to get started we can give you a much better idea


If you’re using my sheet above you can then say:

> We did 15 work items/stories in this month. There’s 189 stories in the backlog. If we work in the same tempo and do all of them it will take us … And by the way - this is data - not an (guess)estimate of a future that we don't know much about

If they force you to estimate just ensure that you give a span and a percentage: between 3-6 months with 90% certainty, within 6-18 months with 95% certainty. See this by [Daniel Vicanti]( https://www.youtube.com/watch?v=aG5Eet6BJTc)

### Conclusion

Thanks Øyvind for a great question that helped my summarize some thoughts on a big topic. And thanks for permission to publish it here.

And thank you reader for reading this - I hope you too learned something, as I and Øyvind did.