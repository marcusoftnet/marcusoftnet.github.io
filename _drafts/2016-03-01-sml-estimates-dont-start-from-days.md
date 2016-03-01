---
layout: post
title: "S, M, L estimate should not be a date span"
author: "Marcus Hammarberg"
date: 2016-03-01
tags:
 - Agile
 - Lean
 - Life of a consultant
---

Many teams I visit nowadays have ditched story points and start to use S, M and L estimation instead. I like that. 

But very often a smell is creeping into the estimation, removing the "relative" out of "relative estimation". 

Here's how this sickness will reveal itself: 

<blockquote>Ok - so a S is 1-2 days, M 3-5 and L 5-10 then or what's the scale?</blockquote>

Don't do that - it's the wrong way around. In this post I'll explain why and what is a better, more trustworthy, candid and transparent approach. 

<a name='more'></a>

# Why attaching day-span to the estimate is bad
Well, it's quite obvious isn't it; doing that (S = 1-2 days) is just giving "1-2" days another name. From that follows "resource-days", then Gantt Schemes and the suffering that we all know of. 

S, M, L is intended to communicate the uncertainty and that we uncover things as we go, while still giving some kind of size to the items. Funnily enough so ware story points, but it's easier to misuse since they are numbers. 

S, M, L are in themselves uncertain since we all know that two t-shirts that are S are just roughly the same size. Attaching day-spans to them before you estimate is destroying this. 

# What should we do then, Mr Smartypants? 
Quite simply: don't estimate the size - base it off data instead. It requires a few very simple steps. 

## Classification into S, M and L
One of the simplest exercises I know about estimating in S, M and L is an exercise we in [Kanban in Action](http://bit.ly/theKanbanBook) called "a line of cards". It's quick, simple and good enough. 

Here's what you do: 
1. Pick an item from your backlog and write it on a sticky and place it in the middle of a table
2. Pick another and ask the team: "Is this bigger or smaller?"
    1. if bigger put it above
    2. if smaller put below
3. Take another item and ask the same question, placing it in the correct spot in the line; below things that its smaller than - above stuff it's bigger than
4. Continue until you run out of cards, or when it feels suitable (for example next release or sprint)

Now you have a long line of cards order by their relative size. The biggest is on top, the smallest in the bottom. Now go through the line and call the bottom third Small, the middle part Medium and the top third part Large. 

## Track lead time
The second part is super simple, when you start to work with the item (when you put it on your board, for example) write the current date on the sticky. Once it's deployed (or you take it off the board), note that date and start to track it in an Excel file or something. 

Pretty soon you will have some data like this: 

| Size  | Start date | End date | Lead time |
| :------  | :-------- | :-------- | :------ |
| S |  2016-01-04 |  2016-01-05 | 1 |
| M |  2016-01-08 |  2016-01-10 | 2 |
| S |  2016-01-05 |  2016-01-08 | 3 |
| S |  2016-01-02 |  2016-01-04 | 2 |
| M |  2016-01-05 |  2016-01-09 | 4 |
| L |  2016-01-01 |  2016-02-01 | 31 |

## Data-based prognosis
This means that now you make something much better than an estimate. Because now you can say this: 

<blockquote>From what we've learned so far our S takes 1-3 days, M 2-4 days and L 31 days. We know this because we have done 3 Small, 2 Medium and 1 Large</blockquote>

This is much more trustworthy and candid than to give an estimate, prediction of the future. There's a few questions that might be asked at this point: 


