---
layout: post
title: "A simple diagram and some conversations on flow efficiency"
author: "Marcus Hammarberg"
date: 2018-03-29 09:21:39
tags:
 - Lean
 - Kanban
 - Agile
 - Life of a consultant
---

The last couple of weeks I have been re-discovering an old diagram (eerm … sketch really). You can find it scribbled on close to every whiteboard in our office now. Because it opened a lot of interesting discussions on flow, flow efficiency and optimizations for value delivery. 

I wanted to share this with you here, in a few iterations and also share some of the discussion that it triggered. 

<a name='more'></a>

First of all, this came up as we had a process that was taking a long time. Too long. It involved a few people from different departments that needed to do their work before handing it over to the next department. And then there was a user acceptance testing phase in the end that of course took a long time. 

The backlog of work is growing much faster than these people are completing work. High stakes, stakeholders, and customers getting angrier by the minute, people in the process getting overloaded with work etc. 

The proposed solution; yes, of course. Hire more engineering (step 4/5 in the process) people. I needed a way to visualize that more people in that step might not necessarily help the flow of finished. Because I think that the problem is not in the work but the waiting. 

## A simple diagram

This diagram is a very crude version of a [value stream map](https://en.wikipedia.org/wiki/Value_stream_mapping), but I've always found it useful. Even in this first iteration. 

Divide a section of the board into two halves, working and waiting

<img src="/img/flowefficiency_1.jpg" width="100%" />

Then draw a line that indicates the flow of the work that you are doing. I've found that in most process that is not yet optimized for flow efficiency it looks something like this:

<img src="/img/flowefficiency_2.jpg" width="100%" />

And that is it. 

In all honesty, I've stopped here most cases presenting this. Because most people agree with this hypothesis; much more time is spent waiting than actually working. Also, this crude diagrams is enough for the rest of the conversations, I've noticed. From this we can easily start and talk about the real problems and what to do about them. 

But you and I can deep dive a bit more. 

### Flow effeciency

The comparison between these two values is called **flow efficiency** and tracks how much of the total lead time is actually work. There's a [great post by Julia Wester](http://www.everydaykanban.com/2016/09/25/flow-efficiency/) that describes this in detail. It's super simple to calculate:

```
flow efficiency = work time / (work time + waiting time)
```

Most processes that are not explicitly optimized for flow would have a flow efficiency of below 15%. Meaning that around 85% of the total lead time is spent waiting.

Now, as I said above I've seldom had use numbers to convince people that we have a problem in our process. Because this is `exactly how we work` and `yes - I can totally relate to that` in most cases. 

Should you really want/need data it's pretty easy to get as well, to get really into the details? If not just skip to the next heading. 

Simply just decorate the diagram with the names of the process-stages (in some cases that is the same thing as departments…) and add the times between each stage: 

<img src="/img/flowefficiency_3.jpg" width="100%" />

Now we can easily calculate the flow efficiency (using the numbers in the picture):

```
Work Dep 1: 12 h
Wait: 2 weeks á 40 h = 80 h
Work Dep 2: 1 day * 8 h = 8 h
Wait: 1 week = 40 h
Work Dep 3: 2 h
Wait: 4 day * 8 h = 32 h
Work Dep 1: 1 h
Wait: 1 week = 40 h
Work Dep 3: 1 h

Total work: 12 h + 8 h + 2 h + 1 h + 1 = 24 h
Total wait: 80 h + 40 h + 32 h + 40 h = 192 h

flow efficiency = 24 h / (24 h + 192 h) = 11%
```

Yup. 11% flow efficiency. About normal I would say from experience. Echoes what most people I talked to experiences too. And devastatingly bad. 89% wasted waiting. 

### Showing the suggested improvement in our diagram

With this simple diagram (even without the numbers above), we also start to talk about the suggested improvement; `add more testers`, `add more people doing [stage x]` etc. 

Let's say that we do. Not only that - it's also hugely successful and takes away 75% of their working time. What have we achieved then? This: 

<img src="/img/flowefficiency_4.jpg" width="100%" />

That's it. The overall lead time is affected very little. Because the bulk of the lead time is not working. It's waiting. Adding more people to a process like this means that you have more people waiting. 

Also, adding more people might seem like a compelling quick fix, but: 

* It's not - read [Mythical man month](https://www.amazon.com/Mythical-Man-Month-Software-Engineering-Anniversary/dp/0201835959/ref=sr_1_1?ie=UTF8&qid=1522312799&sr=8-1&keywords=Mythical+man+month), written 1984. `Nine women don't give birth in a month`
* It is the most expensive thing you can do to solve this problem. More on this below
* It will slow you down even further for a while, to train and educate the people in the process. 

### Impact of high work in process

In one instance I had a very interesting comment, that stumped me at first:

> That is just ridiculous! There's never any waiting time like that?! There's always new work to do. 

I realized that I had done a lousy job explaining what the diagram was showing. Because that line above is showing the lead time of the *work*. How long before the car is complete? How long before the feature request is implemented? 

This diagram is not showing buysiness - it's showing flow of value. In fact, through [Littles Law](https://en.wikipedia.org/wiki/Little%27s_law) we can show that this thinking is part of the behavior. Because the moment we are not working on something we feel obligated to pick up something new to work with. That will make all work in process go slower. 

There are nice simulations to show this problem in action, if you want to click through it:

<iframe src="//www.slideshare.net/slideshow/embed_code/key/hfpgABlZ6t59qu" width="595" height="485" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe> <div style="margin-bottom:5px"> <strong> <a href="//www.slideshare.net/marcusoftnet/pass-the-pennies-lean-game-simulation" title="Pass the pennies - Lean game simulation" target="_blank">Pass the pennies - Lean game simulation</a> </strong> from <strong><a href="https://www.slideshare.net/marcusoftnet" target="_blank">Marcus Hammarberg</a></strong> </div>



You could also show this problem in the diagram by running your finger across the line. As you reach end a working stage just say `Now this work has to wait because Dep 2 are busy doing other things right now`.  

Then maybe add `Imagine if they would have time to pick this up now? Then we wouldn't need to wait all this time`, as you slowly run your finger across the waiting line. 

## Why is this? Who can be this stupid?

Why is the normal that we have 15% flow efficiency? That is not good. In fact; it is lousy. How can we together have built an organization that is this stupid? 

Well, that is not hard to understand at all, if you add an equally crude organization chart below. This will show that we have built the organization for another purpose. Here's one example: 

<img src="/img/flowefficiency_5.jpg" width="100%" />

The departments are organized in silos, but this work requires that we go through all the silos and work together to achieve a result. This is how value is created - it's called the value stream (blogged about [that realization before - it was painful](http://www.marcusoft.net/2016/04/what-are-you-optimized-for-then.html))

We have a legal department to do legal things, a development department to develop things and sometimes even a testing department to test things. They are often tracked on how many things they are doing and rewarded accordingly. The more you test the better. This means that you are always trying to be busy - hence increasing your work in process and probably queue length. 

Now imagine the poor schmuck that comes along and needs your help to complete a task that crosses over many departments; she needs to bargain and hustle a way to make sure that her things get priority and hence flows faster. 

Naturally, work will not flow fast and smooth across department, projects, and teams. That is not what the organization is built for. Sadly, flowing work fast and smooth is often what we are trying to achieve.

## Optimizing the process - the fast, fun & cheap way

However, the weakness reveals how to turn it into strength. Because this problem is easy to solve. Using the same diagram it can be visualized like this. 

<img src="/img/flowefficiency_6.jpg" width="100%" />

It involves a very complicated organizational shift too: 

> Get the people in the same room, at the same time and work on the same problem

That's it, really (objections below). 

Because now you have eliminated all the wait states in one simple go. Should Dep 1-guy need to ask Dep 2-gal something she's not only 2 feet way; she's also always ready to answer. They are namely working together, collaborating, on completing the task. 

Did you notice how I didn't hire new people, retrained, re-organized (ah well…) or spent any money accomplishing this change? I just let the people that are needed to complete the work… work together to complete the work.



In my first description of the process with problems above, I wrote this: 

> And then there was a user acceptance testing phase in the end that of course took a long time. 

Why is that always the case? The problem parts of the processes tend to be at the end of the process. Why? Because that's when we discover our false assumptions and miscommunications. They are bound to happen - but we want to discover them earlier. 

How will this change with people in the same room at the same time working on the same thing? They will discover these problems much earlier. As we start to describe what we want to change the people in later stages will think about their parts and can reveal problems directly. 

This is formalized in software development in a meeting called the [Three Amigos](https://www.agilealliance.org/glossary/three-amigos); where several different disciplines meet early on to discuss new features and find problems earlier.



Ensure that this team works together to improve lead time. Follow their progress on finishing items with quality as fast as possible. This is a bigger area and a bit of topic, but balance the metrics of speed and quality so that we don't get sloppy.

Better yet, if you dare, lead like it was 1807 and [give them a mission command](https://en.wikipedia.org/wiki/Mission_command), a value you want to be improved, a WHY and leave the HOW to the group. Ask them; what do you want to measure yourselves on to see improvements.



Oh, that's right; this will fail. It will without exception fail, **if** you don't have the right people in the room. If the people in the room goes: `I have to check this with Joe`, `this now needs approval from Legal` or `Done! Now we just need to wait for Sally to click Approve` then you have set them up for failure. 

For this to succeed you need the people that can complete the work in the room. Alternatively, give the people in the room the authority to complete the work.  

### Objection, your honor!

Yes yes - this is a bit simplified. Or is it? See [Mob programming](https://en.wikipedia.org/wiki/Mob_programming) that does exactly this. 

But sure… yes yes… I understand and hear you:

> SO?! Should we get the entire company into a room just have everyone waiting then? 

(true quote from an upset client)

No. Because your organization and processes are not yet built to handle that low work in process. Lean companies could be said to have that state as their hypothetical vision - a north star goal. Toyotas "one-piece continuous flow" is an example.

But we can't do that. Now. We need to balance the resource efficiency and flow efficiency to what makes sense economically. Or simpler: let's find a suitable number of people, for a suitable number of hours per week that will ensure that this work flows fast and smooth.

Look up the [execellent writings of Dr. Donald Reinertsen](https://www.amazon.com/Principles-Product-Development-Flow-Generation/dp/1935401009/ref=sr_1_1?s=books&ie=UTF8&qid=1522314063&sr=1-1&keywords=Principles+of+product+development+flow) on economic models for this. 

Or just try something for awhile and see if it works. Then tweak it until the flow improves. Here's one idea: 

> Tuesday and Thursday afternoon we sit together, all the people needed to complete this process, and work together to complete work. For 3 hours. 
>
> After each session we evaluate and change our ways of working. 
>
> We measure ourselves on lead time for each thing we completed, number of completed things per week and quality issues of the work we have completed.



Another objection is that of course, not everyone can be in the same room at the same time; location, time zones, working from home etc. 

Ok ok - if you cannot do physical room then do a virtual room instead. Focus more on the `at the same time working on the same thing` part first. Being in the same physical room is, in my experience better, but do what you can under the constraints you have. 

## Conclusion

This simple diagram is remarkable in how fast it gets to very interesting conversations and reasoning. I have discussed it with about 30 people on all levels of a company the last week and got surprisingly fast to the problem and focus on solving the real issue at hand in just a few minutes each time. 

Hope you found this useful.