---
layout: post
title: Metrics on 'well-defined' projects - and what I learned about uncertainty
author: Marcus Hammarberg
date: 2019-11-22 08:43:43
tags:

  - Agile
 - Lean
  - Life of a consultant
---

I've just finished a huge project here at work. I have recorded reference recordings of all the lectures in the [</salt> bootcamp](http://salt.dev). It was quite fun, quite exhausting but also quite rewarding as it basically drained me of every system development knowledge I have in me. And some that I didn't have in me (there's CSS in there, my friends...)

Obviously, I cannot share the result - but what I can share is what I learned.

I am a fan of [embracing uncertainty](https://vimeo.com/43603453) since I first heard [Dan North](https://dannorth.net/) all those years ago. Most of the work I do is development hence naturally uncertain, as learning is the main constraint. This has led me to ditch the idea of being able to estimate how long a task or project will take before we start.

But still I and teams I've coached are often asked this. Before the project starts?! When I know absolutely the least about what we are going to do. What a crazy time to ask for estimates.

Ok - this has led me to seek other ways of making predictions and prognosis, without me having to estimate (aka guess).

This particular project was a bit different and hence perfect to make a point about uncertainty with:

* I knew exactly what needed to be done - record 63 lectures
* I knew exactly what went into each part - the material and slides was created before I started
* It was an area in which I was an expert - I've created the entire boot camp together with [Jakob Leczinsky](https://twitter.com/jaklec) and I have made many screencasts and presentations over the years. [Some are recorded](https://www.youtube.com/user/MarcusoftNet/videos)

But still, the uncertainty bit me and it was bigger than I (we) thought, took longer in some regards and shorter in others and in general revealed a lot about things we didn't really think about.

In this post, I wanted to share how I tracked the data and lessons I learned from it.

<!-- excerpt-end -->

## Lesson 1 - a pie chart is just about never enough

A good friend of mine, [Håkan Forss](https://hakanforss.wordpress.com/), once told me to never use a Pie Chart; "you will always be disappointed". But I did. And I was. For the sole reason that pie charts are static and don't show progress over time, and hence are not very helpful to draw conclusions from.

Don't believe me?

<iframe width="600" height="368" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vTwA_WwPjQ49vxdEDqHMfsdOpYoSgtzkQHBvSeEpRlAxTF07tJDxEg4cUpuwHo6xVF4HQmhrUkgrU9Z/pubchart?oid=60332040&amp;format=interactive"></iframe>
Ok ... thanks. When did that happened? How was the progress there?

Well - now compare this to this chart

<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vTwA_WwPjQ49vxdEDqHMfsdOpYoSgtzkQHBvSeEpRlAxTF07tJDxEg4cUpuwHo6xVF4HQmhrUkgrU9Z/pubchart?oid=1857737974&amp;format=interactive"></iframe>
Thanks a LOT! That was much more helpful. Now I understand how the progress was during the project. HEY - I could even start to make some predictions, based on this data, half-way through.

**Lesson**: Pie Charts are static and not really helpful for showing progress. Good to flash vanity metric, maybe?

## Lesson 2 - But how big is this, really?

> Wait for a second here... what are we doing here really?

This is a very common question that in one way or another pops up as soon as you start to measure anything about your process. Because you are very often tracking the wrong thing.

For example, I tracked the number of lectures recorded in the two previous diagrams. But as the lectures are very different in size, maybe that is not really a good indicator of progress. Let's see if there's another thing that would be helpful to track in order to tell us "how far we have come" or "how much is left"

I tried hours recorded / day

<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vTwA_WwPjQ49vxdEDqHMfsdOpYoSgtzkQHBvSeEpRlAxTF07tJDxEg4cUpuwHo6xVF4HQmhrUkgrU9Z/pubchart?oid=1410772851&amp;format=interactive"></iframe>
And think it's just about as bad...

<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vTwA_WwPjQ49vxdEDqHMfsdOpYoSgtzkQHBvSeEpRlAxTF07tJDxEg4cUpuwHo6xVF4HQmhrUkgrU9Z/pubchart?oid=1621752627&amp;format=interactive"></iframe>
Maybe there is no real correlation between length of the hours recorded and progress. That last day I recorded many long lectures. Meaning; one lecture left doesn't really tell me how far it's left.

Or put differently; just the number of lectures is not much worse than tracking hours recorded.

Come to think about it - what is the real value here? That would be how good the students will pick up the content. That is the real value, but also that has a much longer feedback loop. Also for this "record all the lectures"-project it's not a really good indicator. Maybe if I am rather instead trac... {Marcus fades away in an infinite loop of reasoning}

**Lesson**: By starting to track anything you will trigger good discussions about what the real value of a project it is. Track something and be ready to change.

## Lesson 3 - Predictions are just predictions - not reality

Being a nerd of stats, I've written many posts about [how to track](https://www.marcusoft.net/2019/03/kanbanstats-an-average-improvement.html) (software development) [projects here](http://www.marcusoft.net/2019/01/kanbanstats-simplify-process-stats-get-started.html) and also being off the average-fallacy-train thanks to [Dan Vacanti](https://twitter.com/danvacanti), I quickly threw together a predictions sheet.

At first, I just predicted the total length of all the video to record. Remember; I knew exactly how many it was (63), but I didn't really know how long each thing would be. My feeling was that they were about the same length (turns out ... not really).

So what I did was that I just took the number of lectures times the median time of the lectures recorded this date and plotted it out. This was how I could make predictions, right? For all the things I recorded up to 2019-10-09 the median video was 10 min and 10 seconds and there are 63 lectures to record ... all in all it should be 10 h 32 and 6 seconds.

But if you asked me in 2019-11-19 the median would have been 0:13:51 and the total time instead 14 h 32 min 02. A difference of 4 h or 25% of the total time.

<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vTwA_WwPjQ49vxdEDqHMfsdOpYoSgtzkQHBvSeEpRlAxTF07tJDxEg4cUpuwHo6xVF4HQmhrUkgrU9Z/pubchart?oid=598086569&amp;format=interactive"></iframe>
Oh - btw; the total time ended up to be 16 h 20 minutes and not 15 h 04 min as my median calculations projected. Because projections is not the true. It's a projection based of the data at hand.

But from the data that we see here, we can see how that trend is projected little by little and steadily goes upwards. It would, on 2019-10-27, be a pretty safe bet to say that this incline would continue. Or not ... because how knows what will happen in the future. Maybe there are only short lectures at the end.

**Lesson**: Projections are made from historic data. The future is uncertain. Projections are not truths about the future. If your business depends on you accurately guess what will happen in the future I feel sorry for you. I cannot be done...

## Lesson 4 - Add spans and percentages to show uncertainty

Ok - the uncertain nature of the future got us. It's over. Let's all go home and not try to kid ourselves that we could predict the future.

Or maybe we can use this uncertainty to our advantage and let the power of statistics helps us.

Let's ask this, very common question; Ok - nice graphs, Marcus. But when will it be done?

(And here, I will right away say that this is a simplified version of doing this prediction. You would have to use [Monte Carlo Simulations](https://en.wikipedia.org/wiki/Monte_Carlo_method) to get a more proper calculation - WAY beyond the scope of this post. There are [books on that](https://leanpub.com/actionableagilemetrics).)

That said - let's make some predictions with the data that we have.

We can, for example, calculate how many sessions it would take me to record the whole thing. But remember, that I spent very different amounts of time per session; sometimes I just got one hour of work done and other times I sat for an entire day.

This will be a prediction and hence based on the data that I have so far. I decided to calculate 3 percentiles; 20%, 50% and 80% of the time recorded per date. And represent them as 3 lines on a chart.

<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vTwA_WwPjQ49vxdEDqHMfsdOpYoSgtzkQHBvSeEpRlAxTF07tJDxEg4cUpuwHo6xVF4HQmhrUkgrU9Z/pubchart?oid=746742999&amp;format=interactive"></iframe>
A percentile means that 20% (for example) of a set of data points are within this. 50% is the same thing as the median - half of the data is above that line and half below. Smack in the middle. And hence the 80% percentile indicates that 80% of the data falls underneath that line.

From these values we can make some predictions; At 20 October I predicted that

* with 80% certainty the next recording session I will make something that is from 0 - 2 hours
* with 50% between 0 and 1,5 h
* and with 20% between 0 and 1 h 10 mins

This is exactly what a prediction should entail; a percentage of certainty + a span of data. The higher the degree of certainty the bigger the span.

Notice that the gap between the lines gets wider, especially for the last data point. This has to do with the fact that I have some sessions where I really plowed on and got 2,5 h done, while others only gave me 17 minutes of finished material. Uncertainty - a funny thing.

But I digress from the topic at hand - let's continue. From this calculation, I could also calculate how long it would take to calculate all of it. I know knew, at each date, how long is the predicted total time and how much do I predict to record per session. From there it was quite a simple division to get the projected days to record.

I could have pressed on to and subtracted the days already recorded but refrained from that. This diagram is just showing how many sessions it will take to record all of the sessions.

Here's the resulting diagram:

<iframe width="600" height="371" seamless frameborder="0" scrolling="no" src="https://docs.google.com/spreadsheets/d/e/2PACX-1vTwA_WwPjQ49vxdEDqHMfsdOpYoSgtzkQHBvSeEpRlAxTF07tJDxEg4cUpuwHo6xVF4HQmhrUkgrU9Z/pubchart?oid=744965411&amp;format=interactive"></iframe>

Interesting enough the lines are flipped here; 80% is the lowest line. That had me perplexed at first but makes sense of course since I'm dividing the projected total time with 80% of recorded time (higher) and hence get a lower number.

So basically we need to flip the values for this prediction; the prediction that I've used the 80% data points of time recorded becomes the 20% prediction for how long this will take.

The meaning becomes something like;

> With 20% certainty this will take 0 to five days, using the best case scenarios of recorded time per day.

In reality, it took me ... 10 sessions to record this. Just BANG on the mark for the median.

**Lesson**: A prediction is a great way to express and handle uncertainty. A prediction has a span of data points (0 - 5 days) and a percentage (20% of the data falls in this range).

## Conclusion

This was one of the more well-defined projects that I've done in a long time; from both scope, content and how to run it. Still, as this post showed, there was a lot of uncertainty in this work and by taking a predicting approach I could handle this uncertainty and continuously get updates on how it works.

I had a lot of fun doing these dashboards and as always learned a lot in the process. I hope you picked that a thing or two too.