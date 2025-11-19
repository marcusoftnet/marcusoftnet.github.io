---
layout: post
title: Applying the Switch framework to developers don’t want to write tests–part II
date: 2012-05-04T06:00:00.000Z
author: Marcus Hammarberg
tags:
  - .NET
  - Agile
  - TDD
modified_time: 2012-05-04T06:00:06.339Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-7328654065310556224
blogger_orig_url: >-
  https://www.marcusoft.net/2012/05/applying-switch-framework-to-developers_04.html
---

This is the second part (<a
href="https://www.marcusoft.net/2012/05/applying-switch-framework-to-developers.html"
target="_blank">read the first part</a>) of my trying to get inspiration
from the
<a href="http://www.heathbrothers.com/switch/" target="_blank">Switch
book</a> on how to get developers to realize that we also need to take
our responsibility for the quality to test. It not just the testing
departments problem. As W. Edward Deming put it;

> <a
> href="http://thinkexist.com/quotation/quality_is_everyone-s_responsibility/326081.html"
> target="_blank">“Quality is everybody's responsibility”</a>

Last time we took a look at the first principle – Direct the Rider. This
time the turn has come to the elephant in the kitchen. The emotions and
things that we cannot control by pure will power – it’s time to see if
we can Motivate the Elephant.

## Motivate the Elephant

The elephant is lazy; he doesn’t want to write more code than necessary
or write stuff that probably somebody else will find anyway. Also the
elephant will be pushed out of his comfort zone a bit here. Testing code
is different, there are new tools to be learned and new ways of writing
code that can be challenging to a comfortable elephant that has been on
the job for a long time.

Why should he care about testing?

### Find the feeling

In this part the Heath brothers talk about making people feel things
instead of just understanding them. I have been using a lot of games and
simulations lately in my presentations and it’s apparent that those kind
of experience-based learning is a much better way to make stuff stick
for people.

In this problem context I would love to make people feel the security of
being able to change code and refactor it without having to worry about
breaking stuff without knowing it. One great way to show that could be
to bring down a well tested open source library, such as
<a href="http://nancyfx.org/" target="_blank">NancyFx</a> and start to
change stuff inside it – and be “saved” by tests that help you see the
value of having them.

Best of course if you can show that bugs that was found by the automated
tests, when you *knew* that the code was tested and bug free.

Think about the feeling you want your developers to feel and find a way
to simulate that. Make it apparent.

#### Shrink the change

Here you want to motivate the elephant so that the first steps feels
easy. They might even have been taken already.

For us that means that you don’t want to enforce 100% code coverage. In
fact – let’s just cover the steps that we take right now. I have 2
simple rules for introducing tests in a non-tested code base:

1. Agree on that we write a small unit test for each bug that we find.
    Make sure that the test fails when the bug is present and is green
    when the bug is fixed. Take the measures needed to get the code
    under test. Please refer to the <a
    href="http://www.amazon.com/Working-Effectively-Legacy-Michael-Feathers/dp/0131177052"
    target="_blank">Working effectively with legacy code</a> book by
    Michael Feather for more on this.
2. <a href="http://dannorth.net/" target="_blank">Dan North</a> told
    great story that I often bring up in this kind of situations.
    Imagine that our code is a big dark scary forest. Now we need to go
    into the forest and make a small change in a clearing. So to protect
    ourselves we put small lights on the path we go to get to the
    clearing. While we’re there we also put out some lights around the
    clearing for protection.
    These lights are small unit tests.
    And the rest of the big dark forest? – We don’t go there!
    As it happens a lot of bugs appear in the same code base. Pretty
    soon you will have a great code coverage there. You get there in
    small steps.

#### Grow your people

Here you want to create an identity; we are like this.

Start with small steps like; we add a unit test for each ticket on the
board. That will trigger a sense of us being testers. Testing is part of
what we do.

After awhile you could try to take it further and add automated
acceptance tests for the most common, or scary functionality
(<a href="http://gojko.net/2007/09/25/effective-user-interface-testing/"
target="_blank">Gojko calls them face savers</a>). That will even
further enforce the identity of us being testing developers.

Finally try to get to place where testing and coding is not two
different activities but rather one in two different gears. Developers
write tests – that just how it work.

Take a look at any big OSS projects and you’ll find some very well
tested code and a culture and identity of testing being very natural.
None of those projects have assigned testers to my knowledge – it’s part
of the developers job there.

### Conclusion

That was the second part of this series. Stay tuned for the final part –
Shape the path.
