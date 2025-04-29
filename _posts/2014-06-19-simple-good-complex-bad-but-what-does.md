---
layout: post
title: Simple = Good. Complex = Bad. But what does it mean?
date: 2014-06-19T07:40:00.001Z
author: Marcus Hammarberg
tags:
  - Lean
  - Life of a consultant
  - Agile
  - Salvation Army
modified_time: 2014-06-19T07:42:17.939Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-1426830830628928525
blogger_orig_url: https://www.marcusoft.net/2014/06/simple-good-complex-bad-but-what-does.html
---

I’m a programmer. But I, for some strange reason, often find myself doing management consulting on different levels. Since my basic schooling is in programming I ~~sometimes~~ often find myself using principles that work well for programming in management.

One such principle was something I picked up about 10 years ago and I’m still reaching for that every day. Here’s my current desktop background, showing that principle to me every day:

![Slide3](/img/simplegood_complexbad.png)

This is a so-called [truism](http://en.wikipedia.org/wiki/Truism) that nobody says again, but I fail to reach just about all the time. I find it very useful as a guiding north star both in organizations and programming. But what does it really mean?

I have the good fortune to coach some managers in my current position and today we got to talk about that statement above with one of them. She obviously bought into that, as do we all, but I thought I’d try to explain what Simple and Complex mean for me:

To me simple is made up of two components (I think, might add stuff here later): *transparency* and *short feedback loops.*

## Transparency and trust

Transparent in turn means that the things we do are open and shown to others within our organization as far as we think it’s reasonable. This is one of the principles we built [Aptitud](http://www.aptitud.se) on and we’re pushing the envelope on this. You can see the way we calculate salaries on our website, every invoice is distributed to everyone in the company as are all the pay slips etc. etc.

By having the information as transparent as possible (as suitable) people will start to ask questions. Because now they see the information in broad daylight, and they wonder why a number is like that, or they might know that a statement should be changed, or they have an idea on how to improve on X.

![2014-06-18 09.38.54](/img/2014-06-18%2009.38.54.jpg)

And for the record, an intranet will not be sufficient. Put it out in the hallway! Make it big! I dare you to do an experiment to measure the difference. Create a beautiful page on your intranet with some important number visualized and pretty. Then try a really ugly, hand-drawn diagram and put it somewhere where everyone passes (close to the reception?). Note the difference in the number of questions or comments. The image above is one example from yesterday.

Two very simple things that we have tried lately are:

- Make a board with a post-it for every task we’re doing. Do 3 columns (To do, Doing & Done), meet every day and ask people how every task is going. Only that. Yeah, this is the embryo to a [kanban](http://bit.ly/theKanbanBook) board. But very simplified. For the current situation I’m helping to improve the communication in the organization. And by using this simple tool, it was restarted in minutes. Just by showing people the information.
- Create a hand-drawn diagram (like the one above) for some important metric your organization is trying to reach. Put it close to the entrance for the employees. Update it daily. Ask people what they think about that number, or if they want to track another number.

Transparency is not only about visualization, although that’s really important for reach. It’s also a mindset to share information rather than keeping it to oneself. And if you’re going to share the information, people need to feel safe to do so. To me, transparency without trust is not really worthwhile because people will not be transparent.

If you go “Show me the numbers!” or “Mr Andersson! Why is the [BOR](https://www.moh.gov.sg/content/moh_web/home/statistics/healthcare_institutionstatistics/Beds_Occupancy_Rate_BOR.html) lower today than yesterday?” people will lie to you. They will tell you the numbers you want to hear. But if you want the truth you will also show the people that even bad news are welcome. [Simon Sinek talks](http://www.youtube.com/watch?v=ReRcHdeUG9Y) about the main task of a manager as creating a safe environment. I think I kinda like that.

In my current team we try to solve that by often restating that:

> There are no good or bad news. There are just news.

I could go on for hours about transparency, but let me just leave you with one more thought; if you’re experiencing corruption in your organization, what would transparency do for you? What kind of questions would arise? What kind of information would be presented? What will the people involved in the corruption do?

Transparency is a powerful tool. Using it will uncover things. Are you ready to handle that?

## Short feedback loops – making it concrete often

![feedbackloopshort](/img/feedbackloopshort.jpg)

The other part of Simple to me is short feedback loops. For example, when we create the board with tasks as above, we meet *daily* to talk about it. This has a number of advantages over meeting once a week:

- The information is current.
- The meeting feels relevant.
- The meeting is short.
- Problems that occur will be small.

Funnily enough, if you meet seldom you can go through that list and make the opposites… And you [control the dial for that too](https://www.marcusoft.net/2014/06/controlling-disappointment-dial.html).

There’s been a lot of [text written about meeting daily](http://martinfowler.com/articles/itsNotJustStandingUp.html) so let's just focus on the last bullet for now. This connects the short feedback loops with the other part of the heading – making things concrete often.

When doing software development nowadays, we try to make things more concrete earlier by for example:

- Writing test cases on how the functionality should work before we write the application. In order to do so, we have to think about HOW the system should work without being bogged down with WHAT we need to build to make that happen.
- Running automated tests often. Several times an hour. Because this makes our current progress concrete. “Now that I’ve changed this little calculation, does everything else work?”
- Deploying to production often. Several times a day. Even for big sites like [Google](http://www.google.com) (did you see [this little feature](https://twitter.com/marcusoftnet/status/479463187612315649) they deployed without telling anyone, for example), [Facebook](http://www.facebook.com), and [GitHub](http://github.com). Because if it’s in production, it is as concrete
