---
layout: post
title: Kanbanboards III–putting on the web date: '2011-01-23T22:26:00.001+01:00'
author: Marcus Hammarberg
tags: - BDD -
.NET - ASP.NET MVC - KanbanBoards - SpecFlow
modified_time: '2011-01-25T11:28:24.156+01:00' thumbnail:
http://lh5.ggpht.com/\_TI0jeIedRFk/TTyc-nZa-iI/AAAAAAAAAvo/ye0t1HcwTiE/s72-c/updated-scenario_thumb.jpg?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-9181359261521028249
blogger_orig_url: http://www.marcusoft.net/2011/01/kanbanboards-iiiputting-on-web.html ---

After my latest <a
href="http://www.marcusoft.net/2011/01/kanbanboards-part-iitwo-step-forward.html"
target="_blank">post-of-admitting-failures</a> I got some really nice
feedback from a lot of people. Apparently there are others out there who
think that a failure is great learning opportunity. OK – I will most
certainly continue down that path.

I actually write these post as I code along. It’s forward only mode in
other words... Almost.

### Comments

One of the nicest things that happened as a result from the last post
was that
<a href="https://github.com/darrencauthon" target="_blank">Darren
Cauthon</a> gave me some
<a href="https://github.com/marcusoftnet/KanbanBoards/pull/1"
target="_blank">insightful comments and patches</a> to go with them.
This “social coding” that is going on, on
[www.github.com](http://www.github.com) (a.k.a. programmers Facebook) is
really, really cool.

Darren has done a lot of stuff in and around the
<a href="http://www.specflow.org" target="_blank">SpecFlow</a> project,
for example the <a
href="https://github.com/techtalk/SpecFlow/tree/master/Runtime/Assist"
target="_blank">SpecFlow Assist</a> (table helpers) that is really
great. So I value his opinions a lot. He gave me 4 points to think about
and I thought I comment them here as I learned a lot from them and think
maybe you will to:



1.  <a
    href="https://github.com/marcusoftnet/KanbanBoards/pull/1#commitcomment-244865"
    target="_blank">Line up your SpecFlow tables correctly</a>. This is
    a great point that will make the feature-files be readable outside
    Visual Studio. I think that the readability is a key feature of
    <a href="http://en.wikipedia.org/wiki/Behavior_Driven_Development"
    target="_blank">BDD</a> so totally agree there. Committed!
2.  <a
    href="https://github.com/marcusoftnet/KanbanBoards/pull/1#commitcomment-244868"
    target="_blank">Don’t use asserts in the When-step</a>. Totally
    agree on this! The Given/When/Then mantra is from the outset a
    development of the Arrange/Act/Assert. Don’t assert in the act step
    seems reasonable and give you a better
    <a href="http://en.wikipedia.org/wiki/Separation_of_concerns"
    target="_blank">separation of concerns</a> in your step definitions.
    Committed!
3.  <a
    href="https://github.com/marcusoftnet/KanbanBoards/pull/1#commitcomment-244869"
    target="_blank">Split you step definition files into files per thing or
    concept.</a> Great tip! Didn’t think at all of that – but it makes a
    lot of sense and also pushes me to think about keep the steps clean
    from state and other smells, so they easily can be stitched together
    in other scenarios. Committed!
4.  <a
    href="https://github.com/marcusoftnet/KanbanBoards/pull/1#commitcomment-244871"
    target="_blank">Use SpecFlow 1.5</a>. I actually thought of this the
    moment I realized that NuGet didn’t give me the latest version of
    SpecFlow. There are some great additions to SpecFlow especially the
    one Darren mentions. So I guess I go manual and include the SpecFlow
    1.5 myself. Or maybe <a
    href="http://haacked.com/archive/2011/01/12/uploading-packages-to-the-nuget-gallery.aspx"
    target="_blank">I can upgrade the NuGet-version of SpecFlow?</a>
    Committed!

OK – with the aid of GitHub and not to mention Darren the project is now
in great shape. 

But really - it’s just to [hard to grasp git
sometimes](http://www.marcusoft.net/2011/01/how-to-apply-pull-request-on-github.html).
I finally applied Darrens changes as a patch. I am a damaged Microsoft
developer who haven’t adjusted to the bash/dos command only world of
git.

On with tasks at hand.

### Updating the specs for the Homepage

The current scenario lacks a little bit of information. When you
navigate to the homepage of the application you should not only see the
top three favorited Kanban boards, there should also be a list of the
newest additions. The simplest way to do that is simply to augment the
current scenario with a new Then-statement. Like this:

[<img
src="http://lh5.ggpht.com/_TI0jeIedRFk/TTyc-nZa-iI/AAAAAAAAAvo/ye0t1HcwTiE/updated-scenario_thumb.jpg?imgmax=800"
title="updated scenario"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="160" alt="updated scenario" />](http://lh3.ggpht.com/_TI0jeIedRFk/TTyc9iQIwaI/AAAAAAAAAvk/CH74nJtL23A/s1600-h/updated-scenario2.jpg)

The observant reader sees that I done a few minor tweaks to the scenario
title and the When-step as well since it didn’t fit or read very well.

Ok – this of course fails since I haven’t implemented the step yet.
Yada, yada, yada – <a
href="http://www.marcusoft.net/2010/10/story-on-doing-outside-in-development.html"
target="_blank">it’s all been explained before.</a> Finally, led and
driven by my scenario, I ended up with this new When step definition:

[<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TTydAJxPzTI/AAAAAAAAAvw/hQAv6j5noJE/then-step-for-latest-additions_thumb.jpg?imgmax=800"
title="then step for latest additions"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="151"
alt="then step for latest additions" />](http://lh3.ggpht.com/_TI0jeIedRFk/TTyc_pe82jI/AAAAAAAAAvs/bXJO5o6FIB4/s1600-h/then-step-for-latest-additions2.jpg)

And this, rather ugly, action method for the Index action of the
KanbanBoard Controller:

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TTydBFwpMnI/AAAAAAAAAv4/EDmsrg5Wv1s/updated-index-action-method_thumb.jpg?imgmax=800"
title="updated index action method"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="312"
alt="updated index action method" />](http://lh4.ggpht.com/_TI0jeIedRFk/TTydAhLBPgI/AAAAAAAAAv0/uDStT5daPZU/s1600-h/updated-index-action-method2.jpg)

Let me be the first to the possibilities for improvement here. I was
thinking of using
<a href="http://ncqrs.org/reference/" target="_blank">CQRS</a> as my
architecture for this application, but didn’t because that would be to
many things at once. I might go back and redo the application CQRS style
as an exercise to learn it later.

Right now I’m satisfied with this. It keeps my focus on the stuff I <a
href="http://www.marcusoft.net/2011/01/developing-in-neta-new-era-has-begun.html"
target="_blank">wanted to learn</a> and the scenarios will be a great
guide when I redo the architecture later. Wow – I’m looking forward to
it already.

Let me also here declare my standpoint on
<a href="http://en.wikipedia.org/wiki/Test-driven_development"
target="_blank">TDD</a> and Scaffolding
(<a href="http://www.marcusoft.net/2011/01/tdd-and-scaffolding.html"
target="_blank">see this</a>). Ok – I going to treat the generated
repository code as not mine. I actually added the DebuggerNonUserCode
attribute to the repository, until I need to change it.  The rest of the
code will be touched on and hence tested, even though I sense that it
will be much more BDD than TDD.

# Writing an end to end acceptance test

Right now the application doesn’t work if you actually run it. That’s
one of the drawbacks of writing your step definitions against the
controller level of the application. The gain is that you get faster
test execution (NOT to be underestimated) and also a much faster writing
experience.

But I sure want the application to work. <img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TTydBn7BcVI/AAAAAAAAAv8/NHtYQdT8AN0/wlEmoticon-smile2.png?imgmax=800"
class="wlEmoticon wlEmoticon-smile"
style="border-bottom-style: none; border-right-style: none; border-top-style: none; border-left-style: none"
alt="Smile" />. So I will have a few integration tests that will run end
to end – from the HTML down to the metal in the SQL database.

Since I haven’t yet this process will force me to install an IoC
Container (<a href="http://ninject.org/" target="_blank">Ninject</a>
baby) and to setup and configure the database (<a
href="http://weblogs.asp.net/scottgu/archive/2011/01/11/vs-2010-sp1-and-sql-ce.aspx"
target="_blank">SQL CE</a> which looks nice... and is free).
<a href="http://nuget.org" target="_blank">NuGet</a> will do the heavy
(?) lifting for me. And my scenarios will guide me.

Let’s go!

###

###

### Writing the scenario

I created a new project for the acceptance tests (called... drum-roll;
AcceptanceTests). These are tests and that is something different than
the specifications in the Specs-project. They will run different, be
written different and do different stuff – I don’t want any strange
connections between the two. At least not now. I intend <a
href="http://www.marcusoft.net/2010/12/using-tags-in-specflow-features.html"
target="_blank">use tags</a> to separate out the slow end-to-end test
from the fast specifications.

Another thing to think about is that we’re now running against another
application an hence another application domain. For these scenario the
internals of the System Under Test (SUT) is truly a black box. That is
important to think about for test data for example. How can I load the
database with known test data? Or can I write my scenario in a way that
the test data is irrelevant or not as important?

Remembering that this is tests and not specifications I settled for the
last option and wrote the following feature file:

[<img
src="http://lh5.ggpht.com/_TI0jeIedRFk/TTydCVA3bnI/AAAAAAAAAwE/4dSGAUXuM1Y/first-acceptancetest_thumb.jpg?imgmax=800"
title="first acceptancetest"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="193" alt="first acceptancetest" />](http://lh4.ggpht.com/_TI0jeIedRFk/TTydB4_UveI/AAAAAAAAAwA/EB6xWQyflUo/s1600-h/first-acceptancetest2.jpg)

And now I started to implement the steps since they all fail with the
inconclusive status, to start with. This time I created a step
definitions class for the home page, I think that further down the road
the need for different pages will become evident.

Also, before long I needed
<a href="http://watin.sourceforge.net/" target="_blank">WatIn</a> to
easy write automations for the browser. Not found on NuGet, sadly. I had
to download and add manually. Feels old school already. I also ripped <a
href="https://github.com/SteveSanderson/GuestbookDemo/blob/master/Guestbook.Spec/Steps/Infrastructure/WebBrowser.cs"
target="_blank">this wrapper</a> for the browser from
<a href="blog.stevensanderson.com" target="_blank">Steven Sandersson</a>.

Finally here is the step definitions with the first step implemented, so
that I need to write production code:

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TTydDlYbvYI/AAAAAAAAAwM/mvpRXdnK--c/acceptance-feature_thumb.jpg?imgmax=800"
title="acceptance feature"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="339" alt="acceptance feature" />](http://lh3.ggpht.com/_TI0jeIedRFk/TTydCyS7AYI/AAAAAAAAAwI/6ILdA12iMl8/s1600-h/acceptance-feature2.jpg)

When I run this I get the following error; know as the yellow screen of
no Dependency Injection controller set:

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TTydEW0hMCI/AAAAAAAAAwU/9ivrNVC1alc/yellow-screen-of-missing-di-containe%5B2%5D.jpg?imgmax=800"
title="yellow screen of missing di container"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="124"
alt="yellow screen of missing di container" />](http://lh6.ggpht.com/_TI0jeIedRFk/TTydEIoBkNI/AAAAAAAAAwQ/WdYEMAxxaKc/s1600-h/yellow-screen-of-missing-di-containe%5B1%5D.jpg)

One gotcha that I ran into with WatIn on the way was that I needed to
set the “Embed Interop types” property of the reference to
Interop.SHDocVw.dll to false:

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TTydFYGYP9I/AAAAAAAAAwc/idQTxmng8PE/watin-gotcha_thumb.jpg?imgmax=800"
title="watin gotcha"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="317" height="228" alt="watin gotcha" />](http://lh4.ggpht.com/_TI0jeIedRFk/TTydEzNY2QI/AAAAAAAAAwY/KYWD0JJv5fo/s1600-h/watin-gotcha2.jpg)

But then this first step ran and showed me the error above.

### Inject some Ninject please

OK – to solve this I need a dependency injection framework. Ninject has
MVC 3 version so I’ll go with that. One NuGet command later... I have
one class and method to add the following one line to register my
KanbanRepository:

[<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TTydGKcvAEI/AAAAAAAAAwk/zQx846vhXFk/ninject-mvc-injected_thumb.jpg?imgmax=800"
title="ninject mvc injected"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="65" alt="ninject mvc injected" />](http://lh4.ggpht.com/_TI0jeIedRFk/TTydFlCREwI/AAAAAAAAAwg/O2AbOfsGkgE/s1600-h/ninject-mvc-injected2.jpg)

Boom – Ninject installed! Man – I LOVE NuGet. It’s super-slick to work
with.

### More errors – become database

The “sad” part is that only got me to my next error. The model returned
is empty which has to do with the database not being present and hooked
up. From <a
href="http://weblogs.asp.net/scottgu/archive/2011/01/11/vs-2010-sp1-and-sql-ce.aspx"
target="_blank">this blog post</a> I can see that I’m just a simple
NuGet addition away from solving that. 

He he... no, actually the MvcScaffolding install from NuGet did that for
me... I just found out.

But I was wrong – you actually need some configuration in order to get a
bit further. The connection string is missing. To add that you need to
know about some conventions.

The connection string should be named the same as your DbContext class
which in my case gives me the following connection string:

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TT13sKAdWbI/AAAAAAAAAw8/1PD-tEiGUkE/connectionstring_thumb.jpg?imgmax=800"
title="connectionstring"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="99" alt="connectionstring" />](http://lh6.ggpht.com/_TI0jeIedRFk/TT13rqr2_MI/AAAAAAAAAw4/Ybg2QeYXzME/s1600-h/connectionstring%5B2%5D.jpg)

Ok – and now, speaking of super-slick a new SQL CE database is now
created in the App_Data folder. So I included it in my project and
double click it. And here I was stopped in my tracks.

I haven’t read the [Scott Gu
post](http://weblogs.asp.net/scottgu/archive/2011/01/11/vs-2010-sp1-and-sql-ce.aspx)
fully. It’s even called Visual Studio 2010 SP1, I felt stupid and
started to install [Visual Studio 2010
SP1](http://www.microsoft.com/downloads/en/details.aspx?FamilyID=11ea69cb-cf12-4842-a3d7-b32a1e5642e2).
Which took me the rest of the night – it actually took 2 hours to run.
Can’t remember an installation that took so long. But hey – the it
worked. And when that was done I could open the database and add some
data.

Now I ran into a problem where “model don’t implement IEnumerable”. This
has to do with that my ViewModel holds two collections for TopFavorited
Kanban boards and Latest's Additions. So I changed the loop from looping
over the model to loop over the TopFavoritedKanbanBoards. And boom –
data in my view. Ugly but there for the first time. It’s alive!

[<img
src="http://lh5.ggpht.com/_TI0jeIedRFk/TT13tDZ7tmI/AAAAAAAAAxE/85nnJgvEJtE/first%20view_thumb.jpg?imgmax=800"
title="first view"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="134" alt="first view" />](http://lh4.ggpht.com/_TI0jeIedRFk/TT13siBUEGI/AAAAAAAAAxA/QK_yOtj99FE/s1600-h/first%20view%5B2%5D.jpg)

I couldn’t live with that layout so I did a very simple update of the
view to this:

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TT13t11uSEI/AAAAAAAAAxM/pCq7rfvZK1o/index%20view%20code_thumb.jpg?imgmax=800"
title="index view code"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="334" alt="index view code" />](http://lh6.ggpht.com/_TI0jeIedRFk/TT13tfCLQNI/AAAAAAAAAxI/eYVyGYGE7CA/s1600-h/index%20view%20code%5B2%5D.jpg)

And that looks like this:

[<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TT13up-oLKI/AAAAAAAAAxU/lpQKHpaT5W0/index%20view%20layout_thumb.jpg?imgmax=800"
title="index view layout"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="279" alt="index view layout" />](http://lh6.ggpht.com/_TI0jeIedRFk/TT13udsrI5I/AAAAAAAAAxQ/Y12-uJDu53Q/s1600-h/index%20view%20layout%5B2%5D.jpg)

That is not pretty I know. But that is a start and I can complete my
acceptance test with that layout.

### Completing Acceptance tests

With all these changes it’s been a while but, where I left of the
When-step (“I navigate to to the homepage”) passed, and the Then-steps
was failing. Here is the complete acceptance scenario again:

[<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TT13vYq9cmI/AAAAAAAAAxc/BjtN7N9faPw/first%20acceptancetest_thumb.jpg?imgmax=800"
title="first acceptancetest"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="193" alt="first acceptancetest" />](http://lh5.ggpht.com/_TI0jeIedRFk/TT13vMzfn9I/AAAAAAAAAxY/z6x4SOgag_w/s1600-h/first%20acceptancetest%5B3%5D.jpg)

The Then-steps are easily implemented using WatIn and the infrastructure
in place:

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TT13wU9A-uI/AAAAAAAAAxk/nc3cHcFuqCU/then%20steps_thumb.jpg?imgmax=800"
title="then steps"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="202" alt="then steps" />](http://lh5.ggpht.com/_TI0jeIedRFk/TT13v-HE03I/AAAAAAAAAxg/0UJAHbCE5ds/s1600-h/then%20steps%5B2%5D.jpg)

### Reflection

This session (although it stretched several days) felt so much better.
I’m now hooked into a database and have seen the first signs of the site
working.

I am already longing to continue.

The [code is here](https://github.com/marcusoftnet/KanbanBoards) and
[this was the
commit](https://github.com/marcusoftnet/KanbanBoards/commit/ee38fc01db925ebb5946df8106abc49862f03f98)
for this post.
