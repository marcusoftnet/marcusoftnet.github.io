---
layout: post
title: Using tags in SpecFlow features
date: 2010-12-13T21:30:00.005Z
author: Marcus Hammarberg
tags:
  - Agile
  - SpecFlow
modified_time: 2012-11-29T20:50:51.777Z
thumbnail: >-
  http://4.bp.blogspot.com/\_TI0jeIedRFk/TQdXP9v4aMI/AAAAAAAAAqE/2ub9D7gAH3M/s72-c/reshaper+showing+features+with+tags+as+categories.png
blogger_id: tag:blogger.com,1999:blog-36533086.post-8822445321832123412
blogger_orig_url: http://www.marcusoft.net/2010/12/using-tags-in-specflow-features.html
---


<div>

Since I first read about
<a href="https://github.com/aslakhellesoy/cucumber/wiki"
target="_blank">Cucumber</a> in the excellent
<a href="http://www.pragprog.com/titles/achbd/the-rspec-book"
target="_blank">RSpec Book</a> the concepts of tags has been the one
that I haven’t really grasped. I liked the idea as outlined
<a href="https://github.com/aslakhellesoy/cucumber/wiki/Tags"
target="_blank">here</a>, which states that you can use tags to organize
your features and only run a subset of them. And the über-cool @wip-tag
that allow you to limit the number of items in progress for the team.
Yam for <a
href="http://www.marcusoft.net/2009/11/kanban-example-by-henrik-kniberg.html"
target="_blank">Kanban</a> lovers.
OK – but when I got around to try it in
<a href="http://www.specflow.org/" target="_blank">SpecFlow</a> I was a
bit disappointed to learn that the only @ignore was supported… Or was
it?

#### @ignore

@ignore is in other words the only tag that is supported by default and
is translated to “IGNORE” in your test framework of choice (for example
<a href="http://www.nunit.org/index.php?p=ignore&amp;r=2.4"
target="_blank">Ignore in NUnit</a> or <a
href="http://msdn.microsoft.com/en-us/library/ms182457(v=vs.80).aspx#UsingIgnoreAttribute"
target="_blank">MsTest</a>).
This can be used to disable features and/or scenarios that are not ready
to be run yet.

#### Custom tags

You then have the liberty to make up any tag you want. For example Aslak
Hellesoy list these;

>     @important @billing @bicker @annoy @qa_ready

You can also use tags for features and scenarios to refer to another
system with requirements (TFS or JIRA for example) with the ID from that
system. Love Aslak comment on that:

> “if you have to deal with old school requirements in a different
> system”

Anyhow, in short – creativity is the limit. You can tag them with
anything you want.

#### Using tags in SpecFlow hooks

But what for? What can I (or rather SpecFlow) do with them. There are
two answers to my knowledge; hooks and test execution.

SpecFlow comes with a number of Hooks that in effect are events that is
fired during the running of features and scenarios. SpecFlow can create
a file with them all for you if you choose the SpecFlow Event Definition
file template. The available hooks are and their running order are:

\[BeforeTestRun\]
  \[BeforeFeature\]
    \[BeforeScenario\]
      \[BeforeScenarioBlock\]
        \[BeforeStep\]
        \[AfterStep\]
      \[AfterScenarioBlock\]
    \[AfterScenario\]
  \[AfterFeature\]
\[AfterTestRun\]

See this <a
href="https://github.com/techtalk/SpecFlow/blob/master/Tests/FeatureTests/BeforeAfterHooks/BeforeAfterHooks.feature"
target="_blank">specification</a> to get it from the source

Luckily they are well-named so it’s easy to know when they run.
Also, they all take zero to more tags as an optional input that we can
make use of to write specialized hooks. Like this:

> ``` brush:
> [BeforeScenario("testTag1")]
> public void BeforeScenario_testTag1()
> ```

So now you can write your own definitions on what’s going to happen when
you tag a scenario (or feature) with a certain tag. Using this technique
we have a @restoreDb that triggers a BeforeScenario-method with that tag
(\[BeforeScenario("restoreDb")\] ) that does that, restore a new
database in a virgin state for us.

Please note that you can use more than one tag in a Hook, like this:

``` brush:
[BeforeScenario("testTag1", "testTag2", "testTag3")]
public void BeforeScenario_testTags()
```

But then the tags are OR:ed together. So the above method (and the empty
one) will be run for @testTag1, @testTag2 and @testTag3.

#### Integration with test frameworks

But wait, there is more. If the test framework supports it (as
<a href="http://www.nunit.org/index.php?p=category&amp;r=2.2"
target="_blank">NUnit</a> and
<a href="http://msdn.microsoft.com/en-us/library/ms182489.aspx#category"
target="_blank">MsTest</a> <a
href="http://groups.google.com/group/specflow/browse_thread/thread/5e15853e59f8219e/baaec86e7ed8da6a?lnk=gst&amp;q=tags+mstest#baaec86e7ed8da6a"
target="_blank">4.0 does</a>) the tags will be converted to Categories
which you can use to run certain parts of your test suite for example.
That would map to the part on
<a href="https://github.com/aslakhellesoy/cucumber/wiki/Tags"
target="_blank">"Running a subset of scenarios” here</a>.

Here’s a picture of Resharpers test runner grouping my features on the
different tags I’ve used:

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://4.bp.blogspot.com/_TI0jeIedRFk/TQdXP9v4aMI/AAAAAAAAAqE/2ub9D7gAH3M/s1600/reshaper+showing+features+with+tags+as+categories.png"
data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
src="http://4.bp.blogspot.com/_TI0jeIedRFk/TQdXP9v4aMI/AAAAAAAAAqE/2ub9D7gAH3M/s320/reshaper+showing+features+with+tags+as+categories.png"
data-border="0" width="320" height="184" /></a>

</div>

#### <span style="font-size: 19px; font-weight: bold;">Conclusion

Of course this can be used on the command line, in your build script
etc. to not have to run through all the tests on every check-in for
example.

This have been a quick tour of the capabilities of tags and hooks in
<a href="http://www.specflow.org/" target="_blank">SpecFlow</a>. I’ve
uploaded my <a href="https://github.com/marcusoftnet/DemoSpecFlowTags"
target="_blank">demo project here</a>.

Please note that I’ve only used tags for Scenario-hooks in the
demo-project, but they work the same for features.

</div>
