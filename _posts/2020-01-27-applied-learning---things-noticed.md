---
layout: post
title: "Applied learning - things noticed"
author: "Marcus Hammarberg"
date: 2020-01-27 09:18:28
tags:
 - Programming
 - Agile
 - Management
---

I work for a developer accelerated career program. I have (together with [Jakob Leczinsky](https://twitter.com/jaklec?lang=en)) created a training material that takes people with no professional development experience into professional developers in 3 months. We have now run 4 courses and found jobs for about 100 people. All of them have got rave reviews from our clients, top-line software companies in Stockholm. 

But how?! This is quite provocative, even for me. I spent 4 years in university (Go [DSV](https://dsv.su.se/utbildning/alla-utbildningar/kandidatprogram/dsv)!) - surely you can't learn as much in 3 months. 

How can this work? Because it quite obviously does. I have 100 devs telling me so.

I was pondering this as I picked up the book [Antifragile by Nicholas Nassim Taleb](https://www.goodreads.com/book/show/13530973-antifragile) for a reread. And things clicked. Our method is antifragility applied to training. And we create antifragile developers. 

<!-- excerpt-end -->

In this post I will speak solely from my own experience and only make assumptions about my career, the author (that's me, folks) started even though he knew that many people share his experiences. 

## Antifragile?

Before I go any further I owe you a short explanation to this uncommon word. This would be a VERY short summary of a topic that you really should read more about in the amazing book, mentioned above. This section is just my summary of the topic - and if it doesn't make sense it's on me. You should learn more from the source.

For me, learning about this topic was a pivotal moment in my carer where things I just felt was right now all of a sudden got words and theory. 

Anyhow, I'm gonna steal Mr. Nassim-Taleb's example; imagine that you want to send a bunch of champagne glasses to a far of the country (Siberia I think is his choice - you do yours). To be sure they arrive in one piece each, you wrap the packages in stickies. What do they say? Fragile.

They don't respond well to being subjected to outside forces, being shaken och dropped or for that matter hit (too hard) against each other. 

What is the opposite of that? 

..., the author (me again), gave the reader a second to ponder up a question in their head by using way too long words frivolously to confuse them.

Most people would say something robust. Like a block of steel. But that is not *anti*-fragile it's just netural. Fragile things are hurt by being mistreated. Robust things don't care. 

*Anti*-fragile things, on the other, thrive while being misused. It grows by it. The subtitle of the Antifragile book sums it up: Things that gain from disorder. 

Aha, the reader said, that was interesting. And also not that useful. What on earth are like that? 

Well, a lot of things. Training, health, evolution, learning, sustainable organizations. When many of us try to build protection to stay the same and duck the changes around us, we are in fact making ourselves more fragile. If we instead, for example, built organizations that were meant to fail, break and learn from that, we would be *anti*-fragile in our approach. Most places where I have worked have not responded well to failure or mistakes.

I wrote this post because I saw how some of these ideas made the accelarated career program tick.

## Applied knowledge

> After four years in university, master of computer science, I had to spend 6 months at my first job being trained as a developer.
>
> > Marcus Hammarberg, 2020

This is not an error by or bug in the educational system. It's entirely by design. For example, I spent 1/8 of my time in the university writing a scientific paper (on automated decision making) and many courses were spent researching a topic and then presenting a report. I have not done that one day as a professional developer. Nor as an agile coach. 

The first day at my first job we were checking in code into a source repository using [Visual SourceSafe](https://en.wikipedia.org/wiki/Microsoft_Visual_SourceSafe) (look it up, kids - it's a world of ~~hurt~~ fun), and then built a binary package that went to an integration build pipeline for later deployment onto an Acceptance Test environment. I didn't do any of that in university. 

University studies are theoretical and meant to prepare you for a continued academic career. I didn't follow that path and ended up having to make the jump between theory and practice by myself while working. The knowledge was there but the application of it had never (or rarely) been done. 



In our accelerated career program, we train developers the opposite way. We introduce a concept, just too little of it. No, I'm not kidding - it's quite painful to do. REST API - 25-minute lecture. Functional programming - 20 minutes. Test-driven development - 10 minutes. All these topics took me years, some we spent entire semesters going through in university. 

But here's the kick; right after you get the 25 minutes introduction to REST you are then thrown into an exercise where you get to apply the knowledge, in a professional team setting within a team that you will need to cooperate with. Not seldom the things you build on Tuesday are built on top of the things you did on Monday - so learning is mandatory. 

The learning is fast, and often quite frustrating. Much like many of the best days I had had (looking back) at work. I can't count the number of times I've gone home from a task frustrated just to find a (better) solution the day after. Or looking back at gigs with many days like that as `the best I ever had`. 



We are training in an antifragile way; we are putting heavy stressors onto the individuals and teams, support them to overcome them. At the end of the career program, they have not only a lot of applied knowledge but also, more important, great skills in learning. 

## Narrower and deeper over wider and shallower 

> Hey Marcus and Jakob - could you, please, summarize what you need to know to be a developer and fit it into 3 months?
>
> > Richard Andemark, CEO of </salt> 

That task was probably the most challenging I ever got. It was summarizing my entire (developer) career. The only logical first thing to do was to decide what to remove. We have taken out most of the things I learned in university ... and at work. 

Gone are the courses on networking. Gone are the math. Foundations of Computer Science - gone. Visual Basic, PASCAL and Visual Interdev, all of these were important learning platform me - GONE. 

Instead, we started with a simple question, with the end (result) in mind:

> What do you need to know to be a great team member in a professional software team? 

Answering that question meant that we kept *some* historic "relics" like the origins of CSS, or JQuery or knowing Git at the terminal. Because you likely will run into that during a normal workweek in a software development team. Or knowing them will help you understand, appreciate and learn the modern tools better.  

It also meant that we kept some theory - enough to understand how to apply it. You need to understand the theory of REST to use it effectively. You need to understand what types are, the difference between OOP (Object-oriented programming) and FP (Functional programming), etc. If not the applying of these topics becomes mechanical and cargo-culting quickly can happen. And any flexibility and creativity are stifled as you cannot improvise around a single known way.    

But that also means that the training contains things that you would never dream of putting into a university course; 

* We have several sessions on building teams - because that is how we learn at </salt>
* there is a lot of focus on effectively using Visual Studio code
* we grade the students on their ability to present - the actual presenting skills, as well as the content. Presenting skills are key in a modern workplace. 
* We teach and encourage using modern tools and frameworks for increased productivity, over building it yourself. We spend time in the start of each topic exploring the basics but as the course goes forward we encourage tools that you probably will use in "the wild" (material UI, Git UI in Visual Studio code for two examples)
* we spend 15-20% of the course building a real product from scratch, based on their idea. And then pitch it to a stakeholder / VC. 

In short, we go deeper faster. This picture from my friend [John Cutler](https://twitter.com/johncutlefish) sums that up in a good visual way: 

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">Something clicked.<br><br>There are two ways for a team/org to go about learning a new way of working. 1) Pick off a part, then deepen &amp; broaden. Or 2) allow them to experience the full practice, then deepen. <br><br>Lots of orgs assume the left option is the only way and is &quot;safer&quot;. Is it? <a href="https://t.co/HNo4p8M3gy">pic.twitter.com/HNo4p8M3gy</a></p>&mdash; John Cutler (@johncutlefish) <a href="https://twitter.com/johncutlefish/status/1221661962624352256?ref_src=twsrc%5Etfw">January 27, 2020</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
You will, by no means, learn as wide topics at </salt> as I did at university. But you will learn the topics we teach much deeper. So deep that you can start working on your first day at the job. 

Don't take my solemn promise for it. Talk to our developers: 

> Hey Marcus, I just pushed my first lines of JavaScript into production. It could never have happened without you, pal. Thank you
>
> > J, class of fall 2018. The second day on the first job ever, as developer

and then:

> Me: So where are you at now?
>
> Dev: I'm at [big lending company in Sweden]
>
> Me: Ok - cool. What do you do there? 
>
> Dev: I'm supporting the app. It's me this other guy

That is amazing but also a testament to what they have learned. They came out ready to start to work in a team. No to little onboarding needed. But more importantly; they know how to learn and apply their knowledge fast.  



We are training the developers to be antifragile - to be ready and prepared for being confused, making errors and picking up new things every day. And sharing, explaining and deepening their knowledge together with others. Because that's how our days at the school are designed. Also, funnily enough, that's how software development most days has felt for me.  

## But how? Immersive

And that leaves us with the secret recipe; immersiveness. 

We have a 13-week long career program. During this time our developers are only doing code. They are not allowed to have other jobs, or training going on at the same time. We pull them through exercises that are, for most people, way beyond the scope of what they would cope with individually each day. Every weekend there's a test on the topics score. They present code and code topics to other teams every week. 

The first week, the first day they are thrown into a big-ish code-base of vanilla JavaScript where we have taken out a few key lines of code. Their work is to make it work. It usually takes the mobs about 6-8 hours. 

Development is the only thing that exists for them during this period. And it changes how they behave and think. Let me give an example; after the first week we usually have a little After Work and I have made a habit of talking to every developer to check in on how they are doing. 

Interesting (and a little bit scary - let me get back to this) enough every person I talk to says just about the same thing:

> I see JavaScript when I close my eyes

> I woke up this morning and thought about the solution for the kata we did yesterday

> My girlfriend woke up by me screaming CALLBACKS out loud.

They become like first time parents - they can only talk about that one thing. It's fascinating to see and really annoying to talk to. I mean, I'm geeky and all but could we please talk about something else than [ternary if statements](https://appliedtechnology.github.io/protips/ternary-operator) and [asynchronous code](https://appliedtechnology.github.io/protips/asyncOptions)... just for a while.



Full disclosure - I feel a bit bad about pushing people to this point. I would never dream of doing this too people, and often tell the developers that I would never make it through this program. So why do we do this to them? 

Because this is a once in a lifetime thing. They have come here to re-boot their careers and in some cases live. You can immerse yourself like this, willingly, once in your life. The price is big - a new career in a field you want to pursue. 

The term Bootcamp comes from the military and I've often wondered about the Navy Seals instructors screaming `WHY DO YOU WANT TO BE HERE? YOU COULD LEAVE NOW!` in the face of the recruits for the world's toughest service. But that's just because they want the ones that want, no *needs* to be, a Navy Seal. They are driven by a passion for it. 

We want developers like that. Because they will be ready to keep learning for the rest of their career.

(I'm not screaming in people's face, though... I'm [more of a poem-guy](https://www.youtube.com/watch?v=vyGB-bLA62Q&) :)) 

## Summary

As I read the book Antifragile I realized why this works;

We are creating developers in an antifragile way, to make them antifragile in their careers. 
