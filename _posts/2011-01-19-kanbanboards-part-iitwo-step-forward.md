---
layout: post
title: KanbanBoards part II–two steps forward and one back
date: 2011-01-18T23:05:00.001Z
author: Marcus Hammarberg
tags:
  - BDD
  - .NET
  - ASP.NET MVC
  - KanbanBoards
modified_time: 2011-01-18T23:12:04.743Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-1192963568942273739
blogger_orig_url: https://www.marcusoft.net/2011/01/kanbanboards-part-iitwo-step-forward.html
---

### Disclaimers and introduction

I am now the [father of three kids](https://www.marcusoft.net/2010/03/arvid-and-gustav.html). They are my number one priority. This project will come second. I'm doing the project for myself mostly, but I'm very humbled by the fact that several people already have shown interest in my undertakings.

Up to now I’ve also had time to look at the project half-an-hour at a time. With several hours of back-in-my-head thinking in between. That might be good.

I have no master plan. I will make mistakes as you sure will notice in this post... I do not intend to document just the result but also my sidesteps and mistakes. I am a firm believer that it’s through our mistakes that we learn the most.

OK – on with the show.

In the [first part of this series](https://www.marcusoft.net/2011/01/developing-in-neta-new-era-has-begun.html) I simply wrote the first specification. So it’s no time to, [outside in](www.marcusoft.net/2010/10/story-on-doing-outside-in-development.html), get some of the steps passing.

### Step carefully now

Where we left off we got an error message and stub implementation from [SpecFlow](http://www.specflow.org) like this:

```text
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

So I created a Steps folder and added the suggested code to a HomeSteps class. I also added the other two step definitions from the suggested code. I left all of steps pending for now. Here is the code:

![initial steps](/img/initial%2520steps_thumb%255B2%255D.jpg)

My plan is to not go against the GUI this time. Partly because the outside-in experience is a bit clearer when you skip the GUI, but also since I’ve already demonstrated that in [another blog post](www.marcusoft.net/2010/10/story-on-doing-outside-in-development.html).

### Spec-ing out the first step

OK – the first steps say that some “Kanbanboards” are needed. So the first order of business is to create them. I’ll use the Assist-namespace of SpecFlow to get help to turn the [SpecFlow Table into a list of objects](http://www.youtube.com/watch?v=Dsk0EE43Tg4). This led me to specify the initial layout of the Domain object KanbanBoard.

Here’s the code (really simple):

![Turning SpecFlow table into a list of KanbanBoards](/img/Turning%2520SpecFlow%2520table%2520into%2520a%2520list%2520of%2520KanbanBoards_thumb.jpg)

And for those wondering I moved the KanbanBoard class into the model directory of the Web project when I created it below.

### Strategy thinking

But that doesn’t really cut it. We need to stick them somewhere. Later on we want to pull these from a repository, right? Right! The background step sets up 4 Kanban boards but in the Then-step only the top 3 favorite should be returned as “Top Kanban boards”. Hmm – so we need to stick a fake database into the repository in order to mock it out.

Here’s my plan; I was thinking on using [EF Code First](http://weblogs.asp.net/scottgu/archive/2010/07/16/code-first-development-with-entity-framework-4.aspx) which defines the database context as a class inheriting from DbContext and exposing DbSet’s to write queries against. So maybe that DbContext could be a dependency to my repository and I can mock it when doing unit tests.

Let’s see if I can get there.

### Creating the web project

One of the tools I wanted to try out is [MvcScaffolding](http://blog.stevensanderson.com/2011/01/13/scaffold-your-aspnet-mvc-3-project-with-the-mvcscaffolding-package/) that looks very interesting. For that to work out properly (I think?) I need an MVC project. So I created an empty one. This is the first **need** I see for it so in a way I’m forced to create it.

Let’s do that!

I simply created an MVC 3 project using the wizard. No unit-tests since I don’t need them. Yet. I went with Razor as my view engine.

![creating web project](/img/creating%2520web%2520project_thumb.jpg)

Choosing "Internet application” above will give me some initial structure. You win some and you lose some with that. I started by removing the Account model, -controller, and -view-stuff since I haven’t seen the need for that yet. I’m planning on using OpenID for authentication later on.

### MvcScaffolding install

I can now install MvcScaffolding. Let's get MvcScaffolding (with NuGet of course). When I did that with the Add Library Package Reference dialog I got this error:

![Operation Failed](/img/Operation%2520Failed_thumb.jpg)

And reading the [excellent introduction post by Steven Sandersson](http://blog.stevensanderson.com/2011/01/13/mvcscaffolding-standard-usage/) I understand why. This package is all run from the Package Console. So I’ll install it from there too. Makes sense. The command is simply:

```bash
Install-Package MvcScaffolding
```

And with the power of NuGet I got the required dependencies pulled down as well:

```bash
Successfully added 'EFCodeFirst 0.8' to Web
Successfully added 'T4Scaffolding 0.8.5' to Web
Successfully added 'MvcScaffolding 0.8.7' to Web
```

### Detour – wrong project

Bah! I installed it into the wrong project. There is a tricky little drop down in the package management console that tells you which project to install into.

![package console](/img/package%2520console_thumb.jpg)

So I had to learn how to uninstall packages... Simple:

```bash
Uninstall-Package <package-id>
```

### Scaffold me a repository

I’ll now create a model object called KanbanBoard using MvcScaffolding with this command. I had to set the Default Scaffolder first – read [Stevens post](http://blog.stevensanderson.com/2011/01/13/mvcscaffolding-standard-usage/) for that. In order to get this command to fire properly I had to set the default DBContext and the default Repository. Here is the command:

```bash
Scaffold Repository KanbanBoard
```

But now I got an error stating:

```bash
Cannot find primary key property for type 'Web.Models.KanbanBoard'. No properties appear to be primary keys.
```

I suspect a simple ID property will be enough... Let’s add it to the KanbanBoard class. Yup – it worked!

I now have a context created and a repository using that context. Hey – even an interface for the Repository.

I now wrote a test that shows that a Repository cannot be created without a KanbanBoardsDbContext (the name I used for my DBContext-object). Here is the test (in a new Tests-project):

![test proving that a repository need a context](/img/test%2520proving%2520that%2520a%2520repository%2520need%2520a%2520context_thumb.jpg)

OK – that in turn led me to a lot of refactorings:

- I extracted an interface called IKanbanBoardsDbContext from the KanbanBoardsDbContext class
- I updated the KanbanBoardRepository to be dependent on that interface instead of the concrete implementation.
- I used NuGet like a wizard and installed Should, installed Should Fluent, Uninstalled Should and finally installed a mocking framework called NSubstitute. Man NuGet makes you work fast fast. Imagine an extension for Visual Studio that grabbed the framework you need when you used methods from it...

### Back

 to the steps

There – now I can update the Given-step from way back to hold a mocked repository that returns the given KanbanBoards. Here is the implementation:

![given with mocked dbContext](/img/given%2520with%2520mocked%2520dbcontext_thumb.jpg)

Nice! The background step is now Green and refactored properly. Now we can get on with the next steps.

### When! Then

“When I go to the homepage” in this case translates to “Call the Index action” of the KanbanBoardsController. I’ll then get a view model back, keep it in the ScenarioContext and check that it contains the right stuff in the Then-steps.

Here is the When step definition I wrote:

![when implementation](/img/when%2520implementation_thumb.jpg)

And it was around this time that I realized that I was going about this the wrong way.

### Step back, breathe, and reconsider

My aim was to learn the tools, MvcScaffolding among others. So I can now go one of two ways. The way the code is coming about now is backwards in [TDD](http://en.wikipedia.org/wiki/Test-driven_development) terms since I get the code generated (well scaffolded) for me. For example, I would rather have a single method in the repository called GetTopThree or something. Or I can stay with the tools and only use my features to drive me forward. Also, looking at the code in the generated repository class it’s not much to test.

I’ll go with option two; I’ll use the tools I wanted to learn and the code they give me and tweak it to my need.

So now – what does that do with my design? For now I’ll leave it as simple as possible, which in this case is the generated code from MvcScaffolding. I might push the repository down to an application service later on but it will be ok as it is now.

No time to lose – but I’ll leave out the details to save you, dear reader, some time.

### Restart

After some refactorings I now ended up with this Given step definition:

![Given](/img/Given_thumb.jpg)

Here is my When step definition:

![When](/img/When_thumb.jpg)

And the Then step definition:

![Then](/img/Then_thumb.jpg)

Let me just add that for the Then-part there is an excellent [table Comparison helper in SpecFlow 1.5](https://github.com/darrencauthon/SpecFlowAssist/wiki/CompareToInstance-T-) that I would have used if not NuGet handed me 1.4 of SpecFlow instead.

Finally, the Index-method and constructor of the Kanban controller now look like this.

![kanban controller](/img/kanbancontroller_thumb.jpg)

### Reflection

I am not altogether happy with this session. It was too long and I mostly made mistakes. But I learned to love NuGet and got to try out MvcScaffolding and we are already best friends.

I think that the next step is to set up a simple end-to-end test for the homepage to get the application fully runnable. Right now we’re lacking a dependency injection framework. But it’s late, I’ll fix that later.

The [code is here](https://github.com/marcusoftnet/KanbanBoards) and [this was the commit](https://github.com/marcusoftnet/KanbanBoards/commit/6d310a3b777851a5c4e8f50e3312a7cb4d382d11) for this post.