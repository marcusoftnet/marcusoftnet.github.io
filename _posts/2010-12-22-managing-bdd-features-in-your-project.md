---
layout: post
title: Managing BDD features in our project (using TFS)
date: '2010-12-21T20:17:00.005+01:00'
author: Marcus Hammarberg
tags:
  - BDD
  - .NET
  - Life of a consultant
   - TFS - Agile - SpecFlow
modified_time: '2011-01-13T21:18:53.615+01:00'
thumbnail: http://lh4.ggpht.com/\_TI0jeIedRFk/TRH-yMkOTrI/AAAAAAAAAqs/T9aoPLDlot0/s72-c/wlEmoticon-winkingsmile%5B2%5D.png?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-6919193304724604886
blogger_orig_url: http://www.marcusoft.net/2010/12/managing-bdd-features-in-your-project.html
---

From time to time I find myself in the position where I ask “stupid”
questions. I’ve found that it’s often the case that the question is not
that “stupid” after all and if it is you get to learn a lot in the
process. I have never been verbally abused, flamed or laughed at for my
questions – which often are the reasons that people don’t want to ask to
“stupid” questions.
So recently I’ve been asking “stupid” (final time I use that word in
this post, promise) questions surrounding the management of features
(.feature-files for us
<a href="https://github.com/aslakhellesoy/cucumber/wiki/"
target="_blank">Cucumber</a> freaks). And at the same time I've
searching high and low on the net for best practices on how to managing
your features through the course of a project.
I didn't find much due a couple of reason:

-   the Ruby/ cucumber inheritance of .net tools such as SpecFlow is
    great - you can learn a lot(!!) from that community. But there is
    not much written on BDD project management in .net. Also the whole
    Ruby environment is very different than the typical .net setup. This
    allows for other kind of solutions.
-   I was asking the wrong question. My initial thoughts were centered
    on how to get the business side responsible for the features and the
    writing of them. Wrong! More on that below.
-   there might not yet be a best practice surrounding this for .net
    projects using TFS. We're still catching up with the BDD community
    in general.

So on to my suggestions. How do I Manage BDD features in my project
(using Team Foundation Server (TFS)).


### Managing

What it the deal with this? As I introduce the concept of 
<a href="http://specificationbyexample.com/"
target="_blank">Specification by example</a> to business people they
always ask me about these things:

-   “How do we link this to our current project templates”
-   “What about traceability in our electronic tracking system”
-   “I want to follow the whole chain from vision to maintenance and bug
    reporting in TFS. How can your BDD-features hook into that?”

I personally might not put so much emphasizes on this but it might be
important to big organizations to have this unbroken chain of
traceability in an electronic system such as TFS.
But I think this was what lead me of the agile, collaborative track for
a while. I don’t think it’s impossible to achieve but I think it might
not be the tracking system that is the master of the feature-data. More
on that below.


### <a href="http://en.wikipedia.org/wiki/Behavior_Driven_Development"
target="_blank">BDD</a> or Specification by example

A phrase I’ve heard a lot when reading about specification by example is
“It’s not in the tool”. That tells us that the or a tool is not the
solution. But what is then – Collaboration is the solution. It’s
<a href="http://en.wikipedia.org/wiki/No_Silver_Bullet"
target="_blank">no silver bullet</a> – but it comes close, very close.
<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TRH-yMkOTrI/AAAAAAAAAqs/T9aoPLDlot0/wlEmoticon-winkingsmile%5B2%5D.png?imgmax=800"
class="wlEmoticon wlEmoticon-winkingsmile"
style="border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none;"
alt="Winking smile" />
What this means is that the real benefit from using the agile
methodology of BDD is that you meet all the people involved in realizing
a feature and write down how you expect the feature to work. In a
language that all of you understand. Using examples that later can be
used to test that the application behaves as expected.
That’s the thing!
There are tools that help you to drive that process and run your
scenarios but that’s not nearly as important as the fact that you meet
and write the scenarios down, together.


### Features

So that leads us to the features. What are those? What do they
represent? And who writes them?
A feature is a behavior in the system that some person (or role)
benefits from (see <a href="http://blog.dannorth.net/introducing-bdd/"
target="_blank">Introducing BDD by Dan North</a>). Often they written in
the form of
<a href="http://en.wikipedia.org/wiki/User_story" target="_blank">user
stories</a> since that practice and form capture the three elements in a
very concise format:

> **As a** \[X\]
> **I want** \[Y\]
> **so that** \[Z\]

Who writes the stories then? It’s easy to think that this a business /
requirement thing. But as a <a
href="http://groups.google.com/group/behaviordrivendevelopment/msg/e8b983ae5b433b99"
target="_blank">great answer</a> to <a
href="http://groups.google.com/group/behaviordrivendevelopment/browse_thread/thread/c75ec1255a34a5a6/e8b983ae5b433b99?#e8b983ae5b433b99"
target="_blank">my question</a>,
<a href="http://cuke4ninja.com/sec_collaborative_feature_files.html"
target="_blank">great authoritative resources</a> and even <a
href="http://blog.jonasbandi.net/2010/05/bdd-antipattern-business-readable-but.html"
target="_blank">links off old post of mine</a> shows that misses the
point of BDD. You want to write the features and their scenarios
together as I wrote above. A bit like this maybe:

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://1.bp.blogspot.com/_TI0jeIedRFk/TRH_cbh-9NI/AAAAAAAAAqw/3SjZhSN62Do/s1600/specws.jpg"
data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
src="http://1.bp.blogspot.com/_TI0jeIedRFk/TRH_cbh-9NI/AAAAAAAAAqw/3SjZhSN62Do/s320/specws.jpg"
data-border="0" width="320" height="156" /></a>

</div>



(Short side note – I actually was on to that track in an
<a href="http://www.marcusoft.net/2010/08/story-on.html"
target="_blank">earlier post</a> also, which I hope lessen the stupidity
of my question and reasoning a bit <img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TRH-yMkOTrI/AAAAAAAAAqs/T9aoPLDlot0/wlEmoticon-winkingsmile%5B2%5D.png?imgmax=800"
class="wlEmoticon wlEmoticon-winkingsmile"
style="border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none;"
alt="Winking smile" />).
In the picture above we see that the roles needed to grasp the story
meet, bringing all the documentation of the work they have done up to
now and record their common understanding of the problem in a feature
with scenarios. They write the feature together. 
In the <a
href="http://groups.google.com/group/behaviordrivendevelopment/msg/e8b983ae5b433b99"
target="_blank">answer to my question on the BDD list</a> another view
was also suggested:

> “Cucumber features are an executable map of the current
> functionality of the system”
> “The output of running cucumber features is something you can keep.
> You can
> say at this time that system was like this.”

I like this idea a lot! (Thanks
<a href="http://blog.andrew.premdas.org/" target="_blank">Andrew
Premdas</a>). In a way this means that the content of the .feature files
are like source code that can be run to see how well the system fulfills
the current requirements.
So in short – you meet and write the features down together. Probably
this can be sketched out during the meeting and nailed by somebody later
(to better match existing steps or to keep the language consistent for
example).
The feature is then checked in with the source code as it can be
executed to produce a map between our common understanding of the
requirements and how well the system fulfills them.
 

### Associate with work item in TFS

Now we can see how to associate the feature we write together with a
work item in TFS. The link between the two can be achieved two-way like
this:

-   in the .feature file you can <a
    href="http://www.marcusoft.net/2010/12/using-tags-in-specflow-features.html"
    target="_blank">tag</a> the feature or scenario with the work item
    id, @TFS_432453 for example. That can be used to search for the item
    among your scenarios and to control which items that are run again
    <a
    href="http://www.marcusoft.net/2010/12/using-tags-in-specflow-features.html"
    target="_blank">see this post</a>).
-   you can also use a comment with a link to the work item on the TFS
    Server. For example this link
    (<http://tfs:8080/tfs/WorkItemTracking/Workitem.aspx?artifactMoniker=68717>)
    will take me to the WI 68717 on the TFS web site.
    when the .feature file is created, associate it with the work item
    of choice (for example a work item with some relevant documentation
    attached to it) just like you do with any other check in.

### Suggested workflow

An example on who this can be worked into a workflow of an feature would
be this:

When the item is about to be developed, gather the required people and
skills that you need to formulate the scenarios of the item. This would
typically be the sprint planning meeting or an analyze step on a Kanban
board

Sketch down the feature and a couple of scenarios. There’s a lot to be
said about this (see <http://www.cuke4ninja.com/> for some good advices
and directions) but all the roles need to have their say and input in
how to formulate the scenarios. So that:

1.  Requirements get all the important business rules and effects into
    the story
2.  Developers might think of edge cases and some special cases
3.  Testers get the coverage and spread of test data that is needed
4.  Maintenance get their say on how the function behaves etc.

Get one person to write down the story in a .feature-file, do the check
in and associate the .feature with the required work items.

As work is commenced the different steps will give the developers a
possibility to work outside-in and complete the feature step-by-step.

When new knowledge arises (as it always does) that can easily be
incorporated into the feature by updating and changing the scenarios. Of
course after communicating within the team.

Likewise when testing is done new scenarios and new data might be added
to further enhance the story. The use of <a
href="http://www.marcusoft.net/2010/12/using-tags-in-specflow-features.html"
target="_blank">tags</a> can be used here to differentiate between the
different test and when to run them

### Conclusion

I am sure that I will find some better way to do this as we go along but
this is the way we do it now and it works quite nice and also fulfills
the need of connecting the agile workflow of specification by example
with TFS.
