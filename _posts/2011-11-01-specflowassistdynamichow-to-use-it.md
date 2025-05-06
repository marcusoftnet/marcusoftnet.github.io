---
layout: post
title: SpecFlow.Assist.Dynamic – How to Use It
date: 2011-11-01T07:00:00.000Z
author: Marcus Hammarberg
tags:
  - BDD
  - Tools
  - .NET
  - Specification by example
  - SpecFlow
modified_time: 2011-11-03T15:39:48.397Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-651375687003503
blogger_orig_url: https://www.marcusoft.net/2011/11/specflowassistdynamichow-to-use-it.html
---

This is the second post about [SpecFlow.Assist.Dynamic](https://github.com/marcusoftnet/SpecFlow.Assist.Dynamic) – a tool I wrote to help you write less code in your step definitions and focus on the actual steps instead of infrastructure. You can read the [first post here](https://www.marcusoft.net/2011/10/specflowassistdynamicwhat-is-it.html) – it explains what SpecFlow.Assist.Dynamic is.

In this post, I’ll show you some ways I use the dynamic features and some tricks that you might not know about.

Again – this is not the documentation for SpecFlow.Assist.Dynamic – [that can be found here](https://github.com/marcusoftnet/SpecFlow.Assist.Dynamic/wiki).

### Installation

With the power of [NuGet](http://www.nuget.org/), it’s super-easy to install SpecFlow.Assist.Dynamic by simply running:

```bash
Install-Package SpecFlow.Assist.Dynamic
```

(Side note: Ha! It’s good to try out your own stuff. I found a bug in version 0.2 on NuGet and fixed it with version 0.2.1.)

This command will also pull down the latest version of [SpecFlow](http://www.specflow.org) and other dependencies needed.

### Test Data Management

I’ve found that the most maintainable way to write scenarios is to have them initialize their own test data, or at least at the feature level.

Restoring backups has two drawbacks:

1. It takes too long. Tests that take too long are often not run.
2. The features (specifications?) are not easy to follow. The test data is hidden and not visible to most users.

So why do we still try this approach? Laziness, I guess… It’s just too much code to write.

### Adding Test Data – Single Instances

SpecFlow.Assist.Dynamic helps in two main areas: adding test data in the `Given` steps and comparing the outcome to the test data in your `Then` steps.

For example, for this Given step:

```gherkin
Scenario: Searching for books
    Given the following books in the system
        | Title         | Author            | ISBN       |
        | The Goal      | Elijah Goldratt    | 123345678  |
        | Stick         | Ted and Dan Heath | 9955663322 |
        | The Good book | God et. al        | 1          |
```

You can write the following short statements with SpecFlow.Assist.Dynamic:

```csharp
[Binding]
public class DemoSteps
{
    [Given(@"the following books in the system")]
    public void GivenTheFollowingBooksInTheSystem(Table table)
    {
        IList<dynamic> books = table.CreateDynamicSet().ToList();
        foreach (var book in books) { DBHelper.AddBook(book); }
    }
}

public class DBHelper
{
    public static void AddBook(dynamic book)
    {
        var insertStatement = string.Format(
            "INSERT INTO BOOKS (Title, Author, ISBN) VALUES ('{0}', '{1}', '{2}')",
            book.Title, book.Author, book.ISBNNumber);

        // Call into the db...
    }
}
```

There’s a lot to be said about the data access code; for example, you might be using an ORM and hopefully can send dynamic objects to it. I’ll show other ways to do that later.

Let’s focus on SpecFlow.Assist.Dynamic. It’s not much to it – I simply create a list of dynamic objects and use my `DBHelper` to insert each one into the database. Shorten it up with Step Argument Transformations.

You can use a trick that I’ve included in SpecFlow.Assist.Dynamic to shorten the code even further.

There is a [SpecFlow feature called Step Argument Transformation](https://github.com/techtalk/SpecFlow/wiki/Step-Argument-Conversions) that I use to shorten code like the one above. With step argument transformation, you can create small conversion methods that are triggered when certain types are used.

I have supplied three such argument transformations that convert Table arguments into:

- A `dynamic` instance
- An `IEnumerable<dynamic>`
- An `IList<dynamic>`

So the example above can be written like this, using these step argument transformations:

```csharp
[Given(@"the following books in the system")]
public void GivenTheFollowingBooksInTheSystem(IList<dynamic> books)
{
    foreach (var book in books) { DBHelper.AddBook(book); }
}
```

Pretty slick, huh? Here’s how it works:

- SpecFlow matches my Given statement with the `Step` definition marked with the `Given` attribute above.
- From the .feature file, it knows that a table is sent to the step. It sends that table.
- In the SpecFlow.Assist.Dynamic.dll, step argument methods are found that match a Table and the `IList<dynamic>` used in the method signature.
- SpecFlow converts my argument using that method and returns an `IList<dynamic>` containing the data from the table.

You can read more [about this on my wiki](https://github.com/marcusoftnet/SpecFlow.Assist.Dynamic/wiki/Step-argument-transformations).

**Very important:** To get this to work, you need to add a configuration to your app.config:

```xml
<specFlow>
  <stepAssemblies>
    <stepAssembly assembly="SpecFlow.Assist.Dynamic" />
  </stepAssemblies>
</specFlow>
```

This ensures that the step arguments are picked up from the `dll`.

### Asserting Results in the Then Steps

SpecFlow.Assist.Dynamic also shines when asserting that certain results of an action have occurred.

If we expand my example into a fully-fledged feature, we get this:

```gherkin
Scenario: Searching for books
    Given the following books in the system
        | Title         | Author            | ISBN Number |
        | The Goal      | Elijah Goldratt    | 123345678   |
        | Stick         | Ted and Dan Heath | 9955663322  |
        | The Good book | God et. al        | 1           |
    When I search for Titles containing 'Goal'
    Then the results should show the following books
        | Title         | Author            | ISBN Number |
        | The Goal      | Elijah Goldratt    | 123345678   |
```

You can write the following steps:

```csharp
[Binding]
public class DemoSteps
{
    private IList<dynamic> _books;
    private IEnumerable<dynamic> _filteredBooks;

    [Given(@"the following books in the system")]
    public void GivenTheFollowingBooksInTheSystem(IList<dynamic> books)
    {
        foreach (var book in books) { DBHelper.AddBook(book); }
        _books = books;
    }

    [When(@"I search for Titles containing '(.*)'")]
    public void PerformTitleSearch(string value)
    {
        _filteredBooks = from b in _books
                         where b.Title.Contains(value)
                         select b;
    }

    [Then(@"the results should show the following books")]
    public void ResultsContainsBooks(Table table)
    {
        table.CompareToDynamicSet(_filteredBooks.ToList());
    }
}
```

Don’t worry about the `Given` and `When` steps – they are simplified. I have saved the original list into a private variable called `_books` and then filter that out in the `When` step. In a real example, the `When` step would likely hit a webpage or controller that reads from the database. The `Given` step would put the right data into the database before that.

The interesting (and short!) part is the one-liner in the `Then` step. Here, I use SpecFlow.Assist.Dynamic to compare the sent-in table to the result of my `When` action.

This way of writing it is easier than using step argument transformations and comparing two `IList<dynamic>` instances to each other. That would be a lot more code.

### What About Single Instances?

I’ve only shown you the use for Sets. There are similar methods for creating instances, typically used to fill out forms or find a certain record in the database.

I leave the usage of those methods as a creative exercise for the reader. Let me know if you discover anything that helps.

### Conclusion

I have shown you how I use these helpers. Please note that they are inspired by the Table helpers in the [SpecFlow.Assist](https://www.specflow.org) namespace, which have similar methods but for statically typed objects (which you need to create).

I hope you find this helpful. Please let me know if I can improve.

In the [next post](https://www.marcusoft.net/2011/11/specflowassistdynamicmaxing-out-with.html), I’ll show a final thing that marries this with [Simple.Data](https://github.com/markrendle/Simple.Data). See you then.
