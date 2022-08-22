---
layout: post
title: What i learned from 'From User stories to Acceptance tests' with Gojko Adzic
date: '2011-11-29T20:27:00.001+01:00'
author: Marcus Hammarberg
tags:
  - BDD
  - Specification by example

  - Agile
modified_time: '2011-11-29T22:34:36.362+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-7973153048578917460
blogger_orig_url: http://www.marcusoft.net/2011/11/what-i-learned-from-from-user-stories.html
---

I've just returned back home from a course. It's the first course
I've attended in over a year and I'm always amazed how much you can
learn in a short time; if the course and teacher is good and if you
engage yourself in the course.

This time I knew it would be great since [Gojko
Adzic](http://gojko.net/) was the teacher and the subject was something
that I find really interesting and useful - [Specification by
example](http://specificationbyexample.com/).
I would be completely impossible to write down even a fraction of all
the stuff I picked up during the two days but I thought I stop at the
main points and write down what stood out for me.

As I've been following the BDD and Specification by example community
intensively for two years I had quite a lot of knowledge on before
hand - the main points I wanted to get out of this was practical tips on
how to facilitate and handle the early phases of the lifetime of a
specification done in this manner. Being a developer I have focused much
on the later parts up to now.

Here are the main topics we discussed, but not in this order as I
remember:

- Communicating with examples
- Key process patterns of successful teams
- What makes a good specification
- Fitting into a development process
- Adoption strategies and patterns

### Communicating with examples

<div>

We started this part by doing a simulation (a Black Jack game) in which
we tried out what happens when we try to do "traditional" testing on a
short development cycle. And our group went into all the traps that I've
been preaching against for so long; developers and testers stopped
communicating, we didn't involve the customer, we focused on the
implementation rather than on business value. We even got the acceptance
test case but returned them as we thought it was a mistake. No group
asked the customer (Gojko) what he was expecting.

</div>



<div>

From that we started to look on how hard it is to understand each other
and how the telephone game plays out in a software process. For even
such simple stuff as to [how many points a simple symbol
has](http://gojko.net/2008/08/29/how-many-points-are-there-in-a-five-point-star/) there
were a lot of disagreements.

</div>



<div>

We saw how using concrete examples could clarify that a great deal. And
when we went back to our simulation and applied examples to the
requirements we've got we actually could find a whole lot
of inconsistencies in them. Here is was really powerful to find business
concepts by using examples such as BlackJack and Busted for example.

</div>



<div>

Two kind of exercises for creating examples as a group stood out to me:

</div>

<div>

- Diverge and merge - where you intentionally let several groups work
    on the same example for a while and then merge the groups to compare
    and learn from each other.
- A feedback exercise which reassembled [planning
    poker](http://en.wikipedia.org/wiki/Planning_poker) a bit. Write
    down a case and then each write the expected outcome. Compare and
    learn.

<div>

The main thing you want here is probably not the examples but rather to
learn and get a shared understanding of the problem at hand. The
examples is a great way to reach there and also to document them in.

</div>

</div>

### Key process patterns of successful teams

<div>

This part I knew the most about during the course, since I've read the
book and done presentation on these patterns. I still learned stuff of
course:

</div>

<div>

- All the teams that was successful in implementing Specification by
    example specified collaborative and did that using examples
- Key examples is not all examples. It's probably 10-15 not 500
- Put up a couple of examples and try to break them (drill a hole in
    them) to see if all relevant key examples has been found

<div>

We then talked about some common collaboration patterns and when they
might be applicable:

</div>

</div>

<div>

- All-team workshops - when stakeholders are available, you need loads
    of knowledge transfer (you don't know much about the domain) or you
    want to explore new ideas. Pretty expensive tough.
- Three Amigos - get a Business Analyst, Developer and tester together
    and do a mini-workshop. [Hehe I drew this without
    knowing](http://lh5.ggpht.com/_TI0jeIedRFk/THzCfVkXX9I/AAAAAAAAAlQ/rN05kWnVArs/s1600-h/specws1%5B2%5D.jpg) a
    while back. This is useful when you have mature product that your
    team knows a bit about.
- Ad-hoc conversation where you simple skid over and ask the involved
    people. This requires people being nearby and you knowing a lot
    about the product.
- Write + Review - you write a specification and then have somebody
    else review it. Good if your are distributed and have a hard time to
    get hold of people needed to answer questions.

</div>

### What makes a good specification

<div>

I loved this part and learned loads from this. The main part of this was
us dissecting and discussing a big load of examples (great idea -
examples to understand how to write examples). Together we came up with
a big list of stuff that was good or bad with them.

</div>



<div>

Here are the good part, as we finally summarized them:

</div>

<div>

- A descriptive title (what you would Google for to find this
    document)
- Has context under which the example executes
- No technical details such as database ids or web page class names
- Short - in fact most of the good stories were considerable shorter
    than the bad ones
- Precis - talks only about the example at hand.
- A structure in which the test was separated from the examples
    ([Scenario Outline for
    Cucumber](https://github.com/cucumber/cucumber/wiki/Scenario-outlines)
    features for example)
- Boundaries included - we triage and try different values to find the
    boundaries for the example
- More than 1 example (see above)
- Uses the business language - the domain language
- Has the *right* abstraction level. This is a hard one but you
    reached this when you cannot remove anything without destroying it.
    Or another way is to ask someone to summarize the things you have
    written down. If they can and it's still understandable - use that
    summary.
- Clear and measurable expectations
- No new concepts introduced simply due to the fact that we're going
    to test this with a tool

<div>

Other stuff that came up from Gojkos presentation was:

</div>

</div>

<div>

- Don't write workflow scripts - write WHAT should be tested not HOW
    it should be tested. 90% of the team failing with BDD does this.
    90%!!!
- If you find yourself writing about technical concepts - try to
    rephrase it into what that technical thing does
- Try to find breaking examples to find the boundaries
- Show the example to someone else and see if they understand it
    (given domain knowledge). If so - then you have the right level of
    self-explanation.
- Write the description of the test to be a description on how to read
    the examples.

</div>

### Fitting into a development process

<div>

This was basically a number of case studies that showed how different
teams had fitted the ideas of Specification by example into their
process. It was quite interesting as it ranged from fully fledged agile
teams to very rigid waterfall-type of processes.

</div>



<div>

A few tips I picked up:

</div>

<div>

- Set aside time before the planning (be it sprint planning or
    whatever) to prepare some key examples. That will make the actually
    planning much smoother not halting on the first question.
- The more stuff that is unknown the further ahead the initial team
    should work. Work a sprint ahead if needed.
- Get only bullet points with acceptance criteria from BA if they are
    very busy
- Don't try to write out full specifications at workshops - who writes
    the [specification is not
    important](http://www.marcusoft.net/2011/09/who-writes-specification-now-again.html).
- Emphasize collaboration and shared understanding
- Define tests as early as possible
- Make sure that you get a mindset of collective ownership for the
    specification

</div>

### Adoption strategies and patterns

<div>

This was something that our group came back to. How do you introduce
these concepts? How do you sell it to the team or the stakeholders.

Firstly you can say that this is a general problem that has to do with
any change. For that I would recommend the book [Switch - how to make
change when change is hard](http://www.heathbrothers.com/switch/) that
talk about a lot of strategies for change management. A quote that stuck
is; "People don't resist change. People resist being changed" - if you
get people to think that it's their idea you have gained a lot.

Gojko had three points:

- **Change the team culture** to a culture of collaboration.
    Collaborate on specifications and test, which will build trust among
    team members. Focus on delivering business features and
    not functionality which will build trust with stakeholders
- **Remove waste from the process** - make things precis early to
    establish a clear definition of done. Validate frequently and strive
    to get a single source of truth - the examples. This will make other
    things you do unnecessary (such as writing different documents for
    specifications and tests for example)
- Facilitate change - make sure that the examples becomes the main
    source of information (send links to them to answer questions),
    document business process (do not "write tests")  

</div>

<div>

This section also contained a lot of other stuff but it was discussed
and is hard to write down here.

</div>

### Conclusion

<div>

This post was my brain dump. I don't expect anyone to get it if you
wasn't there. If you still did I'm very happy. If you didn't get it -
please ask a question below and I'll answer to the best of my knowledge.

</div>



<div>

Again - thank you Gojko for a great course. I learned loads from you.
Again.

</div>
