---
layout: post
title: What BDD is all about
date: 2012-06-14T06:49:00.001Z
author: Marcus Hammarberg
tags:
  - BDD
  - Life of a consultant
  - Agile
  - TDD
modified_time: 2012-06-14T06:49:18.169Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-9079199862341884847
blogger_orig_url: https://www.marcusoft.net/2012/06/what-bdd-is-all-about.html
---

I got an email from a colleague a couple of weeks back. We were members of the same team for awhile this last autumn. He (and the rest of the team) are great programmers - way better than me. I had some difficulties to keep in step with them, but to some extent that had to do with [F#](http://msdn.microsoft.com/en-us/vstudio/hh388569.aspx) being the language of choice. A first for me!

We had a lot of discussions about [TDD](http://en.wikipedia.org/wiki/Test-driven_development) and if it's feasible or pay off. This project made me realize that TDD done backwards (writing unit tests after the production code) is not only NOT TDD but also doesn't pay off.  But as I am dunked deeply in the BDD pool I suggested that we've take a look at that and get started that way. I never got through there...

So I was very happy when he wrote me an email with a link to [an article](http://devblog.cloudreach.co.uk/2012/05/behavior-driven-development-in-net.html) that talk about doing BDD with [SpecFlow](http://specflow.org/) and [White](http://white.codeplex.com/). The question was simply; Is this how BDD is done?

This was a temptation that I couldn't resist... I thought I'll drop the answer in here too.

"Dear anonymous colleague,

Firstly [that article](http://devblog.cloudreach.co.uk/2012/05/behavior-driven-development-in-net.html) talks a lot about tools ([SpecFlow](http://specflow.org/), [NUnit](http://www.nunit.org/) and [White](http://white.codeplex.com/) in this case) and they are all great tools and I think he sketch out a good process as well. But here's the thing - BDD is not about tools!

I'll say that last part again; **BDD is a communication tool and is not about the tools**.

Oh the obsession of tools in our business! So many wrong turns we take because of that. We so quickly want to jump to How to do stuff without knowing much about What to do and not caring at all about Why we are doing it in the first place.

There is really no reason to use [Gherkin](https://github.com/cucumber/cucumber/wiki/Gherkin) and tools like [SpecFlow](http://specflow.org/) if the only one that cares is developers. If it's only developers that is going to write, read and understand the scenarios you are probably better off using NUnit straight up. Talk to devs in dev speak - code! Gherkin and SpecFlow is used to discuss, experiment and clear out misunderstandings and things that are unclear earlier in the process than you traditionally do.  You talk in concrete terms about the systems functionality before you've written any code.

That said the tools have it's place - a win is that you can use the scenario (to talk Gherkin syntax) and execute it against the system. That gives you both a clear specification, a test of the functionality and a definition of done for development. You only have to fulfill the scenario - code to that works. That is enough. For now.

The test ability can also be used to catch regression problems and make sure that as we developing new features we don't break stuff that used to work.

Finally will the scenario describe how the system ACTUALLY works. It's a great, living documentation. Compare that to any written documentation that describes how the system SHOULD work.
Reminds me of a story when I got the documentation for a system I was going to code against. The developer (may his name go unknown through this story) was super proud over the quality of the system documentation;

> Marcus - this documentation is really really up to date. It's almost exactly what the system actually does...

And it was great. I'd say that 97% of it was right. Problem was that I didn't knew which 3% that was wrong... So it was not much use to me.

To sum up - yes that article is a describes a way to do BDD - but thats only the first section. The rest is about tools. And they don't matter as much. BDD is about talking to each other - which is best done without tools.

Read more (and better probably) here: [http://dannorth.net/introducing-bdd/](http://dannorth.net/introducing-bdd/), [http://dannorth.net/whats-in-a-story/](http://dannorth.net/whats-in-a-story/).

Thanks for giving me the opportunity to write this. I had to think hard, as I knew that bright guys like you are going to read this.
