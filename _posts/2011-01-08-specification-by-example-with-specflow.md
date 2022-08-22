---
layout: post
title: Specification by example with SpecFlow in TFS and the question of traceability
date: '2011-01-07T22:33:00.002+01:00'
author: Marcus Hammarberg
tags:
  - BDD
  - TFS
  - Agile
  - SpecFlow
modified_time: '2011-01-13T21:18:16.228+01:00'
thumbnail: http://lh5.ggpht.com/\_TI0jeIedRFk/TSeGuHKFJKI/AAAAAAAAArM/XjCCauGjlF0/s72-c/specws_thumb%5B2%5D.jpg?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-4541921553992432260
blogger_orig_url: http://www.marcusoft.net/2011/01/specification-by-example-with-specflow.html
---

This is the second post talking about how to integrate the use of
Team Foundation Server (TFS) in a
<a href="http://specificationbyexample.com/"
target="_blank">Specification by example</a>
(<a href="http://en.wikipedia.org/wiki/Behavior_Driven_Development"
target="_blank">BDD</a>, ATDD call it what you want) workflow. You can
read the <a
href="http://www.marcusoft.net/2010/12/managing-bdd-features-in-your-project.html"
target="_blank">first post here</a> for some background, but I will
include some background here too, as I have thought about it some
more.

### Background

Specification by example is not only a way to write executable
specifications (red. those words still gives me the chills) but in the
way it’s used in projects lies some kind of agile methodology hidden.
The early and frequent communication and documentation (in a commonly
understood format,
<a href="https://github.com/aslakhellesoy/cucumber/wiki/gherkin"
target="_blank">Gherkin</a>) it fosters really get the way you work in a
very agile way. More on that later.
Cucumber is a very well known tool in the Ruby world, where projects
often create web applications. I think that this inheritance has
influenced the process above, which states quick and rapid movement and
very agile ways.
This doesn’t sit to well with big organizations where maintainability
and traceability from requirements through bugs and change requests are
very important.
After my <a
href="http://www.marcusoft.net/2010/12/managing-bdd-features-in-your-project.html"
target="_blank">last blog post</a> I got some feedback from
<a href="http://www.hugohaggmark.com/" target="_blank">Hugo Häggmark</a>
and <a href="http://hakanforss.wordpress.com/" target="_blank">Håkan
Fors</a> that suggested different approaches to how the TFS work items
could be used in this workflow. Since I haven’t use the different work
item types much I got together with Hugo (who is now my colleague!) and
tried to flesh things out. This is our findings.

### Specification

All the work that is done before a feature is implemented should of
course not be wasted but in the Specification by example process (if
such a thing exists) it’s just background information. You might want to
link to it or read up on it before you get together but the important
“handshake” is the .feature-file and the scenarios in it.
It’s here we, together write down our common understanding of the
functionality. A good place to do this is in the Sprint planning meeting
(for Scrum) or an early stage of your agile process.
[<img
src="http://lh5.ggpht.com/_TI0jeIedRFk/TSeGuHKFJKI/AAAAAAAAArM/XjCCauGjlF0/specws_thumb%5B2%5D.jpg?imgmax=800"
title="All roles bring their respective background to the specification workshop"
data-border="0"
style="background-image: none; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; display: block; float: none; margin-left: auto; margin-right: auto; padding-left: 0px; padding-right: 0px; padding-top: 0px;"
width="240" height="156"
alt="All roles bring their respective background to the specification workshop" />](http://lh5.ggpht.com/_TI0jeIedRFk/TSeGtaWUfhI/AAAAAAAAArI/9OIHeyCXRuY/s1600-h/specws%5B4%5D.jpg)
The requirement team has, if they are using the
<a href="http://msdn.microsoft.com/en-us/library/dd997897.aspx"
target="_blank">TFS Agile template</a> or similar, probably created
<a href="http://msdn.microsoft.com/en-us/library/dd380634.aspx"
target="_blank">user story work items</a> for the different user
stories. The .feature files that are created (with
<a href="http://www.specflow.org/" target="_blank">SpecFlow</a>) are
associated with their respective user story work item at check-in time,
to get the link and traceability between the work items and the
.feature-file. Also you can link back from the .feature-file (see <a
href="http://www.marcusoft.net/2010/12/managing-bdd-features-in-your-project.html"
target="_blank">earlier blog post on this</a>).

### Testing

But that’s only part of the story; the other part is testing.  A very
common misconception is that SpecFlow features are tests. That is wrong!
A SpecFlow feature is a executable specification. When it’s implemented
it can be used see or verify which functionality your system currently
implements and satisfy:

> “Cucumber features are an executable map of the current
> functionality of the system.” - <a
> href="http://groups.google.com/group/behaviordrivendevelopment/msg/e8b983ae5b433b99?pli=1"
> target="_blank">Andrew Premdas</a>

Does this mean that you don’t need testing? What does a tester do in a
working agile project that write executable specifications.
I don’t claim to be an expert on this area (I recommend <a
href="http://www.amazon.com/Agile-Testing-Practical-Guide-Testers/dp/0321534468"
target="_blank">Agile Testing by Lisa Crispin and Janet Gregory</a> for
an excellent deep dive in the subject), but one thing that still is left
is what’s called;
<a href="http://en.wikipedia.org/wiki/Exploratory_testing"
target="_blank">exploratory testing</a>:

> Exploratory testing seeks to find out how the software actually works,
> and to ask questions about how it will handle difficult and easy cases

So this is where you try to find the cases that you haven’t covered
already. There is great support in TFS for this. For example the
<a href="http://msdn.microsoft.com/en-us/library/bb385901.aspx"
target="_blank">Microsoft Test Manager</a> in which you can create test
plans and test cases.
The <a href="http://msdn.microsoft.com/en-us/library/dd380712.aspx"
target="_blank">test case work item</a> is used to test the user story
work item that we talked about earlier, so they are linked together in a
nice tight fashion. In the test cases a series of steps are specified
that the tester should take and verify the outcome. If exploratory
testing is done these are often manual tests.

### Bugs and test automation

But what if a bug is discovered? Well the tester then create a
<a href="http://msdn.microsoft.com/en-us/library/dd380645.aspx"
target="_blank">bug work item type</a> that is associated to the test
case.
The bug is then assigned to a developer who see what needs to be changed
to fix the bug. It might be that the scenarios we wrote in our .feature
file was faulty or that the implementation didn’t do what it was
supposed. Or it might be a thing that we haven’t thought of at all.
But the good news is that we can create a scenario that shows how to
reproduce the bug, as a SpecFlow scenario. When that is done and the bug
is fixed we can do two things to keep the traceability chain intact:

1. Resolve the bug at check-in, or whatever your state diagram allow
    the developer to do
2. In the test case where the bug is found, the developer can create an
    <a href="http://msdn.microsoft.com/en-us/library/dd553273.aspx"
    target="_blank">Associated Automation</a>. This is a field where you
    can point to different kind of automated test; among others Unit
    Tests. And that is the great news for us since you then can point
    SpecFlow scenario (or rather the generated unit-test behind it).

### Recap

This picture shows the complete flow, with suggested use of the
different work item types of the MSF Agile template.
[<img
src="http://lh6.ggpht.com/_TI0jeIedRFk/TSg0Y946GVI/AAAAAAAAArc/ZZdv-V7Cn1I/linking%20work%20items%20and%20features_thumb%5B10%5D.png?imgmax=800"
title="linking work items and features" data-border="0"
style="background-image: none; border-bottom: 0px; border-left: 0px; border-right: 0px; border-top: 0px; display: block; float: none; margin-left: auto; margin-right: auto; padding-left: 0px; padding-right: 0px; padding-top: 0px;"
width="502" height="437" alt="linking work items and features" />](http://lh5.ggpht.com/_TI0jeIedRFk/TSg0YPS8k-I/AAAAAAAAArY/wAktg6mYekY/s1600-h/linking%20work%20items%20and%20features%5B8%5D.png)

1. User story work items contains the “raw” requirements and links to
    any documents that is needed to understand the story.
2. The user story and other background information is used to create a
    feature file, for example in a sprint planning meeting.
    The feature will be our executable specification during development
    and afterwards serve as a regression verification of our systems
    current state
3. A test leader create a test plan to plan the exploratory testing of
    the system.
4. This plan contains many different test cases that states how the
    tests should be conducted. The test cases tests a user story and
    describes the different stages of the test, with expected outcome.
5. If a bug is found it’s assigned to a developer
6. The developer creates scenario that shows how the bug can be
    reproduced.
7. The scenario and the corrections in the system are associated with
    the bug at check-in time.
8. Finally the developer returns to the test case and associate the
    scenario as an associated automation, for later automation.

### Conclusion

This is one way to get full traceability through the whole process and
still keep the specification by example / BDD process going.
A big thank you go out to
<a href="http://www.hugohaggmark.com/" target="_blank">Hugo</a>, that
showed me the inner workings of the MSF Agile template.
