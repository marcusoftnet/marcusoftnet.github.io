---
layout: post
title: Writing a Selenium test using .NET core and Visual Studio Code
author: Marcus Hammarberg
date: 2021-10-07T21:27:54.000Z
tags:
  - .NET - Life of a consultant - Programming
---

I'm rediscovering my first programming love; .NET. I'm having a blast and .NET core keeps giving.

This post is one of those - I can't believe that I couldn't find this post on the net somewhere. Or I didn't look hard enough.

But I wanted to setup [Selnium testing](https://www.selenium.dev/), but only use .NET Core and Visual Studio Code on my Mac. Every example I saw was using older versions of .NET core (I'm writing this on .NET core 5) and/or Visual Studio, which I don't have.

<!-- excerpt-end -->

## Installations

First, to make .NET and C# developement pretty good in a code editor, we need a few addons to Visual Studio:

* [C# extension](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csharp)

* I also installed Prettier and added support for C# code formatting using the following snippet in my `setttings.json`-file

  ```json
  "[csharp]": {
      "editor.defaultFormatter": "ms-dotnettools.csharp"
  }
  ```

Ok - then of course you need to have [.NET cor](https://dotnet.microsoft.com/download)e installed on you computer.

With that out of the way, crack open the terminal and let's do this.

## Our test project

For this simple get-up-and-running-example I just want to have a testproject that opens a web page using the Chrome Web Driver and then verifies the title of a random site (this blog).

First let's create the test-project, I'm going to go with a `xunit` test project.

```bash
mkdir webtests_core && cd webtests_core
dotnet new xunit
code .
```

This will create the project and open it in Visual Studio core.

Once in there, let's ensure that we got everything up and running, by first running the tests. Go the Visual Studio terminal (or the Mac terminal, whatever you fancy) and go `botnet test`

That should give you a response that ends something lik ethis:

```bash
A total of 1 test files matched the specified pattern.

Passed!  - Failed:     0, Passed:     1, Skipped:     0, Total:     1, Duration: < 1 ms
```

Let's now see if the C# extension works as expected. Quite often, to be honest, it downloads new version of something called OmniSharp and that can take some time. OmniSharp is a server that handles C# refactorings and syntax highlighting for us.

To try it out, rename the file`UnitTest1.cs` to `BlogTests.cs`. Now open that file and position you cursor on the class name, that should be `UnitTest1`. Hit `CMD`  and `.` to open the refactoring and you can then select Change name to `BlogTests`

Quite often you will need to restart OmniSharp, to get this to work, In fact, there's even a command for that in Visual Studio after you have installed OmniSharp. Hit `CMD` + `SHFIT` + `P` to open the command promt and wirte `Restart Omnisharp`. Pretty soon it's restarted and you'll see the editor light up.

Now try the `CMD`  and `.`  again and refactor the class name to match the file name.

Did you notice the link to run or debug the tests, right there in the code editor. Pretty nifty, right?

## Let's do some web stuff

Next up is to install the `Selenium.WebDriver` [NuGet package](https://www.nuget.org/packages/Selenium.WebDriver). This is done, using the terminal with the following command:

```bash
dotnet add package Selenium.WebDriver
```

Cool - now let's use it and write some code. And let's do it properly and ensure that we don't create a lot of resources hanging around.

```csharp
using System;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using Xunit;

public class BlogTests : IDisposable
  {
    IWebDriver Driver = null;
    public BlogTests()
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

    }
  }
}
```

Oh man

* C#! This takes me back.

Sorry, I've wiped the tears now and am ready to explain what is going on.

* XUnit is very lightweight and just uses the normal ways of handling classes lifecycles to managed Setup and TearDown
  * Hence we Setup our test environment in the constructor of the class.
  * The TearDown is a bit more tricky, but by implementing `IDisposable` we ensure that the `Dispose` method gets called once the test goes out of scope and we can there clean up
* The code of the constructor creates a `ChromeDriver` which is my weapon of choice.
  * I had some problems running this, but once I `brew install chromedriver` it worked as it should
* The `Dispose` code checks if the `Driver` has a value and then `.Quit` the browser and sets the value to `null`

Run the tests with `botnet test`  again and you should see ... not much. Sure the `ChromeDriver was started successfully.` and you might seen a browser flash by.

But let's make that browser work for us:

```csharp
[Fact]
public void VerifyThatBlogExists()
{
  // Act
  Driver.Navigate().GoToUrl("https://www.marcusoft.net");

  // Assert
  Assert.Contains("sharing is learning", Driver.Title);
}
```

And that should give you a passing test, because that stupid little phrase has been in my title for years and years.

## Summary

This post came about due to my own frustration of not finding a simple get up and running post for writing a Selenium web test using .NET core and Visual Studio Code.

I hope you found it useful.
