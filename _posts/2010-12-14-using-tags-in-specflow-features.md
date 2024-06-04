---
layout: post
title: Using Tags in SpecFlow Features
date: 2010-12-13T21:30:00.005Z
author: Marcus Hammarberg
tags:
  - Agile
  - SpecFlow
modified_time: 2012-11-29T20:50:51.777Z
thumbnail: /img/reshaper+showing+features+with+tags+as+categories.png
blogger_id: tag:blogger.com,1999:blog-36533086.post-8822445321832123412
blogger_orig_url: http://www.marcusoft.net/2010/12/using-tags-in-specflow-features.html
---

Since I first read about [Cucumber](https://github.com/aslakhellesoy/cucumber/wiki) in the excellent [RSpec Book](http://www.pragprog.com/titles/achbd/the-rspec-book), the concept of tags has been one that I haven’t really grasped. I liked the idea as outlined [here](https://github.com/aslakhellesoy/cucumber/wiki/Tags), which states that you can use tags to organize your features and only run a subset of them. The über-cool `@wip` tag allows you to limit the number of items in progress for the team, perfect for [Kanban](http://www.marcusoft.net/2009/11/kanban-example-by-henrik-kniberg.html) lovers.

OK – but when I got around to trying it in [SpecFlow](http://www.specflow.org/), I was a bit disappointed to learn that only `@ignore` was supported… Or was it?

### `@ignore`

`@ignore` is the only tag supported by default and is translated to `IGNORE` in your test framework of choice (for example, [Ignore in NUnit](http://www.nunit.org/index.php) or [MsTest](http://msdn.microsoft.com/en-us/library/ms182457(v=vs.80).aspx#UsingIgnoreAttribute)). This can be used to disable features and/or scenarios that are not ready to be run yet.

### Custom Tags

You then have the liberty to make up any tag you want. For example, Aslak Hellesoy lists these:

```text
@important @billing @bicker @annoy @qa_ready
```

You can also use tags for features and scenarios to refer to another system with requirements (TFS or JIRA, for example) with the ID from that system. Love Aslak's comment on that:

> "if you have to deal with old school requirements in a different system"

Anyhow, in short – creativity is the limit. You can tag them with anything you want.

### Using Tags in SpecFlow Hooks

But what for? What can I (or rather SpecFlow) do with them? There are two answers to my knowledge: hooks and test execution.

SpecFlow comes with a number of hooks that are essentially events fired during the running of features and scenarios. SpecFlow can create a file with them all for you if you choose the SpecFlow Event Definition file template. The available hooks and their running order are:

```csharp
[BeforeTestRun]
  [BeforeFeature]
    [BeforeScenario]
      [BeforeScenarioBlock]
        [BeforeStep]
        [AfterStep]
      [AfterScenarioBlock]
    [AfterScenario]
  [AfterFeature]
[AfterTestRun]
```

See this [specification](https://github.com/techtalk/SpecFlow/blob/master/Tests/FeatureTests/BeforeAfterHooks/BeforeAfterHooks.feature) to get it from the source.

Luckily, they are well-named, so it’s easy to know when they run. Also, they all take zero or more tags as an optional input that we can make use of to write specialized hooks. Like this:

```csharp
[BeforeScenario("testTag1")]
public void BeforeScenario_testTag1()
```

So now you can write your own definitions on what’s going to happen when you tag a scenario (or feature) with a certain tag. Using this technique, we have a `@restoreDb` tag that triggers a `BeforeScenario` method with that tag (`[BeforeScenario("restoreDb")]`) that restores a new database in a virgin state for us.

Please note that you can use more than one tag in a hook, like this:

```csharp
[BeforeScenario("testTag1", "testTag2", "testTag3")]
public void BeforeScenario_testTags()
```

But then the tags are OR-ed together. So the above method (and the empty one) will run for `@testTag1`, `@testTag2`, and `@testTag3`.

### Integration with Test Frameworks

But wait, there is more. If the test framework supports it (as [NUnit](http://www.nunit.org/index.php?p=category&r=2.2) and [MsTest](http://msdn.microsoft.com/en-us/library/ms182489.aspx#category) [4.0 does](http://groups.google.com/group/specflow/browse_thread/thread/5e15853e59f8219e/baaec86e7ed8da6a?lnk=gst&q=tags+mstest#baaec86e7ed8da6a)), the tags will be converted to categories which you can use to run certain parts of your test suite, for example.

That would map to the part on ["Running a subset of scenarios"](https://github.com/aslakhellesoy/cucumber/wiki/Tags).

Here’s a picture of Resharper's test runner grouping my features on the different tags I’ve used:

![Categories](/img/reshaper+showing+features+with+tags+as+categories.png)

Of course, this can be used on the command line, in your build script, etc., to not have to run through all the tests on every check-in, for example.

This has been a quick tour of the capabilities of tags and hooks in [SpecFlow](http://www.specflow.org/). I’ve uploaded my [demo project here](https://github.com/marcusoftnet/DemoSpecFlowTags).

Please note that I’ve only used tags for scenario hooks in the demo project, but they work the same for features.