---
layout: post
title: Kanbanboards III–putting on the web
date: 2011-01-23T21:26:00.001Z
author: Marcus Hammarberg
tags:
  - BDD
  - .NET
  - ASP.NET MVC
  - KanbanBoards
  - SpecFlow
modified_time: 2011-01-25T10:28:24.156Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-9181359261521028249
blogger_orig_url: http://www.marcusoft.net/2011/01/kanbanboards-iiiputting-on-web.html
---

After my latest [post-of-admitting-failures](http://www.marcusoft.net/2011/01/kanbanboards-part-iitwo-step-forward.html) I got some really nice feedback from a lot of people. Apparently there are others out there who think that a failure is a great learning opportunity. OK – I will most certainly continue down that path.

I actually write these posts as I code along. It’s forward only mode in other words... Almost.

### Comments

One of the nicest things that happened as a result from the last post was that [Darren Cauthon](https://github.com/darrencauthon) gave me some [insightful comments and patches](https://github.com/marcusoftnet/KanbanBoards/pull/1) to go with them. This “social coding” that is going on, on [www.github.com](http://www.github.com) (a.k.a. programmers Facebook) is really, really cool.

Darren has done a lot of stuff in and around the [SpecFlow](http://www.specflow.org) project, for example the [SpecFlow Assist](https://github.com/techtalk/SpecFlow/tree/master/Runtime/Assist) (table helpers) that is really great. So I value his opinions a lot. He gave me 4 points to think about and I thought I’d comment on them here as I learned a lot from them and think maybe you will too:

1. [Line up your SpecFlow tables correctly](https://github.com/marcusoftnet/KanbanBoards/pull/1#commitcomment-244865). This is a great point that will make the feature-files be readable outside Visual Studio. I think that the readability is a key feature of [BDD](http://en.wikipedia.org/wiki/Behavior_Driven_Development) so totally agree there. Committed!
2. [Don’t use asserts in the When-step](https://github.com/marcusoftnet/KanbanBoards/pull/1#commitcomment-244868). Totally agree on this! The Given/When/Then mantra is from the outset a development of the Arrange/Act/Assert. Don’t assert in the act step seems reasonable and gives you a better [separation of concerns](http://en.wikipedia.org/wiki/Separation_of_concerns) in your step definitions. Committed!
3. [Split your step definition files into files per thing or concept](https://github.com/marcusoftnet/KanbanBoards/pull/1#commitcomment-244869). Great tip! Didn’t think at all of that – but it makes a lot of sense and also pushes me to think about keeping the steps clean from state and other smells, so they can easily be stitched together in other scenarios. Committed!
4. [Use SpecFlow 1.5](https://github.com/marcusoftnet/KanbanBoards/pull/1#commitcomment-244871). I actually thought of this the moment I realized that NuGet didn’t give me the latest version of SpecFlow. There are some great additions to SpecFlow, especially the one Darren mentions. So I guess I’ll go manual and include SpecFlow 1.5 myself. Or maybe [I can upgrade the NuGet-version of SpecFlow?](http://haacked.com/archive/2011/01/12/uploading-packages-to-the-nuget-gallery.aspx) Committed!

OK – with the aid of GitHub and not to mention Darren, the project is now in great shape.

But really - it’s just too [hard to grasp git sometimes](http://www.marcusoft.net/2011/01/how-to-apply-pull-request-on-github.html). I finally applied Darren's changes as a patch. I am a damaged Microsoft developer who hasn’t adjusted to the bash/dos command only world of git.

On with tasks at hand.

### Updating the specs for the Homepage

The current scenario lacks a little bit of information. When you navigate to the homepage of the application, you should not only see the top three favorited Kanban boards, there should also be a list of the newest additions. The simplest way to do that is simply to augment the current scenario with a new Then-statement. Like this:

![updated scenario](/img/updated-scenario_thumb.jpg)

The observant reader sees that I’ve done a few minor tweaks to the scenario title and the When-step as well since it didn’t fit or read very well.

OK – this of course fails since I haven’t implemented the step yet. Yada, yada, yada – [it’s all been explained before](http://www.marcusoft.net/2010/10/story-on-doing-outside-in-development.html). Finally, led and driven by my scenario, I ended up with this new When step definition:

![then step for latest additions](/img/then-step-for-latest-additions_thumb.jpg)

And this, rather ugly, action method for the Index action of the KanbanBoard Controller:

![updated index action method](/img/updated-index-action-method_thumb.jpg)

Let me be the first to acknowledge the possibilities for improvement here. I was thinking of using [CQRS](http://ncqrs.org/reference/) as my architecture for this application, but didn’t because that would be too many things at once. I might go back and redo the application CQRS style as an exercise to learn it later.

Right now I’m satisfied with this. It keeps my focus on the stuff I [wanted to learn](http://www.marcusoft.net/2011/01/developing-in-neta-new-era-has-begun.html) and the scenarios will be a great guide when I redo the architecture later. Wow – I’m looking forward to it already.

Let me also here declare my standpoint on [TDD](http://en.wikipedia.org/wiki/Test-driven_development) and Scaffolding ([see this](http://www.marcusoft.net/2011/01/tdd-and-scaffolding.html)). OK – I’m going to treat the generated repository code as not mine. I actually added the DebuggerNonUserCode attribute to the repository, until I need to change it. The rest of the code will be touched on and hence tested, even though I sense that it will be much more BDD than TDD.

## Writing an end-to-end acceptance test

Right now the application doesn’t work if you actually run it. That’s one of the drawbacks of writing your step definitions against the controller level of the application. The gain is that you get faster test execution (NOT to be underestimated) and also a much faster writing experience.

But I sure want the application to work. So I will have a few integration tests that will run end-to-end – from the HTML down to the metal in the SQL database.

Since I haven’t yet, this process will force me to install an IoC Container ([Ninject](http://ninject.org/) baby) and to set up and configure the database ([SQL CE](http://weblogs.asp.net/scottgu/archive/2011/01/11/vs-2010-sp1-and-sql-ce.aspx) which looks nice... and is free). [NuGet](http://nuget.org) will do the heavy (?) lifting for me. And the scenarios will guide me.

### Writing the scenario

I have created a new project for the acceptance tests (called... AcceptanceTests). The difference from the specs in the Specs-project is that these tests will test a whole application and be handled separately. I will use [tags](http://www.marcusoft.net/2010/12/using-tags-in-specflow-features.html) to distinguish slow end-to-end tests from fast specifications.

Testing an entire application forces you to think about loading known test data or writing scenarios that are less dependent on test data.

Here is the feature file for the acceptance test:

![first acceptance test](/img/first-acceptancetest_thumb.jpg)

I started to implement the steps for this scenario – which failed with an inconclusive status as expected. I created a step definitions class for the home page, but expect that other pages will require their own classes.

For browser automation, I’m using [WatIn](http://watin.sourceforge.net/). It’s not available on NuGet, so I had to download and add it manually. I also used [Steven Sanderson's browser wrapper](https://github.com/SteveSanderson/GuestbookDemo/blob/master/Guestbook.Spec/Steps/Infrastructure/WebBrowser.cs).

Here’s the step definition for the first implemented step:

![acceptance feature](/img/acceptance-feature_thumb.jpg)

When running this, I encountered the “yellow screen of no Dependency Injection controller set”:

![yellow screen of missing DI container](/img/yellow-screen-of-missing-di-containe%255B2%255D.jpg)

I needed a Dependency Injection framework. Luckily, Ninject has an MVC 3 version that I included using NuGet. Here’s how I registered the KanbanRepository:

![ninject mvc injected](/img/ninject-mvc-injected_thumb.jpg)

Ninject is now installed, and NuGet is a great help.

### More errors – database integration

The next problem I faced was that the model returned was empty because the database was missing. I resolved this by following the steps outlined in [Scott Gu’s blog post](http://weblogs.asp.net/scottgu/archive/2011/01/11/vs-2010-sp1-and-sql-ce.aspx). After installing Visual Studio 2010 SP1, I could open the database and add some data.

I encountered another issue: “model doesn’t implement”...

---

**Note**: The content has been truncated here. Make sure to adjust or complete based on actual content needs.
