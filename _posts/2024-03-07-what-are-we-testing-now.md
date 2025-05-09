---
layout: post
title: "What are we testing here?"
author: "Marcus Hammarberg"
date: 2024-03-07 08:00:00
tags:
  - Testing
  - Programming
---

> Hold on? What are we testing here? Now I'm only testing the framework code

I've had this conversation many times, mostly with myself, and a few days ago with Johan. It might feel and seem like a failure but it is often the beginning of improvements and deeper understanding.

<!-- excerpt-end -->

In this particular situation, it started with a test that was hard to write, since it needed to check the output of a `console.error`-message that happened when a [Redux-thunk](https://github.com/reduxjs/redux-thunk) rejected a promise...

The setup and mocking was 25-30 lines of code and the check was 1 line. But we couldn't get it to work.

Taking a few steps back we realized that the code that was being tested consisted mostly of us chaining Redux framework-related code together. When we squinted our eyes we saw two lines of code in the middle of all of this code that performed some business logic. That logic was quite simple and loaded a bunch of strings into a listbox, or default values if failure.

We thought about it and realized that it could be pulled out to a separate function that would be very easy to test. The rest of the framework code could be left to an integration or end-to-end test to verify. As it turns out the Redux framework code wrapped access to a backend API. Failures (promises rejected) would happen if the API was unreachable and then the entire page was unreachable.

We didn't feel that having a unit test for every branch in the system was worth the effort to write; now and for maintenance going forward.

The end of the story was that we ended up with many fewer lines of code, tests, and, most importantly, a better-refactored solution.

## Principles used

We didn't get there by chance but used a few principles and thoughts from others to guide us.

1. If the system is hard to get under test - it's a design smell. See if you can make it easier to test the part of the application that you are interested in and you will notice that your design improved. Read or watch anything by Michael Feathers and you will learn more. [Here is one great video](https://www.youtube.com/watch?v=4cVZvoFGJTU)
2. ["Code is cost" is a thing that Dan North taught me a long time ago](https://www.youtube.com/watch?v=4cVZvoFGJTU). It feels weird to think about it like that but when you realize that the most productive day a developer can have is to remove code while making the system better it starts to make sense. There's a cost to maintaining production and test code. Writing fewer tests that in a good way verifies the system in a great way will always be better than writing many tests, in my experience.
3. [Mocking is a smell](https://medium.com/javascript-scene/mocking-is-a-code-smell-944a70c90a6a) *sorry for linking to Medium, the anti-reader-platform*. This is related to the first bullet but it is a good indicator of bad design of your production code, to have to write many lines of mocking to be able to write a good test. If you instead try to extract the code into testable functions you'll see the framework easier and you will also test the interesting parts of the code.
4. I don't know where I picked this up (probably from [Gojko](https://gojko.net/)), but I've found that starting an application typically verifies 60-70% of how the system is wired together. Just a few end-to-end tests that do the most basic use cases are often enough. Put the effort in writing many unit tests, refactoring as part of doing so, rather than spending a long time writing brittle, slow-running, and hard-to-maintain end-to-end tests.

That was a few musings after a fruitful discussion.
Thank you, Johan.
