---
layout: post
title: xUnit - closing Selenium driver after ALL test in suite
author: Marcus Hammarberg
date: 2021-10-25T13:42:39.000Z
tags:
  - |-
    Programming
    - C#
---

I'm enjoying myself at work right now, writing a course in C# and for the .NET core platform. Man - this was some time ago.

Naturally I learn a lot. That's why I became a teacher. I wanted to share a little nugget (NuGet?) of gold that I found.

In one of the early labs in the course I used [Selenium](https://www.selenium.dev/) to write some end-to-end tests. And in doing so I need to create `Driver` object, that is both pretty heavy to start and, if left after the test run, quickly will eat your memory.

Now, I was using [xUnit](https://xunit.net/) as my testing framework and xUnit doesn't have a notion of test suites. This was bad since I wanted to create the `Driver` object on the first e2e test and not tear it down until the last.

My intial attempt looked like this:

```csharp
using System;
using Xunit;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;

namespace Salt.Stars.End2End
{
  public class Index_E2E_Tests : IDisposable
  {
    IWebDriver Driver = null;
    public Index_E2E_Tests()
    {
      Driver = new ChromeDriver();
    }

    public void Dispose()
    {
      if (Driver != null)
      {
        Driver.Quit();
        Driver = null;
      }
    }

    [Fact]
    public void Test1()
    {
      // Arrange
      var testName = "Marcus";

      // Act
      Driver.Navigate().GoToUrl($"http://localhost:6001/?developerName={testName}");

      // Assert
      IWebElement mainHeader = Driver.FindElement(By.Id("mainHeader"));
      Assert.Contains(testName, mainHeader.Text);
    }
  }
}
```

Which was not too bad, this will now create the `Driver` object before the first test is run in the file, and dispose of the `Driver` object after the tests in this file.

But I soon ended up with several files like that and I saw 6 Chrome Browsers open. I just need one for all tests in the E2E-suite.

## Fix for the fixture

This [StackOverflow post](https://stackoverflow.com/questions/13829737/run-code-once-before-and-after-all-tests-in-xunit-net) taught me that there's a way to create a disposable fixture like this:

```csharp
public class BrowserFixture : IDisposable
{
  public IWebDriver Driver { get; private set; }
  public BrowserFixture()
  {
    Driver = new ChromeDriver();
  }

  public void Dispose()
  {
    if (Driver != null)
    {
      Driver.Quit();
      Driver = null;
    }
  }
}
```

This is cool - I now have a fixture that is disposed, and it also becomes a little bit like a context for my browser automation tests. Maybe I'll have more stuff in there.

We now need to tell our tests about this fixture. This is done in two steps. First we create a `CollectionFixture` out of our fixture. This is the way that xUnit can group tests together in a ... collection or suite.

```csharp
[CollectionDefinition("Browser automation collection")]
public class BrowserCollection : ICollectionFixture<BrowserFixture>
{
}
```

Yes - no code in there. It's a marker interface that we will use soon. Now, in fact:

```csharp
[Collection("Browser automation collection")]
public class Index_E2E_Tests
{
  IWebDriver _driver = null;
  public Index_E2E_Tests(BrowserFixture browserFixture)
  {
    _driver = browserFixture.Driver;
  }

  [Fact]
  public void Index_Page_Shows_without_name()
  {
    // Act
    _driver.Navigate().GoToUrl($"http://localhost:6001/");

    // Assert
    IWebElement mainHeader = _driver.FindElement(By.Id("mainHeader"));
    Assert.Contains("Get your greeting below", mainHeader.Text);
  }
}
```

The important points happens outside of the tests:

* We mark the class with the `[Collection]` attribute, giving it a name so that we can group things into a collection with the same name.
* Our constructor now gets a parameter of the `BrowserFixture` type that we created before. How? Well, when we defined the collection fixture we gave it the type `ICollectionFixture<BrowserFixture>` and hence can get the fixture of the correct type.
* From that we can then pull the `Driver` or what ever thing we have exposed.

We don't need to dispose the object in our test, that is done after all the tests in the `[Collection("Browser automation collection")]` is run

Nice!
