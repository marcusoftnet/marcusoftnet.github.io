---
layout: post
title: SpecFlow.Assist.Dynamic–maxing out with
Simple.Data
date: '2011-11-02T08:00:00.000+01:00'
author: Marcus
Hammarberg
tags: - BDD
   - Tools
  - .NET - Specification by example - C# -
SpecFlow
modified_time: '2011-11-03T16:34:05.677+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-508246732156716014
blogger_orig_url: http://www.marcusoft.net/2011/11/specflowassistdynamicmaxing-out-with.html
---

<a href="https://github.com/marcusoftnet/SpecFlow.Assist.Dynamic"
target="_blank">SpecFlow.Assist.Dynamic</a> came about from my own need
when I wrote something that used
<a href="https://github.com/markrendle/Simple.Data"
target="_blank">Simple.Data</a>. I saw the power and simplicity (duh!)
in Simple.Data by using dynamics. And I started to thinking on how it
could be used in <a href="http://www.blogger.com/www.specflow.org"
target="_blank">SpecFlow</a> to further simplify and shorten up the code
in my steps.
This is the third and final post on SpecFlow.Assist.Dynamic. Again this
is not the formal documentation. It can be found
<a href="https://github.com/marcusoftnet/SpecFlow.Assist.Dynamic/wiki"
target="_blank">here</a>. These are just my personal preferences and
thoughts on how to use it. This time with Simple.Data. And it won’t be
long.


### SpecFlow and Simple.Data

First you should check out Darren Cauthons
<a href="http://darrencauthon.posterous.com/61641417"
target="_blank">post</a> on using SpecFlow and simple data together. It
shows the great use of a lightweight, simple data access framework in
SpecFlow.
As I said in my earlier post test data management is something that you
often have to handle in your scenarios. Simple.Data is more than up to
the job.

### SpecFlow.Assist.Dynamic and Simple.Data

So I thought I’ll take Darrens example from the post and rewrite it
using SpecFlow.Assist.Dynamic.
Here is the feature Darren is using, updated to be a bit more readable
for a non-technical person (spaces in headers):

<div id="codeSnippetWrapper">

<div id="codeSnippet"
style="background-color: #f4f4f4; border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none; color: black; direction: ltr; font-family: 'Courier New', courier, monospace; font-size: 8pt; line-height: 12pt; overflow: visible; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; width: 100%;">

```
   1: Scenario: Submit a valid create account form
```

```
   2:  Given the following accounts exist
```

```
   3:      | First name | Last name | Email   |
```

```
   4:      | Howard     | Roark     | h@r.com |
```

```
   5:  When I submit the following Create Account form
```

```
   6:      | Field      | Value   |
```

```
   7:      | First name | John    |
```

```
   8:      | Last name  | Galt    |
```

```
   9:      | Email      | j@g.com |
```

```
  10:  Then the following accounts should exist
```

```
  11:      | First name | Last name | Email   |
```

```
  12:      | Howard     | Roark     | h@r.com |
```

```
  13:      | John       | Galt      | j@g.com |
```

</div>

</div>


SpecFlow.Assist.Dynamic will convert the “First name” header into
“FirstName” as you <a
href="https://github.com/marcusoftnet/SpecFlow.Assist.Dynamic/wiki/Conventions-used"
target="_blank">might remember</a>. As will the statically typed
SpecFlow.Assist table helpers if I remember correctly.
I first create the Simple.Data dynamic database object in the a method
marked with the attribute BeforeScenario. And while I’m there I clear
out the Accounts table as well:

<div id="codeSnippetWrapper">



<div id="codeSnippet"
style="background-color: #f4f4f4; border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none; color: black; direction: ltr; font-family: 'Courier New', courier, monospace; font-size: 8pt; line-height: 12pt; overflow: visible; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; width: 100%;">

```
   1: private static dynamic DB { get; set; }
```

```
   2: 
```

```
   3: [BeforeScenario]
```

```
   4: public void Setup()
```

```
   5: {
```

```
   6:     DB = Database.Open();
```

```
   7:     DB.Accounts.DeleteAll();
```

```
   8: }
```

</div>

</div>


In the Given step I’m using the step argument transformations that comes
with SpecFlow.Assist.Dynamic and get a <span
style="font-family: 'Courier New';">IList\<dynamic\></span> from the
Table as parameter to the step definition. This can then be sent right
on to the Simple.Data database object, like this:
<span id="lnum1"
style="background-color: white; color: #606060; font-family: 'Courier New', courier, monospace; font-size: 11px; line-height: 16px; text-align: left; white-space: pre;">
1:</span><span class="Apple-style-span"
style="background-color: white; font-family: 'Courier New', courier, monospace; font-size: 11px; line-height: 16px; white-space: pre;">
\[Given(</span><span
style="background-color: white; color: #006080; font-family: 'Courier New', courier, monospace; font-size: 11px; line-height: 16px; text-align: left; white-space: pre;">@"the
following accounts exist"</span><span class="Apple-style-span"
style="background-color: white; font-family: 'Courier New', courier, monospace; font-size: 11px; line-height: 16px; text-align: left; white-space: pre;">)\]</span>

<div id="codeSnippetWrapper">

<div id="codeSnippet"
style="background-color: #f4f4f4; border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none; direction: ltr; font-family: 'Courier New', courier, monospace; font-size: 8pt; line-height: 12pt; overflow-x: visible; overflow-y: visible; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; width: 100%;">

```
   2: public void x(IList<dynamic> accounts)
```

```
   3: {
```

```
   4:     DB.Accounts.Insert(accounts);
```

```
   5: }
```

</div>

</div>


Bom! Table loaded – one line.
In the When-step I have faked up a controller. Here I am using
SpecFlow.Assist.Dynamic to get a single instance, again with the use of
the step argument transformations; this time it will turn the Table into
a <span style="font-family: 'Courier New';">dynamic:</span>
<span id="lnum1"
style="background-color: white; color: #606060; font-family: 'Courier New', courier, monospace; font-size: 11px; line-height: 16px; text-align: left; white-space: pre;">
1:</span><span class="Apple-style-span"
style="background-color: white; font-family: 'Courier New', courier, monospace; font-size: 11px; line-height: 16px; white-space: pre;">
\[When(</span><span
style="background-color: white; color: #006080; font-family: 'Courier New', courier, monospace; font-size: 11px; line-height: 16px; text-align: left; white-space: pre;">@"I
submit the following Create Account form"</span><span
class="Apple-style-span"
style="background-color: white; font-family: 'Courier New', courier, monospace; font-size: 11px; line-height: 16px; text-align: left; white-space: pre;">)\]</span>

<div id="codeSnippetWrapper">

<div id="codeSnippet"
style="background-color: #f4f4f4; border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none; direction: ltr; font-family: 'Courier New', courier, monospace; font-size: 8pt; line-height: 12pt; overflow-x: visible; overflow-y: visible; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; width: 100%;">

```
   2: public void y(dynamic account)
```

```
   3: {
```

```
   4:     var fakeController = new FakeAccountController(DB);
```

```
   5:     fakeController.Create(account);
```

```
   6: }
```

</div>

</div>


The actual FakeAccountController looks like this:
<span id="lnum1"
style="background-color: white; color: #606060; font-family: 'Courier New', courier, monospace; font-size: 11px; line-height: 16px; text-align: left; white-space: pre;">
1:</span><span class="Apple-style-span"
style="background-color: white; font-family: 'Courier New', courier, monospace; font-size: 11px; line-height: 16px; white-space: pre;">
</span><span
style="background-color: white; color: blue; font-family: 'Courier New', courier, monospace; font-size: 11px; line-height: 16px; text-align: left; white-space: pre;">public</span><span
class="Apple-style-span"
style="background-color: white; font-family: 'Courier New', courier, monospace; font-size: 11px; line-height: 16px; text-align: left; white-space: pre;">
</span><span
style="background-color: white; color: blue; font-family: 'Courier New', courier, monospace; font-size: 11px; line-height: 16px; text-align: left; white-space: pre;">class</span><span
class="Apple-style-span"
style="background-color: white; font-family: 'Courier New', courier, monospace; font-size: 11px; line-height: 16px; text-align: left; white-space: pre;">
FakeAccountController</span>

<div id="codeSnippetWrapper">

<div id="codeSnippet"
style="background-color: #f4f4f4; border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none; direction: ltr; font-family: 'Courier New', courier, monospace; font-size: 8pt; line-height: 12pt; overflow-x: visible; overflow-y: visible; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; width: 100%;">

```
   2: {
```

```
   3:     private readonly dynamic _database;
```

```
   4: 
```

```
   5:     public FakeAccountController(dynamic database)
```

```
   6:     {
```

```
   7:         _database = database;
```

```
   8:     }
```

```
   9: 
```

```
  10:     public void Create(dynamic account)
```

```
  11:     {
```

```
  12:         _database.Accounts.Insert(account);
```

```
  13:     }
```

```
  14: }
```

</div>

</div>


Finally the Then-step compares the Table from the scenario to the
content of the database. For now I just compare the number of rows,
which is super lazy… but it’s ten o’clock and I’m tired…
<span id="lnum1"
style="background-color: white; color: #606060; font-family: 'Courier New', courier, monospace; font-size: 11px; line-height: 16px; text-align: left; white-space: pre;">
1:</span><span class="Apple-style-span"
style="background-color: white; font-family: 'Courier New', courier, monospace; font-size: 11px; line-height: 16px; white-space: pre;">
\[Then(</span><span
style="background-color: white; color: #006080; font-family: 'Courier New', courier, monospace; font-size: 11px; line-height: 16px; text-align: left; white-space: pre;">@"the
following accounts should exist"</span><span class="Apple-style-span"
style="background-color: white; font-family: 'Courier New', courier, monospace; font-size: 11px; line-height: 16px; text-align: left; white-space: pre;">)\]</span>

<div id="codeSnippetWrapper">

<div id="codeSnippet"
style="background-color: #f4f4f4; border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none; direction: ltr; font-family: 'Courier New', courier, monospace; font-size: 8pt; line-height: 12pt; overflow-x: visible; overflow-y: visible; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; width: 100%;">

```
   2: public void z(IList<dynamic> expectedAccounts)
```

```
   3: {
```

```
   4:     IList<dynamic> accountsInDb = DB.Accounts.All().ToList();
```

```
   5:
```

```
   6:     // Assert that they are the same
```

```
   7:     expectedAccounts.Count.Should().Equal(accountsInDb.Count);
```

```
   8:     // ...
```

```
   9: }
```

</div>

</div>

<span class="Apple-style-span"
style="font-size: 19px; font-weight: bold;">Conclusion</span>
So by marrying the great Simple.Data framework with my small efforts in
SpecFlow.Assist.Dynamic we can now move clear-text scenario data from
and to the database very easily and with just a few lines of code.

I hope you found this helpful and the SpecFlow.Assist.Dynamic could be
useful for you.
