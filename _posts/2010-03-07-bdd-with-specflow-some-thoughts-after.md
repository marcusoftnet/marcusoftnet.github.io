---
layout: post
title: BDD with SpecFlow – some thoughts after a workshop at Elevate
date: 2010-03-06T19:53:00.001+01:00
author: Marcus Hammarberg
tags:
  - BDD
  - Life of a consultant
  - Agile
modified_time: 2010-03-06T19:53:13.618+01:00
blogger_id: tag:blogger.com,1999:blog-36533086.post-5996332960561722947
blogger_orig_url: http://www.marcusoft.net/2010/03/bdd-with-specflow-some-thoughts-after.html
---


Last Thursday I facilitated a
<a href="http://blog.avegagroup.se/elevate/" target="_blank">Elevate</a>-workshop,
<a href="http://www.avegagroup.se" target="_blank">Avega</a> on
<a href="http://en.wikipedia.org/wiki/Behavior_Driven_Development"
target="_blank">BDD</a> with
<a href="http://www.specflow.org" target="_blank">SpecFlow</a>. It was,
as always, a very nice learning experience for me, and hopefully also
for the participants.

I wanted to take some time to put down my thoughts and findings about
the framework, BDD in general and some other stuff I have ran into.

#### BDD – Behaviour driven design

I don’t want to go into
<a href="http://dannorth.net/introducing-bdd" target="_blank">explaining
BDD</a> since it's been done
<a href="http://blog.wekeroad.com/2009/09/21/make-bdd-your-bff-2"
target="_blank">several</a> <a
href="http://blog.stevensanderson.com/2010/03/03/behavior-driven-development-bdd-with-specflow-and-aspnet-mvc/"
target="_blank">times before</a> (I can really recommend the last Steven
Sanderson post – excellent!) in a much better ways than I could ever do.
Go on and read them if you want – I’ll wait right here.

But I can share some aha-moments and experiences that has surfaced for
me when preparing and doing the workshop.

##### It’s not in the tool

First, as a colleague told me yesterday: “It’s not in the tool”. First
and foremost I think that BDD is a great way to discus and formalize the
requirements together with your customer. I know that
<a href="http://gojko.net/" target="_blank">Gojko Adzic</a> has
formalized this into
<a href="http://gojko.net/2010/03/03/acceptance-testing-best-practices/"
target="_blank">workshops</a> where you flesh out the acceptance
criteria together and I really like that idea.

That promotes an <a href="http://domaindrivendesign.org/node/132"
target="_blank">ubiquitous language</a> and helps you to preserve that
language when turning requirements into code.

A great way to get hold of behavior is to ask for example scenarios.
These fit very well as the scenarios we’re writing when doing our
features and scenarios in BDD. That is so much clearer and crisper than
sending documents back and forth.

##### Implementing outside in

Finally when it comes down to implementing the scenarios you get a nice
outside-in approach to your testing. Of course this was where I started.
Being a programmer I was eager to see how to use this to write code. And
as
<a href="http://www.marcusoft.net/2010/02/specflow-bdd-net-style.html"
target="_blank">you might know</a> that was where I started glancing on
SpecFlow and BDD.

Starting from the acceptance criteria's or scenarios I was amazed how a
design was
<a href="http://en.wikipedia.org/wiki/Kanban" target="_blank">pulled</a>
from the text and turned into code. Just-in-time so to speak

#### Gherkin

<a href="http://www.specflow.org/specflow/feature-syntax.aspx"
target="_blank">SpecFlow is supporting Gherkin 100 %</a>.
<a href="http://wiki.github.com/aslakhellesoy/cucumber/gherkin"
target="_blank">Gherkin</a> is the language that is used in the Ruby BDD
framework <a href="http://cukes.info/" target="_blank">Cucumber</a>. And
SpecFlow is a great way to use standard Cucumber/Gherkin BDD-style on
the .NET platform. That mean that you can read and understand any
Cucumber literature be if for the Ruby, Java or the .NET platform.

Gherkin is a DSL (Domain Specfic Language) for writing user stories and
scenarios, with the well know trio of:
<a href="http://wiki.github.com/aslakhellesoy/cucumber/given-when-then"
target="_blank">Given/When/Then</a>. And as it is a formal language it
has it’s own best practices and trick that you’ll need to pick up before
being productive. Here is a great article series that take you from
basic to advanced:

- <a href="http://www.engineyard.com/blog/2009/cucumber-introduction/"
    target="_blank">Basic syntax and usage</a>
- <a href="http://www.engineyard.com/blog/2009/cucumber-more-advanced/"
    target="_blank">A bit more advanced features</a>
- <a
    href="http://www.engineyard.com/blog/2009/15-expert-tips-for-using-cucumber/"
    target="_blank">15 Best practices in Gherkin</a>

#### SpecFlow

Earlier on I said “It’s not in the tool” but of course you will need
one. The tool I have used is
<a href="http://www.specflow.org" target="_blank">SpecFlow</a>. The
thing that I like with
<a href="http://www.specflow.org" target="_blank">SpecFlow</a> is that
is 100% <a href="http://wiki.github.com/aslakhellesoy/cucumber/gherkin"
target="_blank">Gherkin</a>  compatible and doesn’t introduce <a
href="http://codebetter.com/blogs/aaron.jensen/archive/2008/05/08/introducing-machine-specifications-or-mspec-for-short.aspx"
target="_blank">any funky syntax</a> to go to code. Ok, it’s cool – but
come on: “= () =\> “ – who reads stuff like that?

Just as in standard Cucumber you also get stub code for your steps, when
you run the scenarios the first time. I love that feature since it helps
you along in a very nice way.

The binding between your scenarios and the code is done in a class with
step definitions. The methods are decorated with attributes
(Given/When/Then) that instructs
<a href="http://www.specflow.org" target="_blank">SpecFlow</a> which
method to run for a certain step.

Here we found out some problems and opportunities:

- The steps can be located in any class with the Binding-attribute.
    There is no connection between the scenario and the binding. It just
    a bunch of steps. If more than one attribute match a step in a
    scenario SpecFlow will throw and exception and inform you about it.
- <a href="http://www.specflow.org" target="_blank">SpecFlow</a>
    supports that you can have more than one attributes (two different
    \[When\]’s for example) on the same method. Using this technique you
    could have very specific strings in the attributes and still have
    them call the same method.
- In the attributes for the steps you can use <a
    href="http://github.com/techtalk/SpecFlow/blob/master/Samples/BowlingKata/Bowling.Specflow/BowlingSteps.cs"
    target="_blank">regular expressions</a> to be able to send different
    data to the same step. This could also be a bit confusing since some
    regular expressions will match a “bigger” portion of a string than
    you first might have guessed. This feature is standard Gherkin.
- Another, and maybe better way, to send data is the <a
    href="http://github.com/aslakhellesoy/cucumber-rails-test/blob/master/features/manage_lorries.feature"
    target="_blank">table construct in Gherkin</a>. I found this a much
    better way to keep your scenarios clean and less sensitive for
    change.
    The syntax for tables are a bit special though:
  - You need to have space after the pipe (\|) sign.
  - The table (of course) need headers, so that you can reference
        different columns in your code. The first line is the header.
- A thing that confused me, but is the way it has to work, is that a
    pending step will stop the execution of the rest of the scenario.

All in all I think
<a href="http://www.specflow.org" target="_blank">SpecFlow</a> is an
excellent choice when doing BDD on the .NET platform.

##### A bumpy ride – bugs and embarrassing moments

As me and
<a href="http://manssandstrom.wordpress.com/" target="_blank">Måns
Sandström</a> created the code and lab for the workshop we ran into more
bugs in tools and frameworks than I ever seen… None of them had to do
with <a href="http://www.specflow.org" target="_blank">SpecFlow</a> and
some of them had to do with me…

- We used <a href="http://www.jetbrains.com/resharper/beta/beta.html"
    target="_blank">Resharper 5.0 Beta</a> (different versions). I
    cannot imagining Visual Studio without Resharper, but this time I
    started to soon. Thanks to some great support
    <a href="http://www.jetbrains.net/devnet/thread/286635"
    target="_blank">some of the issues</a> were solved during the weeks
    we developed the code.
- I still cannot get Resharper to run the test from the .feature-file.
    “No test found in file” is the response that I get from Resharper
    for that… That worked for a while but has disappeared now. I haven’t
    reported a bug for that yet – not sure if it’s in Resharper or in
    SpecFlow.
- I also <a href="http://code.google.com/p/moq/issues/detail?id=234"
    target="_blank">reported a bug</a> in
    <a href="http://code.google.com/p/moq/" target="_blank">Moq</a> –
    but that was completely my fault. And I have to endure the
    embarrassing “user fault” in the report…
    That had to do with me using an overload and forgetting do an Verify
    for the overload.

So all in all – I’m hooked. I will sure try to get some more BDD
approach to the project I’m in. I up to now I haven’t seen a better tool
than <a href="http://www.specflow.org" target="_blank">SpecFlow</a> for
the job.
