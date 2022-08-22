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
thumbnail: >-
  http://lh5.ggpht.com/\_TI0jeIedRFk/TUXP0xEoVOI/AAAAAAAAAys/iZt4QifJ2ns/s72-c/slimmed%20controller_thumb.jpg?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-5936748023655640119
blogger_orig_url: http://www.marcusoft.net/2011/01/kanbanboards-ivshaping-stuff-up.html
---


I have now coded away for a while and it’s time to reflect a refactor a
bit. I don’t like code lying around that I might not need.
<a href="http://en.wikipedia.org/wiki/You_ain&#39;t_gonna_need_it"
target="_blank">YAGNI</a> you know...

So I thought I’d give it an hour to clean stuff up. And maybe put some
better looks on the site. Hopefully I’ll end up in a better place. Here
are the things I have planned:

1. Remove all the Views and Controller methods that I’m not using
2. Bring in a theme for the site
3. Shape up the lists on the first page
4. Create a page object to write my acceptance tests against
5. Introduce a read service for the site – the start of my CQRS
    initiative

Man – that looked long! But most of them are small. Just imaging how
much better the code will be afterwards.

Here we go.

### Remove unused stuff

OK – I love the
[MvcScaffolding](http://blog.stevensanderson.com/2011/01/13/scaffold-your-aspnet-mvc-3-project-with-the-mvcscaffolding-package/)
ideas but, as I [wrote
here,](http://www.marcusoft.net/2011/01/tdd-and-scaffolding.html) I’m
having some trouble with the code it’s generating. In this case – I’m
not even sure that I will need all the views and controller methods.
Maybe I would have been better of by just generating the repository.

Not use crying over that – I’ll just remove the views and action methods
of the controller that I’m not using. So under Views/Kanbanboard I
removed all the .cshtml (Razor) files except the Index.cshtml which is
the page we’re using.

And then in the KanbanBoardController I removed all the methods save the
Index action method. Leaving me with this very slimmed controller: [<img
src="http://lh5.ggpht.com/_TI0jeIedRFk/TUXP0xEoVOI/AAAAAAAAAys/iZt4QifJ2ns/slimmed%20controller_thumb.jpg?imgmax=800"
title="slimmed controller"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="323" height="270" alt="slimmed controller" />](http://lh5.ggpht.com/_TI0jeIedRFk/TUXP0Rpa6JI/AAAAAAAAAyo/Nk2X17Si7sU/s1600-h/slimmed%20controller%5B2%5D.jpg)

There – much better. Ooops – almost forget. Better run my specs and
tests. There – they run fine. I feel better.

Next!

### Add a nice theme for the site

OK – me and layout. That’ll make a lot of people laugh. Hard and long...
But I’ve found a [codeplex
project](http://mvccontribgallery.codeplex.com/) that helps me and
others in this situation. From [there you can
download](http://mvccontribgallery.codeplex.com/SourceControl/list/changesets#)
a number (50+) project examples. I did that and choose an example. But
this is for aspx pages and MVC 2. So I needed to convert them.

The process was pretty straight forward but made me realized how much I
lack in understanding of these concept. I use a template based on
[BluePrint CSS](http://www.blueprintcss.org/) (which is an awesome idea
for lost people like me) and tweaked it. And tweaked it. And then
tweaked it some more. I’m still not happy. For a while I thought to
myself that maybe this is designing – but that can’t be...

OK – I need help. I’ll leave it like this. It’s better but not even OK I
think. I’ll get some help on this one.

Here are the before and after shots:

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TUXP18Mi9fI/AAAAAAAAAy0/ZiZZfQf0kUU/before_thumb%5B1%5D.jpg?imgmax=800"
title="before"
style="background-image: none; border-right-width: 0px; padding-left: 0px; padding-right: 0px; display: inline; float: left; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" data-align="left" width="220" height="180"
alt="before" />](http://lh5.ggpht.com/_TI0jeIedRFk/TUXP1dt6d5I/AAAAAAAAAyw/zwbk_rV7GyQ/s1600-h/before%5B3%5D.jpg)

[<img
src="http://lh5.ggpht.com/_TI0jeIedRFk/TUXP2maRCrI/AAAAAAAAAy8/kjk1pvnKfqs/after_thumb%5B3%5D.jpg?imgmax=800"
title="after"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="279" height="180" alt="after" />](http://lh3.ggpht.com/_TI0jeIedRFk/TUXP2AvRrQI/AAAAAAAAAy4/vlF-9Wf3La4/s1600-h/after%5B7%5D.jpg)

### Shape up the index view and keeping it DRY

I’m not happy of with the lists on the index page right now. I want
something condensed that can be shown on a row. Maybe two with the
thumbnail on top of the text. This is also layout stuff that I don’t
know much about.

But first – I’m looping over two collections of KanbanBoards, creating
the same HTML. That doesn’t feel
<a href="http://en.wikipedia.org/wiki/Don&#39;t_repeat_yourself"
target="_blank">DRY</a> at all. So I used the Html.RenderPartial() –
method like this:

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TUXP39V1CZI/AAAAAAAAAzE/eIM8bZqgXkE/using%20renderpartial_thumb%5B1%5D.jpg?imgmax=800"
title="using renderpartial"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="125" alt="using renderpartial" />](http://lh6.ggpht.com/_TI0jeIedRFk/TUXP3XBrG6I/AAAAAAAAAzA/24tyF5nOIq0/s1600-h/using%20renderpartial%5B3%5D.jpg)

And then I created this partial view that just creates a row for one
KanbanBoard:

[<img
src="http://lh5.ggpht.com/_TI0jeIedRFk/TUXP43jksyI/AAAAAAAAAzM/zicGo2FvrnY/Kanban%20board%20list%20item_thumb.jpg?imgmax=800"
title="Kanban board list item"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="82" alt="Kanban board list item" />](http://lh4.ggpht.com/_TI0jeIedRFk/TUXP4ZXp62I/AAAAAAAAAzI/d9jPiu2yh0M/s1600-h/Kanban%20board%20list%20item%5B2%5D.jpg)

OK – that’s ugly, but at least it’s DRY. I’ll get help on that too.

### A little less brittle, please

OK – that was a part that I’m wasn’t very comfortable with. Hmmm really
need to do something about that. I’ve
<a href="http://pragprog.com/titles/bhgwad/web-design-for-developers"
target="_blank">put this on my reading list.</a> But now I’m back in C#
(at least) and thought that I could refactor the acceptance test a bit.

One problem with going against the GUI is that you have to get a hold of
the items you want to interact with somehow. And they have a tendency to
... move or change. So when I write code that goes against a certain
tag, with a certain class or id or even worse a certain placement in a
page – I stand a big chance that the test might fail just because
somebody has renamed or move things on the page. And that is very likely
to happen.

And this adds to the problem we call brittle tests. Brittle test will
soon fail for reasons that the current developer doesn’t know about. And
they are not run.

There are a lot ways to manage this and I’ve found an
<a href="http://www.cheezyworld.com/2010/11/09/ui-tests-not-brittle/"
target="_blank">excellent series</a> (in Ruby but we have a lot to learn
from them I think) on these matters. The first thing that is suggested
is to introduce a
<a href="http://code.google.com/p/selenium/wiki/PageObjects"
target="_blank">PageObject</a> that sits between your test and your
HTML. Your test code is now decoupled from your HTML – we like
decoupling.

Right now the difference in brittleness (hey, that was a word !?) in the
tests, but as we progress and create more and more interactions
(clicking links, filling out forms etc) we will have more and more use
of them.

Here is my first stab of a page object for my home page, with loads of
concepts shameless stolen from
<a href="http://www.cheezyworld.com/" target="_blank">Cheezy World</a>:

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TUXP57rVAlI/AAAAAAAAAzU/4hBNkZeLx2Q/first%20page%20object%20implementation_thumb%5B1%5D.jpg?imgmax=800"
title="first page object implementation"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="331"
alt="first page object implementation" />](http://lh3.ggpht.com/_TI0jeIedRFk/TUXP5eLcl3I/AAAAAAAAAzQ/plBlTXBPmZw/s1600-h/first%20page%20object%20implementation%5B3%5D.jpg)

Well that – felt pretty nice. But I see room for improvement. I created
an abstract base-class that encapsulates some stuff that all page
objects need. Here’s that class:

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TUXP676afwI/AAAAAAAAAzc/3iWeerI1Eic/baseclass%20for%20page%20objects_thumb%5B2%5D.jpg?imgmax=800"
title="baseclass for page objects"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="242"
alt="baseclass for page objects" />](http://lh3.ggpht.com/_TI0jeIedRFk/TUXP6Utg3RI/AAAAAAAAAzY/cc6OwAhlZ_o/s1600-h/baseclass%20for%20page%20objects%5B6%5D.jpg)

And that shaped up my HomePage object into this:

[<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TUXP7nR8cSI/AAAAAAAAAzk/SUwGQiATLro/home%20page%20object%20inheriting%20baseclass_thumb%5B1%5D.jpg?imgmax=800"
title="home page object inheriting baseclass"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="188"
alt="home page object inheriting baseclass" />](http://lh3.ggpht.com/_TI0jeIedRFk/TUXP7dQ063I/AAAAAAAAAzg/9bGUrIMcaBs/s1600-h/home%20page%20object%20inheriting%20baseclass%5B3%5D.jpg)

And all this together gives some pretty clean step definitions:

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TUXP8hZf3mI/AAAAAAAAAzs/G3DxpP5lTrs/step%20definitions%20using%20page%20object_thumb%5B1%5D.jpg?imgmax=800"
title="step definitions using page object"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="305"
alt="step definitions using page object" />](http://lh6.ggpht.com/_TI0jeIedRFk/TUXP8AY4HfI/AAAAAAAAAzo/Ct-27XgS4aE/s1600-h/step%20definitions%20using%20page%20object%5B3%5D.jpg)

And the test still runs! I’m allowed to enter the next stage

### Read service – the start of CQRS

I have already
<a href="http://www.marcusoft.net/2011/01/cqrsanother-love-story.html"
target="_blank">sung the CQRS praises</a> but it feels so right I have
to include it here. I’ll start as I usually do – simple and small. Here
it will be by introducing a read service that get me my view models.

I’ve hacked my way through the
<a href="http://ncqrs.org/getting-started/getting-started-with-ncqrs/"
target="_blank">excellent getting started section</a> of
<a href="http://ncqrs.org" target="_blank">NCQRS</a> that showed some
concept – and for now I think I’ll do alright without a framework. I
might bring it in later.

In the NCQRS example they use a DBContext and simply let that be the
read model. That pretty much sums up what I’ve done up to now. But I
want to formalize it a bit more. So I was thinking that I might
introduce a application service
(<a href="http://en.wikipedia.org/wiki/Domain-driven_design"
target="_blank">DDD</a>-style) and call the repository from there.

So I wrote these tests in a new Tests project. But first – I never grow
tired of this:

> Install-Package NSubstitute
> Install-Package ShouldFluent
> Install-Package NUnit

Here’s the tests...

Eeh ... I’m back. I got into to it, I’m sorry. As I started to code out
the test I couldn’t help myself. Sorry. Here is a short version of what
I did:

- I created a test project and wrote that first test for a ReadService
    that returns ready packed ViewModels.
- I then created a new Class library called ... ReadModel.
- Into that I moved my ViewModel, Domain (KanbanBoard since it’s just
    a read model anyway), Repository and DBContext to go with it.
- I didn’t move the database (as they did in the NCQRS example) since
    I don’t feel comfortable with a .dll holding on to my database.
- I refactored and cleaned up for a while – and then I could run the
    tests again. Oh that feel so good – tests are a warm blanket that
    wraps around me in refactoring times.

Well – that’s pretty much it. It’s a bit over refactored now but feels
good.

### Reflection and conclusion

I did a lot of small changes in this post. In some areas I was way out
in the deep, so I have to get back to them. Yes the layout stuff.  But
other felt really good to do. I especially liked to introduce the Page
Object stuff.

Next up is to start creating Kanban boards.

The [code is here](https://github.com/marcusoftnet/KanbanBoards) and
[this was the
commit](https://github.com/marcusoftnet/KanbanBoards/commit/5f80449916276362881235016ce4121571b1d2ad)
for this post.
