---
layout: post
title: "KanbanStats - an average improvement"
author: "Marcus Hammarberg"
date: 2019-03-25 12:41:24
tags:

  - Agile

  - Kanban
 - Lean
---

Reading books is awesome - because it changes how you see and think about the world. I'm an avid reader and a non-recovering learn-o-holic.

I read a great book the other week - [When Will It Be Done](https://leanpub.com/whenwillitbedone) by [Dan Vacanti](https://twitter.com/danvacanti) and it changed how I saw the world a bit. I wrote a whole array of [blog posts on process metrics](http://www.marcusoft.net/2019/01/kanbanstats-simplify-process-stats-get-started.html) and now Mr Vacanti threw some of it on its head.

Not that much when you think about it, but enough for me to want to correct myself with this new knowledge.

It all has to do with averages...

<!-- excerpt-end -->

## What I got wrong

In his book, Dan Vacanti is actually referring to another book called "[The Flaw of Averages](https://www.amazon.com/Flaw-Averages-Underestimate-Risk-Uncertainty-ebook/dp/B0096CT4VY)" by Sam L. Savage. I have not read that yet, but the gist of it is: average is a pretty misleading fact that doesn't (properly) take into account outliers and the distribution of data in a good way.

Two sayings that are too good to leave out shows what the problem is:

> If Bill Gates walks into a bar - everyone in the bar is, on average, a millionaire

> Never cross a river that is, on average, 4 feet deep.

In the When Will It Be Done book Mr Vacanti even has a whole chapter called "Don't ever forecast using averages".

All of this new knowledge amounts a bit of an embarrassing situation for me, as much of the data I suggested (especially around lead time) is using, or is entirely based on averages.

But hey - learning is learning and now I want to redeem myself and do something better.

In this blog post, I will instead show you a better (and much simpler) way to show data that helps you forecast (not estimate mind you) *when it will be done*.



Also, Mr Vacanti solved a thing that I always end up arguing about. What if something starts and stop on the same day? How long is that? Well… 1 day of course. But if you do a date-diff function it will be 0 days. Hence we should always add one day to the result of the date-diff function.



I also learned a thing or two about the all-powerful [QUERY](https://support.google.com/docs/answer/3093343?hl=en&authuser=0)-function of Google Sheet that we will make use of in this post. All by myself. No help needed!

## What I got right

One of the first things where the book made me happy was where it said that the only two data points you really need to get all the forecasting power you'll need are: when it entered your workflow and when it left your workflow. Created and Closed date - in other words.

You can, of course, decorate with even more data (like enter/leave date per stage in the workflow) but that is just to get more granular data. Also, adding the type of work, tags and project ids increases the filtering capabilities but is strictly speaking not needed.

Also, I based my sheets, graphs and charts on the idea that you should be able to just dump the data from an electronic tool (or update it by hand) in one place and the rest should be handled automatically.

Which is the same basic idea that Actional Agile tools are running from? That tool is much more elaborate than what I'm doing here, but this will get you started.

## When will one item be done?

Let's update the charts for lead time (that Mr Vacanti calls cycle time, I've also heard flow time and I'm using that in this post… chose your poison).

Here's [my new sheet](https://docs.google.com/spreadsheets/d/1lmlelcMdvo1SvQ0JZXraGYQxnZ5TNZ5qxUj5CapJn40/edit?usp=sharing), I've left the old one available for your gloating need.

There's still a "Raw data"-tab where the export from a tool can be poured. Or you just keep updating it by hand from your physical board. You only need the created and completed date per ticket.

Now I can "easily" grab all of that data and do the lead time calculations using the [QUERY](https://support.google.com/docs/answer/3093343?hl=en&authuser=0)-function like this:

```
=QUERY('Raw data'!A:H, "SELECT A, dateDiff(H, G) + 1, toDate(H) WHERE H IS NOT NULL ORDER BY H LABEL dateDiff(H, G) + 1 'Flow time', toDate(H) 'Date closed' ")
```

This looks hairy but is really quite simple:

* I'm getting the data from the Raw data-tab, columns A:H (all of it)
* But I'm selecting only A (the ID of the ticket) and the dates I'm interested in
  * For the flow date (lead time) I'm applying that knowledge to add 1 to the result (`dateDiff(H, G) + 1`)
* And to get nice heading over each column I'm using the `LABEL` feature of the QUERY language.
  * Notice that the expression needs to be exactly the same as it stood in the SELECT-clause. `LABEL dateDiff(H, G) + 1 'Flow time'` for example

Cool - that means that we now calculate the flow time and closed date per item automatically. More so, as the dataset grows with new lines it will automatically be picked up by the query and added to the end. No need to remember to append new rows of formulas… yet.



The month closed is calculated by just appending the parts of the date together. I've also included a check for no data so that I can have a formula for rows where the QUERY will add rows later:

```
=IF(C2<>"", YEAR(C2) & "-" & IF(MONTH(C2)<10,"0"&MONTH(C2),MONTH(C2)), "")
```



Now for the new learning. Rather than using averages and the standard deviations, Mr Vacanti suggests using percentiles. At the 50%-percentile we know that 50% of the data is below this point and 50% above it. At the 85%-percentile we rather know that 85% of the data is below that point in data.

This is very useful information for someone that wants to make a forecast because now we can say something like this:

> Based on the data we have now, a ticket will take up 28 days, with 85% certainty. With 95% certainty, it will take 51 days.

Pretty good, huh? And it follows the good practice of a forecast: a span and a certainty. 0-28 days, with 85% certainty. Based on the data we have now...

And even better - supersimple to calculate:

```
=IF(B2<>"", PERCENTILE(B:B, 0.5), "")
```

That is:

* If B2 has data (the flow time calculated by our QUERY)
  * then just use the PERCENTILE-function to calculate the `0.5` or 50% percentile

I even created a header containing this information:

```
="50% (" &E2 & " days)"
```

Now we can create a beautiful scatter plot diagram that looks like this:

<img src="/img/FlowTimeScatterPlotPercentiles.png" style="width:50%" />

I had to do some chart hacking to get this to work:

* It's based on a "Smooth line chart" containing all the information needed
* To make the flow time into scatter dots I set the point size for each data point to 7px and set the line thickness to 0px
* Notice that the heading that we created now makes sense in the legend where we can see the number of days for each percentile

### A new diagram - histogram for flow time

In the When Will It Be Done book, Mr Vacanti put me onto a new type of diagram, a histogram for flow time. It's basically just plotting out how many items has a certain lead time (in groups).

Easier to talk about if you've seen it:

<img src="/img/HistorgramFlowTime.png" style="width:50%" />

A few things to note here:

This curve that you see - it's like that for most knowledge work. It's not a normal, bell-curve distribution of flow time data. This is yet another thing to notice about how hard it is to estimate (before you start) knowledge work.

Most things go pretty fast, and a small selected few take a very long time to complete. You will not know on beforehand which is which. You can try to break them down into smaller *right-sized* pieces will make your errors smaller but it will still follow this curve.

Second, if the charts in Google Sheet were better we could have plotted in the percentiles in this chart too. It would have been a nice vertical line for the 50%-percentile just at the start of the second bar and another for the 85%-line at the fourth bar. This would have emphasized the problem with averages and the benefits of using percentiles even more.

## When will the complete backlog be done

This is a big aha-moment for me. Because taking the average flow time and multiplying it with the number of items in the backlog feels … dirty now.

There are ways, but its way beyond the scope of this post and my Google Sheet skills. The way to do this is to run a [Monte Carlo simulation](https://en.wikipedia.org/wiki/Monte_Carlo_method) which basically simulates many (MANY 10k, 20k simulations for example) potential outcomes, based on the data you supply to the simulation.

I understand it like this: the data you have now is just one outcome based on theoretical never-ending. What if we played out 10000 potential futures based on data we have today.

It then gives you a forecasted percentage and ends up in you being able to say:

> With 80% certainty 50 items will take between 20 and 54 days to complete

This is awesome but not something that I've tried to accomplish here.

## The rest of the diagrams

I have not changed a lot about the rest of the diagram, but I have refrained from using averages.

This is just from the top of my head, but since throughput is tracking the number of completed items we wanted the percentile to be opposite. If we with 95% certainty want to say how many items we complete per Month, for example, we need to get the 5% percentile. I think.

Now my throughput reporting looks like this:

```
                        Total    S    M    L
50% percentile / month    29        15    5    9
85% percentile / month    13        9    1    2
95% percentile / month    6        4    0    1
50% percentile / week    11        6    2    2
85% percentile / week    2        0    0    1
95% percentile / week    1        0    0    0
```

Which means that we could now say stuff like:

> Based on the current data the team will complete at least 29 items per month, with 50% certainty
>
> With 85% certainty we will complete 13 items or less. 9 small.

There no data for some of these numbers to be complete, for example, the 5%-percentile of the weekly throughput is 0… which feels ominous but is probably correct, based on the data.

### New charts

I've added a very simple Blockers-tracker. It tracks how much time, of the total flow time that an item spent blocked. I don't mention this much here because this is some data that is not easily obtainable… relatively speaking.

You need to track how many days each item has been blocked or not, so it's not hard by any stretch but can be cumbersome. I use dots on the stickies and just count those at the end.

It produces a chart that looks like this

<img src="/img/TimeSpentInBlockagePerItem.png" style="width:50%" />

This is a very useful thing to do a root cause analysis to solve real flow problems.

## Summary

I [hope this sheet](https://docs.google.com/spreadsheets/d/1lmlelcMdvo1SvQ0JZXraGYQxnZ5TNZ5qxUj5CapJn40/edit#gid=1896547007) can be useful to you. If you want to make changes, make a copy to your own Google drive and go crazy. Please let me know if you fix any fatal flaws in it.

Stop using averages. Use percentiles instead.

Stop estimating. Forecast based on data instead. Update the forecasts as you get more data.

