---
layout: post
title: "Jidoka - an old Toyota practice makes an guest appearance"
author: "Marcus Hammarberg"
date: 2016-06-04 20:59:58
tags:
 - Agile
 - Lean
 - Life of a consultant
 - Kanban
---

When I started to learn about lean I naturally heard a lot of Toyota stories - it's pretty inevitable since the whole thinking comes from there. One thing that I learned about was translated as [autonomation](https://en.wikipedia.org/wiki/Autonomation). I was pretty sure it was a mistranslation.

But the other week when one of my team members said:

> What's the big deal of many things going on? If I'm blocked on a few items I can equally well just start a few more.

(Not his exact words but still those lines of reasoning)

At that point I saw the time to implement some *jidoka* (as automation is called in Japanese) in our project

<!-- excerpt-end -->

## What is this "jidoka"-thing really?

Ok, there's an excellent article about [autonomation](https://en.wikipedia.org/wiki/Autonomation) on Wikipedia so I'll just summaries it here. The jidoka concept is at the heart of continuous improvements at the Toyota.

When a machine detects a problem the machine stops the production, signals to a worker that a problems occurred so that it can be fixed. The idea is that:

> "the decision to stop and fix problems as they occur rather than pushing them down the line to be resolved later"
>
> Jeffrey Liker and David Meier

The example I've heard was from the time when Toyota was producing fabric. Their automatic loom machines had a feature that if a thread would break the machine would stop and then raise a little flag.

That it stop meant that no faulty fabric was produced. A human could then go down there and fix the problem and restart the machine. Minimising the waste of faulty fabric.

There's stories about Toyota workers and machines stopping the line, like this, many times a day while flushing out problems and waste. To try to end up in a non-wasteful, just-in-time, continuous flow of value.

## But that's machines… how does it translate to IT?

In IT most of the work is soft - hence the word software. Most of the work we do take place in our brains and the things that often slows us down are the context and conditions we are working under. Like for example organisation and process conditions.

This means that we, in the same way as the loom above, can become blocked. Maybe we can't contact the people we need to get information, or we lack privileges to read/move files, or we have to wait for someone that is engaged in another project before we can move on. You can probably come up with many more.

Very few of us at this time just put our feet up, stop working and go:

> Well - I'm blocked.

No, instead we want to be busy, so we quite naturally start some new work. (Hopefully and most commonly we investigate some ways around the problem of course).

Now that's not very good. It increases work in process and with that comes increase in context switching, complexity and unevenness in our flow. Now we have two (or more) things going on which we need to juggle in our heads, coordinate with people around us and, if it drags out, report progress on.

It would of course be better to try to solve the problem that blocked you. Preferably also stop and think about how you can make sure that this problem never comes back to block you (or any other) again.

At the very least we should think hard before *increasing* work in process. This "not-busy" time that has arisen is called slack. It occurs naturally in most processes and should not be viewed as something bad. In fact slack is the mother of innovation and process improvements - let's use the opportunity.

> Without slack there cannot be improvements.
>
> [Dr. Arne Roock](http://twitter.com/arneroock)

Goes without saying that only slack is of course not good, but with a little slack in the system we have created room for innovation. Fully utilised means no time to think:

> Busy-ness is not good for business
>
> [Woody Zuill](https://twitter.com/woodyzuill)


## How did you implement it, then?

When I had the discussion I mentioned in the beginning, with my coworker I saw an opportunity to implement the flags from the Toyota loom for real. And we did. And it helped us. A little at least.

We are running 4-5 teams with ca 40 people in total in one big area. I wrote an email with the instructions for what to do when you are blocked. Here's what I wrote, with some comments I've added now to explain the reasoning behind the idea:

1. Stop your work and get a flag from Marcus desk. Attach it to your screen. If you know who can help you to become unblock - go over there and ask them.
   By doing this we now easily can see that who is blocked. This promotes other to ask what the problem is and help out. It's also a transparent act since we are open with the fact that we are now blocked.
   A secondary benefit is that you need to declare, for those who ask you, what the blockage is about. Anyone that tried [rubber duck debugging](http://www.rubberduckdebugging.com/) knows that this act alone can help you find a solution to your problem.

   I bought a pack of Swedish flags (only flags I could find at the time, sorry motherland) and put them in a central location in the team area.

2. Look around and see if there's other flags up. If so go over there and ask if you can help them to resolve the blockage.
   By doing this we increase transparency and working to help each-other to become unstuck. We've also noticed that it increase learning and understanding in the team.

3. If you still have nothing to do - ask your team if you can help anyone with their work. Or if they can help you to become unblocked.
   By doing this we are focusing on finishing work rather than to start new work. "Stop starting - start finishing" as the famous kanban war-cry goes. This simple act also promotes cooperation and teamwork to move our work ahead.

4. If you can't do that either, you now have slack time; do something that you think can help us work smoother in the future. Make sure that you don't take on too much work - so that you can't go back to your original task once you are unstuck.
   This means that we use the slack to innovate and improve rather than to see it as something bad. In this step you can of course consider to take on new work, in accordance to any agreed on policies, but I'd rather use slack for innovation.


(This list was heavily inspired by [David Joyce](https://leanandkanban.wordpress.com/about/) and we have a section (7.4) on it in [Kanban In Action](http://bit.ly/theKanbanBook))

Here's a picture from a day last week when two people were blocked. The pack of the rest of the flags are shown in the foreground.

![Two people blocked](/img/twoJidokaFlagsUp.png)

### Any results you'd like to share?

This is pretty new in our team so far, but we've seen:

* More interaction and people trying to resolve the situation. Every time a flag goes up (4 so far) I've seen at least 4-5 people go over to the desk and ask about the problem, suggesting solutions and trying to help out.
* Better knowledge and spread of blockage that occur - goes without saying really but is very beneficial in the long run.
* Less work in process - where it before was natural to "just start a new thing" we now actually keep our WIP-limits. Better.

It's at least interesting enough to keep it going for some time more. I have high hopes that we can root out some inherit problems to our process pretty fast.