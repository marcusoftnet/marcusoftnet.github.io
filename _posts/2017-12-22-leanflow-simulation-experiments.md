---
layout: post
title: Lean/flow simulation experiments
author: Marcus Hammarberg
date: 2017-12-22T11:09:11.000Z
tags:
  - Agile
  - Lean
  - Kanban
  - Life of a consultant
---

When I do workshops on kanban/lean I ~~often~~ always include a game, since I think that adds to the experience of the principles I try to teach. One of my favourite is the Number Counting game that I, one **very** boring day did an animation of in PowerPoint. You can flip through it here:

<iframe src="//www.slideshare.net/slideshow/embed_code/key/2mgxDilfj0lg65" width="595" height="485" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe> <div style="margin-bottom:5px"> <strong> <a href="//www.slideshare.net/marcusoftnet/numbers-simulation-a-demonstration-of-lean-in-action" title="Numbers simulation - less is more!" target="_blank">Numbers simulation - less is more!</a> </strong> from <strong><a href="https://www.slideshare.net/marcusoftnet" target="_blank">Marcus Hammarberg</a></strong> </div>

This game very clearly illustrates the benefits of limiting work in process as the lead time for all the projects goes way down, as well as the lead time for each individual project. While quality often improves.

However, every time I've done this exercise I have to resist the urge to throw in a couple of curve balls and changes. I resist it because I think it would be quite hard work and stressful. Now I've tested them on myself and I wanted to share the outcomes with you.

<!-- excerpt-end -->

## Original game - my score

The game is about completing three columns with letters and numbers as fast as possible. The columns are (A-J, roman number I-X and 1-10). The trick is that you are doing them row-by-row (all at once) in the first round. This has a devastating effect on the lead time of course since you are mostly switching pens. Not only that but the most important project (A-J, as I introduce the game), is severely punished in lead time.

Here is my result:

<img alt="My result of the game doing all three project at once" src="/img/orignalrun.png" width="100%" />

As you can see I spent 1 minute and 16 seconds completing it. And the first project took 1.12, just because I did 3 projects at the same time. Typically a second round (did do one sadly)  would see numbers like 34 seconds in total and about 9-15 seconds per project.

I often make a big case for the facts that:

* The same amount of work has been done
* By the same worker
* Using the same pens
* On the same board

It 1/3 of the time. And the *magic* that has achieved this is the fact that we have limited work in process to 1 project at the same time. Or put differently: focus on flow of value over resource utilization.

## Variation 1 - outsourcing blue pen

One variation that I often wanted to try, especially in companies where resource efficiency is held as the most important thing is to outsource one pen. This kind of organization is very common in Sweden, at least and you can hear things like this being spoken in the corridor:

> Ah, you are working 40% on the A-J project. Awesome then I need you 20% in Roman Numbers project and then you can spread yourself evenly between 1-10 project and maintenance of A-J project. Ok?

No! It's stupid because you will first of all slow things down (see original run above) but secondly you will create of waiting states since now everyone is very busy.

Although it has not specifically to do with outsourcing, I thought that could be used to illustrate the problem. Outsourcing is, in my experience, mostly done to optimise utilization of peoples time - not to increase the flow of the value.

I thought that one way of illustrating/simulating this situation was to put the Blue pen on a table, just a few feet away. Now you have to go over there to get it, and then leave it there every time you need it. Imagine that this is someone you need to get from another room. In our simulation, the Blue pen is always ready to be used, and the delay is just the walking over there to get it.

Here's my result in this blue-outsourced-scenario, when doing all three projects at once, row-by-row:

<img alt="My result of the game doing all three project at once, with blue pen outsourced" src="/img/WIP3OutsourcedBlue.png" width="100%" />

Yes, I suffered. About 16 slower, which is lost by me getting the Blue pen. Also, note that this penalty is given to all projects, although it's only the Blue pen that is slowing me down. This is because

1. I'm working on 3 projects at once. Yes, this is one of those "All things need to be completed before any value is created, you can do them in any order you want. I just want to see the end result. Stop bothering me"-kind of projects. And [Yes, that is always the wrong way to do projects](http://www.marcusoft.net/2017/11/no-waterfall-is-not-sometimes-correct-it-is-always-wrong.html). In any kind of business, any setting. We have just not discovered better ways yet.
2. We have decided to organize so that the Blue pen is optimised in use, over the value for all projects. Again, the Blue pen in our simulation is not doing anything when I don't need it but the delay is shown to me just having to go over there and get it. Imagine that you had someone else using the Blue pen in between and I'll have to wait for it to be done before I can use it…

But let's try to minimise WIP and see how it turns out. Here's my result with WIP of 1 (column-by-column) with the Blue Pen outsourced:

<img alt="My result of the game doing all three project at once, with blue pen outsourced" src="/img/WIP1OutsourcedBlue.png" width="100%" />

Ooooh - shiny! That's much better, unsurprisingly.

- All projects now takes 27 seconds to complete (compared to 1 minute 32 seconds before)
- First project completed after 8 seconds (1 minute 28 seconds before)
- Second took 11 seconds to do, with a total lead time of 18 seconds (1 minute 30 seconds)
- The third project took 9 seconds with a total lead time of 27 seconds (1.32 before)

Well, that was not too strange, since I had to get the Blue pen only once, compared to 10 times before. But there are a few interesting points of reflection here:

The other projects are not punished by the extra delay in me getting the pen every row. Now that penalty had to be paid only once for the entire game. Imagine that I introduce a 10-second delay each time I have to get the Blue pen. Now that would hurt us horribly in the first version (WIP = 3 projects) but not be any penalty for the first two projects in the second run. And the penalty would not be that horrible even for the Blue Pen column, even in the last run of the game.

Secondly, we get more opportunities to pick the most important thing to do 3 times, as compared to only once in the first round (before start, after completing A-J and after completing Roman numbers). That is called Business Agility, if I'm not mistaken. It will be huge.

## Variation 2 - Adding more projects

Another thing that I always wanted to try but never dared to do, is to interrupt half-way through and throw in a new project. This project is of course very urgent too, but they need to continue to work on all the other projects too. Everything is most important! If you ever experienced that situation.

In the simulation I had my friend Mattias Livré, adding a project at the half-way point. We had discussed what it was before we started, but still, it messed things up considerably for me. The project was that Mattias wanted me to write a new column 10-1 using a black pen. And continue to work on the other projects.

Heres my result:

<img alt="My result of the game doing all three project at once, adding a new project half-way through" src="/img/AddedProjectAfterHalfTime.png" width="100%" />

Actually not too bad… But it sure messed things up for my head. By **far** the most challenging and stressful of the variants I tested. Also, there are some interesting things to notice about the result

First of all the times went up, for all projects, compared to the original run (1.12, 1.14, 1.16). Secondly, all projects got punished for me adding extra work in process in the form of this new project. Thirdly the end times of the projects show that although I got this last urgent project thrown in at the end, it actually had to wait considerably (about 45 seconds I would guess) before it was completed, just because I was doing 3 other projects simultaneously.

Now consider this variation with me doing only one project at the same time (column-by-column). I sadly didn't have time to try this, but let's play with the idea. After 1, 5 complete columns Mattias would hand me a new project. He would state that it was as urgent as the rest. But now I have one completed (after about 8 seconds). The very natural thing to do for both me and Mattias would actually be to ...

[halting for personal reflection on suggested action here]

Stop and ask ourselves if we would rather finish the Roman Numbers project and then pick up the Black or the Blue project next. Or possibly just drop the Roman Number project and just head onto the Black 10-1 project straight away.

Point being: we naturally get a chance to choose and it's natural because we have already finished one project already. It's in parts already. We have already delivered some value and now (or at least soon, VI-X is left) will finish another one. In short: we have more points in time to choose.

When I ran all three projects at the same time I had 3 half-finished projects at this time. It is not natural nor beneficial to ask yourself if you should halt all three unfinished projects and then start a new one at that point. No value has been created. There's no opportunity to redecide - that is done once, at the beginning of all three projects.

## Summary

I found these simple variations very interesting and they sure raised a lot of questions for me and Mattias. It shows, in its simplicity, on the problems of doing many (3!) things at the same time and the benefits of putting a limit on that number.

Doing so will help you to ask powerful questions, and to focus on flow of value.
