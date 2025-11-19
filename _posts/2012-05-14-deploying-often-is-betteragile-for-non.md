---
layout: post
title: Deploying Often is Better – Agile for Non-Techies II
date: 2012-05-14T10:28:00.001Z
author: Marcus Hammarberg
tags:
  - Life of a consultant
  - Agile
modified_time: 2012-05-14T10:28:22.839Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-1785069010922658762
blogger_orig_url: https://www.marcusoft.net/2012/05/deploying-often-is-betteragile-for-non.html
---

This is the second post in a series where I discuss agile concepts with business people (and some technical folks too). [Here is the first post](https://www.marcusoft.net/2012/05/agile-is-good-for-business-part-i.html) if you want to catch up.

Again, a disclaimer: this might seem basic to agile experts. Please bear with me as I explain these ideas to people who may not have immersed themselves in agile methodologies.

One common topic that comes up is deployment frequency. Many organizations prefer to make big, infrequent deployments rather than smaller, more frequent ones. While this might seem logical to some, it's often the opposite in large companies. Let me illustrate with a story:

I once consulted for a major insurance company in Sweden. They, like many in their industry, did four releases per year, aiming for "stable IT."

Let's pause and consider this. If you deploy only four times a year, stakeholders and projects will try to pack as much as possible into these releases. This leads to massive, complex deployments with many dependencies, and often, quality may be sacrificed in the rush to meet the release deadline. After each release, there is typically a period of instability and correction.

The stability graph for such a deployment schedule looks like this:

![Deploy seldom](/img/Deploy%25252520seldom_thumb%2525255B3%2525255D.png)

I was also working with a team from an online poker site in Sweden. During a Kanban course, they shared that they made 386 deployments last year. My jaw dropped. They explained:

> "Do you know what the last manual step is before we deploy?"
> "Uh, shutting down IIS?"
> "No, the developer checks in!"

A few points about their achievement:

- Their production environment is complex due to regulatory requirements for data storage.
- This practice wasn’t applied to every application, but to most.
- It took them a long time to achieve this.
- They are still improving.

This made me think: What do you deploy when you do 386 releases a year? Typically, small, manageable pieces. Smaller releases generally have fewer dependencies and are less complex.

In many large companies, deployments are huge events requiring extensive planning and coordination because they involve many dependencies. This is a direct result of the infrequent release schedule.

Thus, infrequent, large releases can be more costly than frequent, small ones, primarily because the latter reduce complexity and dependencies.

I used this insight to explain to the insurance company how deploying frequently can actually lead to more stability. I compared their stability graph to the one from the online poker site:

![Deploy often](/img/Deploy%25252520often_thumb%2525255B1%2525255D.png)

Their reaction?

> "Aha – their production environment was never stable, then."

While it’s true that the online poker site's environment wasn’t perfectly stable, their goal was to deliver working software consistently, not to achieve absolute stability. The key takeaway is that frequent deployments can lead to a more agile, responsive development process.

Of course, transitioning to such a model takes time. The poker site had been working on their continuous deployment for two years. However, the journey itself brings significant benefits, such as reducing dependencies and automating manual processes.

## Conclusion

I firmly believe that smaller, more frequent deployments are better than large, infrequent ones. Many organizations are not set up to support this, as noted in [Conway's Law](http://en.wikipedia.org/wiki/Conway's_law), but striving for smaller releases is always a worthwhile endeavor.
