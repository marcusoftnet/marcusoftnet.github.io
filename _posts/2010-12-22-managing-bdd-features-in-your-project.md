---
layout: post
title: Managing BDD features in our project (using TFS)
date: 2010-12-21T19:17:00.005Z
author: Marcus Hammarberg
tags:
  - BDD
  - .NET
  - Life of a consultant
  - TFS
  - Agile
  - SpecFlow
modified_time: 2011-01-13T20:18:53.615Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-6919193304724604886
blogger_orig_url: https://www.marcusoft.net/2010/12/managing-bdd-features-in-your-project.html
---

From time to time I find myself in the position where I ask “stupid” questions. I’ve found that it’s often the case that the question is not that “stupid” after all and if it is you get to learn a lot in the process. I have never been verbally abused, flamed or laughed at for my questions – which often are the reasons that people don’t want to ask “stupid” questions. So recently I’ve been asking “stupid” (final time I use that word in this post, promise) questions surrounding the management of features (.feature-files for us [Cucumber](https://github.com/aslakhellesoy/cucumber/wiki/) freaks). And at the same time I've been searching high and low on the net for best practices on how to manage your features through the course of a project. I didn't find much due to a couple of reasons:

- The Ruby/cucumber inheritance of .NET tools such as SpecFlow is great - you can learn a lot(!!) from that community. But there is not much written on BDD project management in .NET. Also the whole Ruby environment is very different from the typical .NET setup. This allows for other kinds of solutions.
- I was asking the wrong question. My initial thoughts were centered on how to get the business side responsible for the features and the writing of them. Wrong! More on that below.
- There might not yet be a best practice surrounding this for .NET projects using TFS. We're still catching up with the BDD community in general.

So on to my suggestions. How do I manage BDD features in my project (using Team Foundation Server (TFS))?

### Managing

What is the deal with this? As I introduce the concept of [Specification by Example](http://specificationbyexample.com/) to business people, they always ask me about these things:

- “How do we link this to our current project templates?”
- “What about traceability in our electronic tracking system?”
- “I want to follow the whole chain from vision to maintenance and bug reporting in TFS. How can your BDD features hook into that?”

I personally might not put so much emphasis on this, but it might be important to big organizations to have this unbroken chain of traceability in an electronic system such as TFS. But I think this was what led me off the agile, collaborative track for a while. I don’t think it’s impossible to achieve, but I think it might not be the tracking system that is the master of the feature-data. More on that below.

### [BDD](http://en.wikipedia.org/wiki/Behavior_Driven_Development) or Specification by Example

A phrase I’ve heard a lot when reading about Specification by Example is “It’s not in the tool”. That tells us that the tool is not the solution. But what is then? Collaboration is the solution. It’s [no silver bullet](http://en.wikipedia.org/wiki/No_Silver_Bullet) – but it comes close, very close.

What this means is that the real benefit from using the agile methodology of BDD is that you meet all the people involved in realizing a feature and write down how you expect the feature to work in a language that all of you understand. Using examples that later can be used to test that the application behaves as expected. That’s the thing! There are tools that help you to drive that process and run your scenarios, but that’s not nearly as important as the fact that you meet and write the scenarios down, together.

### Features

So that leads us to the features. What are those? What do they represent? And who writes them? A feature is a behavior in the system that some person (or role) benefits from (see [Introducing BDD by Dan North](http://blog.dannorth.net/introducing-bdd/)). Often they are written in the form of [user stories](http://en.wikipedia.org/wiki/User_story) since that practice and form capture the three elements in a very concise format:

> **As a** \[X\]
> **I want** \[Y\]
> **so that** \[Z\]

Who writes the stories then? It’s easy to think that this is a business/requirement thing. But as a [great answer](http://groups.google.com/group/behaviordrivendevelopment/msg/e8b983ae5b433b99) to [my question](http://groups.google.com/group/behaviordrivendevelopment/browse_thread/thread/c75ec1255a34a5a6/e8b983ae5b433b99?#e8b983ae5b433b99?), [great authoritative resources](http://cuke4ninja.com/sec_collaborative_feature_files.html), and even [links off old post of mine](http://blog.jonasbandi.net/2010/05/bdd-antipattern-business-readable-but.html) show, that misses the point of BDD. You want to write the features and their scenarios together as I wrote above.

A bit like this maybe:
![specification workshop](/img/specws.jpg)

(Short side note – I actually was on to that track in an [earlier post](https://www.marcusoft.net/2010/08/story-on.html) also, which I hope lessens the stupidity of my question and reasoning a bit).

In the picture above we see that the roles needed to grasp the story meet, bringing all the documentation of the work they have done up to now and record their common understanding of the problem in a feature with scenarios. They write the feature together. In the [answer to my question on the BDD list](http://groups.google.com/group/behaviordrivendevelopment/msg/e8b983ae5b433b99) another view was also suggested:

> “Cucumber features are an executable map of the current functionality of the system”
> “The output of running cucumber features is something you can keep. You can say at this time that system was like this.”

I like this idea a lot! (Thanks [Andrew Premdas](http://blog.andrew.premdas.org/)). In a way this means that the content of the .feature files are like source code that can be run to see how well the system fulfills the current requirements. So in short – you meet and write the features down together. Probably this can be sketched out during the meeting and nailed by somebody later (to better match existing steps or to keep the language consistent for example). The feature is then checked in with the source code as it can be executed to produce a map between our common understanding of the requirements and how well the system fulfills them.

### Associate with work item in TFS

Now we can see how to associate the feature we write together with a work item in TFS. The link between the two can be achieved two-way like this:

- In the .feature file you can [tag](https://www.marcusoft.net/2010/12/using-tags-in-specflow-features.html) the feature or scenario with the work item ID, @TFS_432453 for example. That can be used to search for the item among your scenarios and to control which items are run again ([see this post](https://www.marcusoft.net/2010/12/using-tags-in-specflow-features.html)).
- You can also use a comment with a link to the work item on the TFS Server. For example, this link ([http://tfs:8080/tfs/WorkItemTracking/Workitem.aspx?artifactMoniker=68717](http://tfs:8080/tfs/WorkItemTracking/Workitem.aspx?artifactMoniker=68717)) will take me to the WI 68717 on the TFS website. When the .feature file is created, associate it with the work item of choice (for example, a work item with some relevant documentation attached to it) just like you do with any other check-in.

### Suggested workflow

An example of how this can be worked into a workflow of a feature would be this:

When the item is about to be developed, gather the required people and skills that you need to formulate the scenarios of the item. This would typically be the sprint planning meeting or an analyze step on a Kanban board.

Sketch down the feature and a couple of scenarios. There’s a lot to be said about this (see [http://www.cuke4ninja.com/](http://www.cuke4ninja.com/) for some good advice and directions), but all the roles need to have their say and input in how to formulate the scenarios so that:

1. Requirements get all the important business rules and effects into the story.
2. Developers might think of edge cases and some special cases.
3. Testers get the coverage and spread of test data that is needed.
4. Maintenance gets their say on how the function behaves, etc.

Get one person to write down the story in a .feature file, do the check-in and associate the .feature with the required work items.

As work is commenced, the different steps will give the developers a possibility to work outside-in and complete the feature step-by-step.

When new knowledge arises (as it always does), that can easily be incorporated into the feature by updating and changing the scenarios, of course after communicating within the team.

Likewise, when testing is done, new scenarios and new data might be added to further enhance the story. The use of [tags](https://www.marcusoft.net/2010/12/using-tags-in-specflow-features.html) can be used here to differentiate between the different tests and when to run them.

### Conclusion

I am sure that I will find some better way to do this as we go along, but this is the way we do it now, and it works quite nicely and also fulfills the need of connecting the agile workflow of Specification by Example with TFS.
