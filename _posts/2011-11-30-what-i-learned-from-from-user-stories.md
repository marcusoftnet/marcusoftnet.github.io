---
layout: post
title: What I learned from 'From User Stories to Acceptance Tests' with Gojko Adzic
date: 2011-11-29T19:27:00.001Z
author: Marcus Hammarberg
tags:
  - BDD
  - Specification by example
  - Agile
modified_time: 2011-11-29T21:34:36.362Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-7973153048578917460
blogger_orig_url: https://www.marcusoft.net/2011/11/what-i-learned-from-from-user-stories.html
---

I've just returned home from a course, marking my first training in over a year. It’s amazing how much you can learn in such a short time when the course and instructor are both excellent and you actively engage. This time, the course was led by [Gojko Adzic](http://gojko.net/), covering a subject I find both fascinating and valuable: [Specification by Example](http://specificationbyexample.com/).

Though it's impossible to capture all the insights from two days of learning, I want to highlight the key takeaways and main points that stood out for me. As someone well-versed in BDD and Specification by Example, my goal was to gain practical tips on managing the early stages of specification, focusing more on the practicalities than the theoretical aspects.

## Communicating with Examples

We began with a simulation of a Black Jack game to explore the pitfalls of traditional testing approaches. Our group fell into common traps: poor communication, lack of customer involvement, and a focus on implementation details rather than business value. We quickly realized that traditional methods could lead to misunderstandings and inefficiencies.

From this exercise, we learned that concrete examples are crucial in clarifying requirements. Applying examples to our requirements helped uncover numerous inconsistencies. Two effective exercises for creating examples as a group stood out:

- **Diverge and Merge**: Groups work separately on the same example and then come together to compare and learn.
- **Feedback Exercise**: Similar to [Planning Poker](http://en.wikipedia.org/wiki/Planning_poker), where each participant writes down expected outcomes for a case and then compares results.

The objective is to build a shared understanding of the problem, using examples to document and communicate requirements effectively.

### Key Process Patterns of Successful Teams

This section reinforced much of what I already knew, thanks to prior readings and presentations on the topic. However, I still gained new insights:

- Successful teams using Specification by Example are collaborative and use examples effectively.
- Focus on a few key examples (10-15) rather than trying to cover everything.
- Validate key examples thoroughly by testing their robustness.

We also discussed collaboration patterns:

- **All-Team Workshops**: Ideal when stakeholders are available, or when exploring new ideas. However, they can be costly.
- **Three Amigos**: A Business Analyst, Developer, and Tester work together in a mini-workshop. Useful for mature products where the team has some domain knowledge.
- **Ad-Hoc Conversations**: Quick, informal discussions for teams familiar with the product.
- **Write + Review**: Draft specifications and have them reviewed, suitable for distributed teams.

### What Makes a Good Specification

This was a highly enlightening part of the course. We analyzed numerous examples to identify what constitutes a good specification. Key attributes of effective specifications include:

- A descriptive title, easily searchable.
- Context for the example's execution.
- No technical jargon or implementation details.
- Conciseness and precision.
- Clear separation between test structure and examples ([Scenario Outline for Cucumber](https://github.com/cucumber/cucumber/wiki/Scenario-outlines)).
- Inclusion of boundaries and multiple examples.
- Use of business language and appropriate abstraction level.
- Clear, measurable expectations.

Additional tips:

- Avoid workflow scripts and focus on what should be tested, not how.
- Rephrase technical details into business functionality.
- Validate examples by sharing them with others to ensure they are understandable.
- Use the description of the test as a guide to read and understand examples.

### Fitting into a Development Process

This section covered case studies of how teams have integrated Specification by Example into their processes. Key takeaways include:

- Prepare key examples before planning meetings to streamline the process.
- Address unknowns early and consider working a sprint ahead.
- Obtain only high-level acceptance criteria from busy BAs.
- Emphasize collaboration and shared understanding over who writes the specification.
- Define tests early and foster a collective ownership mindset.

### Adoption Strategies and Patterns

Introducing these concepts often involves overcoming resistance to change. Gojko shared three strategies for effective adoption:

- **Change the Team Culture**: Foster a culture of collaboration and trust, focusing on delivering business features.
- **Remove Waste**: Make specifications precise early on to streamline the process and avoid unnecessary documentation.
- **Facilitate Change**: Make examples the primary source of information, documenting business processes without over-reliance on tools.

### Conclusion

This post is a summary of my learning experience from the course. I hope it provides valuable insights, even if it can’t capture all the nuances of the sessions. If you have any questions or need clarification, please feel free to ask!

Thank you again, Gojko, for an outstanding course. I learned a great deal and am excited to apply these insights.
