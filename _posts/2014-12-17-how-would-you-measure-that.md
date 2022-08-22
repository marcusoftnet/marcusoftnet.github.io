---
layout: post
title: How would you measure that?
author: Marcus Hammarberg
date: 2014-12-17T12:49:02.000Z
tags:
  - Agile - Lean
  - Life of a consultant
  - Kanban
  - Specification by example
  - Indonesia
---

I've been very much into <a href="http://www.specificationbyexample.com">Specification by example</a> in my software development consulting. One of the key learnings for me there is to try to make things concrete earlier. Using specification by example we do this by, for each of the features we're building, sketching down some concrete examples on how that would work.

For example; let's say that we are building a on-line store and the business rule says <code>Shipping is free for order with 3 items</code>. That's pretty easy, right? We all have a good opinion on how that rule should be... but is it the same opinion?
<!-- excerpt-end -->
What I've found immensely useful here is to write down some really simple examples. Just to make sure that we understand it the same way. For this business our examples might look like this:

| Number of items in order | Shipping free?
| 2  | No
| 3  | Yes
| 4  | Eeeeh? Yes... or?


See... that was not really covered by the business rule. It could be considered obvious that it was *3 or more* items in order. But by writing down a few simple examples we made the *common understanding* better.

By the way - what about 6 items? Or 9? Will that give us a discount of the overall price? Or is it just 3 and above is free and that's it?

All of these questions arise from the simple fact that we made something more concrete earlier. Because this would have become concrete later, when someone wrote the code. And then they would either have guessed what to do or be stumped and made to wait until someone could help them with the answer.

So the goal is common understanding. Earlier.

## Vision statements
Now, that "make concrete earlier"-trick can be used in many other places and situations too. I've found it very useful to be a little more sure that we understand something in the same way. Let me give you an example where I've found it useful.

Right now I'm working with mission and vision statements for the Salvation Army Hospitals in Indonesia. As for most vision statements I've seen or heard, they are often quite hard to grasp. And a bit fluffy. <a href="http://www.marcusoft.net/2014/10/vision-statements.html">Why not say what you really mean?</a>, me thinks.

But then I realized that it may be a hard to do that. Because we don't want to lock it down, or * gasp * we might not know ourselves what it really means until we have worked with it for awhile.

That sounds a bit like the main problem in most software development to me: nobody really knows what it's supposed to be until it's done. So maybe the specification by examples ideas about making things more concrete earlier could be applied here. Let's try.

Since vision statements are meant to be a guiding star, a compass for our actions it might be hard or at least futile to try to give examples that are representative we have to do something different.

Measurements are one way to make it concrete. And yes <a href="http://www.marcusoft.net/2014/12/what-ive-learned-from-how-to-measure-anything.html">anything can be measured</a>. I'm not saying that we need to follow our vision up on these measurement, but just to make it more concrete. Just as our examples in specification by example might not be implemented as tests. They are useful just as conversations to make our common understanding clearer.

So maybe for our vision we ask:
<blockquote>How do we know if we are getting closer towards our vision?</blockquote>

That will push us to come up with some ways to see if we are doing progress as stated in our goal state, the vision. Note that even though the vision might be some state we never reach we can still track progress towards it, and in doing so define what we *actually* meant.

For example a vision like
<blockquote>A optimal health care</blockquote>
Is quite hard to work towards, but if we ask ourselves how we would know if we're getting closer or not we have to start defining what we mean by "optimal" and even "health care".

My favorite "vision" is the so called Formula 1-question. Legend has it that the CEO of the Williams Formula 1 stable evaluated all decisions against a very simple vision/question
<blockquote>Will it make the car go faster?</blockquote>
My suggested question: "How do we know if we are getting closer towards the vision?" would be trivial; "km / h goes up."