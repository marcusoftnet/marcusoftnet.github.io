---
layout: post
title: Repost - Weighted index – a simple, powerful prioritization tool
author: Marcus Hammarberg
date: 2013-09-30 15:17:33
tags:
 - Agile
 - Lean
 - Tools
 - CodeBetter
 - Life of a consultant
---

### REPOST FROM CODEBETTER

I noticed that [CodeBetter](http://codebetter.com/marcushammarberg/) is slowing down. Maybe dying. I'm preserving [my post from there](http://codebetter.com/marcushammarberg/2013/09/30/weighted-index/), here to my site.

## Original post

> “What?! Don’t everyone know about this?”

There are some tools and practices that I use on a regular basis that have grown so familiar and accustom to me that I’m almost embarrassed to talk about them. Because I thought that everyone one did it this way. Not seldom it’s just like that too – it’s something that everyone knows and I end up being laughed at. I can take that, since the one person that didn’t hear about it before might have got something new that could help him. And, not to mention, I often end up learning myself in the process.

So… if you know about this practice (that I don’t know the name for, I call it Weighted index) or not; here we go. I’ll start with a story…

[UPDATED] In the comments I got notified that this might be a [Decision matrix](http://en.wikipedia.org/wiki/Decision_matrix) or even an simplified version of [Multi-criteria decision analysis (MCDA)](http://en.wikipedia.org/wiki/Multi-criteria_decision_analysis). Thanks [Harry McIntyre](http://codebetter.com/marcushammarberg/2013/09/30/weighted-index/#) for that link.

<a name='more'></a>

## My first encounter

When I worked for [big international consultancy] I was sent to a project that had gone bad. It was late December and they sent me and a Swedish colleague to meet up with an “American specialist” to try to help them come up with ways to save the project.

How bad, you ask? They were two weeks before delivery and they experienced some performance issue. The system would bulk under a 2 simultaneous users load. They were supposed to support hundreds. If not they got this in order… the fines was big enough to put the [big international consultancy] out of business, in that country. Luckily they didn’t tell us that until afterwards…

Oh yeah – we had three days. *This message will self-destruct in five seconds*

When we got there we met the “american specialist” (let’s call him Steve, since I think that was his name) and then had a 3 hour briefing about the system, the problem and the architecture. Steve then suggested that we brainstorm some alternatives. We ended up with 30. We had time to do one. Maybe two.

At this point Steve introduced us to a practice he often used. He simply listed all the items in a long, unordered row and then added three columns to the left of them, forming a little table like this one:

[![Initial table with measures](http://codebetter.com/marcushammarberg/files/2013/09/Screen-Shot-2013-09-30-at-09.13.57-.png)](http://codebetter.com/marcushammarberg/files/2013/09/Screen-Shot-2013-09-30-at-09.13.57-.png)

We then discussed our situation and decided that we should evaluate each alternative based on the impact we thought that the suggested measure would have for performance and the time it would take us to implement that. We wrote that above two of the columns and Score above the third.

[![Column names for aspects to evaluate](http://codebetter.com/marcushammarberg/files/2013/09/Screen-Shot-2013-09-30-at-09.14.04-.png)](http://codebetter.com/marcushammarberg/files/2013/09/Screen-Shot-2013-09-30-at-09.14.04-.png)

We then went through all of the measures from top to bottom and ranked them on Performance Impact on a scale 1-5. Steve then covered the “Performance Impact” column and we ranked the alternatives on “Quick to implement”, again using 1-5 as our scale. That produced the following table:

[![Table with ranked aspects](http://codebetter.com/marcushammarberg/files/2013/09/Screen-Shot-2013-09-30-at-09.14.17-.png)](http://codebetter.com/marcushammarberg/files/2013/09/Screen-Shot-2013-09-30-at-09.14.17-.png)We then calculated the Score (or weighted index) by multiplying them resulting in the following score.

[![Ranked, weighted and the winner announced](http://codebetter.com/marcushammarberg/files/2013/09/Screen-Shot-2013-09-30-at-09.27.31-.png)](http://codebetter.com/marcushammarberg/files/2013/09/Screen-Shot-2013-09-30-at-09.27.31-.png)

Yeah; Measure 4 was deemed the winner.
(If I remember correctly that had something to do with splitting larger COM dll-files into smaller ones. The large one was huge in fact, 16 mb, and wasn’t read into memory fast enough when several users were accessing the site.)

We recommended them to implement that measure (only one they had time for). It worked, the [big international consultancy] branch in the country was saved, we were an experience richer and the customer was happy. I remember being carried through the office on the shoulders of … no, wait. That was me dreaming. It all went well and I picked up a practice that I have used on numerous occasions from that moment. Thanks “Steve”.

## The tool and some tips

There’s not really much more to tell but here is the tool in short form:

- List your options in a column on a whiteboard (yes yes, that’s probably the hardest to work out but a nice [brainstorming](http://www.gogamestorm.com/?s=brainstorm)  session will help you with that)
- Now create a column for each of the aspect that you want to take into account. In the story above we had two (Performance impact and Quick to implement) but you can use as many you like. Make sure that you formulate them in a way that can be ranked.
- For each of the aspects rank your options on a suitable scale, 1-5 or 1-10 has worked in most cases for me.
- Use the same scale for all the aspects, so that 5 is the best in each column.
- It’s perfectly fine that two or more option rank the same on an aspect, but you could limit that too if you wanted and only allow one option per aspect. Then you probably need to add more values (1-100 for example).
- Only take one aspect into consideration, at the time, when you rank them. This can be done by covering the other values or maybe even move them to a spreadsheet and then scratch them out.
- Finally multiply the aspects rank for each option and write the product in a final total score column. This will give you the highest ranked option across all the aspects.

Some additional practices that I’ve used that have proven helpful some times are:

- Do this exercise in small groups and compare results. “Divide and merge” I think this is called and that’s a great way to both generate a lot of insights but also get a conversation started.
- Do this exercise in smaller groups and average out the result. This could be useful but should not be done without a discussion. Big discrepancies in your ranking probably show on different view on what the item really is and you better clear that out.
- Weight the aspects with a factor. In this way you can show how important you think that this aspect is to the overall result. If “Time to market” is of the essence you can give this a high factor, and have the other aspects ranked lower. This can be done by writing a factor above each column that you multiply the values by; the entire formula becomes ((value *factor)* (value *factor)* (…)).
- Take different aspects into consideration at different times. If you let your list live for a longer period of time you might not consider all the aspects all the time. I’ve just used this once and rather just recreate the list from the begining.

## My latest encounter

The last time I had great use for this tool was when we started to write [Kanban in Action](http://bit.ly/theKanbanBook). The first thing we did was to create a table of contents for the entire book and ended up with 220+ rows in the spreadsheet. In order to know where to put our effort we ranked each row by “Importance to understand the concept” and “Difficulty to write”.

This gave us a “where to really focus”-index. If something was both “Important” and “Difficult” we knew that it needed our best writing and focus.

[Joakim](http://joakimsunden.com/) (my co-author) and I ranked (from 1 to 10), all the rows by ourselves and then averaged out the result. We also had a couple of discussions where we was far from each other rankings. For rows where the value was close to 100 (10 * 10)  we also talked a lot about what and how to write it.

## Conclusion

This is a really simple tool – hey it doesn’t even have a proper name (to my knowledge). I call it *Weighted index* and it has helped me and my clients through a lot of quite hard prioritization decisions.

Have you used something similar? Am I stealing this from someone? Can it be improved in some way? I’d love to hear you comments below.
