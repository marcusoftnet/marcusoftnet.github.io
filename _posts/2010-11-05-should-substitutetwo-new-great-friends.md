---
layout: post
title: Should & Substitute – Two New Great Friends
date: 2010-11-05T08:33:00.001Z
author: Marcus Hammarberg
tags:
  - BDD
  - Tools
  - .NET
  - TDD
modified_time: 2010-12-14T15:22:38.152Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-1188276247401983374
blogger_orig_url: https://www.marcusoft.net/2010/11/should-substitutetwo-new-great-friends.html
---

Recently, I discovered two fantastic frameworks that have significantly improved my test code: `Should` and `NSubstitute`.

### Should I? Yes – You Should

First up is [Should](http://should.codeplex.com/), an assertion framework that enhances the readability and ease of writing assertions. Here’s an example showcasing its capabilities:

```csharp
object obj = new object();

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
```

One of the great features of `Should` is that it’s not tied to any specific testing framework, making it versatile and compatible with any test framework.

### Get Me a Substitute! Now

The other framework I’d like to highlight is [NSubstitute](http://nsubstitute.github.com/), a mocking framework that simplifies creating substitutes for dependencies. The introductory message from NSubstitute says it all:

> Mock, stub, fake, spy, test double? Strict or loose? Nah, just substitute for the type you need!

I often mix up mocks, stubs, and fakes, and honestly, I don’t care about the distinctions when I just need a simple substitute. NSubstitute offers clean and easy-to-read syntax. Here’s an example from their site:

```csharp
// Create a substitute:
var calculator = Substitute.For<ICalculator>();

// Set a return value:
calculator.Add(1, 2).Returns(3);
Assert.AreEqual(3, calculator.Add(1, 2));

// Check received calls:
calculator.Received().Add(1, Arg.Any<int>());
calculator.DidNotReceive().Add(2, 2);
```

### Come Together, Right Now

The real power comes when you combine `Should` and `NSubstitute`. Here’s an example demonstrating their use with [SpecFlow](http://www.specflow.org/):

```csharp
[Given(@"the following features in the database:")]
public void GivenTheFollowingFeaturesInTheDatabase(Table table)
{
    var features = table.CreateSet<Feature>().ToList();
    var dbWrapperSubstitute = Substitute.For<IFeatureDBWrapper>();
    // Configure the substitute as needed
}

[When(@"I navigate to the homepage")]
public void WhenINavigateToTheHomepage()
{
    var featureDBWrapper = ScenarioContext.Current.Get<IFeatureDBWrapper>(DB_WRAPPER_KEY);
    var controller = new HomeController(featureDBWrapper);
    var indexView = controller.Index() as ViewResult;

    indexView.Should().Not.Be.Null();
    indexView.ViewData.Model.Should().Not.Be.Null();

    var features = (IList<Feature>)indexView.ViewData.Model;
    features.Should().Not.Be.Null();
    featureDBWrapper.Received().AllNotDone();
    ScenarioContext.Current.Set(features, FEATURES_IN_VIEW_KEY);
}

[Then(@"I should see a view with the following features:")]
public void ThenIShouldSeeAViewWithTheFollowingFeatures(Table table)
{
    var features = ScenarioContext.Current.Get<IList<Feature>>(FEATURES_IN_VIEW_KEY);
    var expectedFeatures = table.CreateSet<Feature>();

    foreach (var expectedFeature in expectedFeatures)
    {
        features.Should().Contain.Any(f => f.Name == expectedFeature.Name);
        features.Should().Contain.Any(f => f.AssignedTo == expectedFeature.AssignedTo);
        features.Should().Contain.Any(f => f.HoursWorked == expectedFeature.HoursWorked);
        features.Should().Contain.Any(f => f.Status == expectedFeature.Status);
        features.Should().Contain.Any(f => f.Size == expectedFeature.Size);
    }
}
```

You can find the complete [solution here](https://github.com/marcusoftnet/Marcusoft.OutsideIn.FeatureDemo).

Both `Should` and `NSubstitute` have greatly enhanced my testing capabilities, and I’m excited to see how they can benefit your projects as well.