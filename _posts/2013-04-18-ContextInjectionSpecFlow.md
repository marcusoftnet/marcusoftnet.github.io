---
layout: post
title: Context injection of driver object in SpecFlow
date: 2013-04-18T06:00:00.000Z
author: Marcus Hammarberg
tags:
  - BDD
  - Tools
  - .NET
  - Specification by example
  - C#
  - SpecFlow
modified_time: 2013-04-18T06:00:02.781Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-722525302763224865
blogger_orig_url: http://www.marcusoft.net/2013/04/ContextInjectionSpecFlow.html
---


<div>

[SpecFlow](http://specflow.org/) is a wonderful tool. With a lot of
hidden gems inside of it. I have been using and coding on it now for
about 4 years and still I often forget about features and extension
points that [Gaspar](http://gasparnagy.com/) and the community has put
in there.

For example: did you know that there's an [inversion of
control](http://martinfowler.com/articles/injection.html) framework
built right into SpecFlow? Now you do and in this post I wanted to show
you one way that you could use that feature to make your step
definitions more maintainable.

I found this feature (again, i had heard about it before) when Gaspar
mentioned it too me after my presentation at [CukeUp
2013](http://skillsmatter.com/podcast/agile-testing/cuke-envy-a-dot-net-programmers-attempt-to-catch-up) and
the usage is part of ["Pushing the HOW
down"](http://www.marcusoft.net/2013/04/PushTheHowDown.html) which I
wrote at length on before.

The [Context injection
feature](https://github.com/techtalk/SpecFlow/wiki/Context-Injection)
(as it's called in SpecFlow) is one of those "just works"-feature and
you don't have to think to much about how. Here's a simple example:
<div>

The context injection feature simply creates the Driver object for us,
as long as it has a parameterless constructor... or can figure out how
to create the rest of the objects for us.

That statement probably needs an explaination. Normally you would
configure the IoC (inversion of control) container to know how and what
to resolve as you ask it for objects. So you might say that "the next
time someone asks for an <span
style="font-family: Courier New, Courier, monospace;">IRespository
you should create a <span
style="font-family: Courier New, Courier, monospace;">FakeRepository".

The context injection doesn't work like that. It's purely convention and
a very simple one too: it creates objects that have parameter-less
constructors (not entirely true but let's forget that for awhile).  But
of course it supports resolving in several steps. For example is the
following scenario supported:

Here you can see that the WithdrawSteps (in the WithdrawSteps.cs file at
the bottom) has a dependency of the Driver_HTML class. That in turn has
dependencies of the ATMPageWrapper and the AccountBuilder classes. All
of this is nicely resolved by the context injection feature.

You could of course resolve other stuff with this approach as well;
reference data, test data class etc. but I think it really shines when
it comes to stich your testing infrastructure together.

### Going advanced 

</div>

<div>

I told you above about the default,
resolve-parameter-less-constructor-objects features of the context
injection inversion of control container. There's an advanced version to
this as well... Advanced, by the way, it contains 2 methods
for registering types (<span
style="font-family: Courier New, Courier, monospace;">RegisterInstanceAs(new
Foo(), typeof (IFoo)) and <span
style="font-family: Courier New, Courier, monospace;">RegisterTypeAs())
and a single method for resolving.

To use it you could write a
[BeforeScenario](http://www.marcusoft.net/2010/12/using-tags-in-specflow-features.html)-hook
(there's also BeforeFeature and BeforeTestRun at your disposal) and
configure the container. Like this:



</div>

<div>

(Note the \[Binding\]-attribute on the class of hooks, I forget that one
every time...)

This is great if you need to resolve objects that don't have
parameterless constructors and you can also utilize this approach if you
have objects that you just want one of. One example that springs to mind
is a WebDriver object. This is often expensive and resource intensive to
create and you often just need one active per scenario. 

</div>

<div>

### Wrap up

</div>

<div>

The Context Injection feature of SpecFlow is not very well known and
using it is rare in the implementations I've seen. That's a pity since
it can clean up your testing infrastructure quite a bit. And you should.
Testing code is also code - it deserves your love too. 

</div>

</div>
