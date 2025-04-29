---
layout: post
title: Agile Testing – Reflections from an Excellent Elevate Evening
date: 2009-11-13T10:57:00.001Z
author: Marcus Hammarberg
tags:
  - Life of a consultant
  - Agile
modified_time: 2009-11-13T10:57:28.121Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5694135538797434709
blogger_orig_url: https://www.marcusoft.net/2009/11/agile-testing-some-thoughts-after.html
---

Last night’s [Elevate](http://blog.avegagroup.se/elevate/) event was another impressive showcase of the diverse knowledge within [Avega](http://www.avegagroup.se). The focus was on Agile Testing, a topic that has often confused and frustrated me. I’ve struggled to implement effective agile testing practices in the teams I’ve led. Here are some of the challenges I've faced:

- **No Testers and No Testing in the Team**: This approach led to a traditional waterfall-like process with a separate testing phase after development. We missed out on the benefits of agile methodologies.
- **Testers in the Team, But Not Doing Agile Testing**: When testers were included, they still followed company policies, which meant extensive documentation and test planning for each minor change. This approach proved inefficient.
- **Testers Testing Only Sprint Work**: In this setup, testers only tested the features developed during the sprint, with an acceptance test phase every 4-5 sprints. While this was better, it still led to stress and inefficiencies, especially with regression testing.

I was eager to learn how to address these issues effectively. The lightning talks at the Elevate evening provided valuable insights, even though I missed the [Open Space Technology](http://en.wikipedia.org/wiki/Open_Space_Technology) sessions.

Three key themes emerged from the talks:

- **Team Commitment to Testing**: Emphasize that testing is a team responsibility, not just the role of dedicated testers. This approach aligns well with the next point.

- **Definition of Done**: Include testing in the definition of done. For instance, "We’re not done until the feature is tested." If developers aren't engaging with testing, consider having testers “take a break” for a sprint to encourage developers to step up.

- **Invest in Automation**: Successful agile teams often use automated regression tests. Tools like [Selenium](http://seleniumhq.org/) are useful for this purpose. Manage test scripts as you would any other code, incorporating them into your continuous integration or daily build processes.

Adopting a definition of done such as:

> “A story is done when it has a passing automated regression test.”

will bring several benefits:

- It ensures the system is testable, with the ability to write tests against services and create test clients as needed.
- Regression tests can be developed even before the code is complete.
- A comprehensive suite of automated tests can provide ongoing feedback about the project’s health when integrated into daily builds or continuous integration processes.

Overall, it was an enlightening evening. Thanks to everyone who contributed—I’ve got a lot to think about and implement!
