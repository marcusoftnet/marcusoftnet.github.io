---
layout: post
title: "Experience report: first week of 2 x 5 mobs going remote"
author: "Marcus Hammarberg"
date: 2020-03-21 12:11:23
tags:
 - Agile
 - Programming
---

I've just experienced something fantastic and a real testament to what amazing people can do when given the room to be amazing (and have an apparent and real reason to do so)

A week back, our accelerated career program; [School of Applied Technology - the world's toughest coding bootcamp](https://salt.dev/) were running five mob programming teams (that we call mobs) in two locations. [This is how we teach](https://www.youtube.com/watch?v=iTAHCVwYvQs) and it has given us amazing results so far. 

But it's not cool being the "let's sit as close together as possible for 8 h per day"-teacher in times of Covid-19 infection spreading across the world. 

So in the middle of last week we started to make plans. Last Friday we had a “just in case”-lecture on tooling for our 5 Amsterdam mobs. Then during the weekend, things escalated in Sweden and we decided to move over the 5 Stockholm mobs as well (yes, without training them). Monday, 6 days ago as I write this, we had moved everyone into our remote-only platform. 

And you know what? Just about everyone found it not only useable but actually very useful and, in some reports, even better than before.

In this blog post, I wanted to share our suggested platform setup and some findings that our mobs shared in our weekly retrospective/demo session last Friday.

And before I write a word more: this was not my doing. It was the amazing instructor team of Salt (Mies, Zach, Daniel, Levy, and Adam) setting the stage and then the brilliant developers of Salt building their own applied practices on top of that. Yes - just about every mob did it differently and I loved it.

<a name='more'></a>

## Tooling

### Slack - Communication across mobs

We were already using Slack for all written communication in the course and we didn't change that during this week. `Shrink the change` is a great tip for sticky change that I picked up in the [amazing book Switch](https://www.amazon.com/Switch-Change-Things-When-Hard/dp/0385528752) and keeping Slack around was a good example for that. 

### Mobbing with Discord

What we did add was a tool used by (mainly?) gamers; [Discord](https://discordapp.com/). It's an app to communicate over text and voice, but also allows you to easily share your screen. I knew nothing about this tool as we started this week but it's quite simple to set up and even the free version works pretty well - we paid for upgrades as we have some special demands. 

Creating a Discord server is literary literally as simple as clicking a `+`-button and naming your server. You can then invite people to the server to start to interact with each other. You can create roles and permissions (we have done this, thanks to our instructor Zach that had a lot of knowledge) - but you can also do this later if you want. 

Discord is organized around the concept of channels - you can think about these as rooms. They come in two types; text and voice. Text channels are just about the same as Slack and we have used that to take questions during screen sharing lecture, sharing text stuff (code) within the mobs, etc. 

Voice channels are a bit more interesting and can be thought of as "an always-on multipart phone call". You can only "be" in one room at the time and everyone that is in that room can hear what you say. In the voice channel room, you can easily share your screen (or a window) by the flick of a button

We have created a channel per mob and this is where the biggest part of the work happens. Here's how a round goes down:

* Hadla is the driver and shares her screen so that everyone can see.
  * Everyone is on unmute and speaks freely, as you would during a normal session where you seated next to each other
  * Some mobs muted the driver to work on their communication skills
* When the time is up for Hadla, she unshares her screen and the next person Rickard shares his screen
  * Many mobs are using tools like [Mobster](http://mobster.cc/)) on one of the mob members computers to keep track of the time

At this time you are probably wondering how they can work on the same code base, and that can be found in the next section. For now; they do work in the same code base. Hold on

During the week we have created a few extra rooms; a breakroom where we can meet between the mobbing sessions for a fika and a late-night-mobbing for those people that want to work late at night. 



We have also used Discord to give lectures and presentations; which works the same with the exception that we are about 30 people in the channel. During presentations, we have used a text-channel for questions and only allow the person giving the lecture to talk ... In Stockholm. In our Amsterdam office, the developers have been allowed to speak freely. 

We have learned a lot about how to behave in an environment like that during the week; 

* remember when to mute and unmute (I forgot to unmute as I walked out and the entire class heard my kids screaming while gaming in the background for 30 minutes), 
* allowing for longer technical breaks as we switch screens/driver
* longer mobbing round (we usually do 5 minutes but now many mobs have done 15-25 minutes)
* Taking breaks and not work throughout the day

### Sharing code base with git or VS Code Live share

The main idea of mob programming is:

> All the brilliant people working on the same thing, at the same time, in the same space, and on the same computer

We have now solved all of that (working in the same virtual space) but I have not told you how to work on the same code base (i.e. the same thing). 

We have 3 main approaches that our mobs have picked up for this; using plain old git, using the tool `mob` and using Visual Studio Live Share. 

#### Plain old git

With git what we can do it as the drivers turn is up you can just push your changes to the remote git repository with the following simple commands: 

```bash
git commit -am "Changing driver" && git push
```

And then the next driver can pull this down with:

```bash
git pull
```

We have installed some simple aliases like this: 

```bash
> which gac
gac: aliased to git add -A && git commit -m
> which gp
gp: aliased to git push origin HEAD
```

This works but gives you a lot of commits. 

#### The mob tool

There's a lot written about [remote mob programming in this book](https://www.remotemobprogramming.org/) and they have also created a nifty little tool for sharing code: `mob` that you can [download here](https://github.com/remotemobprogramming/mob). It follows the basic same idea as the commands above but hides it under a much nice interface.

I'll let them show how it works:

```bash
# simon begins the mob session as driver
simon$ mob start 10
# WORK
# after 10 minutes...
simon$ mob next
# carola takes over as the second driver
carola$ mob start 10
# WORK
# after 10 minutes...
carola$ mob next
simon$ mob start 10
# WORK
# After 6 minutes the work is done.
simon$ mob done
simon$ git commit --message "describe what the mob session was all about"
```

That works nicely but in all honestly, none of our mob felt the need for it. 

#### Visual Studio Code Live Share

This [add-on to Visual Studio Code is quite amazing](https://visualstudio.microsoft.com/services/live-share/) and allows you to share your Visual Studio Code window with other easily. You can even expose ports on your server to others so that you can view running sites etc. 

The tool is very easy to get going with (you will need a GitHub account) and holds a [lot of features that I'll let you discover yourself.](https://docs.microsoft.com/en-us/visualstudio/liveshare/) 

There's even a [Visual Studio Code Live Share Pomodoro](https://marketplace.visualstudio.com/items?itemName=lostintangent.vsls-pomodoro) that helps mobs to keep track on when to switch driver, all inside the code editor. Nice! 

#### Miro whiteboard

Some mobs played around with a [virtual whiteboard called Miro](https://miro.com/) and got a good result from that. 

#### Remote retro

Other mobs used the [remote retrospective tool](https://retrotool.io/) for [retrospectives](https://appliedtechnology.github.io/retros/) and that seemed to work just fine for them.

### Discord mob robot - mobot

One particular cool thing was that one of our developer created a little Discord mob robot that will assist with mob programing in the discord channels. You can download and play around with Zimri Leijens tool [MoBot by downloading it here](https://github.com/saltams/mobot)

Thank you Zimri!

## Practices

That was just about all the tools that we put in place, in just under a few hours and the mobs then used during the week. But no tool is very useful until you use it - until then it is truly unusable. 

Therefore it was amazing to listen in to the demos (done in Discord of course and worked amazingly) where the mobs shared their findings and discovered practices with each other. I just wanted to share a few highlights here. 

But what I thought about during the entire week was that the concept of [enabling constraints](https://cognitive-edge.com/blog/freedom-through-constraints/) which means that by putting in something that constraint us and the way that we work we are enabling novel and better practices to emerge. We saw a ton of those yesterday. Here are a few:

### Improved communication

One of the best examples of the enabling constraints was that since we are not face-to-face our communication needs to be even better. We need to and have the opportunity to, listen better and are not "limited" by our interpretation of body language, etc. 

Some mobs (that have been storming a lot) called this their best week yet - since they could mute themselves when someone spoke and then only unmute when you had something important to say. That meant that no sighs and rolling with eyes (why that should happen I don't know, but hey) would not be visible and heard. 

The actual communication itself needs to be better and clearer now that we are remote only. Which of course benefits the understanding. Here was the place where many mobs played around with virtual whiteboards etc. to further improve understanding.

### Mute the driver

A very concrete tip was to mute the driver. Meaning that the driver cannot speak. This is a general good tip for mobs (if not taken to the extreme); dis-allow the smart input device to take its initiative and becoming the navigator. By muting the driver that has an even lower chance of happening. Now just the instructions that the driver hears will be executed. 

Worked brilliantly.

### Common ways to get remote work to work

Working remotely is tricky, especially with getting your routines to work and finding focus. By having a group doing this together a routine and cadence came into place naturally. Also, some common practices as taking a walk, doing pushups or just having a break for a drink of water quickly became a practice that the whole mob made their own. 

As with on-site mob programming, it is harder to interrupt a group of people than an individual and I for one noticed that when I had a few other people speaking out loud I got left alone by kids and didn't feel the need to check twitter as often. Now that I was "alone in my office" these little nudges were invaluable.

### Having fun through gifs

When much of the communication was done in writing we needed ways to find fun in our days and animated gifs were plentiful and entertained our lectures and mob sessions. Here's an example screen:

![Animated gif bonanza](/img/animated_gifs.png)

It might feel silly but it is important to be able to share feelings and humor. 

### Toning down irony

In the instructor's team, we made a real effort of toning down irony and bantering as we were communicating a lot by writing. It's easily misunderstood and it will be some time before you meet and can see how things landed. 

We tried to be extra friendly to each other and speak kindly. More than before. 

## Summary

I hope you found some of these tips and tricks useful.

Mind you that this was after the first week of mobbing. I can only dream about what the mobs will come up within 2, 4 or 8 weeks more. 

Stay healthy, friends. 
