---
layout: post
title: Applying the Switch framework to developers don’t want to write tests
date: '2012-05-03T08:00:00.000+02:00'
author: Marcus Hammarberg
tags:
  - Life of a consultant
  - Agile
  - TDD
modified_time: '2012-05-03T08:00:04.866+02:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-6471968641873307367
blogger_orig_url: http://www.marcusoft.net/2012/05/applying-switch-framework-to-developers.html
---


Last week I attended the premier agile conference in Sweden,
<a href="http://agilasverige.se/" target="_blank">Agila Sverige</a>. In
one of the <a href="http://en.wikipedia.org/wiki/Open-space_technology"
target="_blank">Open Space</a> sessions we had a great discussion on
why, still to this day, many developers don’t think writing test is
important. Or at least boring and second grade job for a developer. The
session was suggested by
<a href="https://twitter.com/#!/villesv" target="_blank">Ville Svärd</a>
who apparently has spent quite a lot of time on trying to convince
developers that testing is important and also an important part of their
job. So the whole session was just us sharing ideas and tips on how to
help and convince developer to catch the testing-bug – it was aptly
named “Testing is cool!”.

Yes, yes – you could argue that it’s simply just to hit them harder and
tell them that “They must!”. But I don’t think that works particular
well. At least it don’t stick. Around here I got to think about
<a href="http://www.heathbrothers.com/switch/"
target="_blank">Switch</a> and <a
href="http://www.marcusoft.net/2011/12/applying-switch-framework-to-broken.html"
target="_blank">a blog post I wrote awhile back</a> where I applied the
<a
href="http://www.heathbrothers.com/resources/download/switch-framework.pdf"
target="_blank">Switch Framework</a> to developers ignoring broken
builds. Why not try that same trick again – I thought to myself. ‘¨

I’ve linked the <a
href="http://www.heathbrothers.com/resources/download/switch-framework.pdf"
target="_blank">Switch Framework</a> about but really you need (you
SHOULD) to read the whole book to make the most of it. I will just make
small notes here and then try to use the problem at hand.

### The problem – Developer don’t want to write tests

So the problem is that for many developers testing is an activity
performed by testers. “I develop code – they test it”. The <a
href="http://www.marcusoft.net/2010/10/no-more-bugs-thought-experiment.html"
target="_blank">problem with that</a> kind of thinking is, among others,
that it builds queues of work that is fed back into development as bugs
are discovered. In
<a href="http://www.kanban101.com/" target="_blank">Kanban</a> terms you
are increasing your work in process. Which in turn will slow down all
the work you are doing. In an agile setting you instead want to test and
complete the work as far as possible as soon as possible. And get fast
feedback on when you are breaking things that used to work.

Therefore a lot of agile practices focus on automated testing, for
example <a href="http://en.wikipedia.org/wiki/Test-driven_development"
target="_blank">TDD</a>, <a
href="http://www.slideshare.net/nashjain/acceptance-test-driven-development-350264"
target="_blank">automated acceptance testing</a> and
<a href="http://specificationbyexample.com/"
target="_blank">Specification by example</a> are all practices that
shorten the feedback loop. But, as I said, this hasn’t been understood
by everybody yet – and many still frown upon testing code as a second
grade citizen in code country.

Let’s apply the powerful, yet simple, Switch Framework to that problem
and see if we can get some tips on how to get them on the train. I will
steal from the points raised at the Agila Sverige Open space session I
mentioned above.

### The Switch framework – a short introduction

I borrow from my previous post and give you the short-short intro to
Switch.

The authors have a image of the human psyche that they build a lot of
their reasoning on; the image of a Rider on an Elephant (borrowed from
Jonathan Haidt). The elephant is our emotion and the rider is our
rational side. The rider controls the elephant with some reins from his
topside position. The only problem is that if the six-ton elephant wants
to go into the bushes to have something to eat … those reins will not
help much.

In order to accomplish change you will have to address both the rider
and the elephant part of people. The rider need clear instructions while
the elephant need motivation and some reasons for why this should be
done. Finally you need to shape the path on which they are going to be
traveling. The Switch framework gives you some guidelines on how to
accomplish that.

And there… I have now summed up about 4 pages in the book. Read the rest
to get the full picture.

###  

### Direct the Rider

The rider here is of course aware of that tests are needed. He probably
even understand and can be taught the WIP principle and why we want
short feedback loops. But I’ve also come across riders that reason a lot
about the maintainability of the test code, and that sure is a problem.
Tests can become a burden if written wrong. So we need to address that
point to.

#### Follow the bright spots

One good thing is to show on places and times when this has worked
before. So you might have to write some tests yourself that is well
written, easy to maintain and actually saved you from throwing bad stuff
into production.

For me this happens almost every time I write my tests before my
production code. It leads me to seeing stuff, order of if-statements,
nestled loops etc. that otherwise would have slipped passed me.

When it comes to maintainable tests I would recommend to check in on the
<a href="http://www.growing-object-oriented-software.com/"
target="_blank">GOOS book</a> or this
<a href="http://www.slideshare.net/amckinnell/xptorontofinalslidehsare"
target="_blank">presentation</a> that both address that problem.

What you want is a short, well written example of when automated tests
saved your butt! Shouldn’t be too hard to find – if you’re like me.

#### Script the critical moves

In the Switch framework this is all about making the change super simple
to follow. In our context a lot of things can help here; checklists,
education, good examples, pairing and even code templates.

On thing that I have found incredible useful is to create a short
template to help you get started. <a
href="http://www.marcusoft.net/2009/02/snippet-for-creating-testmethod-in-c.html"
target="_blank">My template</a> sets up a test with a proper naming and
the Arrange-Act-Assert parts of the test body. Finally it sets up an
assertion that fails until you have implemented the tests. It’s a bit
verbose but I’ve found it to be very useful for beginners. Of course we
change it to our needs and the situation we’re in.

Automated testing tools such as
<a href="http://continuoustests.com/" target="_blank">Mighty Moose</a>
or <a href="http://www.ncrunch.net/" target="_blank">NCrunch</a> can
also be helpful to lower the bar for the testing feedback loop. These
tools run the affected tests on each save (or compilation). Note that
people might need help to set the tools up and you’ll need hardware that
can handle the burden of compiling and testing frequently.

Finally, but that almost goes without saying, you want to enable testing
in the build that is run on each check-in. That will both keep your code
base clean and safe but also give quick feedback to the developer
committing code. But make sure that you <a
href="http://www.marcusoft.net/2011/12/applying-switch-framework-to-broken.html"
target="_blank">fix the broken build</a>

That’s a couple of ways of scripting the critical moves.

#### Point to the destination

This is the part where you send a postcard from the future – showing
everybody how wonderful and well everything will work when you have come
to this place.

Here I would talk about us being able to develop faster and safer
protected by a test suite that we trust. Be sure not to fall into the
trap of sending illusions of 100 % code coverage (100% of your code is
tested). That number is not worth striving for, unless you use TDD when
you get it for free :).

I usually tell stories about companies that have mastered this. My
favorite is about a Swedish online gaming site that releases more than
once a day (386 releases in 2009 if I recall correctly). That’s cool but
the really cool part comes with the process; the last manual step… the
developer checks in. The rest is automated; build, unit testing,
automated regression testing, automated acceptance testing and
deployment. To a level where everybody feel safe just to release it.

That blew me away the first time I heard about it.

### End of part 1

This is already to long. I will publish this in parts. Stay tuned for
the Motivation of the Elephant (Find the feeling, Shrink the change and
Grow you people) and Shape the path (Tweak the environment, build habits
and rally the herd) parts of this.

Thank you for now.
