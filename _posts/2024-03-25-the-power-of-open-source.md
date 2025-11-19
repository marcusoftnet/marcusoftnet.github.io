---
layout: post
title: "A small open-source story"
author: "Marcus Hammarberg"
date: 2024-03-25 08:00:00
tags:
  - Agile
  - Tools
  - SpecFlow
  - BDD
---

Back in 2010, I was very interested in BDD (Behavior-driven Development) as a stepping stone into agile testing-thinking as a general great tool to foster better conversations.

Since I was working on the .NET platform I naturally looked at [SpecFlow](https://specflow.org/) which was very much in its early days back then.

Those two interests, in hindsight, might have been the most important things in my programming career.

I wanted to write this, not to boast (because it's not much to boast about honestly), but to inspire and celebrate the amazing ingenuity and drive of our community.

<!-- excerpt-end -->

## Background - what is SpecFlow

SpecFlow is the .NET spheres clone of [Cucumber](https://cucumber.io/) that allows human language specifications to be connected to code. This is a small but vital step to bridge the communication gap and make this type of specification executable.

```gherkin
Feature: Guess the word

## The first example has two steps
Scenario: Maker starts a game
  When the Maker starts a game
  Then the Maker waits for a Breaker to join

## The second example has three steps
Scenario: Breaker joins a game
  Given the Maker has started a game with the word "silky"
  When the Breaker joins the Maker's game
  Then the Breaker must guess a word with 5 characters
```

For each step, we can now attach some code that performs this action. Et voilà - executable specifications that break if the underlying code changes.

But from experience, I can tell you that the real value lies in having conversations about concrete examples (`the word "silky"` and not `a word`) within the team is the real power of BDD.

## My SpecFlow history

Pretty soon after I started to look into SpecFlow I was involved in a project at a big Swedish insurance company. They had a partnership with Microsoft but didn't know how to utilize it properly. They sent a consultant to our team to see if we could make use of it.

We couldn't but through his special knowledge, he and I managed to put together the first version of Intellisense for SpecFlow. Helped anyone authoring SpecFlow scenarios to discover steps and even create new ones.

I sent a pull request to [SpecFlow](https://github.com/SpecFlowOSS/SpecFlow) and was beyond myself with happiness when I got it accepted, but later rewritten for a more general fit. I had contributed something useful to a tool that I loved and used.

Through this involvement I [met](https://www.linkedin.com/in/gasparnagy) [amazing](https://cucumber.io/blog/authors/aslak/) [people](https://www.linkedin.com/in/darrencauthon/) learned a lot, I [wrote a lot](https://www.marcusoft.net/tags/#SpecFlow) and I even got to speak at one of the places that I [highly respected SkillShare](https://skillsmatter.com/)

I helped a little bit in creating a nice documentation generator that generates a site, .docx, or .pdf from the SpecFlow features. [Pickles](https://docs.picklesdoc.com/en/latest/) was cool at the time.

I even created a little helper tool that I hoped would help the community - [SpecFlow.Assist.Dynamic](https://www.nuget.org/packages/SpecFlow.Assist.Dynamic/). At the time it was just I wanted to see if it could be done at all in .NET, but I also wanted to learn a bit about how to publish an open source tool.

## Today

For several reasons, I moved away from .NET stuff and started to do Node and agile coaching stuff. Much of the SpecFlow things were dormant. I did some occasional bug fixing for SpecFlow.Assists.Dynamic but mostly left it as it was.

Last week I happened to click a link in my bio and ended up on the [NuGet page for SpecFlow.Assist.Dynamic](https://www.nuget.org/packages/SpecFlow.Assist.Dynamic/). And my mind was blow-away:

![SpecFlow.Assist.Dynamic stats](/img/specflow.assist.dynamic.stats.png)

The tool has been downloaded 4.1 million (?!) times in total. Not only that - there are [blog posts](https://medium.com/capgemini-microsoft-team/specflow-a-few-tips-n-tricks-part-2-f1bad5fa4260) and [videos](<https://www.youtube.com/watch?v=SjEbPftoMO0> describing how to use it). People are using, and getting value from my little tool - years after I stopped caring much about it.

SpecFlow has truly grown and become a company that promotes BDD and not only SpecFlow itself.

## Summary

I came home and showed this number of my kids. They immediately wanted me to add ads or monetize the success. But I tried to explain that `That is not how open source is done`

Open source is the backbone of our industry. Many many packages around the eco-system are created and maintained by one or just a few developers.

You can be one of them. You could create a package that scratches your itch, or (as in my case) complements an existing package. It might be just you using it or it might end up being used by millions across the world.

I want to emphasize that I'm not a good role model for open-source maintainers. In fact, I'm probably a good example of a bad maintainer. You can do this much better than me.

But the most important part is `you can`.
