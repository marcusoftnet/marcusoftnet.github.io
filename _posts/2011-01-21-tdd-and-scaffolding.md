---
layout: post
title: TDD and Scaffolding
date: '2011-01-21T15:04:00.001+01:00'
author: Marcus Hammarberg
tags:
  - .NET -
ASP.NET MVC
  - TDD
modified_time: '2011-01-21T15:04:00.334+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-5436875631721491002
blogger_orig_url: http://www.marcusoft.net/2011/01/tdd-and-scaffolding.html ---

During my ventures in to new Microsoft land I’ve stumbled on the concept
of scaffolding (in the form of the excellent <a
href="http://blog.stevensanderson.com/2011/01/13/scaffold-your-aspnet-mvc-3-project-with-the-mvcscaffolding-package/"
target="_blank">MvcScaffolding</a>). The concept is well known in other
frameworks and one of the
<a href="http://media.rubyonrails.org/video/rails_take2_with_sound.mov"
target="_blank">eye-opener features of for example Ruby on Rails</a>.

But as I <a href="http://www.marcusoft.net/search/label/KanbanBoards"
target="_blank">started to use scaffolding</a> I had to stop and think
for a while on other values that I have come to hold in high respect
such as <a href="http://en.wikipedia.org/wiki/Test-driven_development"
target="_blank">TDD</a> for example. The whole concept of
<a href="http://www.growing-object-oriented-software.com/"
target="_blank">driving out my code guided by test</a> has completely
changed the way I code. And my code!.

I don’t feel very good about myself, nowadays, if I have to write code
without tests. But this scaffolded code is not code I have written.
Should I write test for it? Before the code is generated or afterwards.

Since <a
href="http://www.google.se/search?sourceid=chrome&amp;ie=UTF-8&amp;q=tdd+scaffolding#sclient=psy&amp;hl=sv&amp;source=hp&amp;q=tdd+scaffold&amp;aq=f&amp;aqi=&amp;aql=&amp;oq=&amp;pbx=1&amp;fp=8279ccb541c59dbd"
target="_blank">I couldn’t find to much about it</a> I though I jot down
some thoughts on the subject. I think that it’s something that will be
used more and more in the Microsoft sphere.



### Definition

On <a href="http://en.wikipedia.org/wiki/Scaffolding"
target="_blank">Wikipedia scaffolding is defined as</a>:

> **Scaffolding** is a temporary structure used to support people and
> material in the
> [construction](http://en.wikipedia.org/wiki/Construction) or
> [repair](http://en.wikipedia.org/wiki/Repair) of
> [buildings](http://en.wikipedia.org/wiki/Buildings) and other large
> structures.

And if you try to find a
<a href="http://en.wikipedia.org/wiki/Scaffold_(programming)"
target="_blank">definition for programming</a> you’ll end up with
something like:

> **Scaffolding** is a
> [meta-programming](http://en.wikipedia.org/wiki/Meta-programming)
> method of building
> [database](http://en.wikipedia.org/wiki/Database)-backend [software
> applications](http://en.wikipedia.org/wiki/Software_application). It
> is a technique supported by some
> [model-view-controller](http://en.wikipedia.org/wiki/Model-view-controller)
> [frameworks](http://en.wikipedia.org/wiki/Software_framework), in
> which the programmer may write a specification that describes how the
> application database may be used. The
> [compiler](http://en.wikipedia.org/wiki/Compiler) uses this
> specification to generate code that the application can use to
> [create, read, update and
> delete](http://en.wikipedia.org/wiki/Create,_read,_update_and_delete)
> database entries, effectively treating the template as a
> "[scaffold](http://en.wikipedia.org/wiki/Scaffolding)" on which to
> build a more powerful application.

Comparing these definitions I think that a key difference between them
are the “temporary” word and principle. A scaffold to raise a building
is supposed to be removed as the building is finished. The scaffolded
code we get, from a scaffolder, is supposed to be a guide and supposed
to be built into the core of our application.

As <a
href="http://blog.stevensanderson.com/2011/01/13/scaffold-your-aspnet-mvc-3-project-with-the-mvcscaffolding-package/"
target="_blank">Steven Sanderson writes</a>:

> “Scaffolding” is used by many software technologies to mean “quickly
> generating a basic outline of your software that you can then edit and
> customize”

We’re supposed to change it. It’s just some code to get up us and
running. In the case of MvcScaffolding (and I think the scaffolded code
of Ruby on Rails) you actually get fully working code, structured in a
tried and tested way with templated views.

### TDD

<a href="http://en.wikipedia.org/wiki/Test-driven_development#Benefits"
target="_blank">Test Driven Development is a way to produce great
code</a>. It makes me think about what is needed and how I am going to
use it – before I write the production code. It helps me to flesh out
dependencies and structure even before the code is produced. And I don’t
write stuff I don’t need –
<a href="http://en.wikipedia.org/wiki/You_ain&#39;t_gonna_need_it"
target="_blank">YAGNI</a>.

Oh yeah – as a funny side effect I get a test that will tell me if any
of my changes down the road will break existing code (or tests.)

All this is great but here (with a scaffolder)  I get a bunch of code
generated without writing a single test.

### So what is it?

First – I think that code generation (as scaffolding ultimate is) is a
great idea. To generate code that you don’t want to write over and over,
in a well defined manner. Great idea!

But what kind of animal is the generated code. Is it my code? I haven’t
written it. A tool has. I might or might now have control over what is
being generated.

So it’s someone else's code? Well not really. It’s generated for me but
it’s still code. Not compiled assemblies that I include. I am
**supposed** to change it.

And herein lies the problem (for me at least); the code is a bit tricky
to classify and handle.

-   If it is my code I sure want a way to test it. Especially if I am
    going to do changes in it later on. Otherwise the Red light will not
    shine when I mess the code up later.
    Actually I would like to have the test code scaffolded in the same
    way as the production code – “tests to get me going”.
-   If it’s not my code I don’t want to see it. I don’t care how
    <a href="http://code.google.com/p/elmah/" target="_blank">ELMAH</a>,
    <a href="http://unity.codeplex.com/" target="_blank">Unity</a> or
    <a href="http://www.nhforge.org" target="_blank">NHibernate</a> are
    constructed internally. Or at least I don’t want to. 

I suppose that the code could be a mix of those two but in reality I
can’t see how to draw that line. This is either is my code (in which
case I want the code to be tested) or not (in which case I hope it’s
test but I really don’t care as long as it works).

### What to do?

The first thing is to decide on how to treat the code; mine or not. And
then face the facts from that decision.

If you treat the code as your own tests should be added. Most tools
(MvcScaffolding for examples) use a templates that can be tweaked into
the code you want. I would suggest that you tweak the templates to
generate tests for the code that is generated.

In my current project I’ve written a tool that generate data access code
(for the 1200 stored procedures we’re going to call – phew!) and here I
opted to generate tests as well. The code is also supposed to change
over time I wanted the team to have a way to trap any errors down the
road. Also since I wrote the template with TDD that came very cheap to
me. 

If you treat the code as theirs, as a third party tools that you happen
to generate, I would suggest to tweak the code to reflect that. You can
use the <a
href="http://msdn.microsoft.com/en-us/library/system.diagnostics.debuggernonusercodeattribute.aspx"
target="_blank">DebuggerNonUserCode-attribute</a> in .NET to do that.
Maybe in conjunction with the Auto-Generated comment
(\<auto-generated\>) like, <a
href="https://github.com/techtalk/SpecFlow/blob/master/Tests/FeatureTests/BeforeAfterHooks/BeforeAfterHooks.feature.cs"
target="_blank">for example in this code file.</a>

### Conclusion

OK – there you have some thoughts that have been flying around in my
mind a couple of days. Would love to hear any comments on the subject. I
might very well be so that I’ve missed recommendations on the subject –
please correct me then. Otherwise I’ll run with this think for a while.
