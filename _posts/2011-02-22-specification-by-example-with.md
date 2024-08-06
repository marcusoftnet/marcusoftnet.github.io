---
layout: post
title: Specification by Example with SpecLog – Some Initial Thoughts
date: 2011-02-21T19:55:00.001Z
author: Marcus Hammarberg
tags:
  - BDD
  - Tools
  - Agile
modified_time: 2011-03-07T12:35:53.078Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-1461423135737723573
blogger_orig_url: http://www.marcusoft.net/2011/02/specification-by-example-with.html
---

I have been talking about [BDD](http://en.wikipedia.org/wiki/Behavior_Driven_Development) or specification by example almost every day for a year and a half now. I still love the idea—executable specifications that everyone concerned can read, so you can talk about the behavior of the system before a single line of code is written. Yeah, you see, as soon as I start to write about it, it’s hard to stop.

Most people (or roles rather) react positively to this idea; developers love the possibility to get a detailed specification to start from, testers see great promises in automating the tests, and requirements people love the traceability features and the level of detail that you get before you start.

It’s the workflow or process that is the “problem.” How do we organize the work around this? Who writes those features? Where are they updated? I have [blogged about](http://www.marcusoft.net/2010/08/story-on.html) this [several](http://www.marcusoft.net/2011/01/specification-by-example-with-specflow.html) times before, but as I learn, I gain more insights into how this could be done.

This post examines a new tool to support the early stages of the lifetime of a user story with scenarios—the foundation in a specification by example process. The tool is called [SpecLog](http://speclog.org/) from [TechTalk](http://www.techtalk.at/) (as [SpecFlow](http://www.specflow.org) is). It looks promising—very promising indeed.

### Reflection

Please allow me to elaborate on something that I have been thinking about for a while. If you don’t want to, please skip ahead to the next heading. It’s probably just me…

I often get the feeling that I need to sell things like specification by example, [TDD](http://en.wikipedia.org/wiki/Test-driven_development), pair programming, Scrum, or other agile practices to the business. Why is that? Why hasn’t it—during the [10 years that agile has existed](http://10yearsagile.org/)—come from the business side? It’s always technology-driven.

It might have to do with the fact that all the original signees of the [Agile Manifesto](http://agilemanifesto.org/) (as far as I know) are techies…

It’s not a big problem per se, but it’s getting slow to always push the way we work. Often, in big organizations, I’m met with a head-tapping “Yeah, you do that… development guys, if you want to work in short sprints—go ahead” and then 5 years later the other parts of the development process (requirements, test, deployment) wake up and tag along.

Wouldn’t it be refreshing with an initiative from the business side, or the deployment for a change?

Ah—now that I’ve got that (probably erroneous idea) out of my system, back to one of the areas where this has certainly happened.

### The Specification by Example Process

The idea of using specification by example (or BDD if you like) is that you meet and discuss a feature that is to be implemented. That discussion is captured in concrete examples that can be automated and run against the system to verify the state of the system.

Of course, that means you need to have some (in many cases, a lot of) knowledge about the feature you’re about to discuss. So most certainly, the requirements people meet with customers, users, and other stakeholders and write a lot of documentation to capture the system, the business goals, and the benefits that the system will have for all actors.

There might be other work that needs to be done before you can write scenarios even for Development or Test and other roles. But, quite naturally, most work needs to be done in order to capture the functional requirements of the features of the system.

All the background needed is brought to a meeting in which a feature is discussed, and a feature with scenarios (concrete examples of the usage of the feature) is agreed upon. I often use this picture to show people what I mean:

[![Specification workshop](/img/%5%255Bspecws1%255B2%255D_thumb%255B3%255D.jpg)

### Hey? What About the Customer?

Any true [agilista](http://www.urbandictionary.com/define.php?term=Agilista) or BDD practitioner has now stopped reading. Where’s the customer in that picture? Why not talk to her directly?

Well—in my (humble) opinion, big organizations seldom involve the user or customer in the requirements process. Or even before the system is built. They are sometimes involved in the testing, but I haven’t seen a user in years. I envy the people who have direct contact with them and can get firsthand information, but I haven’t.

Also, herein lies a bit of confusion. BDD has a firm grip in the [Ruby on Rails](http://rubyonrails.org/) community, which has brought us great tools such as [RSpec](http://rspec.info/) and [Cucumber](https://github.com/aslakhellesoy/cucumber/wiki/), which SpecFlow is a port of, for example. But that community often does websites. And, as it seems, has more direct interaction with their customers. I haven’t had the good fortune to be involved in a project like that.

When an insurance system is to be built, you seldom get the requirements from the end user. They are rather discussed and decided by business analysts, domain architects, and requirements specialists.

So when a picture and process like the one above is presented, it comes across as a bit simplified at first. But I think it can be useful and used even in such environments. And that’s where I live, so I describe it as I see it.

### But… Who’s Writing That Stuff?

Well, this is one of the most common questions and discussions I get into. It goes something like this:

Me: “yada yada yada [for an hour]… and that’s how specification by example can be done!”

Them: “Way cool! And you know what? Then the requirements people could write those scenarios themselves.”

Me: “Well… but…”

Them: “No, really. That would be so cool. They write down the executable specification and then the developers just need to fill it out.”

Me: “I’m not sure that it will…”

Them: “Why not? Then we don’t even have to meet. It’s just a contract that needs to be fulfilled.”

I made up that last sentence, but all others have been said. By me at first… And admit that the idea sounds somewhat compelling—the customer writes the scenarios.

> But that is missing the point completely—the key thing was that you got together and put down your shared understanding of the problem! That’s what makes [specification by example](http://specificationbyexample.com/) so powerful.

Who is writing the scenarios down is secondary—at least. I would even argue that it’s best done by a technician since you then can think about the “technical” stuff in [Gherkin](https://github.com/aslakhellesoy/cucumber/wiki/gherkin) such as [step reuse](http://www.engineyard.com/blog/2009/15-expert-tips-for-using-cucumber/) (#9), [scenario outlines](https://github.com/aslakhellesoy/cucumber/wiki/scenario-outlines), and [using backgrounds](https://github.com/aslakhellesoy/cucumber/wiki/Background) etc.

Now, don’t get me wrong—it SHOULD still be readable and understood by everyone in the team, but it should also be maintainable and not get out of control as the system grows.

### You Mentioned a Tool in the Beginning?

So my feeling is that the support for writing Cucumber-style features, executing them, and getting reports is very good on the .NET platform. I like SpecFlow, but you could also look into [Raconteur](http://raconteur.github.com/) or [Concordion.NET](http://concordion.org/).

But, in my suggested workflow above, there’s a lot of work that needs to be done before you’re at a level to start writing the concrete scenarios in the examples down.

There are different approaches to do this; [user story mapping](http://www.agileproductdesign.com/presentations/user_story_mapping/index.html) or [actor goal](http://tynerblain.com/blog/2008/06/09/use-case-to-actor-mapping/) to mention two. But the tooling has often been stickies and whiteboards (which is not bad at all, but not a computer tool per se). And the connection between that work and the formalized feature and scenarios in Gherkin.

### SpecLog

... until now! SpecLog ([www.speclog.org](http://www.speclog.org)) aims to bridge this gap—and focus on the early stages of a user story. Long before it’s even a user story, actually. The tool is still in the early phases, but I see a lot of stuff that I like already. For starters—it’s good looking:

![Example workspace in SpecLog](/img/example%2520workspace%2520in%2520speclog_thumb.jpg)

Just imagine how boring this design could have been (think [TFS Work item editor](http://www.codeguru.com/dbfiles/get_image.php?id=18481&lbl=PART_1,_FIGURE_4_-_WORK_ITEM_PNG&ds=20110207) and you get an idea). This workspace, move-things-freely approach feels great and fosters an atmosphere of creativity, I think. My thoughts go directly to one of the core principles of [Kanban – Visualize work!](http://www.kanban101.com/)

Okay—it looks good, but is it functional? Well, as always with products like this, it’s really hard to test them by yourself. The whole idea is to use this as a team tool, and that’s where it’s most useful. So I list the things I like and don’t so far (second release, I have checked it out... barely) and then let you be the judge.

It’s a 1.0 so it’s a real release and works very well indeed. But it’s still early and leaves some holes that will be filled later.

#### Likes

- Supports a variety of ways to work and doesn’t force a process on you.
- Very informative website that talks a lot about the concepts behind the product. Great!
- Love the concept of workspaces that you can arbitrarily group your requirements on/in. You can even display the same requirement on several workspaces.
- Great connection possibilities between the requirements and any checked-in scenarios written in Gherkin.
- Possibility to write acceptance criteria separated from the actual Gherkin file (which you can link to). This means that, if you want to, you can write the acceptance criteria or scenarios and then formalize these as scenarios in Gherkin.
- Every template that is used can be customized to your needs (Swedish, for example). That’s just great—and follows the way of Cucumber very well. The editor is a bit... rough but that doesn’t matter.

#### Improvement Points

- I would love to be able to create refinements directly on the workspace, maybe by just dropping one on the other.
- Better visualization of the relationships between requirements on the workspace area...
- For big systems, I suspect that the search capabilities need improvement (saw something on Lucene in later releases, that’ll fix that...)
- Even if I don’t want to generate my Gherkin content from the acceptance criteria (and I don’t!)—I would love to create the Gherkin file and get the user story injected, etc. Create my Gherkin skeleton.
- Even though the website is great, I miss some manual for the product itself. The [videos are great](http://www.speclog.net/watch/) but I stumble on details (see below).
- When I try to link a file, I get an error message that says something like “Linking Gherkin is only supported when you’re using a shared repository with a version control system.” Okay... I cannot do this in a single file—that’s alright. But when I try to hook into one, it seems like I need to hook into a server of sorts. Could I try this on my own computer? What if I want to use Git (or GitHub)? Hmmm—this is strange—I probably miss something here...
- It [costs money](http://www.speclog.net/buy/)... Well, being an OSS buff, I needed to throw that in there. But I can understand it. For now.

### Conclusion

When I talk about agile requirements, I have a slide that says:

> “It’s not in the tool”

Meaning; it’s much more important to meet and talk (hmmm... [where have I read this?](http://agilemanifesto.org/)) about these things and get a common understanding than to have a great tool. But when you do that (meet and talk), you will soon need to stick that information somewhere. And when you start to automate scenarios, you soon need to keep a chain of work unbroken.

SpecLog looks very promising indeed—I would not be the least scared to recommend it to my clients already in this early stage. But I would have some serious talks with them first about the agile requirements and testing process they will use.

See you later, SpecLog—I promise.
