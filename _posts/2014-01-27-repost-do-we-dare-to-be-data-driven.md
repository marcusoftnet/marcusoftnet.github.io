---
layout: post
title: Repost - Do we dare to be data-driven
author: Marcus Hammarberg
date: 2014-01-27 08:12:43
tags:
 - Life of a consultant
 - Lean
 - Agile
 - Tools
 - CodeBetter re-posts
---

## REPOST FROM CODEBETTER

I noticed that [CodeBetter](http://codebetter.com/marcushammarberg/) is slowing down. Maybe dying. I'm preserving [my original post](http://codebetter.com/marcushammarberg/2014/01/27/do-we-dare-to-be-data-driven/) from there, here on my own site.

## Original post

We had set the system up for a test of how this [A/B testing](http://en.wikipedia.org/wiki/A/B_testing) stuff could work for us. Would it be useful? Could we communicate it clearly to the others around us? Would the data be easy to understand and make something out of?

![Impossible CAPTCHA)](/img/Impossible-Captcha.jpg)

From <http://www.mikebilleter.com/2009/08/impossible-captcha.html>

In order to know what we where doing we picked a no-brainer feature to test it on: registration with or without [CAPTCHA](http://en.wikipedia.org/wiki/CAPTCHA). You know, like the one to the left.

Since all of  us (and probably you too) hate to type those strange, unreadable letters we were confident that we knew which one would win. Hence we had some really good test data for how A/B testing would work. A registration page with CAPTCHA turn on was created and one with it turned off. We then used Google Analytics to direct 50% of the traffic to either page.

The only thing was… the result was puzzling. And it started a really interesting process at the client. And the same reasoning has been made by everyone I told this story to after. I wonder: do we really dare to be data-driven or are we’re chickening out when it comes down to it?

<!-- excerpt-end -->

This experiment was done at one of the big sites in Sweden so there were plenty of traffic. We ran the experiment for a week in order to even out any peaks and valleys in traffic (Sundays is the best day for online-shopping site apparently).

And yes, as you probably have guessed by now: CAPTCHA turned **on** won. On the the winning page 6.5% or 400 people (sorry the exact numbers escapes me) more succeeded to register and become customers. No one, not a single person, in the team or the entire company had guessed that before the test. We were all baffled of the result.

**What’s going through your mind right now?**

I guess that there’s one of these:

- “But that is a too small sample to tell. Run the experiment for a week or two more before you make up your mind.”
- “There’s something wrong with their setup. Are you sure you’re doing it right?”
- “There’s another thing on the page that trips up more people, which show us the wrong “result.
- “This post is not about curly braces, I’m out of here.”
- “But for crying out loud! They cannot use GA to set up a proper A/B test. Product X is much better for that. “

I’m also betting that no one of you thought:

> Well, awesome! Keep the CAPTCHA turned on then and do something more useful. Like run the next experiment, for example.

At least that is what happened at this company. We spent hours laughing about the result, trying to explain it, tweaking the test setup, suggested reruns of the test and of course blaming the tooling. And everyone I’ve told the story to after this has done the same thing. Start questioning the measurement, the data, the way we did it etc.

You know what the client ended up doing? Yes, of course we removed the CAPTCHA. We **knew**that it was better without CAPTCHA. Everyone knows that.

## The Obama story

This client actually contacted another company later, since they were getting more serious about A/B testing. The company is called [Optimizely](https://www.optimizely.com/) and they did a really interesting presentation about their product when it was introduce at this client. In this presentation, to underline the use of A/B testing, they told the story about the Obama campaign site leading up to president Obama being elected president. Pretty good customer case, if you ask me (“this guy used our product and now he’s PRESIDENT OF THE USA”). Optimizely blogged about all the [details here](http://blog.optimizely.com/2010/11/29/how-obama-raised-60-million-by-running-a-simple-experiment/) and it’s a really interesting read.

The site was really simple with just a single page, single “media”-section and an email address form (one field, one button). The goal was of course to get as many people as possible to sign up for the newsletter and hence “Join the movement”, and some percentage of these people would contribute financially too. It’s all about money, you know.

They 24 different combinations of button text, button colors and different movies / pictures above them. Here’s part of their stats that show sign-up rates per combination:

![Obama test sections](/img/Obama_test_sections.jpeg)

From <http://blog.optimizely.com/2010/11/29/how-obama-raised-60-million-by-running-a-simple-experiment/>

And the winning combination, combination 11 looks like this:

![Obama winner](/img/Obama_winner.png)

From <http://blog.optimizely.com/2010/11/29/how-obama-raised-60-million-by-running-a-simple-experiment/>

Yes, people. Red button with “Learn more” and a picture of presidential family in a pastoral setting. 40.6% improvement in sign-up rate. That translates to 2,880,000 more email addresses, 288,000 more volunteers and since they are likely to contribute on average $21 $60 million more in donations. [Read the blog](http://blog.optimizely.com/2010/11/29/how-obama-raised-60-million-by-running-a-simple-experiment/) – it’s fascinating stuff.

**What’s going through your mind right now?**

If you’re anything like me it’s something like:

> Ok? Yeah… but … WHY?! I mean, how can they **know**? Are they really sure about this? How did they dare run with that combo?

Because: they trusted their data and dared to be data-driven. Instead of wasting time discussing the result (“but why that color”, “maybe we should try some other pictures, just to be sure”, “is this really the right tool for this?”) they ran with what they had and pressed on, fulfilling the goal of the application in a great way.

## Conclusion

So what am I saying: don’t think and trust your result blindly? No, of course not. But maybe, as an exercise, think about what you will do when the result comes. Even unexpected result. This will probably clear up a few things about your experiment too.

And as always, the longer lead-time, longer iterations you have the more is at stake and the more likely it is that you start questioning the data and go with your gut feeling instead. For some strange reason. Feeling over data – should be easy. But “we knew that without CAPTCHA is better. Come on?” If you’re concerned about risks – change more frequently. There’s a reason good boxers have excellent footwork.

If you have a quick way of changing, with the tools around [continuous delivery](http://continuousdelivery.com/) etc., the less painful it is to go wrong. The only way to reach perfection is to fail fast and adjust fast. The entire Kaizen culture of Toyota is based on these ideas. Read more in the excellent [Toyota Kata book.](http://www.amazon.com/Toyota-Kata-Managing-Improvement-Adaptiveness/dp/0071635238)

Finally, acknowledge the fact that you simply don’t know. Nobody does. Not you, not the stakeholders, not the testers, not even the users. We have hunches and well grounded, guesses but until the thing you’re building is being used, by real users, in production… you simply don’t know. In order to know we have to test it out on them. Not only will this guide us further in what to build etc. These ideas is not new either and you should check out [Lean Startup](http://theleanstartup.com/book) if you haven’t, for more information about this.

So go forth and be more data-driven. I dare you.
