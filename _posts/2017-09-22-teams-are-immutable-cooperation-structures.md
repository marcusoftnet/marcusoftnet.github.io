---
layout: post
title: Teams are immutable structures
author: Marcus Hammarberg
date: 2017-09-22T14:27:56.000Z
tags:
  - Agile
  - Lean
  - Life of a consultant
  - Kanban
---

Sometimes in my consultancy the soft "people ware" thinking can borrow ideas from the harder "software" concepts. I want to relate such an idea that I cannot get out of my head:

> Teams are immutable structures

I found this very useful to describe some of the unique traits of a team, that is often hard to grasp; such as estimates cannot be compared between teams or that changing  teams around to opitmize resources utilization is sub-optimization in more ways than one.

But first, there's a strange word in there. Two, actually!

<!-- excerpt-end -->

## Strange words 1 - team

Because what does a **team** really mean. The [Webster definition](https://www.merriam-webster.com/dictionary/team) tells us

> a number of persons associated together in work or activity

The focus that stands out for me, in the way that I use the term *team*, is of course in the cooperation. It's not just a group of people sitting next to eachother. It's a group that works **together** solve the problem.

The reason we are a team, in the first place, is that we think that the task will be solved better, faster and more correctly than if we did it together. The sum of our efforts together is greater than our parts. It's in the interactions between us the extra value of us being together is created.

There are (many?) tasks that is better to do one by one - but we have chosen some to be addressed by a team, since it's better for the outcome of the tasks.

Quick comment; if we don't think that I think forcing people into a team to solve the problem is sub-optimizing the efforts of the team members. `1+1 = 1.74`. But that's at least a post of it's own.

## Strange words 2 - immutable

Ok, now the word that probably is a bit more unheard of; immutable. [Webster](https://www.merriam-webster.com/dictionary/immutable), again, tells us:

> not capable of or susceptible to change

Cannot be change, for us laymen.

This is a key trait of a whole class of programming langauges called [functional programming languages](https://en.wikipedia.org/wiki/Functional_programming?oldformat=true). that was dormant to the large community of developer from the 1950-ies (yes - some of the first programming langauges were functional in nature), but the last couple of years they have come into interest again.

They have a [strong constraint](http://www.marcusoft.net/2013/01/on-constraints.html) in that they only allow for immutable values and data structures. This means that once a value has been created in memory of the computer it cannot be changed. The only way to change the value is to make a new copy containing the change. It's something new. It's not the same value.

Although this first sounds very complicated it drives a structure and architecture of the programs that gives some great benefits. Because if the computer can assume that values will never be change it can help us to optimise the running of the program. For example we can very easy run parts of the program on parallell processors and thereby significantly speed up execution. This is very trick to do if you can change the values in a program at will.

This constraint and consequent benefit has led to great interest in functional programs as a mean to process big data. The team I'm working with is regular crunching through hundreds of TB of data in a few hours, in cluster of 50000 machines that share the work load. The programmer has not decided how to split up the program - it's done by the infrastructure, due to the constraint of immutable data structure. It's truly amazing to see in action.

## What about immutable teams?

Ok, that was all a backgrounder. My thought here is that a team is an immutable structure. And that is a good thing. Knowing this is helpful to understand and optimize the execution environment for teams.

Let's unpack that:

**A team is a immutable structure** - if you remove or add a new member to a team it's not the same team. It's a new team. They need to [storm, form and norm](https://www.wikiwand.com/en/Tuckman%27s_stages_of_group_development) all over again. It might be faster than if everyone is new but it still happens.

They don't reason the same about the same kind of problems. Removing the quitest person in the group will affect the group - as will removing the loudest. Adding a new visual person will make the team see new opportunities in new ways. Etc. etc. This is sometime the reason we change team constitutions, to shake it up.

But it's an immutable structure.

**This is a good thing** - there's power in immutable data structures, as we now know that we get something new as we change them. We can, as I wrote above, use this to shake things up if a team needs to - or to refrain to do so as teams need time to come together.

## Examples! Now!

As team starts to work together it's very easy for leadership to generalize and think that other teams works in the same way. But they do not. Because they are immutable - so one team is not the same as the other team. Even if you seed the new team with team members from the orginal team, or if you train them similary etc.

One common example is when asking a team to estimate the size of task, [if you still do stuff like that](http://www.marcusoft.net/2015/10/review-noestimates-the-book.html). Let's say that we ask the team to classify some work items into sizes of [S, M and L](http://www.marcusoft.net/2016/03/sml-estimates-dont-start-from-days.html) - relatively.

They do a great job and make some data based prognosis. Team Awesome crunches (on average, see my post above) 10 S, 4 M and 1 L per week.

Great, you think. I have 5 teams. That means 50 S, 20 M and 5 L work items per week. Ca. There's tools that does exactly this. Check our the [portfolio managment tool for JIRA](https://www.atlassian.com/software/jira/portfolio) for a horrible, but glaring example.

Because this is dead wrong. The teams are immutable. You cannot transfer one estimate from one team to another. What one team thinks is a S might be 5 S for another. And once you change one team member from one team - it is no longer the same team and that same team might now, if asked, re-estimate a S-task to M. Or S again.

It's not transferable - because it's not the same team.
I'm building a self-assessment survey for teams in my department of 20 teams. Teams will rank themselves on agile practices, using a [fist-of-five-voting](https://medium.com/101ideasforagileteams/fist-of-five-1dbaffa1e68d) technique. This will be tracked in radar chart to help the team to know where to focus their improvement efforts.

Great, someone said, now we can see how the entire department are doing, by summarizing the scores for each team. No - you cannot. Same misstake. Team assessments is not transferable to other teams. What one team thinks is a 3 might be the other teams 6.

And again, the same goes if you change team members in an existing team.
We sometimes ask ourselves if we should have fixed teams or throw together tasks forces for certain tasks. I think there might be value in both approaches, but as team are immutable structures and hence the speed, quality and ways of working that was great for one team might not work equally well as you change members (adding or removing a single member counts) in the team.

They, at the very least, need time to find their own ways and practices. Sure this can be helped (a little) with policies but the time is needed to let the (new) team form.
The best soccer player Sweden ever had is Zlatan Ibrahimovic. By a landslide. Something funny happened at the end of his career in the Swedish national team. The team had not had a great period, but Zlatan had still been amazing on the pictch when the rest of the team feed him the right balls to work on.

Then he quit. A brand new team arose. It was restructured to it's core and new leaders, new player and even new strategies was born out of neccesserity. The team started to win again - after loosing the best player in the world?!

It was a new team - they totally changed it. Because they change one player.

## Conclusion

A team is a group of people that work together to achieve a goal. It's an immutable structure, meaning that you cannot change a team. You can change team members, but then you have created a brand new team.

There's value in understanding this. I think.