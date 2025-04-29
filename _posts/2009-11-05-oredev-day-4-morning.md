---
layout: post
title: ÖreDev Day 4 – Morning
date: 2009-11-05T11:45:00.001Z
author: Marcus Hammarberg
tags:
  - DDD
  - .NET
  - ÖreDev
  - Agile
modified_time: 2011-11-09T20:49:22.586Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-4549561414632747159
blogger_orig_url: https://www.marcusoft.net/2009/11/oredev-day-4-morning.html
---

### Keynote: What Drives Design?

We kicked off the day with an intriguing keynote on the driving forces behind design, focusing particularly on the latter two "D"s in various [xDD](https://en.wikipedia.org/wiki/Software_development_methodologies) methodologies (such as TDD, BDD, etc.). The talk started with a fascinating historical overview, showcasing how our industry is still relatively young, with many pioneers still active.

Rebecca Wirfs-Brock discussed Responsibility-Driven Design (RDD) and compared it with other development techniques like [TDD](https://en.wikipedia.org/wiki/Test-driven_development), [BDD](https://en.wikipedia.org/wiki/Behavior_Driven_Development), [FDD](https://en.wikipedia.org/wiki/Feature_Driven_Development), and [DDD](https://en.wikipedia.org/wiki/Domain-driven_design). Her insights into these patterns and their evolution were thought-provoking.

### Making the Sausage

The session with [Dan North](http://dannorth.net/), [Neal Ford](http://www.nealford.com/), [Stuart Halloway](http://thinkrelevance.com/), and [Tyler Jennings](http://tyler.officialopinion.com/) explored BDD within the context of [Clojure](http://clojure.org/). Although it was an engaging discussion, I found it challenging to keep up with their fast-paced ideas. Functional programming can be complex, and with four functional experts presenting late-night code, it was a bit overwhelming.

### Test-Driven Web UI Development

[Scott Bellware](http://blog.scottbellware.com/) shared his experiences bridging the gap between testers and TDD developers in agile teams. Here are some takeaways from his talk:

- [Selenium](http://seleniumhq.org/projects/ide/) is a powerful, free UI-automation testing framework. It can generate test code in various programming languages, though the generated tests often need further refinement.
- It's essential to focus on the team's overall productivity rather than individual productivity. Tests should describe the product rather than the implementation details.
- Good BDD tests should function like a Table of Contents, providing a high-level overview rather than delving into specifics unless necessary.
- Pair programming with testers and developers can uncover issues quickly, but a solid understanding of the test framework is crucial.

I gained some insights into Ruby and test automation, although we didn’t cover everything in detail. James Bach’s comments were particularly intriguing, and I would have liked to delve deeper into them.

Overall, the morning sessions provided valuable insights and sparked plenty of ideas for improving design and testing practices.
