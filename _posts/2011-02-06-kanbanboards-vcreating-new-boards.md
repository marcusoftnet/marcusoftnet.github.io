---
layout: post
title: Kanbanboards V–creating new boards
date: 2011-02-05T20:08:00.001Z
author: Marcus Hammarberg
tags:
  - BDD
  - .NET
  - ASP.NET MVC
  - The KanbanBoards Project
  - SpecFlow
modified_time: 2011-02-05T20:11:06.427Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-8417148080028689205
blogger_orig_url: https://www.marcusoft.net/2011/02/kanbanboards-vcreating-new-boards.html
---

OK – after the last post of refactoring I now feels great to turn my focus on some new functionality; I want to let the users create new Kanban boards. This involves some new views and controllers stuff, uploading pictures and also changes in the domain model.

I got some valuable feedback from my colleague [Joakim Sunden](http://www.joakimsunden.com/) on the real purpose of the Kanban board application / site. I actually never wrote it down. So I’ve updated [the first post in the series](https://www.marcusoft.net/2011/01/developing-in-neta-new-era-has-begun.html) with the following:

> [www.kanban-boards.com](http://www.kanban-boards.com) will be a site where users can upload their Kanban boards for other people to see, vote on and get inspired by. In this way we can share and learn from each other I think and hope. The creation of this site is documented as my learning process.

On with the show!

### New functionality – new scenario

As I always I start off with a new specification and the following scenario:

![create specification with first scenario](/img/create%2520specification%2520with%2520first%2520scenario_thumb.jpg)

Looking at that scenario I’ll know I will run into some problems already, but in the spirit of the series (document you shortcomings and failures I press on. One step definition at the time.

### My workflow

Without knowing if it’s right – here is usually how I work my way through a scenario like this:

- I usually generate all the step definitions with the Pending state. In this “phase” I checking how the language feels and if I can reuse and steps. So I might update the written specification to get it to work. Also I have to do other minor tweaks to other specs to get more re-usability
- I then run the scenario to check that my steps and step definitions are aligned, i.e. I don’t get any Inconclusive (“No matching step definition found for the step”)
- I then focus on one step at the time working outside in and getting each step to pass before I move on to the next. That focus my efforts and also gives a sense of success or forward motion.

### A given background

So I generated the step definitions and they now are in the Pending-state. During this process (see above) I did some minor tweaks to the step definitions and the language, into this:

![updated create specification](/img/updated%2520create%2520specification_thumb%255B1%255D.jpg)

So now I can focus on the first step in the background; “Given I am logged in on the site”. Obvious I don’t want to perform the actual login now (planning on using [Open ID for that later](http://www.hanselman.com/blog/TheWeeklySourceCode25OpenIDEdition.aspx)) so I need some way to mock that away.

Also thinking of what “Given I am logged into the site” means I had to stop for a while...This is my reasoning (done in my head, for those who wondering about my mental health):

- So I want to be logged in in order to ...
- Be able to be sure to pass any requirements of being authenticated later.
- And what is the simplest possible solution to that right now
- To create a simple interface for authentication checks. I can fill it with a implementation that checks against Open ID later.
- So what are you waiting for?
- You to stop asking stupid questions!

Sorry – got carried away there. But really I just need an interface that my authentication mechanism can implement later. So I think I’ll create an AuthenticationService that I later can implement with the check to the User.Identity.IsAuthenticated property that will be set by Open ID.

Here is my Given step definition:

![given I am logged into the site](/img/given%2520I%2520am%2520logged%2520into%2520the%2520site_thumb.jpg)

Obviously I moved the IAuthenticationService to the Web-project, it’s just there now for clarification. But with that simple step I now have a passing step, and can go on to the next:

![first given passed](/img/first%2520given%2520passed_thumb.jpg)

### To the page

Next up is “When I navigate to to the Create page” which feels like something I can reuse from earlier step definition. Well – when examined I cannot. When I write my specifications against the controller “navigating to a page” translates to choosing the right action method to execute and storing that result.

The current implementation can be cleaned up and then maybe reused. Here is what it looks like now:

![Before navigation](/img/before%2520navigation%2520step%2520definition_thumb.jpg)

And I tweaked it to be reusable into this:

![Clean kanban controller](/img/cleaned%2520kanbancontroller%2520steps_thumb.jpg)

... which is a lot more code. It still works (just ran my specs) and it
makes my next step very easy. Here it is:

[Step defintion](/img/step%2520definition%2520without%2520any%2520create%2520action%2520method_thumb%255B1%255D.jpg)

Note that the Create method not is implemented... Yet! But a couple of Resharper-commands later and it’s there – I simply return a view from it.

And with that my the next step is working and I got the Then-step for free since, from the previous scenario:

[Previous scenario](/img/then%2520done_thumb.jpg)

### Enter some information

OK – time to get to the point; the point where some information is about to be entered. I have deliberately used a table format that I know will suit the extension methods of the [SpecFlow](http://www.specflow.org) Table-object good. The one called [CreateInstance](https://github.com/techtalk/SpecFlow/wiki/SpecFlow-Assist-Helpers) works on a table with Field – value pairs.

The step definition looks like this:

![Step defintion](/img/using%2520create%2520instance_thumb.jpg)

And this doesn’t do much right now since the CreateKanbanBoardViewModel doesn’t contain any fields. But I get now errors.. Hmm the CreateInstance method must simply try to add and skip if not present. I add the fields to the class and run again. I added a break point just to be sure – and lo and behold here’s my filled in view model:

![View model](/img/viewmodel%2520filled%2520in_thumb.jpg)

That part with the BoardImage will need to be reworked but it comes later.

### Submit it

I have now filled out the “form” (quoted since I didn’t actually do that, I just filled out the view model and stored it in scenario context). Lets now submit it and see where it takes us.

![Submitting](/img/submitting%2520a%2520filled%2520out%2520viewmodel_thumb.jpg)

Again the method is marked as red since it doesn’t exists. Resharper. Presto – it’s there. Which in turn made me realize that I hadn’t moved the view model class into place. But when all that was done I got the following action method:

![First create post](/img/first%2520create%2520post%2520action%2520method_thumb.jpg)

Which reminded me on that I better store the Action Result. And that in turn gave me an idea on a improvement. I created a method called LatestActionResult and moved it into the MvcSteps class. Which modified the When-step into this:

![Update when-step](/img/updated%2520when-step_thumb.jpg)

And I kind of like that. It fails because my Create action method on the controller simply returns null right now. That makes this step pass so I’m off to the next.

### Final steps... Let’s go Then

So now there’s the assertions in/on the Then-steps to take care of. The first (“Then I should be on the MyBoards page”) is quite easy. I simply update the controller method into this:

![View returned](/img/view%2520returned%2520from%2520action%2520method%2520create_thumb.jpg)

and it works. But doesn’t sit right. Shouldn’t I be redirected to MyBoards which  should pick up my new board from the repository? That feels much more MVC (or [PRG](http://blog.jorritsalverda.nl/2010/03/10maintainable-mvc-post-redirect-get-pattern/)). But now it’s late – I’ll do it tomorrow.

I’m back! Yes – I should definitely change that. So I updated the scenario and step definition into this:

![Redirection](/img/redirection%2520step_thumb%255B1%255D.jpg)

And the with the action method updated to this:

![Redirection action](/img/redirection%2520action%2520controller_thumb.jpg)

my spec now has just the last step failing.

### Last step – show my board

So for the last step (“Then I should see KanbanBoard 1 among my boards”) a couple of things need to happen.

- First we need to take into account that there is a redirection going on.
- Then we must handle the call to the Read-service (which needs to be [TDD](http://en.wikipedia.org/wiki/Test-driven_development)'d out to get “MyBoards” – which in turn call the Repository's GetAll()-methods
- Also the Add-method of the repository is called – so we probably should find a good place to set up the expectations for that
- Finally the whole thing should be put together.

Hmmm – this feels a bit to hard. I have probably missed something in the process, but right now I cannot see what.

### Detour – my boards page

I’ll start with the new method on the read service. It should return a list of boards for a certain user name. Here’s the test:

![Test for get board](/img/test%2520for%2520GetBoardsForUser_thumb.jpg)

And here the implementation:

![Get Boards](/img/GetBoardsForUser%2520implementation_thumb.jpg)

And actually – with this in place I can easily write a specification for
the MyBoards page:

![Scenario for navigating](/img/scenario%2520for%2520navigating%2520my%2520boards_thumb%255B1%255D.jpg)

Which in turn helped a lot of other things:

- I updated the Logged-in step to require a name and created an AuthenticationServiceSteps class
- I realized that I don’t need to store things that are stateless in the ScenarioContext.Current, for example the KanbanBoardController. It can be created when needed
- I could actually put the services I need in the ScenarioContext.Current when needed (or lazy loading if you like). That shapes up the code a lot, look at the new    CreateController-method:

![Create controller](/img/CreateController%2520with%2520lazy%2520loaded%2520services_thumb.jpg)

And with all that in place I just needed the following two steps:

![Two steps](/img/Screen%2520shot%25202011-02-05%2520at%252012.18.03_thumb.jpg)

Please note the [super-slick `CompareToSet<T>`](https://github.com/techtalk/SpecFlow/wiki/SpecFlow-Assist-Helpers) that really simplifies this code. One cool feature is that it only tests the column you put in, like I used above.

### Back to create

And now when I turn back to the Create scenario I see it in another light. I can reuse and shape up the scenario into something a little more concise:

![Create scenario](/img/create%2520sceanario%2520updated%2520and%2520concise_thumb.jpg)

Which in turn means that I can reuse the steps. And now when I run it... it fails because I haven’t implemented the actually add in the Create action method. Just as expected. I can now (is allowed?) to write production code.

### A service for commands

The code is going to use a “command service” in my light-weight CQRS implementation. So I create a new class library with the creative name “CommandService” and added a tests for it and then implemented it as follows.

I want that service to have void return types only (as is the common pattern in CQRS) and to receive command classes. But when I created the Command class (AddNewKanbanBoardCommand) I realized that it contains all the values that the CreateKanbanBoardViewModel does. So maybe I should use that instead. I sure would like to receive a filled out command to the Action method.

Yes! I like – lets do it! Eeeh – well that made me pull things apart a little. My command service will receive commands and (for now) simply just update the (read)model. But to do that I need to separate out the repository since it’s to be referenced from both read and write parts. Also I created a Domain project that contains my Domain model – right now just KanbanBoard (a DTO for now).

Thank God for Resharper! And praise him once again for tests! After that major refactoring I ran my tests again. And they worked. Phew – back on green. Here’s my new solution structure:

![Solution structure](/img/Screen%2520shot%25202011-02-05%2520at%252017.24.11_thumb.jpg)

Next step was simply to remove the CreateKanbanBoardViewModel and face the facts. Where it blew up I replaced it with the AddKanbanBoardCommand. Pretty simple stuff. Lean on the tools – and scarify a for-loop to the Resharper-makers.

Yes – still fails because the Create action isn’t implemented yet. Lets do that now. First we implement a test for the add command handler like this:

![Command handler](/img/Screen%2520shot%25202011-02-05%2520at%252019.40.36_thumb.jpg)

And here’s the implementation. (Yes I know that this is a bit messy from a CQRS perspective. I should have done the update with an event and then updated the database with a [de-normalizer](http://blog.fossmo.net/post/The-denormalizer-in-CQRS.aspx), but I couldn’t without bring in a [CQRS framework](http://ncqrs.org/) [of sort](https://github.com/tyronegroves/SimpleCQRS) and I think this blog post is long enough :)):

![Command handler](/img/command%2520handler%2520implementation_thumb.jpg)

### Finally

And now, once again, I can turn back to the failing specification and wrap it up with this implementation:

![Create action](/img/create%2520action%2520method%2520implementation_thumb.jpg)

But that gave me some pondering to do. Now, in my steps, I need to update the list of Kanban boards that the substituted repository returns. Here is the scenario again:

![Create scenario](/img/create%2520sceanario%2520updated%2520and%2520concise_thumb.jpg)

So when I get to that last step I need to add the new board to the faked return list. And the only place where I have the data to do so is in the When-step (“When I submit a board with the following information”). So I updated the step definition into this:

![Update then-step](/img/updated%2520Then-step_thumb.jpg)

Which makes use of the AddBoardToReturn-method in the KanbanBoardRepositorySteps-class. Here it is:

![Add board to return](/img/AddBoardToReturn%2520method_thumb.jpg)

Feels like a bit of a cheat but I cannot see another way to do it now.

### Disaster

And just when I “just gonna run the tests and be done for today” my acceptance test blew up. I got the following error message:

![Error message](/img/error%2520message%2520for%2520model%2520db%2520conflict_thumb.jpg)

Well – at least the message is very informative. My domain has changed – my database hasn’t. In [this post by Scott Gu](http://weblogs.asp.net/scottgu/archive/2011/01/11/vs-2010-sp1-and-sql-ce.aspx) you can read more about it.

I would like to see if the tool can initialize the database with some data for me. And with a quick search on [mother of all knowledge](http://stackoverflow.com) I found [a
post](http://stackoverflow.com/questions/4703486/about-code-first-database-evolution-aka-migrations) that describe it very quick to me. Here is my implementation of my DatabaseInitializer:

![Initializer](/img/db%2520initializer_thumb.jpg)'

And now I can simply call that initializer in Application_Start like this:

![Application start](/img/application_start_thumb.jpg)

With that my acceptance (and all other) tests run again. And I got a simple migration strategy in-place as well.

### Reflection and conclusion

This was a long post but I also added some important functionality. As always I documented all the wrong turns and backtracking I did, hope you bare with me on that. For me that is really where the learning take place. I hope you can follow along and learn something too.

I am thinking of document a little less details and move faster in the next posts. What do you think?

I didn’t get to uploading pictures and I suspect that when I get to that I will change my domain model (yes, yes DTO) a bit. Well that’s later.

Next up is to create an acceptance test that adds a board through the GUI. That in turn will make me implement the Open ID stuff.

The [code is here](https://github.com/marcusoftnet/KanbanBoards) and [this was the commit](https://github.com/marcusoftnet/KanbanBoards/commit/98e755ec362747bb8744f0b810888abb4df9b08) for this post.

Love to get some feedback on this post.
