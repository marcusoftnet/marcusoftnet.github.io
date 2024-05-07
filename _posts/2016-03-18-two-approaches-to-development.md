---
layout: post
title: "We don't know what will work - a story from last week"
author: "Marcus Hammarberg"
date: 2016-03-16
tags:
 - Agile
 - Lean
 - Life of a consultant
---

The last week I saw yet another time when [embracing uncertainty](https://vimeo.com/43603453) and embracing an experimental mindset, gave us great benefits and potential productivity gains. 

I wanted to share the story since I think it highlights these different mindsets and approaches in an awesome way.

It's also a great story...

<!-- excerpt-end -->

We are chasing a performance problem on our site, specifically on one of our more frequently used pages. Needless to say this have had high priority for quite sometime. 

A team was formed, a plan was created and a backlog of items that we thought would solve the problem was initiated. The first feature, our best bet, was further analyzed, setup and development initiated. The whole journey took about 1,5 months to get ready and another 2-3 weeks to develop. 

Finally, last Monday, we could do the first proper tests where we could measure against the current solution. Our efforts so far paid off. We saw a 5% improvement in page load times. 

In short - it sucked! Our best bet did not solve our problems. 

However (told you this was going to be good...) as the developer that was making the performance test run, he was spelunking around in the code. He found a thing that he thought looked a bit strange... 

"Hmmm... couldn't that part be cached, and maybe we do not have do the loop over these ..." - if you're a developer you know the kind of feeling / reasoning. 

He change 5 lines of code. Ran the tests again... 150% improvement!

**[UPDATED]**
It's been pointed out to me that this developer (that is an awesome developer) had a profiler to his help. A profiler is a tool that measures and helps you to track performance problems in your code.

Well... of course he did. I just didn't write that. My mistake. 

But what did he do there; he measured, saw problems, made a little change, measured again and around he went. It was very controlled, not like he just change a couple of random lines of code to get a good vibe. 

My point, as you'll see below, is that you simply don't know what is the best thing - before the fact. The future is uncertain (duh!). The best way forward is to take small steps often and measure to see that you're on our way to the goal. If not we tweak our course.
**[END UPDATED]**

# What can we learn?
We don't know what will work. Not until we have tested. You can have great ideas and plans - but that's just ideas and plans until you have validated them. 

In order to get to know fast we need to do small, frequent experiment often and change our approach, ideas and thinking based on the result of the experiment. 

You could call it the "humble approach" if you like. Or "experiment driven development". 

## One more thing - this is not an IT-thing
Btw - these ideas goes for business and what will work there. We don't know. I promise. And I've [written about it before](http://codebetter.com/marcushammarberg/2014/01/27/do-we-dare-to-be-data-driven/).

We do not know what will work the best until we have put it in front of users and see if the way they used the system will make us come closer to our goals. 

We should to define our goal, pose a hypothesis and then make the smallest possible change (i.e. investment) to validate our hypothesis. Now where have I [heard this before...](https://en.wikipedia.org/wiki/Scientific_method). Oh that's right - how all science has been made the last 2000 years! And [lean startup](http://theleanstartup.com/).