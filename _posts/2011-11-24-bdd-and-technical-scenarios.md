---
layout: post
title: BDD and technical scenarios date: '2011-11-23T22:34:00.001+01:00'
author: Marcus Hammarberg
tags: - BDD -
Agile modified_time: '2011-11-23T22:34:10.980+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-5375736326531326102
blogger_orig_url: http://www.marcusoft.net/2011/11/bdd-and-technical-scenarios.html ---

I got a question from Sham (Shamresh Khan) that I thought was
interesting and also common. So I thought I post my answer here in the
public and maybe we all can learn a bit.

Sham’s question was something like this:

> …some of my scenarios/examples, may be very technical (i.e. checking
> some algorithm for example). If I write these tests under a user story
> (using the Gherkin syntax), a business analyst will be able to see
> them which may confuse them as they try to work out what scenarios
> exist under the user story or am I wrong here? Maybe all tests should
> be visible under a user story?



#### TDD and BDD

This is really one of the things we struggle with when coming from using
TDD for a while and then starting doing BDD. In my opinion BDD is more
than anything a communication tool that helps all parts of the
development team to communicate and understand what is to be built – to
build the right thing.

By using concrete scenarios and using in plain text we ensure that
everybody can collaborate or at least understand and critique them. That
is the main point and gain from
<a href="http://en.wikipedia.org/wiki/Behavior_Driven_Development"
target="_blank">BDD</a> – communication and a way to quicker <a
href="http://dannorth.net/2010/08/30/introducing-deliberate-discovery/"
target="_blank">find out what we don’t know about the feature in
question yet.</a>

That we get a way to test our system (end to end), and in that way can
handle regression testing in a very nice way, is just a side effect. A
VERY nice one but still just a side effect. Just like in TDD the main
benefit not really is the tests but rather the possibility to take baby
steps and produce well designed code.

#### What to do?

So after that long introduction… If you have technical stories or
scenarios that your stakeholder cannot understand, I think you have a
couple of possibilities:

-   If the feature in question is a business feature – you should
    probably discuss it further. If it’s an important business feature
    it will also be important for the business users. Rephrase it in the
    language of the business users. Hide the technicalities behind their
    terms. How it’s actually implemented is NOT important on this level.
    It’s a TDD-level thing.
-   If the feature is a truly technical scenario – it shouldn’t be in
    the BDD-specifications facing the business user at all. It shouldn’t
    be presented to them and quite frankly – they probably don’t care.
    (If they do one could wonder if they truly are a business user at
    all :P)

Actually to combine BDD and TDD is a great way to manage the question
you just asked. You first set up the scenarios to get something to
discuss around and help you understand and talk about the feature. When
that is in place you also have a “definition of done” for the feature.
You know how much to implement to fulfill the *current* requirements.
It’s has been referred to as doing <a
href="http://en.wikipedia.org/wiki/Outside%E2%80%93in_software_development"
target="_blank">outside-in development</a>.

#### Tips on how to get there

The two groups above could have the headings WHAT and HOW. I suggest
that BDD should be about WHAT the system does for the business user –
not about HOW it does that. Not about HOW it’s implemented.

A good way to ensure that you don’t miss that target is to work you way
backwards;

-   start with the “So that”-part of the user story – the reason for the
    user story to exists. If you get that in place everything will be so
    much easier to understand and reason about.
-   then for the scenarios start with the “Then”-part – the goal and
    assertions you are going to make to know that you have fulfilled the
    goals of the scenarios.

I hope that you got something good out of this Sham. And maybe somebody
else too.
