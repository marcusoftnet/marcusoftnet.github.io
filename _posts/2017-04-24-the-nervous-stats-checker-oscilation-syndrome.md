---
layout: post
title: The nervous stats checker oscillating syndrome
author: Marcus Hammarberg
date: 2017-04-24T10:48:51.000Z
tags:
  - Agile
  - Lean
  - Tools
  - Life of a consultant
---

I had a colleague on one of my gigs many years ago, let's call him Olle (since that was his name). Olle just got a blood pressure meter for Christmas. He was around 45, at the time, and in reasonably good health, according to himself. But he was one of those guys that "had everything" and someone got him this machine. Mostly for fun.

Now, as he as a gadget geek he loved this new toy and of course started to use it. And he kept records in Excel. A few weeks after he started to track his health, to his horror he saw that he was getting worse by the day he measured.

Now, at the time when he told me this, he just started to measure 3-4 times a day and the result were not promising; his blood pressure was through the roof.

He had a doctors appointment later that afternoon to get proper medication.

I think I'm becoming Olle. And it's [JIRAs](https://www.atlassian.com/software/jira) fault. And mine own. Mostly my own.

<!-- excerpt-end -->

Just like Olle and his blood pressure meter JIRA can give me any statistics I need, and many of the ones that I don't need, updated in real-time. We could even, and should maybe, display these metrics on big screens next to the team affected by the metric.

* The WIP limit is up by one? **BAM** - there! Column is shining up red!
* Trend of created / resolved tickets not promising? Shown immediately on our dashboard. I set it to be updated every 15 minutes. So that we don't miss anything.
* Someone hogging more than 2 items on our board? Use the Issue statistics gadget and tweak it to group by assignee. Power at your fingertips!
* I even have created an elaborate system of exports and imports that creates summaries per sprint and then summaries all sprints. In near-real-time! It took me weeks to do.

## Olle's health

Let's revisit Olle again. He came back from the doctors appointment later that day. He still was in reasonable health, as before.

As he nervously entered the office, the doctor looked calmly at him and simply asked:

> Do you feel sick?

The answer was of course that he didn't but since he started to measure the blood pressure. Frequently. And then it dawned on Olle; he's frequently measuring his blood pressure was actually stressing him and that made his blood pressure go up.

Apparently, according to the doctor, this was not uncommon as the "measure your blood pressure at home"-devices became more common on the market.

People, quite simply, measured too often. That gave an oscillating result (just after you walk up a stair the pressure is up, when you wake up it's down etc) which in turn creates stress, which in turn increase the blood pressure.

Olle was fine and returned the blood pressure meter. He would check up his health with his doctor from time to time. And when he *felt* bad.

## Conclusion

I have forced stress upon my team, by watching the metrics and getting worried as I see key metrics go up and down several times a day.

That is natural variation. It's supposed to be like that.

However if the trend over time (we have been above our WIP for 4 weeks running, for example) is moving towards an undesirable state we should have a discussion.

A good place to start is to check this in our retrospectives. A regular cadenced check-up of the team health.

But even better is to see how the team is doing, by asking them. Do you feel ok with the current state of things?

Note to self:

> Just because you can measure a metric every second doesn't mean that you will learn more from it.
>
> A hunch of our current state goes a long way. Back the hunch up with data
