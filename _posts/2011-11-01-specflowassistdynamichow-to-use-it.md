---
layout: post
title: SpecFlow.Assist.Dynamic–how to use it
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
blogger_orig_url: http://www.marcusoft.net/2011/11/specflowassistdynamichow-to-use-it.html
---


This is the second post about
<a href="http://www.blogger.com/www.specflow.org"
target="_blank">SpecFlow</a>.Assist.Dynamic – a little tool I wrote to
help you write less code in your step definitions, and focus on the
actual step instead of infrastructure. You can read the [first post
here](http://www.marcusoft.net/2011/10/specflowassistdynamicwhat-is-it.html)
– it explains little about what
<a href="https://github.com/marcusoftnet/SpecFlow.Assist.Dynamic"
target="_blank">SpecFlow.Assist.Dynamic</a> is.
In this post I’ll show you how some ways I use the dynamic features to
and some tricks that you might not know about.
Again – this is not the documentation for SpecFlow.Assist.Dynamic –
<a href="https://github.com/marcusoftnet/SpecFlow.Assist.Dynamic/wiki"
target="_blank">that can be found here</a>.

### Installation

With the power of
<a href="http://www.nuget.org/" target="_blank">NuGet</a> it’s
super-easy to install SpecFlow.Assist.Dynamic by simply go:

> Install-Package SpecFlow.Assist.Dynamic

(Sidenote: Ha! It’s good to try out your own stuff. Found a bug in the
0.2 version on NuGet. Fixed it with the 0.2.1 version )
That will also pull down the latest version of
<a href="http://www.blogger.com/www.specflow.org"
target="_blank">SpecFlow</a> and other dependencies needed.

### Test data management

I found out that the most maintainable way to write scenarios is to have
them initialize their own test data. Or at least on the feature level.
I’ve tried to do it by restoring back ups but that has two drawbacks.
First – it takes too long. And test that takes too long are not run.
Secondly – the features (specifications?) are not easy to follow. You
have to know what test data is being read back. It’s hidden for most
users.
So why do we still try this approach? Laziness I guess… It’s just to
much code to write.

### Adding test data – single instances

There are two main features where
<a href="https://github.com/marcusoftnet/SpecFlow.Assist.Dynamic"
target="_blank">SpecFlow.Assist.Dynamic</a> helps you; adding test data
in the Given-steps and comparing the outcome to the test data in you
Then-steps.
For example for this Given step:

<div id="codeSnippetWrapper">

<div id="codeSnippet"
style="background-color: #f4f4f4; border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none; color: black; direction: ltr; font-family: 'Courier New', courier, monospace; font-size: 8pt; line-height: 12pt; overflow: visible; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; width: 100%;">

```
   1: Scenario: Searching for books
```

```
   2:     Given the following books in the system
```

```
   3:         | Title         | Author            | ISBN       |
```

```
   4:         | The Goal      | Eliah Goldratt    | 123345678  |
```

```
   5:         | Stick         | Ted and Dan Heath | 9955663322 |
```

```
   6:         | The Good book | God et. al        | 1          |
```

I can write the following short statements with
<a href="https://github.com/marcusoftnet/SpecFlow.Assist.Dynamic"
target="_blank">SpecFlow.Assist.Dynamic</a>:

<div id="codeSnippetWrapper">

<div id="codeSnippet"
style="background-color: #f4f4f4; border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none; color: black; direction: ltr; font-family: 'Courier New', courier, monospace; font-size: 8pt; line-height: 12pt; overflow: visible; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; width: 100%;">

```
   1: [Binding]
```

```
   2: public class DemoSteps
```

```
   3: {
```

```
   4:     [Given(@"the following books in the system")]
```

```
   5:     public void GivenTheFollowingBooksInTheSystem(Table table)
```

```
   6:     {
```

```
   7:         IList<dynamic> books = table.CreateDynamicSet().ToList();
```

```
   8:         foreach (var book in books) { DBHelper.AddBook(book); }
```

```
   9:     }
```

```
  10: }
```

```
  11: 
```

```
  12: public class DBHelper
```

```
  13: {
```

```
  14:     public static void AddBook(dynamic book)
```

```
  15:     {
```

```
  16:         var insertStatement = string.Format(
```

```
  17:             "INSERT INTO BOOKS (Title, Author, ISBN) VALUES ('{0}', '{1}', '{2}')",
```

```
  18:             book.Title, book.Author, book.ISBNNumber);
```

```
  19: 
```

```
  20:         // Call into the db...
```

```
  21:     }
```

```
  22: }
```

There’s a lot to be said about the data access code, for example you
probably are using an ORM of sorts and hopefully you can send dynamic
objects to it. I’ll show other ways to do that later.

Let’s focus on the
<a href="https://github.com/marcusoftnet/SpecFlow.Assist.Dynamic"
target="_blank">SpecFlow.Assist.Dynamic</a> instead. It’s not much to it
– I simply create a list of dynamic objects and use my DBHelper to
insert each one into the database.
<span class="Apple-style-span"
style="font-size: 19px; font-weight: bold;">Shorten it up with Step
Argument Transformations

You can use a trick that I’ve put into
<a href="https://github.com/marcusoftnet/SpecFlow.Assist.Dynamic"
target="_blank">SpecFlow.Assist.Dynamic</a> to shorten the code even
further. There is a <a href="http://www.blogger.com/www.specflow.org"
target="_blank">SpecFlow</a> feature called <a
href="https://github.com/techtalk/SpecFlow/wiki/Step-Argument-Conversions"
target="_blank">Step Argument Transformation</a> that I use to shorten
up code like the one above. With step argument transformation you can
create small conversion methods that is triggered when certain types is
used.

I have supplied three such argument transformations that converts Table
arguments into:

- A dynamic instance
- A IEnumerable\<dynamic\>
- A IList\<dynamic\>

So the example above can be written like this, using these step argument
transformations:

<div id="codeSnippetWrapper">

<div id="codeSnippet"
style="background-color: #f4f4f4; border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none; color: black; direction: ltr; font-family: 'Courier New', courier, monospace; font-size: 8pt; line-height: 12pt; overflow: visible; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; width: 100%;">

```
   1: [Given(@"the following books in the system")]
```

```
   2: public void GivenTheFollowingBooksInTheSystem(IList<dynamic> books)
```

```
   3: {
```

```
   4:     foreach (var book in books) { DBHelper.AddBook(book); }
```

```
   5: }
```

Pretty slick, huh? This is how it works:

- <a href="http://www.blogger.com/www.specflow.org"
    target="_blank">SpecFlow</a> matches my Given statement with the
    Step definition marked with the Given-attribute above.
- From the .feature-file it knows that a table is sent to the step. It
    send that table.
- In the
    <a href="https://github.com/marcusoftnet/SpecFlow.Assist.Dynamic"
    target="_blank">SpecFlow.Assist.Dynamic</a>** **dll step argument
    methods are found that matches a Table and the IList\<dynamic\> that
    I am using in the method signature
- <a href="http://www.blogger.com/www.specflow.org"
    target="_blank">SpecFlow</a> converts my argument using that method
    and simply returns a IList\<dynamic\> containing the data from the
    table.

You can read more <a
href="https://github.com/marcusoftnet/SpecFlow.Assist.Dynamic/wiki/Step-argument-transformations"
target="_blank">about this on my wiki.</a>
Oh yeah – **very important**! To get this to work you need to add a
configuration into your app.config:

<div id="codeSnippetWrapper">

<div id="codeSnippet"
style="background-color: #f4f4f4; border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none; color: black; direction: ltr; font-family: 'Courier New', courier, monospace; font-size: 8pt; line-height: 12pt; overflow: visible; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; width: 100%;">

```
   1: <specFlow>
```

```
   2:   <stepAssemblies>
```

```
   3:     <stepAssembly assembly="SpecFlow.Assist.Dynamic" />
```

```
   4:   </stepAssemblies>
```

```
   5: </specFlow>
```

This make sure that the step arguments are picked up from the dll.
<span class="Apple-style-span"
style="font-size: 19px; font-weight: bold;">Asserting results in the
Then-steps

The other place where
<a href="https://github.com/marcusoftnet/SpecFlow.Assist.Dynamic"
target="_blank">SpecFlow.Assist.Dynamic</a> shines is when you are
asserting that certain result of an action has happened.
If we expand my example from before in to a fully fledged feature, we
get this:
<span id="lnum1"
style="background-color: white; color: #606060; font-family: 'Courier New', courier, monospace; font-size: 11px; line-height: 16px; text-align: left; white-space: pre;">
1:<span class="Apple-style-span"
style="background-color: white; font-family: 'Courier New', courier, monospace; font-size: 11px; line-height: 16px; white-space: pre;">
Scenario: Searching for books

<div id="codeSnippetWrapper">

<div id="codeSnippet"
style="background-color: #f4f4f4; border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none; direction: ltr; font-family: 'Courier New', courier, monospace; font-size: 8pt; line-height: 12pt; overflow-x: visible; overflow-y: visible; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; width: 100%;">

```
   2:     Given the following books in the system
```

```
   3:         | Title         | Author            | ISBN Number |
```

```
   4:         | The Goal      | Eliah Goldratt    | 123345678   |
```

```
   5:         | Stick         | Ted and Dan Heath | 9955663322  |
```

```
   6:         | The Good book | God et. al        | 1           |
```

```
   7:     When I search for Titles containing 'Goal'
```

```
   8:     Then the results should show the following books
```

```
   9:         | Title         | Author            | ISBN Number |
```

```
  10:         | The Goal      | Eliah Goldratt    | 123345678   |
```

I can now write the following steps:

<div id="codeSnippetWrapper">

<div id="codeSnippet"
style="background-color: #f4f4f4; border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none; color: black; direction: ltr; font-family: 'Courier New', courier, monospace; font-size: 8pt; line-height: 12pt; overflow: visible; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; width: 100%;">

```
   1: [Binding]
```

```
   2: public class DemoSteps
```

```
   3: {
```

```
   4:     private IList<dynamic> _books;
```

```
   5:     private IEnumerable<dynamic> _filteredBooks;
```

```
   6: 
```

```
   7:     [Given(@"the following books in the system")]
```

```
   8:     public void GivenTheFollowingBooksInTheSystem(IList<dynamic> books)
```

```
   9:     {
```

```
  10:         foreach (var book in books) { DBHelper.AddBook(book); }
```

```
  11:         _books = books;
```

```
  12:     }
```

```
  13: 
```

```
  14:     [When(@"I search for Titles containing '(.*)'")]
```

```
  15:     public void PerformTitleSearch( string value)
```

```
  16:     {
```

```
  17:         _filteredBooks = from b in _books
```

```
  18:                          where b.Title.Contains(value)
```

```
  19:                          select b;
```

```
  20:     }
```

```
  21: 
```

```
  22:     [Then(@"the results should show the following books")]
```

```
  23:     public void ResultsContainsBooks(Table table)
```

```
  24:     {
```

```
  25:         table.CompareToDynamicSet(_filteredBooks.ToList());
```

```
  26:     }
```

```
  27: }
```

Don’t worry about the Given and When-steps, it’s just fake. I have save
the original list into a private variable called \_books and then simply
filter that out in the When-step. In a real example the When-step would
probably hit a webpage or a controller that in turn reads the database.
And the Given-step would put the right data into the database before
that.

But the interesting (and short!) stuff is the one liner in the
Then-step. Here I can again use the power of
<a href="https://github.com/marcusoftnet/SpecFlow.Assist.Dynamic"
target="_blank">SpecFlow.Assist.Dynamic</a> and simply compare the
sent-in table to the result of my When-action.

And before you start to think about it. This way of writing it is easier
than to use the step argument transformations and compare two
IList\<dynamic\> to each other. That will be a lot more code.

### What about single instances?

I have now only showed you the use for Sets. There’s similar methods for
creating instances. Typically they are used to fill out forms or find a
certain record in the database.
I leave the usage of those methods as a creative exercise for the
reader. Let me know if you did anything that helped you.

### Conclusion

### <span class="Apple-style-span" style="font-size: small; font-weight: normal;">I have shown you how I use these helpers. Please note that they are inspired to a great deal by the Table helpers in the <a href="http://www.blogger.com/www.specflow.org"

style="font-size: medium; font-weight: normal;"
target="_blank">SpecFlow</a><span class="Apple-style-span" style="font-size: small; font-weight: normal;">.Assist namespace that have similar methods but for statically typed objects (that you need to create ^^)

I hope you find this helpful. Please let me know if I can improve.

In the [next
post](http://www.marcusoft.net/2011/11/specflowassistdynamicmaxing-out-with.html)
I’ll show a final thing that marries this with
<a href="https://github.com/markrendle/Simple.Data"
target="_blank">Simple.Data</a>. See you then.
