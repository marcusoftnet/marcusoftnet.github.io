---
layout: post
title: KanbanBoards part II–two step forward and one back
date: 2011-01-18T23:05:00.001Z
author: Marcus Hammarberg
tags:
  - BDD
  - .NET
  - ASP.NET MVC
  - KanbanBoards
modified_time: 2011-01-18T23:12:04.743Z
thumbnail: >-
  http://lh3.ggpht.com/\_TI0jeIedRFk/TTYchqvu2RI/AAAAAAAAAsE/S1AUq5UoCq0/s72-c/intial%20steps_thumb%5B2%5D.jpg?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-1192963568942273739
blogger_orig_url: http://www.marcusoft.net/2011/01/kanbanboards-part-iitwo-step-forward.html
---


### Disclaimers and introduction

I am now the
<a href="http://www.marcusoft.net/2010/03/arvid-and-gustav.html"
target="_blank">father of three kids</a>. They are my \#1 priority. This
project will come second.  I’m doing the project for myself mostly, but
am very humbled by the fact that several people already have shown
interest in my undertakings.

Up to now I’ve also have time to look at the project half-an-hour at the
time. With several hours of back-in-my-head-thinking in between. That
might be good.

I have no master plan. I will make mistake as you sure will notice in
this post... I do not intend to document just the result but also my
sidesteps and mistakes. I am a firm believer that it’s true our mistakes
that we learn the most.

OK – on with the show.

In the <a
href="http://www.marcusoft.net/2011/01/developing-in-neta-new-era-has-begun.html"
target="_blank">first part of this series</a> I simply wrote the first
specification. So it’s no time to, <a
href="www.marcusoft.net/2010/10/story-on-doing-outside-in-development.html"
target="_blank">outside in</a>, get some of the steps passing.

### Step carefully now

Where we left off we got an error message and stub implementation from
<a href="http://www.specflow.org" target="_blank">SpecFlow</a> like
this:

``` brush:
Given the following Kanban boards

---

table step argument
---yada yada yada...
 No matching step definition found for the step. Use the following code to create one:
    [Binding]
public class StepDefinitions
{
    [Given(@"the following Kanban boards")]
    public void GivenTheFollowingKanbanBoards(Table table)
    {
        ScenarioContext.Current.Pending();
    }
}
```

So I created a Steps folder and added the suggested code to a HomeSteps
class. I also added the other two step definitions from the suggested
coded. I left all of steps pending for now. Here is the code:

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TTYchqvu2RI/AAAAAAAAAsE/S1AUq5UoCq0/intial%20steps_thumb%5B2%5D.jpg?imgmax=800"
title="intial steps"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="212" alt="intial steps" />](http://lh3.ggpht.com/_TI0jeIedRFk/TTYcg8w9BeI/AAAAAAAAAsA/FInc0uzHO-I/s1600-h/intial%20steps%5B8%5D.jpg)

My plan is to not go against the GUI this time. Partly because the
outside-in experience is a bit clearer when you skip the GUI, but also
since I’ve already demonstrated that in <a
href="www.marcusoft.net/2010/10/story-on-doing-outside-in-development.html"
target="_blank">another blog post</a>

### Specing out the first step

OK – the first steps says that some “Kanbanboards” is needed. So the
first order of business is to create them. I’ll use the Assist-namespace
of SpecFlow to get help to turn the
<a href="http://www.youtube.com/watch?v=Dsk0EE43Tg4"
target="_blank">SpecFlow Table into a list of object</a>. This led me to
specify the initial layout of the Domain object KanbanBoard.

Here’s the code (really simple):

### [<img

src="http://lh5.ggpht.com/_TI0jeIedRFk/TTYclt5EN8I/AAAAAAAAAsM/rZvP-gdZuhI/Turning%20SpecFlow%20table%20into%20a%20list%20of%20KanbanBoards_thumb.jpg?imgmax=800"
title="Turning SpecFlow table into a list of KanbanBoards"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="417" height="357"
alt="Turning SpecFlow table into a list of KanbanBoards" />](<http://lh4.ggpht.com/_TI0jeIedRFk/TTYckHg517I/AAAAAAAAAsI/FObZC5JGb2g/s1600-h/Turning%20SpecFlow%20table%20into%20a%20list%20of%20KanbanBoards%5B2%5D.jpg>)

And for those wondering I moved the KanbanBoard class into the model
directory of the Web project, when I created it below.

### Strategy thinking

But that doesn’t really cut it. We need to stick them somewhere. Later
on we want to pull these from a repository right? Right! The background
step sets up 4 Kanban boards but in the Then-step only the top 3
favorited should be returned as “Top Kanban boards”. Hmm – so we need to
stick a fake database into the repository in order to mock it out.

Here’s my plan; I was thinking on using <a
href="http://weblogs.asp.net/scottgu/archive/2010/07/16/code-first-development-with-entity-framework-4.aspx"
target="_blank">EF Code First</a> which defines the database context as
a class inheriting from DbContext and exposing DbSet’s to write queries
against. So maybe that DbContext could be a dependency to the my
repository and I can mock it when doing unit tests.

Let’s see if I can get there.

### Creating the web project

One of the tools I wanted to try out is <a
href="http://blog.stevensanderson.com/2011/01/13/scaffold-your-aspnet-mvc-3-project-with-the-mvcscaffolding-package/"
target="_blank">MvcScaffolding</a> that looks very interesting. or that
to work out properly  (I think?) I need an MVC project. So I create an
empty one. This is the first **need** is see for it so in a way I’m
forced to create it.

Lets do that!

I simply created a MVC 3 project using the wizard. No unit-tests since I
don’t need them. Yet. I went with Razor as my view engine.

[<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TTYcnbqE7hI/AAAAAAAAAsU/mS1aXtpLbcE/creating%20web%20project_thumb.jpg?imgmax=800"
title="creating web project"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="387" height="357" alt="creating web project" />](http://lh6.ggpht.com/_TI0jeIedRFk/TTYcmcNOOiI/AAAAAAAAAsQ/VEqPvplY-Mw/s1600-h/creating%20web%20project%5B2%5D.jpg)

Choosing "Internet application” above will give me some initial
structure. You win some and you loose some with that. I started by
removing the Account model, -controller and -view-stuff since I haven’t
seen the need for that yet. I’m planning on using OpenID for
authentication later on.

### MvcScaffolding install

I can now install the MvcScaffolding. Lets get MvcScaffolding (with
NuGet of course), when I did that with the Add Library Package Reference
dialog I got this error:

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TTYco-KoRrI/AAAAAAAAAsc/vqA941u39ec/Operation%20Failed_thumb.jpg?imgmax=800"
title="Operation Failed"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="159" alt="Operation Failed" />](http://lh3.ggpht.com/_TI0jeIedRFk/TTYcorgC4AI/AAAAAAAAAsY/kEBa5wUNW5k/s1600-h/Operation%20Failed%5B2%5D.jpg)

And reading the <a
href="http://blog.stevensanderson.com/2011/01/13/mvcscaffolding-standard-usage/"
target="_blank">excellent introduction post by Steven Sandersson</a> I
understand why. This package is all run from the Package Console. So
I’ll install it from there too. Makes sense. The command is simply:

>     Install-Package MvcScaffolding

And with the power of NuGet I got the required dependencies pulled down
as well:

>
>
> Successfully added 'EFCodeFirst 0.8' to Web
> Successfully added 'T4Scaffolding 0.8.5' to Web
> Successfully added 'MvcScaffolding 0.8.7' to Web

### Detour – wrong project

Bah! I installed it into the wrong project. There is a tricky little
drop down in the package management console that tells you which project
to install into.

[<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TTYcq7U6aMI/AAAAAAAAAsk/ve6z_SAEb6A/package%20console_thumb.jpg?imgmax=800"
title="package console"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="74" alt="package console" />](http://lh5.ggpht.com/_TI0jeIedRFk/TTYcpV3d5DI/AAAAAAAAAsg/0frvooGab1s/s1600-h/package%20console%5B2%5D.jpg)

So I had to learn how to uninstall packages... Simple:

>
>
> Uninstall-Package \<package-id\>

### Scaffold me a repository

I’ll now create a model object called KanbanBoard using MvcScaffolding
with this command. I had to set the Default Scaffolder first – read <a
href="http://blog.stevensanderson.com/2011/01/13/mvcscaffolding-standard-usage/"
target="_blank">Stevens post</a> for that. In order to get this command
to fire properly I had to set the default DBContext and the default
Repository. Here is the command:

>
>
> Scaffold Repository KanbanBoard

But now I got an error stating:

>
>
> Cannot find primary key property for type 'Web.Models.KanbanBoard'. No
> properties appear to be primary keys.

I suspect a simple ID property will be enough... Let’s add it to the
KanbanBoard class. Yup – it worked!

I now have a context created and a repository using that context. Hey –
even an interface for the Repository.

I now wrote a test that shows that a Repository cannot be created
without a KanbanBoardsDbContext (the name I used for my
DBContext-object). Here is the test (in a new Tests-project):

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TTYcrxWYPVI/AAAAAAAAAss/B26XiHe_lxM/test%20proving%20that%20a%20repository%20need%20a%20context_thumb.jpg?imgmax=800"
title="test proving that a repository need a context"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="162"
alt="test proving that a repository need a context" />](http://lh6.ggpht.com/_TI0jeIedRFk/TTYcrgzpgzI/AAAAAAAAAso/4g018pgHZSc/s1600-h/test%20proving%20that%20a%20repository%20need%20a%20context%5B2%5D.jpg)

OK – that in turn led me to a lot of refactorings:

- I extracted a interface called IKanbanBoardsDbContext from the
    KanbanBoardsDbContext class
- I updated the KanbanBoardRepository to be dependent to that
    interface instead of the concrete implementation.
- I used NuGet like a wizard an installed Should, installed Should
    Fluent, Uninstalled Should (<img
    src="http://lh5.ggpht.com/_TI0jeIedRFk/TTYcsr0sdFI/AAAAAAAAAsw/43_M-ttge_w/wlEmoticon-smile2.png?imgmax=800"
    class="wlEmoticon wlEmoticon-smile"
    style="border-bottom-style: none; border-right-style: none; border-top-style: none; border-left-style: none"
    alt="Smile" />) and finally installing a mocking framework called
    NSubsitute. Man NuGet makes you work fast fast. Imagine an extension
    for Visual Studio that grabbed the framework you need when you used
    methods from it ...

### Back to the steps

There – now I can update the Given-step from way back to hold a mocked
repository that returns the given kanbanboards. Here is the
implementation:

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TTYcutCuAHI/AAAAAAAAAs4/UxVLenEC4qg/given%20with%20mocked%20dbcontext_thumb.jpg?imgmax=800"
title="given with mocked dbcontext"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="189"
alt="given with mocked dbcontext" />](http://lh4.ggpht.com/_TI0jeIedRFk/TTYct7VO7gI/AAAAAAAAAs0/tt6cyLCAMHM/s1600-h/given%20with%20mocked%20dbcontext%5B2%5D.jpg)

Nice! The background step is now Green and refactored properly. Now we
can get on with the next steps.

### When! Then

“When I to to the homepage” in this case translates to “Call the Index
action” of the KanbanBoardsController. I’ll then get a view model back,
keep it in the ScenarioContext and check that it contains the right
stuff in the Then-steps.

Here is the When step definition I wrote:

[<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TTYcwfoobuI/AAAAAAAAAtA/TwRnlvryclg/when%20implementation_thumb.jpg?imgmax=800"
title="when implementation"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="255" alt="when implementation" />](http://lh4.ggpht.com/_TI0jeIedRFk/TTYcv2QSHRI/AAAAAAAAAs8/GyoUpTh1B-s/s1600-h/when%20implementation%5B2%5D.jpg)

Aaaand it was around this time that I realized that I was going about
this the wrong way.

### Step back, breath and reconsider

My aim was to learn the tools, MvcScaffolding among others. So I can now
go one of two ways. The way the code is coming about now is backwards in
<a href="http://en.wikipedia.org/wiki/Test-driven_development"
target="_blank">TDD</a> terms since I get the code generated (well
scaffolded) for me. For example I would rather have a single method in
the repository called GetTopThree or something. Or I can stay with the
tools and only use my features to drive me forward. Also, looking at the
code in the generated repository class it’s not much to test.

I’ll go with option two; I’ll use the tools I wanted to learn and the
code they give me and tweak it to my need.

So now – what does that do with my design? For now I’ll leave it as
simple as possible, which in this case is the generated code from
MvcScaffolding. I might push the repository down to an application
service later on but it will be ok as it is now.

No time to loose – but I’ll leave out the details to save you, dear
read, some time.

### Restart

After some refactorings I now ended up with this Given step definition:

[<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TTYcxrqfxkI/AAAAAAAAAtI/2lNTcGVffn8/Given_thumb.jpg?imgmax=800"
title="Given"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="147" alt="Given" />](http://lh5.ggpht.com/_TI0jeIedRFk/TTYcxHHq9-I/AAAAAAAAAtE/ESM9Jue0qnk/s1600-h/Given%5B2%5D.jpg)

Here is my When step definition:

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TTYcyzN46MI/AAAAAAAAAtQ/zs9EhlYXUik/When_thumb.jpg?imgmax=800"
title="When"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="179" alt="When" />](http://lh5.ggpht.com/_TI0jeIedRFk/TTYcyDUWsjI/AAAAAAAAAtM/3VikcI-xaI0/s1600-h/When%5B2%5D.jpg)

And the Then step definition:

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TTYcz4t1q8I/AAAAAAAAAtY/W5XuuyyTJ9o/Then_thumb.jpg?imgmax=800"
title="Then"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="209" alt="Then" />](http://lh6.ggpht.com/_TI0jeIedRFk/TTYczddSmsI/AAAAAAAAAtU/miU3qFrAFGA/s1600-h/Then%5B2%5D.jpg)

Let my just add that for the Then-part there is a an excellent <a
href="https://github.com/darrencauthon/SpecFlowAssist/wiki/CompareToInstance-T-"
target="_blank">table Comparison helper in SpecFlow 1.5</a> that I would
used if not NuGet handed me 1.4 of SpecFlow instead <img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TTYc0KAjtyI/AAAAAAAAAtc/F3dcnQi85m0/wlEmoticon-sadsmile2.png?imgmax=800"
class="wlEmoticon wlEmoticon-sadsmile"
style="border-bottom-style: none; border-right-style: none; border-top-style: none; border-left-style: none"
alt="Sad smile" />

Finally the Index-method and constructor of the Kanban controller now
looks like this.

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TTYc1IIwcwI/AAAAAAAAAtk/uDZR2v5P69Y/kanbancontroller_thumb.jpg?imgmax=800"
title="kanbancontroller"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="306" alt="kanbancontroller" />](http://lh3.ggpht.com/_TI0jeIedRFk/TTYc0loK48I/AAAAAAAAAtg/bAe_huMO6CA/s1600-h/kanbancontroller%5B2%5D.jpg)

### Reflection

I am not altogether happy with this session. It was too long and I
mostly made mistakes. But I learned to love NuGet and got to try out
MvcScaffolding and we are already best friends.

I think that the next step is to set up a simple end to end test for the
homepage to get the application fully runnable. Right now we’re lacking
a dependency injection framework. But it’s late, I fix that later.

The <a href="https://github.com/marcusoftnet/KanbanBoards"
target="_blank">code is here</a> and <a
href="https://github.com/marcusoftnet/KanbanBoards/commit/6d310a3b777851a5c4e8f50e3312a7cb4d382d11"
target="_blank">this was the commit</a> for this post.
