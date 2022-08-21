---
layout: post
title: WhiteStepHelper – a small step toward smaller
steps
date: '2010-09-17T19:00:00.001+02:00'
author: Marcus Hammarberg
tags:
  - BDD
  - .NET - SpecFlow
modified_time: '2010-09-28T09:28:49.844+02:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-5718687913603168178
blogger_orig_url: http://www.marcusoft.net/2010/09/whitestephelper-small-step-toward.html
---


I have been using
<a href="http://white.codeplex.com" target="_blank">White</a> in our
project for a couple of days now and it’s looking good I must say. I use
White in conjunction with
<a href="http://www.specflow.org" target="_blank">SpecFlow</a> to get
our specifications in an executable format (that still makes me smile
everything I think of it…)

What I soon realized was that much of the White-automating could be
pushed to a base class… That is much of the stuff that we’re using and
the way we’ll like to do stuff can be pushed downwards.

However – I think that the result is pretty generic and can be used
outside our project. So if you need it you can have it.

### Well known names

The first thing that we’ve thought about was the fact that most user
doesn’t refer to the items in the GUI by the programming name (“So I
clicked the btnSearch2-button”, doesn’t sound like an end user, huh?).
No, they rather speak about the elements in some more loosely terms such
as “the search button”, “the name text field” etc. The well known names
of the UI-elements if you will

To solve that I’ve created an interface (IIdResolver) that is used to
resolve the ID from the well known name the user is using. How – I hear
you ask… Well – that’s the beauty of interface – he answered with a
smile. You can change that implementation if you want to. If you want to
get the ID’s from a constant file or a database or whatever you simply
have to implement IIdResolver (one method) and do that resolving.

I have created two implementations; one real simple one that uses
<a href="http://en.wikipedia.org/wiki/Convention_over_configuration"
target="_blank">convention based naming</a> and one that uses
<a href="http://msdn.microsoft.com/en-us/library/ms752056.aspx"
target="_blank">AutomationProperties</a>. By no means do I claim to
understand all of this but to my understanding these are properties that
can be used when automating an UI Interface. And the <a
href="http://msdn.microsoft.com/en-us/library/system.windows.automation.automationelement.nameproperty.aspx"
target="_blank">AutomationProperties.Name</a> seemed like a perfect fit
for my need.

So I created a White finder that looks for the AutomationProperties.Name
with the well known name and returns the ID for that control. It works
fine and gives us a simple yet powerful way of keeping the
specifications in a format that the user understands. 

### Asserts

I’ve also included a couple of methods for asserting stuff (is this text
in this textbox, is this node in this tree etc.) and to do that I had to
introduce some references to MSTest in my code. That works for us but
doesn’t make the code all generic. I might update that to throw
exceptions further down the road.

### Basic steps – basic language

As I wrote my steps I realized that many steps could be reused if
formulated in a certain way. “Given I click on the button ‘\[wellknown
name\]’” and “Given I click on the tree ‘\[wellknown name\]’” could
simply be “Given I click on ‘\[wellknown name\]’” to support clicking on
all type of controls. In this way I could create a small base language
that I could use to simply the step-classes for the “real” tests. With
the support for <a
href="http://github.com/techtalk/SpecFlow/blob/master/Tests/FeatureTests/ExternalSteps/ExternalSteps.feature"
target="_blank">steps in external assemblies</a> that SpecFlow has this
became a very nice foundation for our language. The stuff I’ve added so
far is very basic but works as a start.

### The code and example

I have put together a small example that simply uses my functions.
<a href="http://github.com/marcusoftnet/WhiteStepHelper"
target="_blank">The code can be found on GitHub</a>.

### What I’ve learned

During writing the steps so far I’ve learned a lot. Here are some
highlights:

-   When I first could write a scenario and run it without writing any
    new steps was a really strange and joyful experience. I told the
    application what it should do (in Swedish) and it just did that…
-   I had a real strange bug for a while. I used the
    Window.Keyboard.HoldKey-method and forgot to call .LeaveKey… Which
    meant that the Control-key of my keyboard was registered as being
    pressed all the time. White uses your computer to automate the
    application. Some strange situations may occur.
-   The performance of White is a bit slow. Especially some operations,
    such as traversing trees etc. This don’t worry me so much since this
    is integrationtest. It’s ok for them to take a while. But beware so
    that you don’t put this in places which is run over and over.
    BeforeScenario or as
    <a href="http://wiki.github.com/aslakhellesoy/cucumber/background"
    target="_blank">Gehrkin Background</a>. Also check <a
    href="http://white.codeplex.com/wikipage?title=Speed%20up%20performance%20by%20Position%20based%20search&amp;referringTitle=Performance"
    target="_blank">out this to get much better (1/4 of the time)
    performance</a>. Use WithCache
-   Also beware that the attributes that SpecFlow looks for can be found
    in any class. And can be applied multiple times. That means that
    BeforeFeature and AfterScenario can be applied multiple times, if
    you don’t watch yourself.
-   Take advantage of the fact that the attributes can be applied
    multiple times. Sometimes the same action-step can be reused as both
    a Given and a Then.
-   The name of the Step-method is not nearly as important as the
    attributes.
