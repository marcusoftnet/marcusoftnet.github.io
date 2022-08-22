---
layout: post
title: Using BDD with SpecFlow, WPF and White
date: 2010-08-14T19:06:00.001Z
author: Marcus Hammarberg
tags:
  - VB.NET - BDD
  - Tools
  - .NET
  - Agile
modified_time: 2010-12-14T15:22:38.155Z
thumbnail: >-
  http://lh3.ggpht.com/\_TI0jeIedRFk/TGbv7ceXU5I/AAAAAAAAAjk/0nlXVkH4TW8/s72-c/appconfig_thumb%5B6%5D.jpg?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-4211414648845018243
blogger_orig_url: http://www.marcusoft.net/2010/08/using-bdd-with-specflow-wpf-and-white_14.html
---


It’s been a while since I blogged.
<a href="http://twitter.com/marcusoftnet" target="_blank">Twitter</a> is
taking over. I compensate that with a major blog post.

#### Background

I written about the project I’m in right now a <a
href="http://www.marcusoft.net/2010/05/using-atdd-in-conversion-project.html"
target="_blank">couple</a> of times before and to make a long story
short; we don’t have any requirements! We only have the existing
application which we are to “convert” from VB6 to VB.NET. 1:1 is the
mantra – which is to be understood as: functional the same.

I have suggested for the team that we work with
<a href="http://en.wikipedia.org/wiki/Behavior_driven_development"
target="_blank">BDD</a> (or ATDD if you like) to create the requirements
as we go. They liked it. A lot!

To not let this post grow totally out of control, I leave the
description for that process to another post.

To put my money where my mouth is and show them how it should be
accomplished. This blog post is that description.

#### Solution and tools

##### SpecFlow

The best
<a href="http://en.wikipedia.org/wiki/Behavior_Driven_Development"
target="_blank">BDD</a>-tool I’ve seen for the .NET platform is
<a href="http://www.specflow.org/" target="_blank">SpecFlow</a>. It’s a
very active open source project that gets more and more attention in the
community.

##### WPF and Prism

We’re going to build a fat client (remember them?) and have decided on
building it with WPF and
<a href="http://compositewpf.codeplex.com/" target="_blank">Prism 2</a>
(or 4 was it?) .

Let me right now say that I don’t, yet, know much about Prism and my
example in this post is NOT an tutorial on how to build great
Prism-applications.

##### White

The missing part in the solution puzzle was given by the
<a href="http://white.codeplex.com/" target="_blank">White project</a>.
From their website we learn:

> White is a framework for automating rich client applications based on
> Win32, WinForms, WPF, Silverlight and SWT (Java) platforms.

Well – perfect fit, if you ask me. Also – the creators of Prism has used
White to acceptance test their own stuff.

#### Where I learned

I’ve followed the SpecFlow-project for a while now and they have
increasingly supplied us with
<a href="http://www.specflow.org/specflow/getting-started.aspx"
target="_blank">great examples and tutorials</a>. I recommend you check
them out. I haven’t seen to much that isn’t web application though.

Likewise the Prism project comes with lot of examples. See their
download and <a
href="http://compositewpf.codeplex.com/wikipage?title=Learn%20Prism&amp;referringTitle=Home"
target="_blank">learning pages</a>.
<a href="http://www.tanguay.info/web/index.php?pg=howtos&amp;id=15"
target="_blank">This description</a> of a Hello World example helped me
get started.

White also have some <a
href="http://white.codeplex.com/wikipage?title=Functional%20Testing&amp;referringTitle=Home"
target="_blank">useful examples</a> on their
<a href="http://white.codeplex.com/" target="_blank">Codeplex</a>-site.
I also found <a
href="http://blog.benhall.me.uk/2008/02/project-white-automated-ui-testing.html"
target="_blank">this post by Ben Hall useful</a>.

#### How I did it

#####

Let’s, finally, get down to business. I’ll take this step by step but
not supply every detail, for the sake of brevity. The complete code
sample can be found
<a href="http://dl.dropbox.com/u/2408484/Marcusoft.BDD.Calculator.zip"
target="_blank">here</a>.

The example is very simple calculator. Yes, I know that the example not
is a fully fledge application but it proves my point.

Through the example I will use the standards of my current project,
which mean VB.NET.

First I downloaded everything I needed:

- <a href="http://www.specflow.org/downloads/installer.aspx"
    target="_blank">SpecFlow 1.3.4</a>
- <a href="http://compositewpf.codeplex.com/releases/view/46046"
    target="_blank">Prism 2.2</a>
- <a href="http://white.codeplex.com/releases/view/29694"
    target="_blank">White 0.20</a>

I then compiled Prism according to the ReadMe.txt and the “Desktop
only - Open Composite Application Library.bat”-file, which put the files
in \CAL\Desktop\Composite.UnityExtensions\bin\Debug-folder which puzzled
me for a while.
Could not help myself to smile when 431 tests passed. Gotta love
<a href="http://en.wikipedia.org/wiki/Test-driven_development"
target="_blank">TDD</a>!

I now created a empty solution for my application,
Marcusoft.BDD.Calculator and in doing so got a root-folder for my
application.

In this root project folder I created a lib-folder and copied all the
Prism binaries (from CAL\Desktop\Composite.UnityExtensions\bin\Debug)

I then moved all the White binaries to the lib-folder as well. My god –
it was many – I will not use all of those…

In my solution I created a lib solution folder and pulled all my
binaries into Visual Studio. That’s probably not need but I like to see
everything I’m using in the solution.

#### Writing specs

I now turned to the SpecFlow part of things. As this project will serve
as a demonstration for my project I wanted to follow my current
customers requirements (VB.NET, MSTest etc).

I therefore created a Test-project called
Marcusoft.BDD.Calculator.Specs. DON’T try to create a Class library and
convert it into a MSTest-project. You will only fail…

In the project I created a folder called Steps and removed the
ubiquitous UnitTest1.vb-file. I also added a reference to
TechTalk.SpecFlow.dll from my lib-folder.

One cool feature with SpecFlow is that you can put some rules for how
your features are to be written in configuration. That’s stuff like test
runner and other technical configuration but also the language used for
you features and scenarios. This will give you compilation errors for
typos in your requirements! I actually scream of joy when that happened.

So I added an App.config with the following content:

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TGbv7ceXU5I/AAAAAAAAAjk/0nlXVkH4TW8/appconfig_thumb%5B6%5D.jpg?imgmax=800"
title="appconfig"
style="border-bottom: 0px; border-left: 0px; display: block; float: none; margin-left: auto; border-top: 0px; margin-right: auto; border-right: 0px"
data-border="0" width="434" height="229" alt="appconfig" />](http://lh4.ggpht.com/_TI0jeIedRFk/TGbv6yLCSQI/AAAAAAAAAjc/gQU443vRSx0/s1600-h/appconfig%5B8%5D.jpg)

I used sv-SE to enable Swedish for my language setting. But I switched
to en-US to get English for this post.

Now I created a .feature-file to get my first SpecFlow-feature. The
feature is called: SumTwoPositiveInteger and looks like this:

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TGbwXQou0eI/AAAAAAAAAj0/Tcx5NGIgZzw/feature_thumb%5B5%5D.jpg?imgmax=800"
title="feature"
style="border-bottom: 0px; border-left: 0px; display: block; float: none; margin-left: auto; border-top: 0px; margin-right: auto; border-right: 0px"
data-border="0" width="434" height="256" alt="feature" />](http://lh6.ggpht.com/_TI0jeIedRFk/TGbwXKKD5gI/AAAAAAAAAjo/g-vuLxc7_ns/s1600-h/feature%5B7%5D.jpg)

Please not that I pay homage to the SpecFlow-template :)

Also, on a more serious note, this is a very <a
href="http://benmabey.com/2008/05/19/imperative-vs-declarative-scenarios-in-user-stories.html"
target="_blank">imperative (vs. declarative) style</a> of writing
scenarios. That fit’s our needs very well but maybe not yours…

As the BDD cycle says I could now compile and run my tests to get a
Inconclusive result and some help on how to continue. The code I was
suggested is in C# but that’s easily translated with
<a href="http://www.developerfusion.com/tools/convert/csharp-to-vb/"
target="_blank">this tool</a>. Not to bothered with that. Yet.

So the first version of my steps matched this precisely. That could work
for now. I could now start my <a
href="http://jockeholm.wordpress.com/2010/02/14/combining-tddbdd-with-ddd/"
target="_blank">outside-in development cycle</a> and write some code.

When I now ran my tests they are all pending. Which gives me an
opportunity to write some production code.

#### Writing application code

Here I followed the description in the
<a href="http://www.tanguay.info/web/index.php?pg=howtos&amp;id=15"
target="_blank">HelloWorld-post</a> I mentioned before, to get my
skeleton code up and running. I will not repeat it here. I called my
Shell Marcusoft.BDD.Calculator.Desktop and the module
Marcusoft.BDD.Calculator.Module.

On trick was the Application.xaml is called Application and not App.
This result in trouble since we’re inheriting from a Prism-class called
Application. When you change the name there are 3 places to do it in… or
use refactoring…

When you have created your module and got it to run and display an empty
form, you’re ready to continue on.

#### Automating with White

##### Starting the application

The first thing I started out with was my background:

> Background:
> Given that the application is started

To achieve this I had to find a way to start the application via White.

So first I referenced White.Core.dll and put a reference from
Marcusoft.BDD.Calculator.Specs to the system under test
(Marcusoft.BDD.Calculator.Desktop)

I then used the BeforeFeature-attribute of SpecFlow to start the
application (or attach me to it) and the AfterFeature to kill it. That
made me write this code:

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TGbxRbfTGTI/AAAAAAAAAkA/T4yomZADKLM/beforeafterfeature_thumb%5B1%5D.jpg?imgmax=800"
title="beforeafterfeature"
style="border-bottom: 0px; border-left: 0px; display: block; float: none; margin-left: auto; border-top: 0px; margin-right: auto; border-right: 0px"
data-border="0" width="434" height="289" alt="beforeafterfeature" />](http://lh3.ggpht.com/_TI0jeIedRFk/TGbxRHSwv9I/AAAAAAAAAj4/_-qN7lSp3vA/s1600-h/beforeafterfeature%5B3%5D.jpg)

##### Writing in textboxes

Now we’re cooking. This actually starts my application and displays the
form. On to the next order of business…

The first row in my scenario says:

> Given that I write 2 in the textbox Number 1

I need some way to get hold of a textbox and write the specified number
in it.

First I cleaned up my step to match all those occurrences. Here is the
Given-attribute and method declaration for that:

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TGbxSGBfrwI/AAAAAAAAAkI/aWAhDTgFlDQ/complete%20given_thumb%5B1%5D.jpg?imgmax=800"
title="complete given"
style="border-bottom: 0px; border-left: 0px; display: block; float: none; margin-left: auto; border-top: 0px; margin-right: auto; border-right: 0px"
data-border="0" width="434" height="60" alt="complete given" />](http://lh4.ggpht.com/_TI0jeIedRFk/TGbxR31ePyI/AAAAAAAAAkE/2yPg6oXiJ2w/s1600-h/complete%20given%5B3%5D.jpg)

This will send the number after “that i write” as stringUserEntered and
the name of the box after “textbox” as wllKnownNameOfTextbox.

With that in place I could remove the other two givens that was exact
matches for specific number.

A problem occurred with the name of the textbox. When writing the
specifications we don’t want to write the ID of the textbox (txtNumber1
for example). Instead we want some kind of well known name that the
users refers to the box with. Often that will be the name of the label
for the control.

In this simplified example I have implemented a
<a href="http://en.wikipedia.org/wiki/Convention_over_configuration"
target="_blank">convention (over configuration)</a>. All textboxes have
the same name (in lowercase and without spaces) as their label. That may
not hold for ever but works for now.

I could now write a method that returns a control, of a given type,
based on the well-known name for that control. Here it is:

[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TGbxubrWWoI/AAAAAAAAAkU/3WpdwOIZEbU/getcontrolbyname_thumb%5B1%5D.jpg?imgmax=800"
title="getcontrolbyname"
style="border-bottom: 0px; border-left: 0px; display: inline; border-top: 0px; border-right: 0px"
data-border="0" width="434" height="83" alt="getcontrolbyname" />](http://lh4.ggpht.com/_TI0jeIedRFk/TGbxtkJ3YLI/AAAAAAAAAkQ/uhP7u4WyOFI/s1600-h/getcontrolbyname%5B3%5D.jpg)

I ran my tests again to watch them fail since there was no control on
the form called “number1”. Great – no I can write production code.

I updated the user control with a label and textbox called Number 1, and
then ran my tests again and … progress! The correct number was filled
in.

And the regular expression matches for both textboxes – so I when I get
the next error (no textbox for named number2), i can safely add some
production code and controls for that.

I had now worked my way outside, from the scenario / requirements, in to
the actual implementation.

Love this!

##### Selecting in Combo-boxes

The final pieces comes together quite easy. I updated the
Given-statement that SpecFlow-generated for Calculation Type from this:

> \<Given("that I choose '\\+' in the list Type")\>

to this:

> \<Given("that I choose '(.*)' in the list (.*)")\>

And then implemented a generic method that selects a value from a combo
box like follows:

[<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TGbxvXEQZ7I/AAAAAAAAAkc/Z5jI2Dw-OgQ/selectsvalue_thumb%5B1%5D.jpg?imgmax=800"
title="selectsvalue"
style="border-bottom: 0px; border-left: 0px; display: inline; border-top: 0px; border-right: 0px"
data-border="0" width="434" height="86" alt="selectsvalue" />](http://lh4.ggpht.com/_TI0jeIedRFk/TGbxvLn5JYI/AAAAAAAAAkY/vSTVmD8L05w/s1600-h/selectsvalue%5B3%5D.jpg)

That drove me to put the a Combo-box on the view. And got another part
of my feature passing.

We’re getting there. One step at the time.

##### Clicking buttons

To click a button it’s as simple as:

[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TGbxwLjUEbI/AAAAAAAAAkk/BEZFnoU8dZM/clicksbutton_thumb%5B1%5D.jpg?imgmax=800"
title="clicksbutton"
style="border-bottom: 0px; border-left: 0px; display: inline; border-top: 0px; border-right: 0px"
data-border="0" width="434" height="88" alt="clicksbutton" />](http://lh5.ggpht.com/_TI0jeIedRFk/TGbxvoQwIFI/AAAAAAAAAkg/Kg-ey726XDs/s1600-h/clicksbutton%5B3%5D.jpg)

And the following method to check the content of a textbox:

[<img
src="http://lh5.ggpht.com/_TI0jeIedRFk/TGbxxsucKBI/AAAAAAAAAks/ptc0Hz4c9Fc/Textboxcontainstext_thumb%5B1%5D.jpg?imgmax=800"
title="Textboxcontainstext"
style="border-bottom: 0px; border-left: 0px; display: inline; border-top: 0px; border-right: 0px"
data-border="0" width="434" height="95" alt="Textboxcontainstext" />](http://lh3.ggpht.com/_TI0jeIedRFk/TGbxw9GhnNI/AAAAAAAAAko/3CmE_JpGYx0/s1600-h/Textboxcontainstext%5B3%5D.jpg)

With these two methods I could bring the whole feature together. And it
fails and tells me that 5 is expected but it got an empty string. I can
now implement the functionality for the feature.

#### Conclusion

This blog post is getting ridiculously long already so I better wrap it.

From now on I continued on driving my implementation from the scenarios.
I took very small steps as described above, so I always knew where I
was.

It took quite some time before I could get my first feature flying, but
by then I had a real nice set of step’s that could be reused by the next
feature. Which led to that the subsequent features were really fast to
implement. I added scenarios for subtraction, division and
multiplication. Which didn’t force me to write anything but production
code!

##### What didn’t I do

I haven’t included anything on TDD in this post. And I didn’t do any.
That doesn’t mean that I don’t think it’s needed, but I didn’t wanted to
mix any of that into this example.

I will sure have to work more on the handling of names and references to
them. There is <a
href="http://white.codeplex.com/wikipage?title=Screen%20Objects&amp;referringTitle=Functional%20Testing"
target="_blank">an article</a> on that in the White functional testing
documentation, that talks about screen objects. Also I recommend
<a href="http://www.viddler.com/explore/c4mvc/videos/4/"
target="_blank">watching this video on how to test the GUI in a web
application</a>. It gave me some valuable insights on how ATDD might
influence your code and naming etc.

##### The code

<a href="http://dl.dropbox.com/u/2408484/Marcusoft.BDD.Calculator.zip"
target="_blank">The code be downloaded here</a>. I will sure work on it
– so it might update from time to time.

##### Final thoughts

This has been a very technical post with lots of code. But remember –
it’s not in the tool!

For me the biggest take away when working like this is the way you can
collaborate with customer, analysist and tester when writing your
features and scenarios.

That’s so much more important than any tool.

If you read all of this – thank you. You have been an awesome audience
;)
