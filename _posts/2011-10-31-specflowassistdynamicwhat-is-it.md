---
layout: post
title: SpecFlow.Assist.Dynamic–what is it?
date: '2011-10-31T08:00:00.000+01:00'
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
  - C#
  - SpecFlow
modified_time: '2011-11-03T16:37:44.638+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-4240793233483386742
blogger_orig_url: http://www.marcusoft.net/2011/10/specflowassistdynamicwhat-is-it.html
---

<a href="http://nuget.org/List/Packages/SpecFlow.Assist.Dynamic"
target="_blank">NuGet package</a>! I am so proud. Actually it’s just a
small extension to <a href="http://www.blogger.com/www.specflow.org"
target="_blank">SpecFlow</a> and the excellent <a
href="https://github.com/techtalk/SpecFlow/wiki/SpecFlow-Assist-Helpers"
target="_blank">Assist helpers</a> by
<a href="http://www.cauthon.com/" target="_blank">Darren Cauthon</a>.
But I learned quite a lot about dynamics in the process and I thought I
write a post or two on
<a href="https://github.com/marcusoftnet/SpecFlow.Assist.Dynamic"
target="_blank">SpecFlow.Assist.Dynamic</a>; what it is, the problem it
solves and how it’s made. Later post will be around how to use it and to
put it together with <a href="https://github.com/markrendle/Simple.Data"
target="_blank">Simple.Data</a> to create a real sweet testing
experience.
Let me say – before I start – that there is
<a href="https://github.com/marcusoftnet/SpecFlow.Assist.Dynamic/wiki"
target="_blank">documentation for usage on the GitHub wiki</a>. This is
a blog posts on how I made
<a href="https://github.com/marcusoftnet/SpecFlow.Assist.Dynamic"
target="_blank">SpecFlow.Assist.Dynamic</a> – not the official
documentation.


### The problem

It’s not a very big problem I’ve solved – but I grew tired of writing
small classes that just was for transporting data. For example for the
Gherkin-step:

> <div id="codeSnippetWrapper">
>
> <div id="codeSnippet"
> style="background-color: #f4f4f4; border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none; color: black; direction: ltr; font-family: 'Courier New', courier, monospace; font-size: 8pt; line-height: 12pt; overflow: visible; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; width: 100%;">
>
> ```
>    1: Given the following users exists in the database:
> ```
>
> ```
>    2:     | Name   | Age | Birth date | Length in meters |
> ```
>
> ```
>    3:     | Marcus | 39  | 1972-10-09 | 1.96             |
> ```
>
> ```
>    4:     | Albert | 3   | 2008-01-24 | 1.03             |
> ```
>
> ```
>    5:     | Gustav | 1   | 2010-03-19 | 0.84             |
> ```
>
> ```
>    6:     | Arvid  | 1   | 2010-03-19 | 0.85             |
> ```
>
> </div>
>
> </div>

I need to implement the following step-definitions (note that I’m using
the <a href="http://www.blogger.com/www.specflow.org"
target="_blank">SpecFlow</a>.Assists table extension methods here to
keep things short):

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
   4:     [Given(@"the following users in the database")]
```

```
   5:     public void x(Table table)
```

```
   6:     {
```

```
   7:         IEnumerable<User> listOfUsers = table.CreateSet<User>();
```

```
   8:
```

```
   9:         // insert in database code goes here
```

```
  10:         //foreach (var user in listOfUsers)
```

```
  11:         //{
```

```
  12:         //    user.Name, user.Age
```

```
  13:         //}
```

```
  14:     }
```

```
  15: }
```

```
  16: 
```

```
  17: public class User
```

```
  18: {
```

```
  19:     public string Name { get; set; }
```

```
  20:     public int Age { get; set; }
```

```
  21:     public DateTime BirthDate { get; set; }
```

```
  22:     public double LengthInMeters { get; set; }
```

```
  23: }
```

</div>

</div>


So the actual step definition is pretty concise and slick. And actually
the only thing that bothers me is that class User. It’s only needed by
the step definition and it’s only purpose is to transport some data.
<span class="Apple-style-span"
style="font-size: 19px; font-weight: bold;">The solution
As I started to use <a href="https://github.com/markrendle/Simple.Data"
target="_blank">Simple.Data</a> I realized that
<a href="http://msdn.microsoft.com/en-us/library/dd264736.aspx"
target="_blank">dynamics</a> could solve this problem for us. So that
instead can write:
<span id="lnum1"
style="background-color: white; color: #606060; font-family: 'Courier New', courier, monospace; font-size: 11px; line-height: 16px; text-align: left; white-space: pre;">
1:<span class="Apple-style-span"
style="background-color: white; font-family: 'Courier New', courier, monospace; font-size: 11px; line-height: 16px; white-space: pre;">
\[Binding\]

<div id="codeSnippetWrapper">

<div id="codeSnippet"
style="background-color: #f4f4f4; border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none; direction: ltr; font-family: 'Courier New', courier, monospace; font-size: 8pt; line-height: 12pt; overflow-x: visible; overflow-y: visible; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; width: 100%;">

```
   2: public class DemoSteps
```

```
   3: {
```

```
   4:     [Given(@"the following users in the database")]
```

```
   5:     public void x(Table table)
```

```
   6:     {
```

```
   7:         IEnumerable<dynamic> listOfUsers = table.CreateDynamicSet();
```

```
   8:
```

```
   9:         // insert in database code goes here
```

```
  10:         //foreach (var user in listOfUsers)
```

```
  11:         //{
```

```
  12:         //    user.Name, user.Age
```

```
  13:         //}
```

```
  14:     }
```

```
  15: }
```

</div>

</div>


Just the code we need. No extra data carriers. Of course you’ll
sacrifice intellisense, which is a big hurdle for a lot of us. But I got
used to it – so can you.
<span class="Apple-style-span"
style="font-size: 19px; font-weight: bold;">How to get it

The easiest way, by far, is to
<a href="http://nuget.org/List/Packages/SpecFlow.Assist.Dynamic"
target="_blank">download it via NuGet.</a>:

> <span class="Apple-style-span"
> style="font-family: monospace;">Install-Package
> SpecFlow.Assist.Dynamic

If you want to help out…you are more than welcome. I’m not planning on
doing any more work on this right now. But I hope that you see a bug or
a improvement possibilities.
<a href="https://github.com/marcusoftnet/SpecFlow.Assist.Dynamic"
target="_blank">Let me know via GitHub</a>
<span class="Apple-style-span"
style="font-size: 19px; font-weight: bold;">How it’s made
The first thing I did was actually to write
<a href="http://www.blogger.com/www.specflow.org"
target="_blank">SpecFlow</a> scenarios for how I wanted the new
functionality to work. Even though this was a good thing, as test first
is, I would not recommend using
<a href="http://www.blogger.com/www.specflow.org"
target="_blank">SpecFlow</a> to test out unit level stuff. The major
benefit with <a href="http://www.blogger.com/www.specflow.org"
target="_blank">SpecFlow</a> and Cucumber, if you ask me, is that
business users can read and understand the specifications.

After that I simply created new
<a href="http://msdn.microsoft.com/en-us/library/bb383977.aspx"
target="_blank">extension methods</a> on the
<a href="http://www.blogger.com/www.specflow.org"
target="_blank">SpecFlow</a> Table object:


<div id="codeSnippetWrapper">

<div id="codeSnippet"
style="background-color: #f4f4f4; border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none; color: black; direction: ltr; font-family: 'Courier New', courier, monospace; font-size: 8pt; line-height: 12pt; overflow: visible; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; width: 100%;">

```
   1: public static IEnumerable<dynamic> CreateDynamicSet(this Table table)
```

</div>

</div>


One for each of the new features I wanted to support, four in all:

-   **CreateDynamicInstance** – creates an instance from a table. This
    can be done either for tables with one row or with two column
    tables.
    In the case of one row tables the header values are used as property
    names.
    In the case of the two column table the first column is presumed to
    contain the property values and the second the values for those
    properties (<a
    href="https://github.com/marcusoftnet/SpecFlow.Assist.Dynamic/blob/master/Specs/DynamicInstancesFromTable.feature"
    target="_blank">for examples see this</a>) 
-   **CreateDynamicSet** – creates a IEnumerable\<dynamic\> for a
    several rows. The headers are the property names as before.
-   **CompareDynamicInstance** (to table) – this compares a instance of
    a object you send to the method to a table. The table is parsed
    using the CreateDynamicInstance–method as above.
-   **CompareDynamicSet** – and finally you can compare a set of object
    to a table. The table is parsed using the CreateDynamicSet method as
    above.

So, I have tried to use the same conventions as the one used in the
<a href="http://www.blogger.com/www.specflow.org"
target="_blank">SpecFlow</a>.Assist helpers;

-   Spaces can be used in table headers but are removed in property
    values (“Birth Date” becomes “BirthDate” for example)
-   I uppercase every new word even though it’s not like that in the
    table. So “Birth date” in the table header becomes “BirthDate” on
    the dynamic object

I also added a convention of my own that has to do with types on the
dynamic object. I try to parse types from the values in the table in
this order:

-   First try to parse it as a DateTime
-   Then as a Integer
-   Then as a Double
-   And as a fall back I use a string

I wanted to do this to be able to do some more safe comparisons etc.
<span class="Apple-style-span"
style="font-size: 19px; font-weight: bold;">Challenges and solutions in
the implementation
<span class="Apple-style-span" style="font-weight: bold;">Creating
object properties from header strings
One of the first tricks I learned about is the <a
href="http://msdn.microsoft.com/en-us/library/system.dynamic.expandoobject.aspx"
target="_blank">ExpandoObject</a>. By reading up on this I learned a lot
about how dynamics actually works.

**First** – the keyword “dynamic” only means “don’t do compile-time
checking for this variable, it will work in runtime”. Nothing more.

**Secondly** - the base class for a lot of the cool the stuff in
System.Dynamics – <a
href="http://msdn.microsoft.com/en-us/library/system.dynamic.dynamicobject.aspx"
target="_blank">DynamicObject</a> – is simply a wrapper that gives you
the possibility to trap exceptions for when you are accessing members
not present on the current object. So if I have written:


<div id="codeSnippetWrapper">

<div id="codeSnippet"
style="background-color: #f4f4f4; border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none; color: black; direction: ltr; font-family: 'Courier New', courier, monospace; font-size: 8pt; line-height: 12pt; overflow: visible; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; width: 100%;">

```
   1: dynamic a = new MyDynamicObject();
```

```
   2: a.Name = "Marcus";
```

</div>

</div>


I’m simply telling the compiler to let me write anything on the “a”
object reference. So it swallows the ‘a.Name = “Marcus”’ statement
without complaining.

In order to handle that I can write this simple class, inheriting from
DynamicObject:


<div id="codeSnippetWrapper">

<div id="codeSnippet"
style="background-color: #f4f4f4; border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none; color: black; direction: ltr; font-family: 'Courier New', courier, monospace; font-size: 8pt; line-height: 12pt; overflow: visible; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; width: 100%;">

```
   1: public class MyDynamicObject : DynamicObject
```

```
   2: {
```

```
   3:     public override bool TryGetMember(GetMemberBinder binder, out object result)
```

```
   4:     {
```

```
   5:         return base.TryGetMember(binder, out result);
```

```
   6:     }
```

```
   7: }
```

</div>

</div>


In the TryGetMember override I can handle access to any member and do
something more useful than to crash with a “Member not defined”.

And that’s exactly what ExpandoObject does. It simply stores all the
members, and their value, that you access into an internal
IDictionary\<string, object\>. In fact you can even cast an
ExpandoObject into a Dictionary\<string, object\> and insert your
members that way.

And that’s how I insert new dynamic properties and their values from
each table row. Like this:


<div id="codeSnippetWrapper">

<div id="codeSnippet"
style="background-color: #f4f4f4; border-bottom-style: none; border-left-style: none; border-right-style: none; border-top-style: none; color: black; direction: ltr; font-family: 'Courier New', courier, monospace; font-size: 8pt; line-height: 12pt; overflow: visible; padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; text-align: left; width: 100%;">

```
   1: private static ExpandoObject CreateDynamicInstance(TableRow tablerow)
```

```
   2: {
```

```
   3:     dynamic expando = new ExpandoObject();
```

```
   4:     var dicExpando = expando as IDictionary<string, object>;
```

```
   5: 
```

```
   6:     foreach (var header in tablerow.Keys)
```

```
   7:     {
```

```
   8:         var propName = CreatePropertyName(header);
```

```
   9:         var propValue = CreateTypedValue(tablerow[header]);
```

```
  10:         dicExpando.Add(propName, propValue);
```

```
  11:     }
```

```
  12: 
```

```
  13:     return expando;
```

```
  14: }
```

</div>

</div>

<span class="Apple-style-span" style="font-weight: bold;">Comparing
dynamic objects
One problem that almost stumped me was how to compare dynamic instances.
There is no way to check which properties a dynamic instance has. … In
the .NET framework. … That I know of.

But I found the <a href="http://code.google.com/p/impromptu-interface/"
target="_blank">Impromptu Interface</a> project (and
<a href="http://nuget.org/List/Packages/ImpromptuInterface"
target="_blank">NuGet package</a>). It does a lot of marvelous and
strange things but I used it to GetMemberNames. That’s a static method
that take an object and returns a list of it’s members.

And there’s also a method that invoke methods on any object by name –
InvokeSet(object, memberName).

Combining these two made it a lot easier to write the comparisons
methods for dynamic instances and sets.
<span class="Apple-style-span"
style="font-size: 19px; font-weight: bold;">Reflection
But it was also around this place (having to take a dependency on
ImpromtuInterface) that I realized that my solution might be the wrong
one. I’m wondering if I might have been closer to a pure “dynamic by the
book” solution if I had done a class inheriting from DynamicObject
called DynamicSpecFlowTable. In that class I could easier and cleaner
have handle how properties are set and comparisions done…

Well it works fine now. I’ll keep it like this.
<span class="Apple-style-span"
style="font-size: 19px; font-weight: bold;">The future

Actually I would not like to have this NuGet package. I would rather see
this included in the <a href="http://www.blogger.com/www.specflow.org"
target="_blank">SpecFlow</a> main source. But as for now that means that
<a href="http://www.blogger.com/www.specflow.org"
target="_blank">SpecFlow</a> needs to take a dependency on
ImpromtuInterface and that’s probably not what they want.

So this has been my training ground for a small adventure in
dynamic-land. I’ve enjoyed it.
<a href="http://nuget.org/List/Packages/SpecFlow.Assist.Dynamic"
target="_blank">I hope you do too.</a>
