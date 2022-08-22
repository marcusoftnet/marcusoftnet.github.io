---
layout: post
title: A story on doing outside-in development with SpecFlow
date: 2010-10-15T18:23:00.013+02:00
author: Marcus Hammarberg
tags:
  - BDD
  - .NET
  - SpecFlow
modified_time: 2010-10-15T19:11:09.821+02:00
thumbnail: http://2.bp.blogspot.com/\_TI0jeIedRFk/TLiD5c8mP3I/AAAAAAAAAnM/Hk25KeDJi-s/s72-c/Screen+shot+2010-10-15+at+12.34.49.png
blogger_id: tag:blogger.com,1999:blog-36533086.post-2428948475329972132
blogger_orig_url: http://www.marcusoft.net/2010/10/story-on-doing-outside-in-development.html
---

As part of my preparations for two different presentations on
<a href="http://www.specflow.org/" target="_blank">SpecFlow</a> and
<a href="http://en.wikipedia.org/wiki/Behavior_Driven_Development"
target="_blank">BDD</a> I found myself in need to create an example. And
I have read loads of them (this is a <a
href="http://blog.stevensanderson.com/2010/03/03/behavior-driven-development-bdd-with-specflow-and-aspnet-mvc/"
target="_blank">great one by</a>
<a href="http://blog.stevensanderson.com/" target="_blank">Steve
Sandersson</a>). I have also read some others that
<a href="http://www.sarahmei.com/blog/2010/05/29/outside-in-bdd/"
target="_blank">emphasized the outside-in style</a> that I liked so
much, but nothing in the .NET sphere.
Finally I’ve tried the
<a href="http://www.marcusoft.net/2010/08/story-on.html"
target="_blank">story telling approach to writing blog posts before</a>
and it was fun and well-received. So here is a story on outside-in
development with SpecFlow and
<a href="http://www.asp.net/mVC/" target="_blank">ASP.NET MVC</a>.
(Disclaimer – I will not go in to details on web automation or ASP.NET
MVC).

### Getting the story straight

Marcus entered the office with extra spring in his step. New project and
he would finally get around to try out the outside-in development style
in a real project. It sounded great – but could it really work? He went
straight to Tobias, the project manager:
“I’m ready! Where is the specifications?” – he sounded eager… almost to
much maybe
”Well, calm down…. For now we have a small side-mission for you. We need
you to extract the tasks at hand from our database. It will be a simple
application but it will be great to start learning the new work
approach” – Tobias did his best to deliver the quite disheartening news
to his eager developer.
“OK… I’ll do it” – Marcus was still eager but not as much
”Great! We simply want a list of all the features in our database that
isn’t done yet. And there is a service that will deliver them to you.
I’ve written the first feature already” – Tobias tried to ride the wave
of enthusiasm. He showed Marcus the feature:

> To know which features that are up next
> As a developer in the team
> I want to see a list of all features that isn’t done

“OK, but what about the done ones? No one ever want to see them?” –
Marcus asked.
“By George! You’re right! We might need to tweak that story a little….
Hmmm how about:”

> In order to see a list of the features of our application and their
> status
> As a developer in the team
> I want to see a list of the features, sorted on their different status

“That isn’t very clear…” – Marcus said plainly. “Could you talk me
through a scenario?”
”That’s EXACTLY what we will do now”
They talked for a while and came up with this scenario:

> When I navigate to the homepage
> Then I should see a list of features are not done yet

“We might need to add a scenario for when I show the features that are
done also. How about this?”

> Given I am on the homepage
> When I click the radio button for “Show done features”
> Then I should see a list of features that are done

“That looks alright by me. Now go code! You can get hold of the service
to get the items, from Thomas who created it yesterday” – Tobias sent
Marcus off to get on with more important stuff.

### Setting up the feature

Marcus fired up his Visual Studio. Oh the new 2010 already felt like
home, he couldn’t even remember the 2008 version.
The first order of business is to create the solution. Marcus created a
blank solution called “Marcusoft.OutsideIn.FeatureDemo”. He then added a
class library for his Specification. Executable specifications! It still
sent shivers down his spine.
The class library was called Marcusoft.OutsideIn.FeatureDemo.Specs and
has references to  TechTalk.SpecFlow.dll and the nunit.framework.dll.
And of course deleted Class1.cs. “Why is that always created?” – he
thought as he hit the delete-button. Hard!
Also Marcus put these reference in a lib-folder, in the top
solution-folder. “That’s always a good think”, he thought, “then
everybody will get the correct version”. Now Marcus created two folders
in the Spec-project; Features and Steps. The Features will contain the
Gherkin-features and the Steps-folder the step definitions.
Now the feature could be added. Marcus added a SpecFlow-feature to the
Features-folder. He called the feature “BrowseHomePage.feature” and
added the following content:

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://2.bp.blogspot.com/_TI0jeIedRFk/TLiD5c8mP3I/AAAAAAAAAnM/Hk25KeDJi-s/s1600/Screen+shot+2010-10-15+at+12.34.49.png"
data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
src="http://2.bp.blogspot.com/_TI0jeIedRFk/TLiD5c8mP3I/AAAAAAAAAnM/Hk25KeDJi-s/s320/Screen+shot+2010-10-15+at+12.34.49.png"
data-border="0" width="320" height="75" /></a>

</div>

Yeah! That looked good. “Let’s run that and see where it leads us” – he
said to himself and ran the tests.
It failed! Or actually it was inconclusive. Which was no big surprise to
him, although he couldn’t help but to feel that there was a lot of work
ahead.

### Keep in step all the time

The exception from SpecFlow was very informative and helpful. It even
gave him some code to get started with. This is what it looked like:
[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TLiAAR5YPiI/AAAAAAAAAmk/jbYFZNPUS2c/Screenshot20101015at12.36.49_thumb1.png?imgmax=800"
title="Intial inconclusive trace" data-border="0"
style="border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; display: block; float: none; margin-left: auto; margin-right: auto;"
width="404" height="104" alt="Intial inconclusive trace" />](http://lh4.ggpht.com/_TI0jeIedRFk/TLiAADZ3Y9I/AAAAAAAAAmg/9q8yXO72y4U/s1600-h/Screenshot20101015at12.36.493.png)
“Sooo… I need to create some steps” – Marcus promptly copied the
WhenINavigateToTheHomepage-method and added a new class
“HomePageSteps.cs” to the Steps folder. He then pasted the code into the
class and ran the test again.
But he was very disappointed to see the same failure… “Aaaah the class
of course need to be public… And apparently need that Binding-attribute
on top. Lets add that.” He did so and ran again.
“Yup – that was better” – he paused. “Kinda… I don’t do what the step
definition says…I’m supposed to navigate to the home-page. But I haven’t
got a site yet. So that is my task at hand now.”
“I’ll use
<a href="http://watin.sourceforge.net/" target="_blank">Watin</a> to
automate the browser” – Marcus said and downloaded and referenced
Watin.Core.dll and Interop.SHDocVw.dll.

“And now all I have to do is to navigate to the page in question. Hmmm –
I know how to navigate with Watin… but where to… I start off by ripping
part of Steven Sanderssons blog post to get a working infrastructure
going.” With that Marcus created the following web browser class:

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://2.bp.blogspot.com/_TI0jeIedRFk/TLiD53iDwcI/AAAAAAAAAnU/JCPsRuGJukU/s1600/Screen+shot+2010-10-15+at+12.53.51.png"
data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
src="http://2.bp.blogspot.com/_TI0jeIedRFk/TLiD53iDwcI/AAAAAAAAAnU/JCPsRuGJukU/s320/Screen+shot+2010-10-15+at+12.53.51.png"
data-border="0" width="320" height="257" /></a>

</div>

“Great” – Marcus thought to himself “ with this in place I can change
the app.config file to point to the root of my application.” He added an
app.config that contained some settings and a RootUrl-key.
Marcus went on to add navigation in the When-step like this:

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://3.bp.blogspot.com/_TI0jeIedRFk/TLiD6C3iJmI/AAAAAAAAAnY/DDtH95aFEmE/s1600/Screen+shot+2010-10-15+at+13.00.44.png"
data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
src="http://3.bp.blogspot.com/_TI0jeIedRFk/TLiD6C3iJmI/AAAAAAAAAnY/DDtH95aFEmE/s1600/Screen+shot+2010-10-15+at+13.00.44.png"
data-border="0" /></a>

</div>

And with that in place Marcus ran the tests again. A browser flashed
before his eyes… It was an Internet Explorer but he couldn’t see the
content. Also when he checked the test run results he could see that
they were still inconclusive. But this time the When-step had passed:

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://3.bp.blogspot.com/_TI0jeIedRFk/TLiD6bgPauI/AAAAAAAAAnc/DDDi8m2riAo/s1600/Screen+shot+2010-10-15+at+13.04.53.png"
data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
src="http://3.bp.blogspot.com/_TI0jeIedRFk/TLiD6bgPauI/AAAAAAAAAnc/DDDi8m2riAo/s320/Screen+shot+2010-10-15+at+13.04.53.png"
data-border="0" width="320" height="98" /></a>

</div>

<div
id="scid:0767317B-992E-4b12-91E0-4F059A8CECA8:2068d381-1444-4f17-94ae-db08182ef93a"
class="wlWriterEditableSmartContent"
style="display: inline; float: none; margin: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px;">

Technorati Tags:
<a href="http://technorati.com/tags/BDD" rel="tag">BDD</a>,<a href="http://technorati.com/tags/SpecFlow" rel="tag">SpecFlow</a>,<a href="http://technorati.com/tags/.NET" rel="tag">.NET</a>

</div>

But the step passed but didn’t do the right thing. There is no website
there. Hmmm – I’ll better add the website and see that it still works.

### Creating the web

Marcus added a new ASP.NET MVC 2 project to his solution;
Marcusoft.OutsideIn.FeatureDemo.Web. He started by removing all the
membership stuff. That wasn’t needed in this project.
Marcus then picked up the url from the project properties web-tab. The
url pointed to [http://localhost:49323](http://localhost:49323/) which
was confirmed when I started the application and got the well-known
default page for an ASP.NET MVC site:

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://3.bp.blogspot.com/_TI0jeIedRFk/TLiD7DWTzlI/AAAAAAAAAnk/LNuKYhfhSdA/s1600/Screen+shot+2010-10-15+at+13.17.59.png"
data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
src="http://3.bp.blogspot.com/_TI0jeIedRFk/TLiD7DWTzlI/AAAAAAAAAnk/LNuKYhfhSdA/s320/Screen+shot+2010-10-15+at+13.17.59.png"
data-border="0" width="320" height="200" /></a>

</div>

He stored that setting in the project, by setting the Specific Port
radio button on the Web-properties for the ASP.NET MVC project. He then
added that url to the RootUrl-key in app.config of the Specs-project.
Marcus ran the tests again. The same behavior… The browser flashed and
he could see anything. In order to see it work Marcus commented the
\[AfterScenario\] in the WebBrowser-class. Now the browser stayed open
and Marcus could see the same page being showed. On the same url even.
With a smile on this face he thought: “Progress” and went on to copy the
method for the Then step definition.

### Then! Why not now?

Marcus added the then step he copied from the test result, to the
HomePageSteps and ran the tests again. The test are still pending but
not with a missing step:

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://3.bp.blogspot.com/_TI0jeIedRFk/TLiD66jXiMI/AAAAAAAAAng/zBMAIuh7I9M/s1600/Screen+shot+2010-10-15+at+13.09.56.png"
data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
src="http://3.bp.blogspot.com/_TI0jeIedRFk/TLiD66jXiMI/AAAAAAAAAng/zBMAIuh7I9M/s320/Screen+shot+2010-10-15+at+13.09.56.png"
data-border="0" width="320" height="42" /></a>

</div>

Again Marcus needed to add the automation that would actually do the
things that the step said: check that no listed feature has status Done.
The simplest solution to that for now is to search for the phrase
“Status: Done” on the page. Marcus also added some checks that the other
statuses is shown. The code for this became something like this with the
use of the excellent
<a href="http://should.codeplex.com/" target="_blank">Should-library</a>
for assertions:

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://4.bp.blogspot.com/_TI0jeIedRFk/TLiD-6S4M4I/AAAAAAAAAoI/224-sllKgRs/s1600/Screen+shot+2010-10-15+at+15.23.20.png"
data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
src="http://4.bp.blogspot.com/_TI0jeIedRFk/TLiD-6S4M4I/AAAAAAAAAoI/224-sllKgRs/s320/Screen+shot+2010-10-15+at+15.23.20.png"
data-border="0" width="320" height="85" /></a>

</div>

When the test were ran this time they fail. Yes failure is our friend –
no we can write some production code:

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://3.bp.blogspot.com/_TI0jeIedRFk/TLiD8loF5iI/AAAAAAAAAnw/PbQkNyDwGog/s1600/Screen+shot+2010-10-15+at+13.36.59.png"
data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
src="http://3.bp.blogspot.com/_TI0jeIedRFk/TLiD8loF5iI/AAAAAAAAAnw/PbQkNyDwGog/s320/Screen+shot+2010-10-15+at+13.36.59.png"
data-border="0" width="320" height="49" /></a>

</div>

<span class="Apple-style-span"
style="font-size: 19px; font-weight: bold;">Let’s write an
application
Now some code was needed in the web application. Marcus needed to get
the page working and listing the features… which in turn meant that he
had to pull the features from the service that Thomas had made.
“Let’s start with the controller. I need to make sure that I can get
hold of the data from the service through the controller to the views".
Let’s write some tests for it” – Marcus said to himself. He added a test
project, referenced nunit.framework.dll, the excellent <a
href="c:\Dev\Marcusoft.OutsideIn.FeatureDemo\Marcusoft.OutsideIn.FeatureDemo.Specs\bin\Debug\Should.Fluent.dll"
target="_blank">NSubsiture.dll</a> and the FeatureDBWrapper that he had
got before. The FeatureDBWrapper exposed a simple interface like this:

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://2.bp.blogspot.com/_TI0jeIedRFk/TLiD86DxKzI/AAAAAAAAAn0/hhuei5o5HAM/s1600/Screen+shot+2010-10-15+at+13.53.09.png"
data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
src="http://2.bp.blogspot.com/_TI0jeIedRFk/TLiD86DxKzI/AAAAAAAAAn0/hhuei5o5HAM/s320/Screen+shot+2010-10-15+at+13.53.09.png"
data-border="0" width="320" height="85" /></a>

</div>

With <a href="http://en.wikipedia.org/wiki/Test-driven_development"
target="_blank">TDD</a> Marcus started fleshed out the structure of the
HomeController and it’s index-method. Still amazed on how well this
process works he found himself:

- Creating some fake data with NSubsitute
- Passing the IFeatureDBWrapper substitute into the HomeController,
    which in turn (and with the help of Resharper in a few keystrokes)
    made the HomeController take an IFeatureDBWrapper as parameter
- Verify that the right method was called and returned the faked data

Here is the test and the controller that was test-driven in the
process:

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://2.bp.blogspot.com/_TI0jeIedRFk/TLiD9_SP0sI/AAAAAAAAAoA/9Rw-3eIvp-Y/s1600/Screen+shot+2010-10-15+at+14.28.12.png"
data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
src="http://2.bp.blogspot.com/_TI0jeIedRFk/TLiD9_SP0sI/AAAAAAAAAoA/9Rw-3eIvp-Y/s400/Screen+shot+2010-10-15+at+14.28.12.png"
data-border="0" width="400" height="186" /></a>

</div>

### Better check with the specifications

“Alright – that worked out just fine! Let just run the Specs to be
sure…” – Marcus thought and hit Run for the tests. They failed. But not
in a good way.
“Actually that is quite strange when I think of it” - Marcus thought.
“Because that injected FeatureDBWrapper to the HomeController should
have broken the site.” He tried to run it in the browser. And yes – it’s
broken. It fails with “No parameterless constructor found for this
object”. Just as Marcus suspected.
“But (!) the When-step of my Spec ran just fine. I better add a check
that I have arrived on the right page to that step” – Marcus thought.
Here is the extension:

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://1.bp.blogspot.com/_TI0jeIedRFk/TLiD9vr-FyI/AAAAAAAAAn8/COSRBVFFdiM/s1600/Screen+shot+2010-10-15+at+14.23.07.png"
data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
src="http://1.bp.blogspot.com/_TI0jeIedRFk/TLiD9vr-FyI/AAAAAAAAAn8/COSRBVFFdiM/s320/Screen+shot+2010-10-15+at+14.23.07.png"
data-border="0" width="320" height="60" /></a>

</div>

<div class="separator" style="clear: both; text-align: center;">

</div>

And now it fails as it should. Marcus went on  to add that title to the
View. “I’ll hardcoded into the view. It will never change” – he laughed
to himself when the sentence passed through his head. He left it
hardcoded.
Alright – not on to fix the injection problem. I’ll go with Ninject for
this. He added <a href="http://ninject.org/" target="_blank">Ninject</a>
and the following code to his Global.asax.cs:

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://1.bp.blogspot.com/_TI0jeIedRFk/TLiD-b6W9WI/AAAAAAAAAoE/h0lfMu8tBTc/s1600/Screen+shot+2010-10-15+at+15.08.03.png"
data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
src="http://1.bp.blogspot.com/_TI0jeIedRFk/TLiD-b6W9WI/AAAAAAAAAoE/h0lfMu8tBTc/s320/Screen+shot+2010-10-15+at+15.08.03.png"
data-border="0" width="320" height="234" /></a>

</div>

“Back to the specs” – Marcus said out loud. He ran them and they failed
but this time as he expected. On Assertion when not finding the
“FeatureStatus: Done”.
“Yeah, that’s right! Haven’t created a view yet”

### View – you want to see something?

Marcus muttered to himself… “I am no designer…Pixel shufflers… where are
they when you need them?” And he created this rather ugly view:

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://4.bp.blogspot.com/_TI0jeIedRFk/TLiD_LWLtWI/AAAAAAAAAoM/fWNvBOh5CdI/s1600/Screen+shot+2010-10-15+at+15.24.56.png"
data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
src="http://4.bp.blogspot.com/_TI0jeIedRFk/TLiD_LWLtWI/AAAAAAAAAoM/fWNvBOh5CdI/s320/Screen+shot+2010-10-15+at+15.24.56.png"
data-border="0" width="320" height="97" /></a>

</div>

that looked like this when rendered in the browser:

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://1.bp.blogspot.com/_TI0jeIedRFk/TLiD_VEZT7I/AAAAAAAAAoQ/qqg5cL8LSQ0/s1600/Screen+shot+2010-10-15+at+15.26.09.png"
data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
src="http://1.bp.blogspot.com/_TI0jeIedRFk/TLiD_VEZT7I/AAAAAAAAAoQ/qqg5cL8LSQ0/s320/Screen+shot+2010-10-15+at+15.26.09.png"
data-border="0" width="320" height="162" /></a>

</div>

Marcus looked at his watch. Not even lunch yet… “Maybe I’ll start
writing the second scenario now. It will probably be faster” – he dived
in.

### Conclusion

And with that we leave Marcus and the fantasy world he is in.
In this, very long blog post, I wanted to try out to be driven by the
specifications outside in to working code. It felt very natural and had
a nice “where do we go now… HERE”-feeling to it. I hope that you could
follow along.
You can
<a href="http://github.com/marcusoftnet/Marcusoft.OutsideIn.FeatureDemo"
target="_blank">download the code here.</a>
