---
layout: post
title: SpecFlow, page objects and FluentAutomation
date: '2012-05-16T14:44:00.001+02:00'
author: Marcus Hammarberg
tags:
  - .NET
  - Life of a consultant
  - Agile - SpecFlow
modified_time: '2013-01-30T15:40:57.546+01:00'
thumbnail: http://lh6.ggpht.com/-pWpMISDNgTI/T7OhNxh3t9I/AAAAAAAABPg/9HvHRV6w8IM/s72-c/wlEmoticon-confusedsmile%25255B2%25255D.png?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-1609908988336242581
blogger_orig_url: http://www.marcusoft.net/2012/05/specflow-page-objects-and.html ---

<div dir="ltr" style="text-align: left;" trbidi="on">

I’ve been putting together a sample for my client on how to automate
against a web page. The purpose is to show how the tools are used and
give a starting ground for training and elaboration. When I was done I
realized that this could be useful for many – so here is my story on how
I set this up, problems I’ve ran into and solutions to them and
<a href="https://github.com/marcusoftnet/SpecFlowAndFluentAutomation"
target="_blank">the code</a>.
Please join me on the journey!


### Why test against the UI now again?

The first thing to notice that testing against the UI is not the best
thing you can do. There’s an excellent <a
href="http://gojko.net/2010/04/13/how-to-implement-ui-testing-without-shooting-yourself-in-the-foot-2/"
target="_blank">article on that by Gojko Adzic here</a>. But sometime
you don’t have much choice, the application may not be in shape for
writing tests against a level under the UI, or you don’t have access in
(or knowledge about) the code base.
In these cases UI testing can be thought of as black box testing, you
don’t need to know the internals of the application, and can be
useful.
The pros of testing against the UI are (IMHO):

-   You’re testing the complete application stack, end-to-end
-   It’s building a confidence and trust with your stakeholders, since
    they can actually see the application being run on the screen.

The cons is (sadly):

-   The tests take much longer time to run
-   The tests becomes brittle since the GUI often is the part of the
    application that changes most
-   Since you’re testing the whole stack of the application it’s harder
    to setup correct test data and and other prerequisite. You cannot,
    easily, fake or mock part of the application infrastructure.

### The application

The application we’re testing is mega simple. It’s an
<a href="http://www.asp.net/mvc/mvc3" target="_blank">MVC 3
application</a> and I’ve simply <a
href="http://blog.stevensanderson.com/2011/01/13/scaffold-your-aspnet-mvc-3-project-with-the-mvcscaffolding-package/"
target="_blank">scaffolded</a> the complete application with the
following commands, in the Package Manager console:

> Install-Package MvcScaffolding
> Scaffold Controller Team –Repository

The "Team" above is a small class with the properties Name, City and
date Founded. I’ve ~~stolen~~ borrowed it from <a
href="http://blog.stevensanderson.com/2011/01/13/scaffold-your-aspnet-mvc-3-project-with-the-mvcscaffolding-package/"
target="_blank">here</a>.

This will produce a simple, but useful, little application in which you
can create a soccer team, that you then can list, edit and delete.
<a href="http://en.wikipedia.org/wiki/Create,_read,_update_and_delete"
target="_blank">CRUD</a> in a nutshell in other words. But it’s
sufficient for our needs in this case.

MVCScaffolding will put you database in your SQLServer express instance
if you don’t tell it otherwise, see <a
href="http://www.marcusoft.net/2011/02/error-provider-did-not-return.html"
target="_blank">this post for more information</a>. I don’t want that
since I want to be able to move the database together with the source.
So I updated the Web.Config with this:


All of this is made in a web application called Web found in
<a href="https://github.com/marcusoftnet/SpecFlowAndFluentAutomation"
target="_blank">the source code</a>.

## Installations and setup for the tests

I then created a class library called Specs (hey, love that
<a href="http://en.wikipedia.org/wiki/Behavior_Driven_Development"
target="_blank">BDD</a> stuff you know) and in that created the
following folders:

-   Features – where my
    <a href="http://www.specflow.org/" target="_blank">SpecFlow</a>
    features will go
-   Steps – where my step definitions will end up
-   Automation – for all the infrastructure to get the automation to
    work. In this folder I created a sub folder: 
    -   PageWrappers – this folder will contain the wrappers for the
        different pages

After that initial set up I was ready to start pulling
<a href="http://www.nuget.org/" target="_blank">NuGet</a> packages in:

> Install-Package SpecFlow 

> Install-Package
> <a href="http://www.nunit.org/" target="_blank">NUnit</a>

There 2 is to set up SpecFlow to use it’s default NUnit testing library.
In order to be able to manipulate the database I went with
<a href="https://github.com/markrendle/Simple.Data"
target="_blank">Simple.Data</a> against the generated SQL Compact
database:

> Install-Package Simple.Data.SqlCompact40

Finally it was time for the automation part to get brought in. I’m using
<a href="http://fluent.stirno.com/blog/"
target="_blank">FluentAutomation</a> since I really like the syntax and
the packaging. It can be thought of as an API on top of
<a href="http://watin.org/" target="_blank">WatIn</a> and
<a href="http://seleniumhq.org/" target="_blank">Selenium Web Driver</a>.
This is nice since we can change automation provider later without
changing the automation code. FluentAutomation also have a couple of
tricks up it’s sleeve that can be useful (running the same test with
multiple browsers, automatic screenshots on errors etc.).

But maybe the most useful thing is shown when you get it from NuGet.
Simply write one command and everything is slurped down to your
computer:

> Install-Package FluentAutomation.SeleniumWebDriver

Here you can see that I’ve gone with the SeleniumWebDriver. Mainly
because I’ve heard great things about it and that I’ve never tried it
before. Also – with FluentAutomation – I don’t care….

## Browsers and automation problems

So far so good. My Specs-project now have all the references I’ll be
needing. But I haven’t used them yet. So I wrote a stupid simple
FluentAutomationTest:

But sadly that didn’t work out as planned…

### Gotcha \#1 – Firefox is default

Firefox is the default browser for FluentAutomation. So, as I didn’t
have it on the computer I tried to reconfigure the test to use another
browser.

This works but I don’t want to say in each and every test which browser
to use. But there is a Setup-method…

### Gotcha \#2 – Setup is not for everything

Every test class that will use the FluentAutomation should inherit from
FluentTest. This gives you, amongst other things, a Setup-method to
override. But if you try to set up which browser to use that will cause
… a
<a href="http://stackoverflow.com/" target="_blank">StackOverflow</a>Exception
(I’ve never had one of those before, honestly). So this code is **not
good**:

If you want to set up FluentAutomation up to use a specific browser for
all your tests in the fixture you should probably do something like
this:

So now the test is using InternetExplorer. But …

### Gotcha \#3 – InternetExplorer and Enable protect mode

When that test started to run I got the next exception, with a very
helpful message telling me that I needed to enable the protect mode for
all the zones in Internet Explorers Security settings (or something like
that).

Go to InternetExplorer –\> options –\> Security and select each zone.
Make sure that the checkbox for Enabling ProtectMode (whatever that this
<img
src="http://lh6.ggpht.com/-pWpMISDNgTI/T7OhNxh3t9I/AAAAAAAABPg/9HvHRV6w8IM/wlEmoticon-confusedsmile%25255B2%25255D.png?imgmax=800"
class="wlEmoticon wlEmoticon-confusedsmile"
style="border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none;"
alt="Confused smile" />) is checked.

Re-running the test and everything was dandy! Success. Surely Chrome
must be much simpler …

### Gotcha \#4 – Download and copy the ChromeDriver

I flipped the I.Use() statement to use BrowserType.Chrome and crossed my
fingers. No! Another helpful exception though. It told me to get and
download the ChromeDriver from
<http://code.google.com/p/chromedriver/downloads/list>. And also to copy
it to the bin-directory.

The first part is pretty easy. Just grab the right version for your OS
and save into the solution folder somewhere (I put mine in the root of
the solution).

The second part required some thinking. So before each test run I want
to copy the chromedriver.exe to the bin-directory of the Specs-project.
To achieve this I’m using the Build-events found under
Properties-\>Build Events of the Specs-project. I added the following
little DOS (my God!) command under the Post-build event command line:

> xcopy $(SolutionDir)chromedriver.exe $(TargetDir) /D

After that the test worked fine with Chrome. And it was fast fast
fast.
Now just back to Firefox. I downloaded it and change the
I.Use()-statement to use BrowserType.FireFox (which is default). And …

### Gotcha \#5 – Firefox not working

This has to do with the SeleniumDriver not supporting the latest
versions of Firexfox, <a
href="http://www.simonrhart.com/2011/11/openqaseleniumwebdriverexception-failed.html"
target="_blank">see this post</a>:

> It seems the Selenium WebDriver does not support the latest version of
> Firefox which is at the time of writing: 8.0.1. A workaround is to
> downgrade to Firefox v7.0.1.

I did that… And it worked!

Everything is up and running!

## Page objects and wrappers

One of the problems with UI tests is that they are brittle. The UI is
changing and finding controls on the page can be tricky sometimes. In
order to handle that problem a bit and buffer the problem you can create
a Wrapper around the page. I have <a
href="http://www.marcusoft.net/2011/04/clean-up-your-stepsuse-page-objects-in.html"
target="_blank">described this common pattern here</a>. For a real
indepth look on this pattern in action <a
href="http://skillsmatter.com/podcast/agile-scrum/bdd-as-its-meant-to-be-done"
target="_blank">check this excellent screen cast</a> by
<a href="http://blog.mattwynne.net/" target="_blank">Matt Wynnne</a>

### PageWrapperBase

So I started to create a little base class for the Page wrappers. This
will hold the Browser-object form FluentAutomation to give each
PageWrapper easy access to the automation. Some generic methods can go
in here also. Here is my first stab:

A few things to notice here:

-   Each page wrapper that inherits this base class will need to supply
    the relative path to the page
-   The base path will be stored in App.Config for the Specs-project
    which will give us possibilities to change that easy as we move
    through the environments
-   I’m using a static instance for the Browser so that I don’t need to
    open a close for each test

Here is a page using that base class:

As you can see the class only need to supply the relative path to the
page it’s wrapping.

#### DBWrapper

I’ve created a small class with static methods that I use to perform
database tasks. It’s based on Simple.Data (LOVE) and in this case goes
against the SQL CE database I’m using in the web application.

### SpecFlow events

SpecFlow gives you a number of <a
href="http://www.marcusoft.net/2010/12/using-tags-in-specflow-features.html"
target="_blank">events and hooks</a> that you can use to perform task
that you want to run before and after tests.
In this case I’m:

-   Cleaning out the testdata I’ve used and change after each scenario
-   Closing the browser after each test run. You DO want to do this or
    you’ll have 50+ browser instances open pretty quickly.

### Steps

With the page wrappers in place the steps becomes very simple. Almost
trivial, as it’s just delegating off to the page wrapper in questions.

So my tip is to not be afraid of a lot of steps, as long as they are
simple. It’s much more important to be able to clearly state the intent
of the scenario.

Another tip is that you can stack different Given/When/Then-attributes
on top of each other for readability. Like this:


All of those steps will hit the same step definition HomePage().

## From feature to automation

Let’s follow a step from feature file all the way down to the automation
as a final exercise. Note that here have translated the feature content
to English as it’s Swedish in my sample:

1.  The step “<span style="font-family: 'Courier New';">Given I am on
    the homepage” gets run as part of the scenario
2.  SpecFlow calls into the step definition marked with the <span
    style="font-family: 'Courier New';">“\[Given(@”I am on the
    homepage”)\]”. That method is defined on the Steps-class
3.  The step definition contains of a single line; “<span
    style="font-family: 'Courier New';">\_teamListingPageWrapper.Visit();”
    1.  \_<span
        style="font-family: 'Courier New';">teamListingPageWrapper
        is a private variable in the Steps-class
4.  The Visit()-method is definied on the <span
    style="font-family: 'Courier New';">PageWrapperBase class
    that simply use the Browser instance to Open the URL for the page;
    <span
    style="font-family: 'Courier New';">Browser.Open(pageURL);
    1.  The pageURL is put together from the prefix found in the
        app.config and the relative URL for the page we’re wrapping (“/”
        in this case)
5.  If that works out the scenario continues on the next step: “<span
    style="font-family: 'Courier New';">Then a link for Create New team
    should be present on the page”
6.  SpecFlow again calls into the right step definition
7.  The step definition propagates into the page wrapper, in the method
    <span
    style="font-family: 'Courier New';">AssertCreateNewTeamLinkExists()
8.  In the page wrapper we’re looking for that link on the page with the
    following line, that will throw and exception if it fails – as we
    want:
    <span
    style="font-family: 'Courier New';">Browser.Expect.Text("Create
    New").In("a#NewLink");
9.  Our test passes!

## Conclusion

Of course I haven’t written this in the order described in this blog
post but rather explored / driven the need for new methods on the page
wrappers as the features dictated.
I hope that you have got something out of this and that you can start
use SpecFlow with FluentAutomation from this.

</div>
