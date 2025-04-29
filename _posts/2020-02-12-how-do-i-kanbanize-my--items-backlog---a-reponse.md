---
layout: post
title: "How do I kanbanize my 300 items backlog - a response"
author: "Marcus Hammarberg"
date: 2020-02-12 21:09:02
tags:
 - Kanban
 - Agile
 - Life of a consultant
---

I got a question, on twitter, the other week about how to handle a long list of backlog items on a kanban board. Here's the original tweet:

<blockquote class="twitter-tweet" data-partner="tweetdeck"><p lang="sv" dir="ltr">Hej <a href="https://twitter.com/marcusoftnet?ref_src=twsrc%5Etfw">@marcusoftnet</a>. Vi sitter med en backlog med 300+ o-organiserade och o-prioriterade stories som ska passera vår <a href="https://twitter.com/hashtag/Kanban?src=hash&amp;ref_src=twsrc%5Etfw">#Kanban</a> board närmaste 10 månaderna.<br>Hur kan vi &quot;gruppera&quot; stories för att förenkla refinement och beroenden mellan stories?<br>- under epics?<br>- funktionella områden?</p>&mdash; Tvivlarn (@MeChristensson) <a href="https://twitter.com/MeChristensson/status/1226486297008787456?ref_src=twsrc%5Etfw">February 9, 2020</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

And my adequate translation. The tweet by "The Doubter"

> Hey @marcusoftnet. We got a backlog of 300+ un-organized and un-prioritized stories that will pass through our #kanban board the coming 10 months. How can we "group"  stories to simplify refinement and dependencies between stories?
>
> -- by epics?
> -- functional areas?

I got his permission to respond here on the blog. It's a response and not an (and even less the) answer.

<!-- excerpt-end -->

### The disclaimers

Well obviously there will be a lot of things that I don't know about this context, so the answer will be given from the perspective of me only knowing what I understood from the tweet.

There are few things in the tweet that I find a bit strange and that I would talk about before doing a single thing:

* Un-prioritized? Why do this at all in that case? Is this the best way of spending valuable programming team time on *un-prioritized* items?
* 10 months? How could you (or someone else) know that? It sound to me that the whole thing is pretty hard to estimate. But it could also be a timebox which makes it a bit ... easier since that will then be a enabling constraint to help us prioritize

But I'm going to assume that it **has to be done** and there's a deadline of 10 months.

Finally I'm gonna assume that the team has the skills and abilities need to take these stories from their current state to production.

## The approach

In the question there are several questions hidden, but I'm gonna focus on two: what to do next (priority) and how to handle the dependencies between stories.

Also - there are a number of different approaches that we could take here and I will group my answer into 3 caricature levels of responses. The best approach would probably be a mix.

Let's talk about dependencies  first.

### Dependencies

We building products or supplying services I've found great use to always start to think from the viewpoint of the person that will benefit of the thing we are building. In the case of software development; features used by users is the goal.

From this I've always found it beneficial to have work items being grouped by feature rather than by function. I don't want to see a story about the backend development needed to get the list of products, or a ticket that talks about the styling of that same list. A user story should be what the user talks about - the value that they will get once this is done.

It's story time - to show you what I mean:

I once helped a team that was 5-6 backend developers and 2 app devs. The project had come to a slow down to a creep. What originally was conceived as a 6 months job had just come back from the board where they asked for budget for 9 months more. To release a MVP and not the full product as the original estimate was about

All the stories that was left were related to front-end development. There were two lanes on the kanban board; front-end and back-end. The backend:ers were done with their stuff - the lane was empty. Since some time. Stupid frontend:ers, they are good for nothing.

Well... turns out that they were not only slow (they were not) but every time that started a new function they were also requiring changes in the backend. A story like "FrontEnd: List accounts" always ended up creating a "BackEnd: correct API list account".  Stupid backend:ers - why didn't they do it right the first time?

You can hear how this was not going well.

The solution was very simple;

* we created one lane - for work
* work was defined as complete features. Instead of "FrontEnd List Account" and "BackEnd List Account" we called it "List account"

I think we too early go to HOW and break things up in tasks that are needed to create the completed feature. Or break it up by functionality; back-end, database, UX, front-end or what have you.

It's not done until all parts are done. To complete the work we all need to help each other.

In the words of Woody Zuill

> “Working Software” is software that users are actually using.
>
> Until it’s in use it is truly useless
>
> \- Woody zuill

Or in my words [When was Lars happy?](https://www.marcusoft.net/2019/09/when-was-lars-happy.html)

Shorter; I always found it more beneficially to group work by features, as viewed of the people that will use the feature.

Grouping it by feature has the added benefit of our work being more likely to put in front of an user earlier. This means faster feedback and hence also more learning.

## Priority - 3 levels

Let's tackle the question about priority. Let's play with the idea that all of those 300+ stories actually is perfectly described user stories that are oriented around features.

We can now take three different approaches:

### The Nihilist approach

> Well... apparently these 300+ user stories are supposed to be done. So in that case we just pick any old one and start and once it's done the next one. Until we are done or we are out of time. We have in essence a waterfall project dressed up as agile.
>
> Let's all go home. They will screw us over anyway. Life is futile in general. Goodbye.

I've been in more projects like these than I care to remember. You can notice if you're in one, by listening for a secret phrase:

> Well... the order doesn't really matter. **Nothing is done until everything is done**

That's a waterfall right there. We will not start to learn until everything is done.

This is not pre-historic things. Last time I heard the phrase said without a hint of irony was 2017. Autumn. Big Swedish food retailer e-commerce site.

### The Agile Ninja approach

Let's go the other other extreme and see what we find there: oh - the agile ninja. What does she suggest?

> Don't spending a lot of time thinking about what is the most important - just pick an important thing and start to do that. And throw the rest of the backlog out the window. If it is important it will come back.
>
> Once you the smallest possible thing that could help the user with something - put it in front of a user. Based on their feedback, decided what to do next. Until you have achieved the outcome, expressed in business terms.

Did you notice that it starts the same? But with two crucial details; we put something useable in front of an user, not when it's done but when we can learn from it. And what do we want to learn? What works, if it takes us closer to the business goal or if it move the business value needle in the right direction.

Come again? What was that?

Your stories doesn't have a business value attached to them?! Well, hehe ... you probably know what the agile ninja would say;

>You don't know why you are doing this?
>
>It sounds to me like you have a new priority no 1, my friend
>
>You really don't want to work hard without knowing why, no do you?

It actually not as easy to it ... should be. At first this seems strange, but in my experience it rare that you know the business value of the features that you are building. At least before until you met ...

### The pragmatic old consultant

> If the business value is not stated in the story the then story will have to prove some business value
>
> -- Old Pragmatic Consultant trying to sound wise by playing with words

The Pragmatic Old Consultant (or the POC for short ... and it's me, if you missed that) would suggest something like:

Yes, I agree with the Agile Ninja and suggest that we take smaller list of stories. Let's do 10, but select a few that we understand well. If there's no business value attached to them we suggest one. Here's a trick that I've found useful to discover the business value;

> For this story, JIRA-24362262245252 - remove the stupid CAPTCHA box from login, we will track  number of registrations per day as our success metric. It's 120 today, and if this goes well it should go up. If it goes bad is should go down.

You'd be surprised how fast you will get to know if you got that wrong:

> WHAT?! Registrations per day to go UP?! Are you crazy? We wanted it to go down for ... {rant continues and you get to know a lot about the intelligence of you and your entire family, as perceived by your coworkers}

To which you respond with zen-like silence, nod, takes notes and say thank you. You just got to know what the real business value was.

If you got it right you probably will not hear a thing. Which is good since it means that you got it right. You might also get the highest praise:

> Yes, of course that is what we want. What did you think?!

Which again means that you got it right.

Now start deliver some stories, start tracking your progress against the business value and always make a number of presenting that before you present flow metrics, in your recurring demos (you do do demos, right?).

Let the discussions about business metric guide you for what to take next from the backlog, by keeping an eye on the deadline too so that we don't miss it.

> OK - that was 1 out of 10 months. And we now spent it all on the login screen. Anything else that might be important?
>
> Heads up - 3 months to go. We should think about where we should put our best effort

## Delivery, the board, metrics and learning

All this talk about business value rather than caring about stories, splitting them in to functional sensible bits from the users perspective ... makes my programmer fingers hurt. Can we please start to work? What goes on the board?

I hear you, young padawan. Let's build our board - here's a few things I want you to do:

* Find a whiteboard or wall you can tape or draw on
  * Yes - I have heard about your JIRA system. But right now we're going old school information radiator which everyone can gather around and talk about.
  * Get pens and post-its too, while you're at it
* This board will go from left to right, as I'm a westerner. Let the first column be called **"Next 10 important items"**
  * Only allow for 10 items in there. Duh - it's in the name of the column.
  * Draw it (if you have a physical board), just a little bit to the left of the center of the board
  * For extra credits, draw a "let's call a meeting and ask for the next 5 items"-line in the middle of the column.
  * Fill it with 10 important items. Don't spend a lot of time find THE most important ones.
  * Don't put anything in there that the teams takes longer than 3 days to complete. If so - split it or find another story that is important and suitable sized
    * You can obviously have another value here... Like 3 weeks if that is better for you.
* Now create another column, broad a nice, to the left of the "Next 10 important"-column and call it **"Options"**
  * Put all the other stickers that you have done, or as you come up with them, in this column.
  * If that is 300+ items you want make much out of that so instead, you can group/aggregate them by feature. Or, if you dare, draw the [backlog as a mindmap](https://www.marcusoft.net/2016/06/backlog-and-features.html).
    * An impact map is a good idea to start with as it also naturally brings out conversations about the real impact and business value we want to create.
* All the way to the right of the board create the done-column but call it **"Learn", "Measure" or "Follow up"** or something like that.
  * Do NOT call it Done or Completed or something that sends the message that we are not that interested of it once it's out in production.
  * This will spark more frequent discussions about business value and how we should track it. People will get properly confused - it will be fun, I promise.
  * You can, if you want to put a work in process limit on this column too. It' will create a [pull for celebrations](https://www.marcusoft.net/2012/09/working-to-cake-limit.html)
* Finally put a WIP limit on the number of things that you are doing at the same time. There are some different ways to do that but my favorites are:
  * Never code alone - ensure that at least 2 people are always working on the tickets. This gets even more powerful now, if you don't have separate tasks but actually completed features
  * One less than us - have the work in process limit less than the number of people in the team, which will create an enabling constraint to force us to collaborate

Now - once this is done start to generate some data for your work. This will be used to make predictions on and forecasts. This is easily done by simply noting "start" and "end"-dates for the work items. You can write it on the card if you want.

For extra points also add a "Added to Next 10 column"-date. Armed with these simple data points you can actually get quite a lot of data and prognosis out. For free.

That is, it's free if someone took the time to create a ... funny that you should ask! Here you go - [my kanban metric google sheet dashboard creator](https://docs.google.com/spreadsheets/d/1lmlelcMdvo1SvQ0JZXraGYQxnZ5TNZ5qxUj5CapJn40/edit#gid=1896547007). You can have it for free (File -> Download a copy...)

![A scatter chart for lead time](https://www.marcusoft.net/img/FlowTimeScatterPlotPercentiles.png)

Here are the posts in a series describing this dashboard in detail:

* [Introduction post on how this simple dashboard works](https://www.marcusoft.net/2019/01/kanbanstats-simplify-process-stats-get-started.html). Then there's a whole array of post describing each metric, what it is, how to gather it and what you can read from it:
  * [Lead time](https://www.marcusoft.net/2019/01/kanbanstats-simplify-process-stats-get-started.html)
  * [Lead time with filters](https://www.marcusoft.net/2019/01/kanbanstats-ii-filter-the-process-chart.html)
  * [Throughput](https://www.marcusoft.net/2019/01/kanbanstats-iii-throughput.html)
  * [Where time is spent](https://www.marcusoft.net/2019/01/kanbanstats-where-is-time-spent.html)
  * [Single numbers - averages, median and max of lead time](https://www.marcusoft.net/2019/01/kanbanstats-v-single-numbers.html)
  * [Queue length](https://www.marcusoft.net/2019/01/kanbanstats-vi-queue-length.html)
* [Why and how you should use percentiles rather than average](https://www.marcusoft.net/2019/03/kanbanstats-an-average-improvement.html)

## Summary

This was, as always when I write, a bit too long but I hope that you found this useful, dear Tvivlarn.

And that if anyone else read this I hope it was useful and actionable for you too. Please fire any questions at me in the comments below.
