---
layout: post
title: "Reflections on TankWars or when 2 minutes was slow"
author: "Marcus Hammarberg"
date: 2016-11-03 21:44:16
tags:
 - Agile
 - Lean
 - Javascript
 - Tools
---

My current team have a practice to do something "learning, inspiring and future-leaning" on every other Friday. We called it LAME (Learning Afternoon Mob Experience) since we started to run it on Friday afternoons first, but have recently changed into running it for a full day every other week.

The other week we decided to give TankWars a go. It great fun and educational, and I got to observe an interesting phenomena about learning and feedback.

<!-- excerpt-end -->

# Tank Wars

TankWars is a nice little game that is have been used to teach AWS Lambda / Serverless computing in some classes given by [Gojko Adzic](http://www.gojko.net)

The game is quite simple; you create a little program that GET called with some information about the world you are in. From that information you then POST a simple command about what to do next (left, right, up, down, pass or fire).

To objective is simply to survive longer than an opponent, or shoot them to smithereens which is considered better. Your opponent is another program that gets called in a the same way.

Of course using AWS Lambda (or anyone old serverless technology) is a perfect fit for this. And if you are using Node - [Claudia](http://claudiajs.com) is your one stop shop for all things AWS Lambda.

# How it played out

It turned out that we had too little time to get something really great out there, even though [one developer](https://twitter.com/orjansjoholm) actually created an algorithm that beat one of the AI robots created at a code camp. He called it luck - we knew that mad skills was on display too.

# Observations

I came late and just went around observing and I saw one common struggle and complaint from all teams:

> It takes too long to get feedback

Me, standing on the side to start with, thought the exact opposite (at first); the feedback cycle was amazingly fast!

* Making a change - 20 s
* `claudia update` (see my [previous posts on Claudia](/2016/02/first-aws-lamda-steps.html)) - 30 seconds more
* Starting a new game and see if your change did anything useful (for example; do I stop when I hit a wall) - 1 minute

That's from idea to verified idea in production in under 2 minutes. Mindblowingly fast!

And then I sat down and wrote some code myself and I felt that it was just too slow.

Quite often my change did **not** do what I thought (I kept driving through walls and soon died from the injuries) and another 2 minute turn-around to fix my algoritm felt like ages.

But when we code our production code we deploy once per week. That's 7 x 24 x 60 = 10080 minutes to get a small idea to be verified in the wild

# Conclusions

Why was this a problem in game context but not when we do production code on our day-to-day team.

Here's a few things I thought about;

* The immediate *game* feel that we were under made us all want to go fast in our feedback cycle. Loosing was very apparent and clear. As was winning.
  * Do we see when we win or loose in our normal application? Why not? What can we do to change it?
* What felt slow in our game (2 minutes) is NOTHING when coding a feature in production. Now, to be quite fair, the production code is very much legacy code and much, much harder to move in.
  * The technical debt accumulated over years and by choosing a big product is slowing our learning considerably. What is the cost of being that slow? What if a competitor would move (much) faster than us?
  * Who is responsible for us moving from the technical debt to a place where we can get faster feedback? Who "approves" us doing that - to the cost of developing new, urgently needed, features that, when completed in the legacy fashion/system, will slow us down further.
* I, for one, made **tiny** changes. My simple algoritm was one based of a random selection from an array of actions - I then added 3 `fire` and only 1 `forward`, `backward`, `left` and `right`. I needed to see how that affected my performance fast. In production code I would of course make bigger changes. These were more on a unit level
  * What would change in my development if I could get feedback very very fast?
  * Do I still need to do rollbacks?
* After a few hours people grew tired of the "slow" feedback cycle and had the been an hour or so longer I'm sure we'd seen a few test harnesses in order to be able to test the application locally to get even faster feedback
  * Out of problems and frustration came innovation.