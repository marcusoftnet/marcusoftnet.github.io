---
layout: post
title: Kanbanboards V–creating new boards
date: '2011-02-05T21:08:00.001+01:00'
author: Marcus Hammarberg
tags: - BDD -
.NET - ASP.NET MVC - KanbanBoards - SpecFlow
modified_time: '2011-02-05T21:11:06.427+01:00'
thumbnail: http://lh3.ggpht.com/\_TI0jeIedRFk/TU2t4aBY_vI/AAAAAAAAA0k/pNIsi5pGUQs/s72-c/create%20specification%20with%20first%20scenario_thumb.jpg?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-8417148080028689205
blogger_orig_url: http://www.marcusoft.net/2011/02/kanbanboards-vcreating-new-boards.html
---


OK – after the last post of refactoring I now feels great to turn my
focus on some new functionality; I want to let the users create new
Kanban boards. This involves some new views and controllers stuff,
uploading pictures and also changes in the domain model.

I got some valuable feedback from my colleague [Joakim
Sunden](http://www.joakimsunden.com/) on the real purpose of the Kanban
board application / site. I actually never wrote it down. So I’ve
updated [the first post in the
series](http://www.marcusoft.net/2011/01/developing-in-neta-new-era-has-begun.html)
with the following:

> [www.kanban-boards.com](http://www.kanban-boards.com) will be a site
> where users can upload their Kanban boards for other people to see,
> vote on and get inspired by. In this way we can share and learn from
> each other I think and hope.
>
> The creation of this site is documented as my learning process.

On with the show!



### New functionality – new scenario

As I always I start off with a new specification and the following
scenario: [<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TU2t4aBY_vI/AAAAAAAAA0k/pNIsi5pGUQs/create%20specification%20with%20first%20scenario_thumb.jpg?imgmax=800"
title="create specification with first scenario"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="232"
alt="create specification with first scenario" />](http://lh4.ggpht.com/_TI0jeIedRFk/TU2t3fBhgVI/AAAAAAAAA0g/WNMGGT0mIM4/s1600-h/create%20specification%20with%20first%20scenario%5B2%5D.jpg)

Looking at that scenario I’ll know I will run into some problems
already, but in the spirit of the series (document you shortcomings and
failures <img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TU2t4tGscaI/AAAAAAAAA0o/OHE2SmEi5a4/wlEmoticon-smile2.png?imgmax=800"
class="wlEmoticon wlEmoticon-smile"
style="border-bottom-style: none; border-right-style: none; border-top-style: none; border-left-style: none"
alt="Smile" />) I press on. One step definition at the time.

### My workflow

Without knowing if it’s right – here is usually how I work my way
through a scenario like this:

-   I usually generate all the step definitions with the Pending state.
    In this “phase” I checking how the language feels and if I can reuse
    and steps. So I might update the written specification to get it to
    work.  Also I have to do other minor tweaks to other specs to get
    more re-usability
-   I then run the scenario to check that my steps and step definitions
    are aligned, i.e. I don’t get any Inconclusive (“No matching step
    definition found for the step”)
-   I then focus on one step at the time working outside in and getting
    each step to pass before I move on to the next. That focus my
    efforts and also gives a sense of success or forward motion.

### A given background

So I generated the step definitions and they now are in the
Pending-state. During this process (see above) I did some minor tweaks
to the step definitions and the language, into this:

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TU2t6IBsViI/AAAAAAAAA0w/9Ab4gw6ijQg/updated%20create%20specification_thumb%5B1%5D.jpg?imgmax=800"
title="updated create specification"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="232"
alt="updated create specification" />](http://lh5.ggpht.com/_TI0jeIedRFk/TU2t5Ah71OI/AAAAAAAAA0s/PhQLOn_3LlE/s1600-h/updated%20create%20specification%5B5%5D.jpg)

So now I can focus on the first step in the background; “Given I am
logged in on the site”. Obvious I don’t want to perform the actual login
now (planning on using [Open ID for that
later](http://www.hanselman.com/blog/TheWeeklySourceCode25OpenIDEdition.aspx))
so I need some way to mock that away.

Also thinking of what “Given I am logged into the site” means I had to
stop for a while...This is my reasoning (done in my head, for those who
wondering about my mental health):

-   So I want to be logged in in order to ...
-   Be able to be sure to pass any requirements of being authenticated
    later.
-   And what is the simplest possible solution to that right now
-   To create a simple interface for authentication checks. I can fill
    it with a implementation that checks against Open ID later.
-   So what are you waiting for?
-   You to stop asking stupid questions!

Sorry – got carried away there. But really I just need an interface that
my authentication mechanism can implement later. So I think I’ll create
an AuthenticationService that I later can implement with the check to
the User.Identity.IsAuthenticated property that will be set by Open ID.

Here is my Given step definition:

[<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TU2t7fGREDI/AAAAAAAAA04/0DspRtyPwnE/given%20I%20am%20logged%20into%20the%20site_thumb.jpg?imgmax=800"
title="given I am logged into the site"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="192"
alt="given I am logged into the site" />](http://lh3.ggpht.com/_TI0jeIedRFk/TU2t61620kI/AAAAAAAAA00/WN1jNuO6DAU/s1600-h/given%20I%20am%20logged%20into%20the%20site%5B2%5D.jpg)

Obviously I moved the IAuthenticationService to the Web-project, it’s
just there now for clarification. But with that simple step I now have a
passing step, and can go on to the next:

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TU2t8IW1rhI/AAAAAAAAA1A/dPhDD5-Gz7s/first%20given%20passed_thumb.jpg?imgmax=800"
title="first given passed"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="100" alt="first given passed" />](http://lh6.ggpht.com/_TI0jeIedRFk/TU2t74-JnaI/AAAAAAAAA08/RZQM48V5TmU/s1600-h/first%20given%20passed%5B2%5D.jpg)

### To the page

Next up is “When I navigate to to the Create page” which feels like
something I can reuse from earlier step definition. Well – when examined
I cannot. When I write my specifications against the controller
“navigating to a page” translates to choosing the right action method to
execute and storing that result.

The current implementation can be cleaned up and then maybe reused. Here
is what it looks like now:

[<img
src="http://lh5.ggpht.com/_TI0jeIedRFk/TU2t9__QVSI/AAAAAAAAA1I/Yl2O8w1Fa6o/before%20navigation%20step%20definition_thumb.jpg?imgmax=800"
title="before navigation step definition"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="153"
alt="before navigation step definition" />](http://lh5.ggpht.com/_TI0jeIedRFk/TU2t88nYGkI/AAAAAAAAA1E/Io_odznx-ZQ/s1600-h/before%20navigation%20step%20definition%5B2%5D.jpg)

And I tweaked it to be reusable into this:

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TU2t-pGK5DI/AAAAAAAAA1Q/vUMm2fRAi_Q/cleaned%20kanbancontroller%20steps_thumb.jpg?imgmax=800"
title="cleaned kanbancontroller steps"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="197"
alt="cleaned kanbancontroller steps" />](http://lh6.ggpht.com/_TI0jeIedRFk/TU2t-bLf-OI/AAAAAAAAA1M/9zjMjNdD4xw/s1600-h/cleaned%20kanbancontroller%20steps%5B2%5D.jpg)

... which is a lot more code. It still works (just ran my specs) and it
makes my next step very easy. Here it is:

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TU2t_koedRI/AAAAAAAAA1Y/y6c_FyqbnYY/step%20definition%20without%20any%20create%20action%20method_thumb%5B1%5D.jpg?imgmax=800"
title="step definition without any create action method"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="96"
alt="step definition without any create action method" />](http://lh4.ggpht.com/_TI0jeIedRFk/TU2t_NDOL1I/AAAAAAAAA1U/-fI3Atane2E/s1600-h/step%20definition%20without%20any%20create%20action%20method%5B5%5D.jpg)

Note that the Create method not is implemented... Yet! But a couple of
Resharper-commands later and it’s there – I simply return a view from
it.

And with that my the next step is working and I got the Then-step for
free since, from the previous scenario:

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TU2uBJyZ_QI/AAAAAAAAA1g/rdgK9tdg2vc/then%20done_thumb.jpg?imgmax=800"
title="then done"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="120" alt="then done" />](http://lh4.ggpht.com/_TI0jeIedRFk/TU2uALWi10I/AAAAAAAAA1c/lyxp5c6ZXZ0/s1600-h/then%20done%5B2%5D.jpg)

### Enter some information

OK – time to get to the point; the point where some information is about
to be entered. I have deliberately used a table format that I know will
suit the extension methods of the
<a href="http://www.specflow.org" target="_blank">SpecFlow</a>
Table-object good. The one called
[CreateInstance](https://github.com/techtalk/SpecFlow/wiki/SpecFlow-Assist-Helpers)
works on a table with Field – value pairs.

The step definition looks like this:

[<img
src="http://lh5.ggpht.com/_TI0jeIedRFk/TU2uCOJvAkI/AAAAAAAAA1o/7mGoztuKfEw/using%20create%20instance_thumb.jpg?imgmax=800"
title="using create instance"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="91" alt="using create instance" />](http://lh4.ggpht.com/_TI0jeIedRFk/TU2uBkSIOVI/AAAAAAAAA1k/RvagHMxc8VA/s1600-h/using%20create%20instance%5B2%5D.jpg)

And this doesn’t do much right now since the CreateKanbanBoardViewModel
doesn’t contain any fields. But I get now errors.. Hmm the
CreateInstance method must simply try to add and skip if not present. I
add the fields to the class and run again. I added a break point just to
be sure – and lo and behold here’s my filled in view model:

[<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TU2uDNQqbgI/AAAAAAAAA1w/PyvdzRAYEg8/viewmodel%20filled%20in_thumb.jpg?imgmax=800"
title="viewmodel filled in"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="126" alt="viewmodel filled in" />](http://lh4.ggpht.com/_TI0jeIedRFk/TU2uCrVgHgI/AAAAAAAAA1s/GT0jyqcUuHg/s1600-h/viewmodel%20filled%20in%5B2%5D.jpg)

That part with the BoardImage will need to be reworked but it comes
later.

### Submit it

I have now filled out the “form” (quoted since I didn’t actually do
that, I just filled out the view model and stored it in scenario
context). Lets now submit it and see where it takes us.

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TU2uD_Lqv3I/AAAAAAAAA14/XVLrxGoBK2c/submitting%20a%20filled%20out%20viewmodel_thumb.jpg?imgmax=800"
title="submitting a filled out viewmodel"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="136"
alt="submitting a filled out viewmodel" />](http://lh4.ggpht.com/_TI0jeIedRFk/TU2uDfRBszI/AAAAAAAAA10/IfYSrAPucXM/s1600-h/submitting%20a%20filled%20out%20viewmodel%5B2%5D.jpg)

Again the method is marked as red since it doesn’t exists. Resharper.
Presto – it’s there. Which in turn made me realize that I hadn’t moved
the view model class into place. But when all that was done I got the
following action method:

[<img
src="http://lh5.ggpht.com/_TI0jeIedRFk/TU2uEiblKEI/AAAAAAAAA2A/6MoeHyrJVOs/first%20create%20post%20action%20method_thumb.jpg?imgmax=800"
title="first create post action method"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="90"
alt="first create post action method" />](http://lh4.ggpht.com/_TI0jeIedRFk/TU2uEFKSS8I/AAAAAAAAA18/p7DZuB383Z8/s1600-h/first%20create%20post%20action%20method%5B2%5D.jpg)

Which reminded me on that I better store the Action Result. And that in
turn gave me an idea on a improvement. I created a method called
LatestActionResult and moved it into the MvcSteps class. Which modified
the When-step into this:

[<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TU2uFT9d2sI/AAAAAAAAA2I/ZX4KUbA9U0I/updated%20when-step_thumb.jpg?imgmax=800"
title="updated when-step"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="130" alt="updated when-step" />](http://lh6.ggpht.com/_TI0jeIedRFk/TU2uEx8RfqI/AAAAAAAAA2E/7zH52EYY570/s1600-h/updated%20when-step%5B2%5D.jpg)

And I kind of like that. It fails because my Create action method on the
controller simply returns null right now. That makes this step pass so
I’m off to the next.

### Final steps... Let’s go Then

So now there’s the assertions in/on the Then-steps to take care of. The
first (“Then I should be on the MyBoards page”) is quite easy. I simply
update the controller method into this:

[<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TU2uGNlCzpI/AAAAAAAAA2Q/UkQ23qNWgCw/view%20returned%20from%20action%20method%20create_thumb.jpg?imgmax=800"
title="view returned from action method create"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="92"
alt="view returned from action method create" />](http://lh6.ggpht.com/_TI0jeIedRFk/TU2uFrDWkTI/AAAAAAAAA2M/g-74ift_2uk/s1600-h/view%20returned%20from%20action%20method%20create%5B2%5D.jpg)

and it works. But doesn’t sit right. Shouldn’t I be redirected to
MyBoards which should pick up my new board from the repository? That
feels much more MVC (or
[PRG](http://blog.jorritsalverda.nl/2010/03/10/maintainable-mvc-post-redirect-get-pattern/)).
But now it’s late – I’ll do it tomorrow.

I’m back! Yes – I should definitely change that. So I updated the
scenario and step definition into this:

[<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TU2uG2IvzOI/AAAAAAAAA2c/qalYB4eMtrs/redirection%20step_thumb%5B1%5D.jpg?imgmax=800"
title="redirection step"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="129" alt="redirection step" />](http://lh6.ggpht.com/_TI0jeIedRFk/TU2uGTeTbkI/AAAAAAAAA2U/quxFFzzaFvs/s1600-h/redirection%20step%5B5%5D.jpg)

And the with the action method updated to this:

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TU2uHjb_KqI/AAAAAAAAA2k/hhKdErhpOaQ/redirection%20action%20controller_thumb.jpg?imgmax=800"
title="redirection action controller"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="90"
alt="redirection action controller" />](http://lh3.ggpht.com/_TI0jeIedRFk/TU2uHcwwLsI/AAAAAAAAA2g/LoTreZDZKH0/s1600-h/redirection%20action%20controller%5B2%5D.jpg)

my spec now has just the last step failing.

### Last step – show my board

So for the last step (“Then I should see KanbanBoard 1 among my boards”)
a couple of things need to happen.

-   First we need to take into account that there is a redirection going
    on.
-   Then we must handle the call to the Read-service (which needs to be
    <a href="http://en.wikipedia.org/wiki/Test-driven_development"
    target="_blank">TDD</a>’d out) to get “MyBoards” – which in turn
    call the Repository's GetAll()-methods
-   Also the Add-method of the repository is called – so we probably
    should find a good place to set up the expectations for that
-   Finally the whole thing should be put together.

Hmmm – this feels a bit to hard. I have probably missed something in the
process, but right now I cannot see what.

### Detour – my boards page

I’ll start with the new method on the read service. It should return a
list of boards for a certain user name. Here’s the test:

[<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TU2uIcupkkI/AAAAAAAAA2s/FXd_Z0g8EGo/test%20for%20GetBoardsForUser_thumb.jpg?imgmax=800"
title="test for GetBoardsForUser"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="165"
alt="test for GetBoardsForUser" />](http://lh4.ggpht.com/_TI0jeIedRFk/TU2uIBDGhYI/AAAAAAAAA2o/HFE9ysXRC40/s1600-h/test%20for%20GetBoardsForUser%5B2%5D.jpg)

And here the implementation:

[<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TU2uJb5tQyI/AAAAAAAAA20/3FKI1c6sXcY/GetBoardsForUser%20implementation_thumb.jpg?imgmax=800"
title="GetBoardsForUser implementation"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="117"
alt="GetBoardsForUser implementation" />](http://lh5.ggpht.com/_TI0jeIedRFk/TU2uI8CAYcI/AAAAAAAAA2w/gg-lDKBLerc/s1600-h/GetBoardsForUser%20implementation%5B2%5D.jpg)

And actually – with this in place I can easily write a specification for
the MyBoards page:

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TU2uKFCUU5I/AAAAAAAAA28/wE-Ji4WYGAk/scenario%20for%20navigating%20my%20boards_thumb%5B1%5D.jpg?imgmax=800"
title="scenario for navigating my boards"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="217"
alt="scenario for navigating my boards" />](http://lh4.ggpht.com/_TI0jeIedRFk/TU2uJ5iv5CI/AAAAAAAAA24/MCTEvlNpOKM/s1600-h/scenario%20for%20navigating%20my%20boards%5B5%5D.jpg)

Which in turn helped a lot of other things:

-   I updated the Logged-in step to require a name and created an
    AutenticationServiceSteps class
-   I realized that I don’t need to store things that are stateless in
    the ScenarioContext.Current, for example the KanbanBoardController.
    It can be created when needed
-   I could actually put the services I need in the
    ScenarioContext.Current when needed (or lazy loading if you like).
    That shapes up the code a lot, look at the new
    CreateController-method:
   [<img
    src="http://lh5.ggpht.com/_TI0jeIedRFk/TU2uK7m4HgI/AAAAAAAAA3E/41rknYVYPrg/CreateController%20with%20lazy%20loaded%20services_thumb.jpg?imgmax=800"
    title="CreateController with lazy loaded services"
    style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
    data-border="0" width="420" height="135"
    alt="CreateController with lazy loaded services" />](http://lh5.ggpht.com/_TI0jeIedRFk/TU2uKgFBHsI/AAAAAAAAA3A/Sg4HteP5sB8/s1600-h/CreateController%20with%20lazy%20loaded%20services%5B2%5D.jpg)

And with all that in place I just needed the following two steps:

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TU2uLsZLJ7I/AAAAAAAAA3M/CeTdLPI7Lyc/Screen%20shot%202011-02-05%20at%2012.18.03_thumb.jpg?imgmax=800"
title="Steps for my boards scenario"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="261"
alt="Steps for my boards scenario" />](http://lh5.ggpht.com/_TI0jeIedRFk/TU2uLS3iCHI/AAAAAAAAA3I/3v-g0-oa6bU/s1600-h/Screen%20shot%202011-02-05%20at%2012.18.03%5B2%5D.jpg)

Please not the [super-slick
CompareToSet\<T\>](https://github.com/techtalk/SpecFlow/wiki/SpecFlow-Assist-Helpers)
that really simplifies this code. One cool feature is that it only tests
the column you put in, like I used above.

### Back to create

And now when I turn back to the Create scenario I see it in another
light. I can reuse and shape up the scenario into something a little
more concise:

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TU2uMjPqKgI/AAAAAAAAA3U/loiWID8Ry4A/create%20sceanario%20updated%20and%20concise_thumb.jpg?imgmax=800"
title="create sceanario updated and concise"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="286"
alt="create sceanario updated and concise" />](http://lh6.ggpht.com/_TI0jeIedRFk/TU2uMHqkT_I/AAAAAAAAA3Q/mO2tRrED1lc/s1600-h/create%20sceanario%20updated%20and%20concise%5B2%5D.jpg)

Which in turn means that I can reuse the steps. And now when I run it...
it fails because I haven’t implemented the actually add in the Create
action method. Just as expected. I can now (is allowed?) to write
production code.

### A service for commands

The code is going to use a “command service” in my light-weight CQRS
implementation. So I create a new class library with the creative name
“CommandService” and added a tests for it and then implemented it as
follows.

I want that service to have void return types only (as is the common
pattern in CQRS) and to receive command classes. But when I created the
Command class (AddNewKanbanBoardCommand) I realized that it contains all
the values that the CreateKanbanBoardViewModel does. So maybe I should
use that instead. I sure would like to receive a filled out command to
the Action method.

Yes! I like – lets do it! Eeeeh – well that made me pull things apart a
little. My command service will receive commands and (for now) simply
just update the (read)model. But to do that I need to separate out the
repository since it’s to be referenced from both read and write parts.
Also I created a Domain project that contains my Domain model – right
now just KanbanBoard (a DTO for now).

Thank God for Resharper! And praise him once again for tests! After that
major refactoring I ran my tests again. And they worked. Phew – back on
green. Here’s my new solution structure:

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TU2uNTsXyyI/AAAAAAAAA3c/0Gc0M7aXUdw/Screen%20shot%202011-02-05%20at%2017.24.11_thumb.jpg?imgmax=800"
title="Screen shot 2011-02-05 at 17.24.11"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="278" height="207"
alt="Screen shot 2011-02-05 at 17.24.11" />](http://lh3.ggpht.com/_TI0jeIedRFk/TU2uM_euSSI/AAAAAAAAA3Y/QBWo9W9QiDM/s1600-h/Screen%20shot%202011-02-05%20at%2017.24.11%5B2%5D.jpg)

Next step was simply to remove the CreateKanbanBoardViewModel and face
the facts. Where it blew up I replaced it with the
AddKanbanBoardCommand. Pretty simple stuff. Lean on the tools – and
scarify a for-loop to the Resharper-makers.

Jupp – still fails because the Create action isn’t implemented yet. Lets
do that now. First we implement a test for the add command handler like
this:

[<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TU2uOHhu58I/AAAAAAAAA3k/Ui9eNsehv64/Screen%20shot%202011-02-05%20at%2019.40.36_thumb.jpg?imgmax=800"
title="Test for Add kanban board command"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="249"
alt="Test for Add kanban board command" />](http://lh6.ggpht.com/_TI0jeIedRFk/TU2uNphqc7I/AAAAAAAAA3g/Mc-23Y6UqUs/s1600-h/Screen%20shot%202011-02-05%20at%2019.40.36%5B2%5D.jpg)

And here’s the implementation. (Yes I know that this is a bit messy from
a CQRS perspective. I should have done the update with an event and then
updated the database with a
[demoralizer](http://blog.fossmo.net/post/The-denormalizer-in-CQRS.aspx),
but I couldn’t without bring in a [CQRS framework](http://ncqrs.org/)
[of sort](https://github.com/tyronegroves/SimpleCQRS) and I think this
blog post is long enough ):

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TU2uPO7d34I/AAAAAAAAA3s/G9NrcGdz370/command%20handler%20implementation_thumb.jpg?imgmax=800"
title="command handler implementation"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="287"
alt="command handler implementation" />](http://lh5.ggpht.com/_TI0jeIedRFk/TU2uOSK6G2I/AAAAAAAAA3o/78GGGUPWGIY/s1600-h/command%20handler%20implementation%5B2%5D.jpg)

### Finally

And now, once again, I can turn back to the failing specification and
wrap it up with this implementation:

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TU2uPh1e92I/AAAAAAAAA30/JLR8bytVJWE/create%20action%20method%20implementation_thumb.jpg?imgmax=800"
title="create action method implementation"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="187"
alt="create action method implementation" />](http://lh4.ggpht.com/_TI0jeIedRFk/TU2uPVsl5eI/AAAAAAAAA3w/XuRvoHmXVt8/s1600-h/create%20action%20method%20implementation%5B2%5D.jpg)

But that gave me some pondering to do. Now, in my steps, I need to
update the list of Kanban boards that the substituted repository
returns. Here is the scenario again:

[<img
src="http://lh5.ggpht.com/_TI0jeIedRFk/TU2uQhspvhI/AAAAAAAAA38/JDy_WGSaSjI/create%20sceanario%20updated%20and%20concise_thumb%5B1%5D.jpg?imgmax=800"
title="create sceanario updated and concise"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="286"
alt="create sceanario updated and concise" />](http://lh5.ggpht.com/_TI0jeIedRFk/TU2uQHK_DmI/AAAAAAAAA34/bRpkU665k9M/s1600-h/create%20sceanario%20updated%20and%20concise%5B6%5D.jpg)

So when I get to that last step I need to add the new board to the faked
return list. And the only place where I have the data to do so is in the
When-step (“When I submit a board with the following information”). So I
updated the step definition into this:

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TU2uRdBzL2I/AAAAAAAAA4E/MD6B6LdvX7A/updated%20Then-step_thumb.jpg?imgmax=800"
title="updated Then-step"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="144" alt="updated Then-step" />](http://lh6.ggpht.com/_TI0jeIedRFk/TU2uQ5rV-vI/AAAAAAAAA4A/GNwPMrSJYHQ/s1600-h/updated%20Then-step%5B2%5D.jpg)

Which makes use of the AddBoardToReturn-method in the
KanbanBoardRepositorySteps-class. Here it is:

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TU2uSZZQZtI/AAAAAAAAA4M/H3RqNn_cwPM/AddBoardToReturn%20method_thumb.jpg?imgmax=800"
title="AddBoardToReturn method"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="92" alt="AddBoardToReturn method" />](http://lh5.ggpht.com/_TI0jeIedRFk/TU2uRwnox-I/AAAAAAAAA4I/DMudahvd2eU/s1600-h/AddBoardToReturn%20method%5B2%5D.jpg)

Feels like a bit of a cheat but I cannot see another way to do it now.

### Disaster

And just when I “just gonna run the tests and be done for today” my
acceptance test blew up. I got the following error message:

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TU2uTe98cZI/AAAAAAAAA4U/9_eVQo9rjng/error%20message%20for%20model%20db%20conflict_thumb.jpg?imgmax=800"
title="error message for model db conflict"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="108"
alt="error message for model db conflict" />](http://lh3.ggpht.com/_TI0jeIedRFk/TU2uSwZmCRI/AAAAAAAAA4Q/fVS8KYai4uk/s1600-h/error%20message%20for%20model%20db%20conflict%5B2%5D.jpg)

Well – at least the message is very informative. My domain has changed –
my database hasn’t. In [this post by Scott
Gu](http://weblogs.asp.net/scottgu/archive/2011/01/11/vs-2010-sp1-and-sql-ce.aspx)
you can read more about it.

I would like to see if the tool can initialize the database with some
data for me. And with a quick search on [mother of all
knowledge](http://stackoverflow.com) I found [a
post](http://stackoverflow.com/questions/4703486/about-code-first-database-evolution-aka-migrations)
that describe it very quick to me. Here is my implementation of my
DatabaseIntializer:

[<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TU2uUa79F-I/AAAAAAAAA4c/RHs8kS_2-Zk/db%20intializer_thumb.jpg?imgmax=800"
title="db intializer"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="382" height="305" alt="db intializer" />](http://lh5.ggpht.com/_TI0jeIedRFk/TU2uTxMwZjI/AAAAAAAAA4Y/DWYp2TLbbK4/s1600-h/db%20intializer%5B2%5D.jpg)

And now I can simply call that initializer in Application_Start like
this:

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TU2uVzfmJYI/AAAAAAAAA4k/FyVjARygxsk/application_start_thumb.jpg?imgmax=800"
title="application_start"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="420" height="130" alt="application_start" />](http://lh6.ggpht.com/_TI0jeIedRFk/TU2uVDNAZaI/AAAAAAAAA4g/VHuJDm45DyQ/s1600-h/application_start%5B2%5D.jpg)

With that my acceptance (and all other) tests run again. And I got a
simple migration strategy in-place as well. <img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TU2t4tGscaI/AAAAAAAAA0o/OHE2SmEi5a4/wlEmoticon-smile2.png?imgmax=800"
class="wlEmoticon wlEmoticon-smile"
style="border-bottom-style: none; border-right-style: none; border-top-style: none; border-left-style: none"
alt="Smile" />

### Reflection and conclusion

This was a long post but I also added some important functionality. As
always I documented all the wrong turns and backtracking I did, hope you
bare with me on that. For me that is really where the learning take
place. I hope you can follow along and learn something too.

I am thinking of document a little less details and move faster in the
next posts. What do you think?

I didn’t get to uploading pictures and I suspect that when I get to that
I will change my domain model (yes, yes DTO) a bit. Well that’s later.

Next up is to create an acceptance test that adds a board through the
GUI. That in turn will make me implement the Open ID stuff.

The [code is here](https://github.com/marcusoftnet/KanbanBoards) and
[this was the
commit](https://github.com/marcusoftnet/KanbanBoards/commit/198e755ec362747bb8744f0b810888abb4df9b08)
for this post. Love to get some feedback on this post.
