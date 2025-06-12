---
layout: post
title: Developing in .Net–a new era has begun
date: 2011-01-13T20:11:00.001Z
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
  - Kanban-boards project
  - Agile
modified_time: 2011-02-05T20:13:11.775Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5907964016203666193
blogger_orig_url: https://www.marcusoft.net/2011/01/developing-in-neta-new-era-has-begun.html
---

### News

The other day I just realized how much has changed in the way we develop code nowadays. Well, it might just be me, but there have certainly been some major changes in the .NET development arena.

I don’t claim this to be in the right chronological order, but here are some major milestones for me:

- [TDD](http://en.wikipedia.org/wiki/Test-driven_development) – didn’t use just 2 years back
- [BDD](http://en.wikipedia.org/wiki/Behavior_Driven_Development) – finally get the [requirements and tester into the agile loop](https://www.marcusoft.net/2010/10/story-on-doing-outside-in-development.html) and an opportunity to [work outside in](https://www.marcusoft.net/2010/10/story-on-doing-outside-in-development.html), which feels just right for me. My favorite tool right now is [SpecFlow](http://www.specflow.org).
- [LINQ](http://msdn.microsoft.com/en-us/netframework/aa904594) – totally changed the way C# ([VB.NET still sucks at LINQ if you ask me](https://www.marcusoft.net/2010/02/vbnet-considered-harmful.html)) looks.
- [ASP.NET MVC](http://www.asp.net/mVC/) – a web framework that makes sense and that you can test. I understand again.

And now the other day (the day of the many updates as it might well be known), [Microsoft released a big load of new updates](http://weblogs.asp.net/scottgu/archive/2011/01/13/announcing-release-of-asp-net-mvc-3-iis-express-sql-ce-4-web-farm-framework-orchard-webmatrix.aspx). Here’s what I find most interesting:

- [NuGet](http://nuget.codeplex.com/) – a really cool packaging system. Now you don’t have to create a lib folder and keep track of where you had the right version for what anymore. All the open source you can manage – at the end of your “List-Package”-command.
- [Razor](http://weblogs.asp.net/scottgu/archive/2010/07/02/introducing-razor.aspx) – a new, more concise way to write web pages.
- [SQL Compact Edition (or SQL CE) 4.0](http://weblogs.asp.net/scottgu/archive/2011/01/11/vs-2010-sp1-and-sql-ce.aspx) – a small, fully working, easily deployable, free database from Microsoft.
- [Code First Entity Framework](http://weblogs.asp.net/scottgu/archive/2010/08/03/using-ef-code-first-with-an-existing-database.aspx) – your [POCO classes](http://stackoverflow.com/questions/250001/define-poco), mapped to a database, automatically. It looks nice, so nice.
- [MvcScaffolding](http://blog.stevensanderson.com/2011/01/13/scaffold-your-aspnet-mvc-3-project-with-the-mvcscaffolding-package/) – scaffolds loads of stuff for you in MVC 3 projects. Looks *very* promising. I didn’t say “brings Ruby-On-Rails to the .NET sphere”... but it was on my mind

When you put all these together, you get something very, very cool, I think. Or at least hope.

### Plans

So I am planning to [build a website](https://github.com/marcusoftnet/KanbanBoards) using (all?) these tools and see where it takes me. I have already bought a URL ([www.kanban-boards.com](http://www.kanban-boards.com)) to put some pressure on me. Here is the mission statement for the site:

> [www.kanban-boards.com](http://www.kanban-boards.com) will be a site where users can upload their Kanban boards for other people to see, vote on, and get inspired by. In this way, we can share and learn from each other, I think and hope.
>
> The creation of this site is documented as my learning process.

You can follow my progress on [GitHub](https://github.com/marcusoftnet/KanbanBoards), where I’ll check in stuff with each blog post. My plan is to try to write as little code as possible and get these tools to work for me. Also, I progress step by step using the tools and my knowledge to solve the problem at hand, at the [last responsible moment](http://availagility.co.uk/2010/04/06/defining-the-last-responsible-moment/). I will *not* download a bunch of stuff that I think I will need – only when I actually need it.

### Coding - Getting up and running

OK, let’s go. Today I want to simply set up the environment and get my first specification in place. Nothing more.

1. First, I installed [Web Platform Installer 3](http://www.microsoft.com/web/gallery/install.aspx?appsxml=&appid=WebMatrix;MVC3) and got all the new stuff down to my computer. My God – that took a while... Hey, I got [Web Matrix](http://weblogs.asp.net/scottgu/archive/2010/07/06/introducing-webmatrix.aspx) as well.
2. I then created the [KanbanBoards GitHub repository](https://github.com/marcusoftnet/KanbanBoards) and cloned a local copy of it.
3. In that folder, I created an empty solution file.
4. Trying to be a good BDD practitioner, I created a Class library called Specs. My SpecFlow features and steps will go here, so I’ll need SpecFlow. NuGet helps me.
5. I right-clicked the Specs project and chose “Add library package reference ...” (Yeah, I like a GUI over a console when learning). I searched for and added the SpecFlow 1.4 to my project. I’m not happy with getting 1.4 instead of 1.5, which is the most current, but OK. Please note that you need to [install SpecFlow](http://www.specflow.org/downloads/installer.aspx) to get the tooling support. This only installs the reference to SpecFlow and NUnit.
6. That created a “packages” folder at my solution root. “Packages” is the new “lib” then. Ok – I’ll live with that. Also, I got a “packages.config” in my Specs folder – that contains a list of my current projects. I didn’t get NUnit, which is the default framework for SpecFlow. Hmmm – let’s see how this plays out.
7. I now created a “Features” folder and created my first feature that is about navigating to the home page of the Kanban-boards site.
8. I ran the tests and.... Boom! Lots of NUnit errors at compile time. Just as I thought.
9. OK – I’ll add NUnit (right-click Specs project -> “Add library package reference ...” -> NUnit). Apparently, 2.5.7 is the most current version, but who is counting – I’ll use the update feature of NuGet later if I want to.
10. Recompile. Works fine.
11. Ran tests – Inconclusive (No step definition found).

Great place to stop, I think.

### Reflection

I’ve simply created a starting point, but little by little, I’m getting there. I have only written specifications in [Gherkin](https://github.com/aslakhellesoy/cucumber/wiki/gherkin) and then used tools only. Works fine so far.

The [code is here](https://github.com/marcusoftnet/KanbanBoards), and this was [the commit for this post](https://github.com/marcusoftnet/KanbanBoards/commit/ca8c3dbc285c75d087e98f5f7b6595e558ce34c5).

Stay tuned to see how this unfolds...
