---
layout: post
title: "Progress indicators, estimates and plans"
author: "Marcus Hammarberg"
date: 2015-08-11 11:16:37
tags:
 - Agile
 - Lean
 - Kanban
 - Life of a consultant
---

Here in Indonesia Internet is often very slow. No, you don't understand. VERY slow. Downloading big files, like movies on iTunes, can be a project from 4 hours to days.

The other night we wanted to watch a movie ([Bamse i Tjuvstaden](https://itunes.apple.com/se/movie/bamse-och-tjuvstaden/id933533886), it's actually pretty good) that our kids love. We have already bought it but iTunes still downloads part of it.

The normal thing happened; the progress indicator lied. My kids were angry and I had to explain to them:

<blockquote>
	That is an estimate, a guess. They simply don't know when it's done.
</blockquote>

As I said that I was reminded about many times I've been required to give estimates in other settings. In this post I wanted to examine the similarities I felt was present.

<!-- excerpt-end -->

## Disclaimer
Yes, this might be considered a comment in the #hashTagThatShallNotBeNamed, but as you know I'm wiser than that. This is a comment in the [#LessEstimates discussion](http://www.marcusoft.net/2015/05/no-no---more-less.html).

## The story
Here's how the waiting played out, with about 1 minute between each update:

* iTunes: Ready to play in 12 minutes - Kids: Oooooh... that's forever.
* iTunes: Ready to play in 8 minutes - Kids: Booooring!
* iTunes: Ready to play in 6 minutes - Kids: Hurry! Hurry! Hurry!
* iTunes: Ready to play in 10 minutes - Kids: Huh?!
* iTunes: Ready to play in 6 minutes - Kids: Yeah! Go iTunes!
* iTunes: Ready to play in 2 minutes - Kids: Huh?! Now?
* iTunes: Ready to play in 4 minutes - Kids: Daaaa-aaad! iTunes is stupid
* iTunes: Ready to play in 2 minutes - Kids: Yeah!
* iTunes: Ready to play in 1 minutes - Kids: Sit down, dad. It starts now.
* iTunes: Ready to play in 1 minutes - Kids: ...
* iTunes: Ready to play in 1 minutes - Kids: Daaaa-aad! Make it stop.
* iTunes: Ready to play in 1 minutes - Kids: Let's watch TV instead.

I'm actually sugar coating it a bit. In reality the last part went on for quite some time.

## The explanation
In my normal, by-grace-given, calmness (not really, but let's say that it was like that) I wanted to tell my kids (and wife) what is really going on here. I tried it something like this:

Me: "The film is a big file that has to be sent from iTunes to our computer. The Internet in our house is not good enough to receive all of that quickly. Sometimes it goes faster and then it can slow down again. In fact, sometimes it doesn't work at all.

The poor people at iTunes doesn't know about this. They cannot, since they have no control of our Internet connection. So the make an estimate - a guess if you will.

They know the size of the movie, and they know how fast the Internet has been up to now when they sent it. So, knowing this the guess that it's maybe 4 minutes left."

Albert: "But it was not! It was 4 minutes left for 10 minutes straight! That's wrong! They lied! I want to hit them."

Me (with an angels voice and patients): "Son, we don't hit. And how could they know? Maybe we have power failure, like yesterday. Or Arvid [other son] pulls the Internet cable, like last week? Then nothing would have been downloaded."

Albert: "But the circle is spinning. The computer is working."

Me (ruining illusions): "No it's not, my son. That is just a picture that is spinning. It has absolutely no idea how much of the file that has been downloaded."

Albert: "Then should not say anything at all! They are lying."

Me: "Yes maybe it would have been better to not say anything. Or to be more open about that they don't know. What would you wanted to see?"

Albert: "The movie."

Me: "Yes... but while we where waiting for it to download."

Albert: "Something else in the meantime."

## The, far-fetched, analogy
Leaving childish drama aside. I think that we are often telling the "progress indicator"-lie to our stakeholders. I know that I have. Why? Because they asked me. And that was stupid of me.

### CQRS

A couple of years ago [CQRS](http://martinfowler.com/bliki/CQRS.html) was the hot thing. It's an architectural pattern that in it's super simplified form just separates the Reads from the Writes. Often the Reads is done against a separate, persisted cache. This store is updated asynchronously from the commands we execute.

This means that during a short period of time the Read data is not updated with the latest changes. This is known as "[eventually consistent](https://lostechies.com/jimmybogard/2012/06/26/eventual-consistency-cqrs-and-interaction-design/)" and scared the living day-lights out of most customers.

<blockquote>
WHAT?! The data is not consistent all the time? NOT. GOOD. ENOUGH.
</blockquote>

Well... sad to break it to you, but it has never been (with the exception for very few systems that locks records for editing etc.)

If I bring up customer information on my screen, and you do the same thing on your screen, we have two caches of the data. If I update the data and save, and you don't reload... We are not watching the same data. This is how most systems I've seen works. Even when it comes to banking and medical records.
(In all honesty it's improving but at least this is how it's been)

One of the things that I really like about the CQRS/"eventual consistent" approach was that it gave the opportunity to be honest on a whole new level with what the users was seeing. We could tell them "This data was updated at XX:XX", trigger a reload when someone else was updating the data or even show that someone else is editing the data,

This was cool, because out of the strict constraints that CQRS imposed, came new possibilities. [I like that, as you know](http://www.marcusoft.net/2013/01/on-constraints.html).

## Back on track, please
Ok, ok... back to progress indicator, estimates, planning and all of that.

What I was saying is that instead of guessing something that we simply do not have enough data for (i.e. "showing the spinner", "12 minutes left, no wait 4, no 6, or eehhh... it looks like 4 hours now"), maybe there's something else we could report. Something that helps decision makers to make better decisions. More raw data, leaving the analysis up to the decision maker.

And in doing so we open new possibilities.

In the iTunes example I think it would have been better to skip the time all together. Just showing "How much has been downloaded so far" and some indicators for how many minutes of film that represents. From that simple information my kids (the "decision makers", God help us) could have made up their own mind:

* "Waited 20 minutes and 20 seconds downloaded. This will never work."
* "Waited 20 minutes and 45 minutes film is downloaded. Great - this is worth it"
* "Ok, we've waited 20 minutes now and it's downloaded 2 minutes of film. Let's give 5 more and see what happens"

(They would never be as reasonable, but I'd like to think that they are.)

In a project it might be:

* We've spent 2 weeks, 12 guys in the team, the app can be started but nothing else - what do you want to do?
* We've spent 6 weeks, did 3 items in the backlog, 43 left - what do you want to do?
* We've spent 6 weeks, did 3 items from the backlog, 246 left - what do you want to do?

(First bullet is from my first Scrum team. They stood up and applauded when they heard that... another story)

# Summary and a final story
I think we often try to sugar coat the data, thinking for the decision makers. I've often found that presenting the raw data at hand, being more transparent and open, "telling it as it is" is a much better approach. Doing frequent reporting of raw data is also better than to do fancy reporting seldom.

Quite often, in our attempts to clarify and simplify, we end up hiding the data that actually is needed to make decisions.

I had the luxury once to work on a project with extremely fixed frames and scope: rewrite this VB 6 application in VB.NET - make it work **just** as before.

The first couple of weeks (you know, that point in time when you know the least about the product, it's complexity and how to do this) we were required to give some estimates of "how much was left". So we did. In hours. If I remember correctly it went something like this:

* Day 1: 670 h
* Day 3: 2450 h
* Day 6: 890 h
* Day 9: 1350 h
* Day 12: 1670 h
* Day 15: 440 h
* and so on

At this point we thought we'd try something different. Something that didn't require us to "guess", as one developer put it. And that was just the raw data.

Here is what I came up with: As we were going to convert an application I listed all the .frm (that good ol' VB 6 forms guys) and classified them by "size of file" into S, M, L and XL.

We then created a circle diagram for each size (S, M, L and not for XL) where we reported Not Started, Started, Completed. Our project manager brought this to the "2 times per week"-project meeting with the stakeholders.

They called that "The best reporting they ever had seen in this company".

Note:

* There was no estimation.
* There was just the (VERY) plain data.
* Everyone could see the difference from the previous data (I think we did some kind of overall progress * diagram).
* The decisions were hopefully easier to make.

# Conclusion, really
I will try steer away from doing progress indicators ("Ready to play in 12 minutes") and instead just display the relevant data, as it is.