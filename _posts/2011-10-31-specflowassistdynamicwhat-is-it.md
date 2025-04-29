---
layout: post
title: SpecFlow.Assist.Dynamic - What Is It?
date: 2011-10-31T07:00:00.000Z
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
  - C#
  - SpecFlow
modified_time: 2011-11-03T15:37:44.638Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-4240793233483386742
blogger_orig_url: https://www.marcusoft.net/2011/10/specflowassistdynamicwhat-is-it.html
---

I’m excited to share a new NuGet package I’ve been working on: [SpecFlow.Assist.Dynamic](http://nuget.org/List/Packages/SpecFlow.Assist.Dynamic). This extension builds on [SpecFlow](https://www.specflow.org) and the fantastic [Assist helpers](https://github.com/techtalk/SpecFlow/wiki/SpecFlow-Assist-Helpers) created by [Darren Cauthon](http://www.cauthon.com/).

In this post, I’ll cover what SpecFlow.Assist.Dynamic is, the problem it solves, and how it was developed. Future posts will delve into its usage and how it integrates with [Simple.Data](https://github.com/markrendle/Simple.Data) to enhance the testing experience.

### The Problem

One of the common issues with SpecFlow is the need to create simple data transfer classes just to move data around in your step definitions. For example, consider the following Gherkin step:

```gherkin
Given the following users exist in the database:
    | Name   | Age | Birth date | Length in meters |
    | Marcus | 39  | 1972-10-09 | 1.96             |
    | Albert | 3   | 2008-01-24 | 1.03             |
    | Gustav | 1   | 2010-03-19 | 0.84             |
    | Arvid  | 1   | 2010-03-19 | 0.85             |
```

To handle this, you would typically create a `User` class and use it in your step definitions:

```csharp
[Binding]
public class DemoSteps
{
    [Given(@"the following users in the database")]
    public void GivenTheFollowingUsersInTheDatabase(Table table)
    {
        IEnumerable<User> listOfUsers = table.CreateSet<User>();
        // Insert into database code goes here
    }
}

public class User
{
    public string Name { get; set; }
    public int Age { get; set; }
    public DateTime BirthDate { get; set; }
    public double LengthInMeters { get; set; }
}
```

While the step definition itself is concise, the `User` class is merely a data carrier and adds unnecessary overhead.

### The Solution

While working with [Simple.Data](https://github.com/markrendle/Simple.Data), I realized that [dynamics](http://msdn.microsoft.com/en-us/library/dd264736.aspx) in C# could simplify this. Instead of creating a `User` class, you can use dynamic objects to handle the data:

```csharp
[Binding]
public class DemoSteps
{
    [Given(@"the following users in the database")]
    public void GivenTheFollowingUsersInTheDatabase(Table table)
    {
        IEnumerable<dynamic> listOfUsers = table.CreateDynamicSet();
        // Insert into database code goes here
    }
}
```

This approach eliminates the need for additional classes and keeps your code clean. While you lose some of the benefits of static typing and IntelliSense, the trade-off can be worth it for the simplicity it provides.

### Getting Started

The easiest way to add SpecFlow.Assist.Dynamic to your project is via NuGet:

```bash
Install-Package SpecFlow.Assist.Dynamic
```

If you’re interested in contributing or have suggestions for improvements, [let me know via GitHub](https://github.com/marcusoftnet/SpecFlow.Assist.Dynamic).

### How It Was Made

To develop SpecFlow.Assist.Dynamic, I started by writing SpecFlow scenarios to define the desired functionality. Although SpecFlow is great for behavior-driven development, it's not ideal for unit-level testing. Instead, I focused on creating extension methods for the SpecFlow Table object:

```csharp
public static IEnumerable<dynamic> CreateDynamicSet(this Table table)
```

These methods include:

- **CreateDynamicInstance** – Creates a dynamic object from a table, either from a single row or a two-column table.
- **CreateDynamicSet** – Creates an `IEnumerable<dynamic>` for multiple rows.
- **CompareDynamicInstance** – Compares a dynamic object to a table.
- **CompareDynamicSet** – Compares a set of dynamic objects to a table.

I followed conventions similar to SpecFlow.Assist, such as converting spaces in table headers to camel case and parsing values in the following order: `DateTime`, `Integer`, `Double`, and `string`.

### Implementation Challenges

#### Creating Object Properties from Header Strings

Using the `ExpandoObject` class was crucial for handling dynamic properties. This class stores properties in an internal `IDictionary<string, object>`, allowing for flexible and dynamic property handling:

```csharp
private static ExpandoObject CreateDynamicInstance(TableRow tableRow)
{
    dynamic expando = new ExpandoObject();
    var dicExpando = expando as IDictionary<string, object>;

    foreach (var header in tableRow.Keys)
    {
        var propName = CreatePropertyName(header);
        var propValue = CreateTypedValue(tableRow[header]);
        dicExpando.Add(propName, propValue);
    }

    return expando;
}
```

#### Comparing Dynamic Objects

Comparing dynamic objects presented a challenge due to the lack of direct methods for retrieving property names. I used the [Impromptu Interface](http://code.google.com/p/impromptu-interface/) library to address this issue, which provided methods to get member names and invoke methods dynamically.

### Future Directions

While I hope SpecFlow will eventually incorporate this functionality, the current approach offers a flexible solution. I’ve enjoyed exploring the dynamic capabilities in C# and hope you find SpecFlow.Assist.Dynamic useful.

[Download SpecFlow.Assist.Dynamic on NuGet](http://nuget.org/List/Packages/SpecFlow.Assist.Dynamic) and enjoy!
