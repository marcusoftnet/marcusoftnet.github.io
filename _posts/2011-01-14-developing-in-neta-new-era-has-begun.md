---
layout: post
title: Developing in .Net–a new era has begun
date: 2011-01-13T20:11:00.001Z
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
  - KanbanBoards
  - Agile
modified_time: 2011-02-05T20:13:11.775Z
thumbnail: http://lh5.ggpht.com/\_TI0jeIedRFk/TS9gf84iOrI/AAAAAAAAArw/fAKXyaQG_TQ/s72-c/wlEmoticon-smile%5B2%5D.png?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-5907964016203666193
blogger_orig_url: http://www.marcusoft.net/2011/01/developing-in-neta-new-era-has-begun.html
---


### News

The other day I just realized how much have changed in the way we
develop code nowadays. Well it might just be me but it’s certainly some
major changes that has taken place in the .NET development arena.

I don’t claim this to be in the right chronological order but here are
some major milestones for me:

- <a href="http://en.wikipedia.org/wiki/Test-driven_development"
    target="_blank">TDD</a> – didn’t use just 2 years back
- <a href="http://en.wikipedia.org/wiki/Behavior_Driven_Development"
    target="_blank">BDD</a> – finally get the <a
    href="http://www.marcusoft.net/2010/10/story-on-doing-outside-in-development.html"
    target="_blank">requirements and tester into the agile loop</a> and
    an opportunity to <a
    href="http://www.marcusoft.net/2010/10/story-on-doing-outside-in-development.html"
    target="_blank">work outside in</a> which feels just right for me.
    My favorite tool right now of course is
    <a href="http://www.specflow.org" target="_blank">SpecFlow</a>.
- <a href="http://msdn.microsoft.com/en-us/netframework/aa904594"
    target="_blank">LINQ</a> – totally changed the way C#
    (<a href="http://www.marcusoft.net/2010/02/vbnet-considered-harmful.html"
    target="_blank">VB.NET still sucks at LINQ if you ask me</a>) looks
- <a href="http://www.asp.net/mVC/" target="_blank">ASP.NET MVC</a> –
    a web framework that makes sense. And that you can test. I
    understand again.

And now the other day (the day of the many updates as it might well be
known) <a
href="http://weblogs.asp.net/scottgu/archive/2011/01/13/announcing-release-of-asp-net-mvc-3-iis-express-sql-ce-4-web-farm-framework-orchard-webmatrix.aspx"
target="_blank">Microsoft release a big load of new updates</a>. Here’s
the one I find most interesting:

- <a href="http://nuget.codeplex.com/" target="_blank">NuGet</a> –
    really cool packing system. Hey – now you don’t have to create a lib
    folder and keep track of where you had the right version for what
    any more. All the open source you can manage – at the end of your
    “List-Package”-command
- <a
    href="http://weblogs.asp.net/scottgu/archive/2010/07/02/introducing-razor.aspx"
    target="_blank">Razor</a> – a new, more concise way to write web
    pages
- <a
    href="http://weblogs.asp.net/scottgu/archive/2011/01/11/vs-2010-sp1-and-sql-ce.aspx"
    target="_blank">SQL Compact Edition (or SQL CE) 4.0</a> – a small,
    fully working, easily deployable, free database from Microsoft.
- <a
    href="http://weblogs.asp.net/scottgu/archive/2010/08/03/using-ef-code-first-with-an-existing-database.aspx"
    target="_blank">Code First Entity Framework</a> – your
    <a href="http://stackoverflow.com/questions/250001/define-poco"
    target="_blank">POCO classes</a>, mapped to a database,
    automatically. It looks nice, so nice.
- [MvcScaffolding](http://blog.stevensanderson.com/2011/01/13/scaffold-your-aspnet-mvc-3-project-with-the-mvcscaffolding-package/)
    – scaffolds loads of stuff for you in MVC 3 projects. Looks *very*
    promising. I didn’t say “brings Ruby-On-Rails to the .NET sphere”...
    but I it was on my mind <img
    src="http://lh5.ggpht.com/_TI0jeIedRFk/TS9gf84iOrI/AAAAAAAAArw/fAKXyaQG_TQ/wlEmoticon-smile%5B2%5D.png?imgmax=800"
    class="wlEmoticon wlEmoticon-smile"
    style="border-bottom-style: none; border-right-style: none; border-top-style: none; border-left-style: none"
    alt="Smile" />

When you put all these together you get something very, very cool I
think. Or at least hope.

### Plans

So I am planning to
<a href="https://github.com/marcusoftnet/KanbanBoards"
target="_blank">build a website</a> using (all?) these tools and see
where it takes me. I have already bought a URL
(<a href="http://www.kanban-boards.com"
target="_blank">www.kanban-boards.com</a>) to put some pressure on me.
Here is the mission statement for the site:

> [www.kanban-boards.com](http://www.kanban-boards.com) will be a site
> where users can upload their Kanban boards for other people to see,
> vote on and get inspired by. In this way we can share and learn from
> each other I think and hope.
>
> The creation of this site is documented as my learning process.

You can follow my progress on
<a href="https://github.com/marcusoftnet/KanbanBoards"
target="_blank">GitHub</a> where I’ll check in stuff with each blog
post. My plan is to try to write so little code as possible and get
these tools to work for me. Also I progress step by step using the tools
and my knowledge to solve the problem at hand, at the <a
href="http://availagility.co.uk/2010/04/06/defining-the-last-responsible-moment/"
target="_blank">last responsible moment</a>. I will *not* download a
bunch of stuff that I think that I will need – only when I actually need
it.

### Coding - Getting up and running

OK let’s go. Today I want to simply set up the environment and get my
first specification in place. Nothing more.

1. First I installed <a
    href="http://www.microsoft.com/web/gallery/install.aspx?appsxml=&amp;appid=WebMatrix;MVC3"
    target="_blank">Web Platform Installer 3</a> and got all the new
    stuff down to my computer. My God – that took a while... Hey I got
    <a
    href="http://weblogs.asp.net/scottgu/archive/2010/07/06/introducing-webmatrix.aspx"
    target="_blank">Web Matrix</a> as well.
2. I then created the
    <a href="https://github.com/marcusoftnet/KanbanBoards"
    target="_blank">KanbanBoards github repository</a> and cloned a
    local copy of it.
3. In that folder I created an empty solution file.
4. Trying to be a good BDD practitioner I created a Class library
    called Specs. My SpecFlow features and steps will go here, so I’ll
    need SpecFlow. NuGet help me
5. I right clicked the Specs-project and chose “Add library package
    reference ...” (Yeah I like a GUI over a console when learning). I
    searched for and added the SpecFlow 1.4 to my project. I’m not happy
    with getting 1.4 instead of 1.5 that is the most current but OK.
   Please note that you need to
    <a href="http://www.specflow.org/downloads/installer.aspx"
    target="_blank">install SpecFlow</a> to get the tooling support.
    This only install the reference to SpecFlow and NUnit.
6. That created a “packages” folder at my solution root. “Packages” is
    the new “lib” then. Ok – I’ll live with that.
    Also I got a “packages.config” in my Specs-folder – that contains a
    list of my current projects.
    I didn’t got NUnit that is the default framework for SpecFlow. Hmmm
    – let’s see how this play out.
7. I now created a “Features” folder and created my first feature that
    is about navigating to the home page of the Kanban-boards site.
8. I ran the tests aaaand.... Boom! Lots of NUnit errors at compile
    time. Just as I thought.
9. OK – I’ll add the NUnit (right click Specs project –\> “Add library
    package reference ...”-\> NUnit). Apparently 2.5.7 is the most
    current version, but who is counting – I’ll use the update feature
    of NuGet later if I want to.
10. Recompile. Works fine
11. Ran tests – Inconclusive (No step definition found).

Great place to stop I think.

### Reflection

I’ve simply created a starting point, but little by little I’m getting
there. I have only written specifications in
<a href="https://github.com/aslakhellesoy/cucumber/wiki/gherkin"
target="_blank">Gherkin</a> and then used tools only. Works fine so far.

The [code is here](https://github.com/marcusoftnet/KanbanBoards) and
this was [the commit for this
post](https://github.com/marcusoftnet/KanbanBoards/commit/ca8c3dbc285c75d087e98f5f7b6595e558ce34c5).

Stay tuned to see how this unfolds...
