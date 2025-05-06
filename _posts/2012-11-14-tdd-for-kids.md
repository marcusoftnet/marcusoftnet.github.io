---
layout: post
title: TDD for Kids
date: 2012-11-14T10:38:00.001Z
author: Marcus Hammarberg
tags:
  - .NET
  - Life of a consultant
  - Specification by example
  - Agile
  - TDD
modified_time: 2012-11-14T21:49:28.747Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-7295652061062160894
blogger_orig_url: https://www.marcusoft.net/2012/11/tdd-for-kids.html
---

I had the opportunity to do something exciting yesterday. I was invited by my good friend Tristessa to teach a class on programming for her 13-14-year-olds. She teaches at the International School of the Stockholm Region and had introduced them to programming just a couple of weeks before I came.

Since the first time I learned [TDD](http://en.wikipedia.org/wiki/Test-driven_development) I've always thought that it's a bit like thinking like a child; challenging the code, come up with more examples, try to break/understand your code and just being curious. Also - when TDD works it feels much like doing a puzzle - the next piece just comes to you in a nice way, another kid-activity. So I thought I'd try to teach them TDD during an hour and a half. We did the [Fizz Buzz kata](http://codingkata.net/Katas/Beginner/FizzBuzz) together and during the class brushed on a number of interesting subjects. They also did somethings during the session that really surprised me and was really inspiring to see and hear.

I got the opportunity to record the whole session and you can watch it here (beware it's long!):

[Watch the recording](https://www.youtube.com/watch?v=Ont8keNr08Y)

The [code can be found here](https://github.com/marcusoftnet/TDDForKids.git).

The things that we discussed during the session were, as I said, both interesting and threw me off for a while. Here are a few of them:

- An early question in the open question section: What computer do you prefer to code on?
  - Me: Mac.
  - They: YES!
  - Me: ???
  - **Takeaway:** Eeeh - well Apple market is strong with these ones...
- After the first two tests, a guy called out that the code was duplicated and demanded we did something about that. Impressive indeed. I introduced [Refactoring](http://en.wikipedia.org/wiki/Code_refactoring) as a concept and moved some code to a separate method. They all agreed that it was a great idea.
  - **Takeaway:** Remove duplication - that's a great start on your journey to [clean code](http://www.cleancoders.com/).
- Tristessa, their teacher, asked them to reflect where this would fit in a manufacturing cycle this would fit (Design, Develop, Test, etc). From that discussion they, pretty much on their own, figured out that tests like these would actually make up the specification.
  - **Takeaway:** Test and specification is really just the same thing from different perspectives.
- I've done the FizzBuzz kata with about 20 groups. This is the first group that asked me to write tests for negative numbers and for zero. When I turned the table and asked them what THEY thought should happen for zero (for example) they first got a bit confused but I think they understood that no-one knows everything from the outset. We need to collaborate to understand that.
  - **Takeaway:** We cannot write complete specifications before we start - adjust and adapt. And write [executable specifications](http://specificationbyexample.com/key_ideas.html) that break when the system doesn't behave.
- They were very disappointed with my computer struggling with doing the FizzBuzz kata up to 1000000 (that is enumerating all the Fizzes and Buzzes etc up to 1 000 000) so we could have a nice little conversation about performance and writing performant code. They were very impressed with the computer being able to do up to 10000 very fast but equally sad that it didn't do 1000000 for them in a jiffy. "Come on - this is a COMPUTER. It should be fast".
  - **Takeaway:** Even with fast computers, you need to think about the algorithm, given a big enough sample it will matter.
- For several changes they were convinced that the tests helped us from catching regressions. So the code we wrote together actually helped them write better code and not have their customers report bugs for them. They got that through and through!
  - **Takeaway:** With a good test suite, you easier catch regression bugs.
- They were really great with coming up with new tests. This partly had to do with us doing the Fizz Buzz kata on the board. So it was visual for them all the time up on the board. That helped a lot during problem solving.
  - **Takeaway:** Visualization is a great help for problem-solving.
- I got into a problem doing some string concatenation during the end of the exercise. I then leaned on the tests and the Expected/Actual output and it guided me towards the solution. They thought that was all normal, by then.
  - **Takeaway:** Test-driven development helps you design and write code. It's not about the tests - it's about the thinking.
- When I was forced to explain how a for-loop behaved I had an epiphany about blocks. So, I said something like: A for loop runs this block (pointing to code within curly-braces) over and over again, as many times as we tell it to. Yes, that is what a block is; some code that can be executed. Think about lambdas and async stuff that we're doing these days - we're just handling blocks of code that we want executed and handled in different ways. Made it clearer to me.
  - **Takeaway:** Explaining stuff to others helps you understand it better.

## Summary

My goal was to teach them the thinking behind TDD. To first see the test fail and then fix the production code that makes the test go green. And finally, in green, make safe changes to the code, since the tests will tell us if we break anything.

They got that! And surpassed me quickly in challenging our code, asking more trickier questions and taking me on an explaining-journey that taught me a lot.

Thanks, guys - that was one great afternoon.
