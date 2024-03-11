---
layout: post
title: "Value vs valueable - another aha-moment"
author: "Marcus Hammarberg"
date: 2024-03-11 08:00:00
tags:
  - User stories
  - TDD
---
English is not my first language, as I'm sure any reader of this blog knows. But I chose to view this as a superpower since I then can see things with fresh eyes. For example, the true meaning of words and phrases.

I still remember when I understood the difference between effectiveness and efficiency. Those are the same word in Swedish, but when I understood the difference a lot of things made sense when it comes to agile and lean stuff. [Read more here](https://www.marcusoft.net/2014/10/effective-revisted.html)

Last week I had another revelation like that - when I realized the difference between value and valueable. According to [Dave Farley it's a common](https://www.youtube.com/watch?v=0HMsh459h5c) mistake he sees for teams to adopt user stories effectively. I think he is right.  

<!-- excerpt-end -->

<iframe width="560" height="315" src="https://www.youtube.com/embed/0HMsh459h5c?si=qUIFejG6e7TONGKr" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

What David Farley is after is how we tend to make user stories too big since we are confusing value and value. Value to a user doesn't mean value to a user. He then continues to talk about a treasure chest. A chest full of gold coins is certainly valuable, but each coin has value.
The reasons we want to make the stories small are plentiful; it's easier to manage, implement, fix, deploy, and test... just about anything we do as a software development team.
But it's also faster to achieve the true goal, with smaller batches than with big batches, as any lean simulation/game will show you. For example this:

<iframe src="https://www.slideshare.net/slideshow/embed_code/key/2mgxDilfj0lg65?startSlide=1" width="597" height="486" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px;max-width: 100%;" allowfullscreen></iframe><div style="margin-bottom:5px"><strong><a href="https://www.slideshare.net/marcusoftnet/numbers-simulation-a-demonstration-of-lean-in-action" title="Numbers simulation - less is more!" target="_blank">Numbers simulation - less is more!</a></strong> from <strong><a href="https://www.slideshare.net/marcusoftnet" target="_blank">Marcus Hammarberg</a></strong></div>

In short; smaller user stories are more effective to do. It is, however, important that each story has some value to a user, but it doesn't have to be valuable. But we want each story to have some value to the user.

This is because the whole idea of user stories is that they are told from the perspective of the user and the value the user will get from the feature. We don't want to describe HOW but rather just the WHAT. This is easier to do if you focus on value for a user.

For example;

* An audit log statement for every action in the system - is too big and will not deliver any value in a long time. But when it does it sure is valuable.
* An audit log statement for logging into the system - this has value, is small, and holds many of the benefits of using smaller batches.

## Analogy to TDD

At this point, I saw an analogy to how test-driven development should be practiced. I love when I see these connections in different areas because it makes it easier to know when I'm on the right path. An approach that has helped me in one area is easy to apply to another when I know the guiding principles.
When using TDD to write code you follow a few steps to ensure that you are writing something small, useful, and relevant tests.

1. **Write a test for some functionality that doesn't exist yet**. This is important since you will now take the standpoint of a user of your code. What would be the value to the user of this code? If it already existed - how would it look?  
1. **Run the code and watch it fail.** This is important since you want to test your assumption that the functionality didn't exist yet. I've often been surprised to see tests pass at this stage, just to realize that I wrote the test badly.
1. **Write the smallest possible implementation to make the test pass**. This is important since you will here validate that the test will pass if return the correct answer. Quite often you will here start by returning a hard-coded value. For the test "1+1 should be 2" we write some code that always returns 2. And watch the test pass.
1. **Refactor the code**. This is the step where we change the code to do something intelligent in a proper way. It is important that we make changes to the code at this step since we now have a test that will tell us if we break anything while making the code do the right thing.
1. **Create another test**. If needed, that is; if the functionality is not yet valueable, go back to 1 and start over. 

The first few iterations of your code are rarely the version that you end up with, but it has some value. Just like user stories.

Also like user stories, we learn by doing the work. The more tests and production code iterations we do the better we understand the problem and can make even better solutions in the end.

The distinction between value and valuable can be seen in bullet 3 above. The "return a constant"-step is rarely what is needed, but it still has value in the process of writing tests. We, the developers, got some value from it. It's doubtful that a function called `addIntegers` should always return the constant `2` but it was value for us at the time.

## Summary

Making user stories small and valuable is hard. Very hard. But making them small with value for a user is luckily both much easier and a good way to write user stories.
