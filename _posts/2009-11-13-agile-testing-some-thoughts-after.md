---
layout: post
title: Agile testing – some thoughts after an excellent Elevate-evening
date: '2009-11-13T11:57:00.001+01:00'
author: Marcus Hammarberg
tags:
  - Life of a consultant
  - Agile
modified_time: '2009-11-13T11:57:28.121+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-5694135538797434709
blogger_orig_url: http://www.marcusoft.net/2009/11/agile-testing-some-thoughts-after.html
---


Yesterday was another
<a href="http://blog.avegagroup.se/elevate/" target="_blank">Elevate</a>-evening
and again I was impressed by the diversity and knowledge of the
consultants of
<a href="http://www.avegagroup.se" target="_blank">Avega</a>.

The theme for last night was; Agile Testing. This is an area that has
confused and frustrated (is that a word?) me for some time. I haven’t
got it to work in any of the agile teams I have been leading. Here are
sample of my failures (as in failure is good – an opportunities to learn
:));

- **No testers and no testing in the team**. This was a disaster. We
    did agile development but when we were done a 3 month testing phase
    took place. Sounds a lot like waterfall to me. And we didn’t harvest
    any of the goodness that agile can bring.
- **Testers in the team – but not doing agile testing**. So we decided
    to move testers into the team. But they had to keep up with the
    company testing policies. So each time we did a change, how ever
    minor it was, it resulted in several days work for the testers;
    updating test cases, use cases and tests plan etc.
    That didn’t work very well either.
- Finally we had **testers in the team that only tested the things we
    worked with during the sprint**. And with an acceptance test-phase
    after each 4-5 sprints. This was the best result we’ve got at this
    customer, but it was very hard to get through to the testers at
    first, and to the developers after a while…
    We got stressed and strained towards the end of each sprint, since
    the testers had nothing to do in the beginning and to much to do at
    the end. And the regression testing were killing them – more and
    more for each sprint.

So I very much looked forward to the evening last night since I didn’t
think that any of the approaches I’ve tried was good. And quite frankly
I haven’t heard anyone say; “Agile testing or testing in an agile
project? Yeah I know how to get that to work smoothly”.
Finally I would get to hear how to do it!

OK – that was my introduction. Here is my thoughts after the lightning
talks last night. Unfortunally I didn’t have time to stay for the
<a href="http://en.wikipedia.org/wiki/Open_Space_Technology"
target="_blank">Open Space</a>.

As I hoped they all had some similar thoughts and underlying themes,
which I takes as points worth noticing. For me three things stood out:

- **Team commitment to test** - make the whole team think test. Make
    sure that you don’t have developers and tester – only team members.
    Which fit very nicely with the next point;
- **Definition of done** – include testing in your definition of done.
    Or in other words; “We’re not done until the thing is tested.”
    We even got some suggestions on what to do if developers don’t take
    interest in testing; let testers be “sick” for a sprint, which will
    make developers to do the tests…
- **Invest in automation –** all the success stories from yesterday
    included automation of regression tests. Learn some tools for that,
    for example
    <a href="http://seleniumhq.org/" target="_blank">Selenium</a> and
    let the testers do test automation, rather than only manual
    testing.
    Manage the test-scripts for automation of regression tests as any
    other code.

All these will be in place if you can get the team to buy in on a
definition of done such as:

> “A story is done when it has an passing automated regression test”

Of course it will probably contain some other stuff also but only to get
a feel for it.

Doing automated regression tests will have plenty of benefits;

- the system needs to be testable – can we write tests against a
    service? do we need a test client that enable us to do automated
    tests?
- you can start writing the regression tests before the code is done,
    in many cases
- you get a suite of tests that run through the whole system and
    checks for breaks. Included in your Daily Build or Continuous
    Integration this will give you a nice status of your project.

OK – it was a great evening. Thank you everyone – you got me thinking a
lot.
