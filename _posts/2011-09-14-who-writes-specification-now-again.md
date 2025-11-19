---
layout: post
title: Who Writes the Specification, Now Again?
date: 2011-09-13T17:30:00.001Z
author: Marcus Hammarberg
tags:
  - Specification by example
  - Agile
modified_time: 2011-09-13T20:16:34.263Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-4387080625349899534
blogger_orig_url: https://www.marcusoft.net/2011/09/who-writes-specification-now-again.html
---

There’s been a lot of buzz around [Specification by Example](http://specificationbyexample.com/) lately, especially in my circles. Recently, I was asked to introduce the topic to a group of interested individuals. Interestingly, the conversations I encounter are predominantly among business analysts, testers, and not just developers.

A common question that often comes up is:

> *Who writes the specifications? Business people, developers, or testers?*

The underlying intent behind this question seems to touch on issues of ownership and collaboration. Drawing from my experience in a recent project and insights from [Gojko Adzic’s book](http://gojko.net), I’d like to share my perspective on this.

## Key Process Patterns

Gojko Adzic outlines seven "key process patterns" in his book on Specification by Example. These patterns are essential practices that contribute to successful implementations of Specification by Example:

1. **Deriving Scope from Goals** – Establishing the scope of a feature or iteration based on business goals.
2. **Specifying Collaboratively** – Developing specifications through collaborative discussion.
3. **Illustrating Using Examples** – Clarifying intent with concrete examples instead of abstract language.
4. **Refining the Specification** – Ensuring that specifications are concise, consistent, and adhere to agreed-upon best practices.
5. **Automating Validation Without Changing Specifications** – Using tools to validate that the system meets the specifications.
6. **Validating Frequently** – Running executable specifications frequently to get quick feedback.
7. **Evolving a Documentation System** – Organizing and maintaining executable specifications for ongoing use.

### Who Writes the Specification?

Here’s how the question of "who writes the spec?" relates to these patterns:

#### Specifying Collaboratively

The specification process should be collaborative. This involves the entire team or small groups representing various disciplines. For example, a workshop format with the whole team can be effective, or smaller feature teams might write specifications directly into automation tools.

This collaborative approach helps gather diverse perspectives, with business users focusing on business needs, developers on implementation feasibility, and testers on test coverage.

**So, in this aspect, the answer is: The Team does!**

#### Illustrating Using Examples

When creating examples, a single person's perspective can limit creativity and comprehensiveness. A team-generated set of examples benefits from collective knowledge and creativity.

**Thus, for illustrating using examples, the answer is: The Team does!**

#### Refining the Specification

Refinement involves tweaking the specification to match best practices and language conventions. This often requires technical tools and skills, such as using [SpecFlow](http://www.specflow.org) with Visual Studio for syntax highlighting and formatting.

While business users may struggle with these tools, a technical person usually handles the refinement process. However, it is crucial that they validate changes with the team to ensure the original intent remains intact.

**Here, the answer is: Someone with enough technical knowledge for the tool does, but the Team has the final say!**

#### Automating Without Changing the Specification

Automating specifications involves writing code to ensure that the system behaves as specified. This task is technical and often requires a developer or technical tester.

**For this pattern, the answer is: A developer or a technical tester does.**

### Conclusion

The question of who writes the specifications reflects a departure from traditional practices where specialists create specifications that are then handed off. Specification by Example promotes a more integrated approach, enhancing collaboration and ownership across the team.

By involving the entire team in creating and refining specifications, and ensuring that automation aligns with these specifications, teams can achieve more accurate and effective results.

I hope you find these insights helpful as you explore Specification by Example.
