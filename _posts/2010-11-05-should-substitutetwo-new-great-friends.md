---
layout: post
title: Should & Substitute–two new great friends
date: 2010-11-05T08:33:00.001Z
author: Marcus Hammarberg
tags:
  - BDD
  - Tools
  - .NET
  - TDD
modified_time: 2010-12-14T15:22:38.152Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-1188276247401983374
blogger_orig_url: http://www.marcusoft.net/2010/11/should-substitutetwo-new-great-friends.html
---



Recently I’ve stumbled upon two great framework that greatly enhanced my
test code.

### Should I? Yes – you should

First up is
<a href="http://should.codeplex.com/" target="_blank">Should</a> – which
is a assertion framework that makes your assertions much more readable
and easier to write. Here’s some code that shows off it’s capabilities:
       object obj = null;

        obj = new object();
        obj.Should().Be.OfType(typeof(object));
        obj.Should().Equal(obj);
        obj.Should().Not.Be.Null();
        obj.Should().Not.Be.SameAs(new object());
        obj.Should().Not.Be.OfType<string>();
        obj.Should().Not.Equal("foo");
       "This String".Should().Contain("This");
        "This String".Should().Not.Be.Empty();
        "This String".Should().Not.Contain("foobar");
       var list = new List<object>();
        list.Should().Count.Zero();
        list.Should().Not.Contain.Item(new object());
       var item = new object();
        list.Add(item);
        list.Should().Not.Be.Empty();
        list.Should().Contain.Item(item);

One really nice feature is that the framework isn’t tied to any testing
framework but works nicely with any test framework.

### Get me a substitute! Now

The other framework is
<a href="http://nsubstitute.github.com/" target="_blank">NSubstitute</a>
which is a mocking framework. I first got hooked when I read their
intro:

>
>
> Mock, stub, fake, spy, test double? Strict or loose? Nah, just
> substitute for the type you need!

I’m probably the only one (NOT!) who mess mock, stubs and fakes up
except from just after I read a book on the subject. And really – who
cares? I just want something to replace the real stuff for a while –
let’s call it a substitute.

The syntax is also super-clean and easy going. Here’s the example from
the NSubstitute site:
   //Create:

    //Set a return value:
    calculator.Add(1, 2).Returns(3);
    Assert.AreEqual(3, calculator.Add(1, 2));
   //Check received calls:
    calculator.Received().Add(1, Arg.Any<int>());
    calculator.DidNotReceive().Add(2, 2);

### Come together. Right now

But the true power, I think, you get when combining these two together.
Here’s an example from I did to show
<a href="http://www.specflow.org" target="_blank">SpecFlow</a> that uses
both Should and NSubsitute:
   [Given(@"the following features in the database:")]
    public void GivenTheFollowingFeaturesInTheDatabase(Table table)
    {
       var features = table.CreateSet<Feature>().ToList();
      var dbWrapperSubsitute = Substitute.For<IFeatureDBWrapper>();

   }

    [When(@"I navigate to the homepage")]
    public void WhenINavigateToTheHomepage()
    {
        var featureDBWrapper = ScenarioContext.Current.Get<IFeatureDBWrapper>(DBWRAPPER_KEY);
        var controller = new HomeController(featureDBWrapper);
       var indexView = controller.Index() as ViewResult;
       indexView.Should().Not.Be.Null();
        indexView.ViewData.Model.Should().Not.Be.Null();
        var features = (IList<Feature>)indexView.ViewData.Model;
        features.Should().Not.Be.Null();
       featureDBWrapper.Received().AllNotDone();
       ScenarioContext.Current.Set(features, FEATURES_IN_VIEW_KEY);

    [Then(@"I should see a view with the following features:")]
    public void ThenIShouldSeeAViewWithTheFollowingFeatures(Table table)
    {
        var features = ScenarioContext.Current.Get<IList<Feature>>(FEATURES_IN_VIEW_KEY);
       var expectedFeatures = table.CreateSet<Feature>();
       foreach (var expectedFeature in expectedFeatures)
        {
            features.Should().Contain.Any( f => f.Name ==  expectedFeature.Name);
            features.Should().Contain.Any( f => f.AssignedTo ==  expectedFeature.AssignedTo);
            features.Should().Contain.Any( f => f.HoursWorked ==  expectedFeature.HoursWorked);
            features.Should().Contain.Any( f => f.Status ==  expectedFeature.Status);
            features.Should().Contain.Any( f => f.Size ==  expectedFeature.Size);
        }
    }

You can find the whole <a
href="https://github.com/marcusoftnet/Marcusoft.OutsideIn.FeatureDemo"
target="_blank">solution here</a>.

Recently I’ve stumbled upon two great framework that greatly enhanced my
test code.

### Should I? Yes – you should

First up is
<a href="http://should.codeplex.com/" target="_blank">Should</a> – which
is a assertion framework that makes your assertions much more readable
and easier to write. Here’s some code that shows off it’s capabilities:
       object obj = null;

        obj = new object();
        obj.Should().Be.OfType(typeof(object));
        obj.Should().Equal(obj);
        obj.Should().Not.Be.Null();
        obj.Should().Not.Be.SameAs(new object());
        obj.Should().Not.Be.OfType<string>();
        obj.Should().Not.Equal("foo");
       "This String".Should().Contain("This");
        "This String".Should().Not.Be.Empty();
        "This String".Should().Not.Contain("foobar");
       var list = new List<object>();
        list.Should().Count.Zero();
        list.Should().Not.Contain.Item(new object());
       var item = new object();
        list.Add(item);
        list.Should().Not.Be.Empty();
        list.Should().Contain.Item(item);

One really nice feature is that the framework isn’t tied to any testing
framework but works nicely with any test framework.

### Get me a substitute! Now

The other framework is
<a href="http://nsubstitute.github.com/" target="_blank">NSubstitute</a>
which is a mocking framework. I first got hooked when I read their
intro:

>
>
> Mock, stub, fake, spy, test double? Strict or loose? Nah, just
> substitute for the type you need!

I’m probably the only one (NOT!) who mess mock, stubs and fakes up
except from just after I read a book on the subject. And really – who
cares? I just want something to replace the real stuff for a while –
let’s call it a substitute.

The syntax is also super-clean and easy going. Here’s the example from
the NSubstitute site:
   //Create:

    //Set a return value:
    calculator.Add(1, 2).Returns(3);
    Assert.AreEqual(3, calculator.Add(1, 2));
   //Check received calls:
    calculator.Received().Add(1, Arg.Any<int>());
    calculator.DidNotReceive().Add(2, 2);

### Come together. Right now

But the true power, I think, you get when combining these two together.
Here’s an example from I did to show
<a href="http://www.specflow.org" target="_blank">SpecFlow</a> that uses
both Should and NSubsitute:
   [Given(@"the following features in the database:")]
    public void GivenTheFollowingFeaturesInTheDatabase(Table table)
    {
       var features = table.CreateSet<Feature>().ToList();
      var dbWrapperSubsitute = Substitute.For<IFeatureDBWrapper>();

   }

    [When(@"I navigate to the homepage")]
    public void WhenINavigateToTheHomepage()
    {
        var featureDBWrapper = ScenarioContext.Current.Get<IFeatureDBWrapper>(DBWRAPPER_KEY);
        var controller = new HomeController(featureDBWrapper);
       var indexView = controller.Index() as ViewResult;
       indexView.Should().Not.Be.Null();
        indexView.ViewData.Model.Should().Not.Be.Null();
        var features = (IList<Feature>)indexView.ViewData.Model;
        features.Should().Not.Be.Null();
       featureDBWrapper.Received().AllNotDone();
       ScenarioContext.Current.Set(features, FEATURES_IN_VIEW_KEY);

    [Then(@"I should see a view with the following features:")]
    public void ThenIShouldSeeAViewWithTheFollowingFeatures(Table table)
    {
        var features = ScenarioContext.Current.Get<IList<Feature>>(FEATURES_IN_VIEW_KEY);
       var expectedFeatures = table.CreateSet<Feature>();
       foreach (var expectedFeature in expectedFeatures)
        {
            features.Should().Contain.Any( f => f.Name ==  expectedFeature.Name);
            features.Should().Contain.Any( f => f.AssignedTo ==  expectedFeature.AssignedTo);
            features.Should().Contain.Any( f => f.HoursWorked ==  expectedFeature.HoursWorked);
            features.Should().Contain.Any( f => f.Status ==  expectedFeature.Status);
            features.Should().Contain.Any( f => f.Size ==  expectedFeature.Size);
        }
    }

You can find the whole <a
href="https://github.com/marcusoftnet/Marcusoft.OutsideIn.FeatureDemo"
target="_blank">solution here</a>.
