---
layout: post
title: Kanbanboards IV–shaping stuff up
date: 2011-01-30T20:54:00.001Z
author: Marcus Hammarberg
tags:
  - BDD
  - .NET
  - ASP.NET MVC
  - KanbanBoards
modified_time: 2011-01-30T20:55:55.120Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5936748023655640119
blogger_orig_url: https://www.marcusoft.net/2011/01/kanbanboards-ivshaping-stuff-up.html
---

I have now coded away for a while and it’s time to reflect a refactor a bit. I don’t like code lying around that I might not need. [YAGNI](http://en.wikipedia.org/wiki/You_ain't_gonna_need_it) you know...

So I thought I’d give it an hour to clean stuff up. And maybe put some better looks on the site. Hopefully I’ll end up in a better place. Here are the things I have planned:

1. Remove all the Views and Controller methods that I’m not using
2. Bring in a theme for the site
3. Shape up the lists on the first page
4. Create a page object to write my acceptance tests against
5. Introduce a read service for the site – the start of my CQRS initiative

Man – that looked long! But most of them are small. Just imaging how much better the code will be afterwards.

Here we go.

### Remove unused stuff

OK – I love the [MvcScaffolding](http://blog.stevensanderson.com/2011/01/13/scaffold-your-aspnet-mvc-3-project-with-the-mvcscaffolding-package/) ideas but, as I [wrote here](https://www.marcusoft.net/2011/01/tdd-and-scaffolding.html), I’m having some trouble with the code it’s generating. In this case – I’m not even sure that I will need all the views and controller methods. Maybe I would have been better off by just generating the repository.

Not use crying over that – I’ll just remove the views and action methods of the controller that I’m not using. So under Views/KanbanBoard I removed all the .cshtml (Razor) files except the Index.cshtml which is the page we’re using.

And then in the KanbanBoardController I removed all the methods save the Index action method. Leaving me with this very slimmed controller: [slimmed controller](/img/slimmed%2520controller_thumb.jpg)

There – much better. Oops – almost forgot. Better run my specs and tests. There – they run fine. I feel better.

Next!

### Add a nice theme for the site

OK – me and layout. That’ll make a lot of people laugh. Hard and long... But I’ve found a [codeplex project](http://mvccontribgallery.codeplex.com/) that helps me and others in this situation. From [there you can download](http://mvccontribgallery.codeplex.com/SourceControl/list/changesets#) a number (50+) project examples. I did that and choose an example. But this is for aspx pages and MVC 2. So I needed to convert them.

The process was pretty straightforward but made me realize how much I lack in understanding of these concepts. I use a template based on [BluePrint CSS](http://www.blueprintcss.org/) (which is an awesome idea for lost people like me) and tweaked it. And tweaked it. And then tweaked it some more. I’m still not happy. For a while I thought to myself that maybe this is designing – but that can’t be...

OK – I need help. I’ll leave it like this. It’s better but not even OK I think. I’ll get some help on this one.

Here are the before and after shots:

[before](/img/before_thumb%255B1%255D.jpg)

[after](/img/after_thumb%255B3%255D.jpg)

### Shape up the index view and keeping it DRY

I’m not happy with the lists on the index page right now. I want something condensed that can be shown on a row. Maybe two with the thumbnail on top of the text. This is also layout stuff that I don’t know much about.

But first – I’m looping over two collections of KanbanBoards, creating the same HTML. That doesn’t feel [DRY](http://en.wikipedia.org/wiki/Don't_repeat_yourself) at all. So I used the Html.RenderPartial() – method like this:

[using render partial](/img/using%2520renderpartial_thumb%255B1%255D.jpg)

And then I created this partial view that just creates a row for one KanbanBoard:

[Kanban board list item](/img/Kanban%2520board%2520list%2520item_thumb.jpg)

OK – that’s ugly, but at least it’s DRY. I’ll get help on that too.

### A little less brittle, please

OK – that was a part that I wasn’t very comfortable with. Hmmm really need to do something about that. I’ve [put this on my reading list](http://pragprog.com/titles/bhgwad/web-design-for-developers). But now I’m back in C# (at least) and thought that I could refactor the acceptance test a bit.

One problem with going against the GUI is that you have to get a hold of the items you want to interact with somehow. And they have a tendency to... move or change. So when I write code that goes against a certain tag, with a certain class or id or even worse a certain placement in a page – I stand a big chance that the test might fail just because somebody has renamed or moved things on the page. And that is very likely to happen.

And this adds to the problem we call brittle tests. Brittle tests will soon fail for reasons that the current developer doesn’t know about. And they are not run.

There are a lot of ways to manage this and I’ve found an [excellent series](http://www.cheezyworld.com/2010/11/09/ui-tests-not-brittle/) (in Ruby but we have a lot to learn from them I think) on these matters. The first thing that is suggested is to introduce a [PageObject](http://code.google.com/p/selenium/wiki/PageObjects) that sits between your test and your HTML. Your test code is now decoupled from your HTML – we like decoupling.

Right now the difference in brittleness (hey, that was a word !?) in the tests, but as we progress and create more and more interactions (clicking links, filling out forms etc) we will have more and more use of them.

Here is my first stab of a page object for my home page, with loads of concepts shamelessly stolen from [Cheezy World](http://www.cheezyworld.com/):

[first page object implementation](/img/first%2520page%2520object%2520implementation_thumb%255B1%255D.jpg)

Well that – felt pretty nice. But I see room for improvement. I created an abstract base-class that encapsulates some stuff that all page objects need. Here’s that class:

[base class for page objects](/img/baseclass%2520for%2520page%2520objects_thumb%255B2%255D.jpg)

And that shaped up my HomePage object into this:

[home page object inheriting base class](/img/home%2520page%2520object%2520inheriting%2520baseclass_thumb%255B1%255D.jpg)

And all this together gives some pretty clean step definitions:

[step definitions](/img/step%2520defintion_thumb.jpg)

### The read service and CQRS

Last – but not least, I want to introduce a read service. I’m thinking about CQRS but it’s really a lot to wrap your head around. So I want to start with a read service and then maybe move to CQRS later.

The idea is to create a service that only reads data, and maybe use this service to build the list on the home page.

This has the potential to decouple the read and write sides of my code and also be able to create special read-optimized structures of data that’s more suited for queries. And if you start to use something like [Event Sourcing](http://en.wikipedia.org/wiki/Event_sourcing) you get the option to build some cool stuff.

There’s a lot of material out there, so I will start to read and learn about this.

For now – this has to wait.

There, that’s it. Lots of stuff to shape up and lots of stuff to do. I feel better and will continue to shape stuff up as I go along.
