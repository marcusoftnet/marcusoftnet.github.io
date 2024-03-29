---
layout: post
title: Who writes the specification, now again?
date: 2011-09-13T17:30:00.001Z
author: Marcus Hammarberg
tags:
  - Specification by example
  - Agile
modified_time: 2011-09-13T20:16:34.263Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-4387080625349899534
blogger_orig_url: http://www.marcusoft.net/2011/09/who-writes-specification-now-again.html
---


There’s been a lot of buzz around
<a href="http://specificationbyexample.com/"
target="_blank">Specification by example</a> lately. At least in my
networks and close to me. I hear it almost everyday at the
<a href="http://www.avegagroup.se" target="_blank">office</a>. A couple
of days ago I was asked to do an introduction to the subject to a group
of interested people. Striking also is that most people I hear talking
about it is not developers (anymore) but rather business/requirements
people and testers.

One question that I often get asked and that puzzles me is:

> But who writes the specifications? Business people, developers or
> testers?

Maybe not exactly like that but something close too that. Actually I
think the underlying intent is something else and has to do with
ownership…

I have also discussed the topic with a few of my
<a href="http://twitter.com" target="_blank">Twitter</a> contacts that
are involved in a project using Specification by example. In this post
I’ll give my view on this – based on experience from a project last
winter and from
<a href="http://manning.com/adzic/" target="_blank">the book</a> by
<a href="http://gojko.net" target="_blank">Gojko Adzic</a>.

#### Touches 4 of 7 key process patterns

In the Specification by example book Gojko Adzic lists seven “key
process patterns” – stuff that teams are doing that makes them
successful. And that in essence is Specification by example. He doesn’t
call it a method or methodology (it can be combined with anything you
use to day), but rather refers to these 7 key process patterns.

The patterns are, very briefly (BUY THE BOOK):

1. **Deriving scope from goals** – where the scope for a feature or
    iteration is derived from the business goals
2. **Specifying collaboratively** – the specification and details
    surrounding a feature is discussed and talked about in a
    collaborative forum
3. **Illustrating using examples** – a practice where you clarifies
    your intent using concrete examples instead of natural language.
4. **Refining the specification** – this steps ensures that the
    specification is concise, conforms to the language in other
    specifications and adhere to best practices that the teams has
    agreed upon
5. **Automating validation without changing specifications** – with
    this practice teams uses tools (such as
    <a href="www.specflow.org" target="_blank">SpecFlow</a>,
    <a href="http://fitnesse.org/" target="_blank">FitNesse</a> or
    <a href="http://concordion.org/" target="_blank">Concordion</a>)
    that can run the examples as executable tests against the system in
    question and validate that the system fulfills the specification
6. **Validating frequently** – the executable specifications are run
    often – such as part of a daily build – to shorten the feedback loop
    and get quick feedback on the current status of the system.
7. **Evolving a documentation system** – where the executable
    specifications are organized, easy to find and concise so that they
    can use it when taking the product forward, change features and
    maintaining the product

I think that the question above (Who writes the spec) touches on 4 of
the patterns – at least – namely:

- Specifying collaborative
- Illustrate using examples
- Refine the specification
- Automate without changing the specification

Let’s look closer to what the question on who should write the
specification means for these different process patterns.

#### “Who writes the spec?” and Specifying collaborative

That the specification is done collaborative is in my opinion a very
important pattern. This means that you can do it with the whole team or
in smaller groups but don’t let one person alone write the
specification.

You could do this as a workshop with the whole team, writing a skeleton
specification (with examples) on a white board. Or you can have small
feature teams with just a few people representing the different
discipline in the team, maybe even writing the specification directly
into a tool for automation.

The thing with this practices is that you want to harvest the knowledge
of the whole team; so that the business user can focus on how well the
example fulfills the business needs, the developer can focus on how this
can be implemented and suggest alternative solutions and the tester on
how this can be tested and test coverage.

In doing this collaborative the team will (easier) get a collective
ownership of the specification. Stuff that you have been a part in
creating is much easier to take responsibility for. Compared to a
specification that is handed over to you – written by someone else.

> *So in this aspect the answer to the question is: **The Team does!***

#### “Who writes the spec?” and Illustrate using examples

This is basically the same as above. If only one person is coming up
with examples they tend to reflect that single person views and be
limited by his creativity. Compare that to examples that has been
created by a team with their collective knowledge and creativity.

> *Also here to the question is: **The Team does!***

#### “Who writes the spec?” and Refining the specification

Ok – in this process pattern we refine the specification and examples we
have created together to conform with the best practices and uses the
same language in the rest of the specifications.

So, if you like, this is where you create the actual specification
document. It’s of paramount importance that the intent and examples are
kept intact even if the language is tweaked into the one used in the
other specifications.

If this was code this step would have been called Refactoring.
Refactoring has been described as
<a href="http://en.wikipedia.org/wiki/Code_refactoring"
target="_blank">"disciplined technique for restructuring an existing
body of code, altering its internal structure without changing its
external behavior"</a>.

Often this is the first step where a computer based tool is needed. So
if you’re using <a href="www.specflow.org" target="_blank">SpecFlow</a>
(of course you do, right?) you’ll use Visual Studio 2010 to get the rich
experience with formatting, syntax highlighting and auto complete for
already implemented steps.

My experience is that this is way over the head of any normal business
user. Just installing Visual Studio and explaining what it is was more
than some of our users managed in my latest project. And those were
people in the IT-department, supporting the users of the system we were
building.

So I would suggest that a technical person performs this step. But of
course validating and checking with the other people in the team that
any changes didn’t change the intent of the specification.

> *So here the answer would be: Someone who has enough technical
> knowledge for the tool does. **But the Team has last say!***

#### “Who writes the spec?” and Automate without changing the specification

In this step it’s up to a developer or a technical tester to connect the
examples in the specification to the actual system in question. This is
done by “automating” the application, that is writing code that runs the
application. This can be tricky and messy if not done right – but it’s
also way off the topic of this scope. <a
href="http://www.marcusoft.net/2011/04/clean-up-your-stepsuse-page-objects-in.html"
target="_blank">To avoid the mess – read this</a>.

So make no mistake – this is coding! A developer automate the steps in
the specification and starts to build the actual system to fulfill them
– <a
href="http://en.wikipedia.org/wiki/Outside%E2%80%93in_software_development"
target="_blank">one by one</a>. The progress through the specification
can be viewed as the steps are implemented and passes validation.

> *For this pattern the answer is: A developer or a technical tester
> does.*

#### Conclusion

So there are a few answers to a question that I almost always get asked
as I present Specification by example. I think it might be because that
this is where there is a big difference from how we traditionally writes
specifications or tests. They are done by a specialist and then handed
over to another specialist to be fulfilled.

*But that it also where the biggest improvements and benefits can be
achieved.*

When you have done this many times I suspect that all the 4 patterns
above (or at least the 3 first I have listed) can be done all at once.
Sitting around a computer and simply entering the specification and it’s
example directly into the tool of choice.

I hope you found this helpful.
