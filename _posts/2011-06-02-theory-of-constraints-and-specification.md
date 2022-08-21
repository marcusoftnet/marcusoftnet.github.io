---
layout: post
title: Theory of constraints and Specification by
example part II
date: '2011-06-01T22:55:00.001+02:00'
author: Marcus Hammarberg
tags:
  - BDD - Kanban - Agile
modified_time: '2011-06-01T22:56:45.817+02:00'
thumbnail: http://lh3.ggpht.com/-42_XIS4q5ng/TeanSuKOU9I/AAAAAAAAA_w/kGWbtqTEj24/s72-c/wlEmoticon-winkingsmile%25255B2%25255D.png?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-2318944997718944184
blogger_orig_url: http://www.marcusoft.net/2011/06/theory-of-constraints-and-specification.html
---


A lot of people read and appreciated <a
href="http://www.marcusoft.net/2011/05/specification-by-example-and-theory-of.html"
target="_blank">the last post</a> on
<a href="http://specificationbyexample.com/"
target="_blank">Specification by example</a> and
<a href="http://en.wikipedia.org/wiki/Theory_of_Constraints"
target="_blank">Theory of constraints</a>, so I thought I do a follow
up.

I often find that your closest people are your best critics, so I asked
a few of my colleagues for feedback.
<a href="http://hakanforss.wordpress.com/" target="_blank">Håkan
Forss</a> (<a href="http://twitter.com/#!/hakanforss"
target="_blank">@hakanforss</a>) is one of them that I respect very much
in matters like these. He, like me, read and loved <a
href="http://www.amazon.com/Goal-Process-Ongoing-Improvement/dp/0884271781"
target="_blank">the Goal</a> and I know that Håkan has great knowledge
about theory of constraints and applying that kind of thinking in the
system development process or other kind of knowledge work.

So it came as no surprise that Håkan had a few, rightful, objections to
my reasoning. He’s points made me think another lap and I thought that
it could be interesting to present it here.



To be able to follow this reasoning <a
href="http://www.marcusoft.net/2011/05/specification-by-example-and-theory-of.html"
target="_blank">you should read the earlier post</a>. Go on – we’ll be
waiting, or maybe just start the next section before <img
src="http://lh3.ggpht.com/-42_XIS4q5ng/TeanSuKOU9I/AAAAAAAAA_w/kGWbtqTEj24/wlEmoticon-winkingsmile%25255B2%25255D.png?imgmax=800"
class="wlEmoticon wlEmoticon-winkingsmile"
style="border-bottom-style: none; border-left-style: none; border-top-style: none; border-right-style: none"
alt="Winking smile" />

### The five focusing steps

Håkans main point has to do with a concept in theory of constraints
called <a
href="http://en.wikipedia.org/wiki/Theory_of_Constraints#The_five_focusing_steps"
target="_blank">the five focusing steps</a>. They are a number of steps
that aims to keep the ongoing improvement process going in an
organization. From <a
href="http://en.wikipedia.org/wiki/Theory_of_Constraints#The_five_focusing_steps"
target="_blank">Wikipedia we learn</a>:

> Assuming the goal of the organization has been articulated (e.g.,
> "Make money now and in the future") the steps are:
>
> 1.  Identify the constraint
> 2.  Decide how to exploit the constraint
> 3.  Subordinate all other processes to above decision
> 4.  Elevate the constraint
> 5.  If, as a result of these steps, the constraint has moved, return
>     to Step 1. Don't let inertia become the constraint.

There’s a couple of things worth thinking about here in the context
we’re talking about; system development.

#### **Assuming the goal of the organization has been articulated**

What is the goal of a system development project? Is it always the same?
In the example of Wikipedia it’s “Make money now and in the future” for
any organization.

The goal of a system development project I presume would be something
like:

> Develop a system that meets the need of the users

But this is entering dangerous “let’s write down a proper academic
definition” land. That’s not the purpose of this post, and way out of my
league...

The main thing here is that you should think about the goal of your
project. It may differ from project to project and it affect how you
reason and make tradeoffs in the five focusing steps.

#### Identify the constraint

How easy to write those words, but much harder to do. In <a
href="http://www.marcusoft.net/2011/05/specification-by-example-and-theory-of.html"
target="_blank">the last post</a> I used a factory as the example
(Marcusoft Welded Steelplates) because it’s physical and concrete. In
this world bottleneck would probably manifest itself as the steel plates
being queued up before the machine that is the bottleneck, or people and
machines with nothing to do (behind the bottleneck).

In our, invisible knowledge work, we need to help work to be visible.
That actually a core principle of Kanban, as shown in this picture from
the
<a href="http://www.kanban101.com/" target="_blank">Kanban101 site</a>.

<img
src="http://www.kanban101.com.php5-7.dfw1-1.websitetestlink.com/wordpress/wp-content/uploads/2009/12/stickies1b.png"
style="display: block; float: none; margin-left: auto; margin-right: auto"
width="400" height="168" alt="Kanban Core Principles" />

So if you have a typical Kanban or Scrum-board a bottleneck will halt
the progress of work, or you’ll see work that nobody is responsible for,
items that have been blocked or empty “columns” (process steps) with no
work to do.

BUT, in the last post I suggested that the bottleneck was the lack of
knowledge. That’s actually the cause of notes being stuck in certain
process steps. There’s (most commonly) not a step in your process called
“gather all required knowledge” – unless your doing strict waterfall
<img
src="http://lh3.ggpht.com/-xR9bM8sdFe8/TeanTCcEYbI/AAAAAAAAA_0/fcka5GAvpTE/wlEmoticon-smile%25255B2%25255D.png?imgmax=800"
class="wlEmoticon wlEmoticon-smile"
style="border-bottom-style: none; border-left-style: none; border-top-style: none; border-right-style: none"
alt="Smile" />.

So to identify the bottleneck here requires a reasoning and
investigation of WHY the work has halted, came back to us, was abandoned
etc. A great way to do this reasoning is to use
<a href="http://en.wikipedia.org/wiki/Root_cause_analysis"
target="_blank">root cause analysis</a>
(<a href="http://www.crisp.se/henrik.kniberg/cause-effect-diagrams.pdf"
target="_blank">great paper on this here</a>), which is another powerful
Lean technique.

#### Exploit the constraint

Oh I love this step. It’s so counterintuitive and just beautiful.
Instead of adding resources and elevating the bottleneck (step 4, two
steps away) you first try to do the best from what you’ve got. Love it!

Ok, assuming that lack of knowledge is our constraint (more on Håkans
criticism of this reasoning below), what should we do?

> Acknowledge the fact that we don’t know!

And how do we exploit that constraint?

> Align your process to the fact that knowledge is discovered as we go.

(To be quite honest I think that’s mixing in step 3 (Subordinate all
other processes to above decision), but that is not important for the
reasoning here.)

That’s the whole thinking behind most (all?) agile methods. That’s why
we release often to get feedback, that’s why we test-drive our code out
to get feedback early, that’s why we do small slices of the application
at the time.

And that’s why Specification by example sits very good (for me at
least). The whole idea is that you use the examples to talk about the
system in terms of the user, so that all roles can ship in and have
their say. Even before the code is created.

The examples then become a way for the developer to keep track of their
progress through the implementation of the feature, by use of the
<a href="http://en.wikipedia.org/wiki/Outside–in_software_development"
target="_blank">outside-in development (ATDD) approach</a>.

Finally the examples end up describing what the system does, as part of
the <a href="http://specificationbyexample.com/key_ideas.html"
target="_blank">living and ever changing documentation of the system</a>.

#### Don't let inertia become the constraint

Håkans criticism was that I always assumed that the lack of knowledge is
the constraint. (There was also mentioning of me having a great hammer
and seeing nails everywhere... <img
src="http://lh3.ggpht.com/-xR9bM8sdFe8/TeanTCcEYbI/AAAAAAAAA_0/fcka5GAvpTE/wlEmoticon-smile%25255B2%25255D.png?imgmax=800"
class="wlEmoticon wlEmoticon-smile"
style="border-bottom-style: none; border-left-style: none; border-top-style: none; border-right-style: none"
alt="Smile" />). This is actually even mentioned in the five focusing
steps, as the inertia to resist change.

I think that it’s absolutely correct; you should enter this with an open
mind and not assume that you KNOW where the bottleneck is. You might
just end up optimizing parts of your process that not is the constraint,
and theory of constraint teaches us that gets us nowhere. The constraint
is still there, and it’s still slowing you down as much as before the
optimization.

For me though, a break through in my thoughts was when I realized that
the constraint might not be a individual step – such as testing or
development. The constraint can be the underlying understanding that all
the steps are using as the feature progress through our process – such
as lack of knowledge of what we’re going to build.

### Conclusion

So Håkans criticism made me think – that’s a Good thing (tm). Thank you
Håkan for some excellent input.

Did that take my reasoning forward? Well, you should probably answer
that...

But I think that many of the problems and constraints we face in system
development projects actually has to do with us not knowing enough when
we start. Miscommunication, bad specifications, code not matching the
specification, hard time to verify the application against the
specification are all example of this – manifestations of lack of
knowledge.

But I wouldn’t go so far as to say that it’s ALWAYS the case. But often.
It’s the “darn close” part of the quote at the end of the first post:

> It (specification by example) is no silver bullet – but it’s darn
> close!
