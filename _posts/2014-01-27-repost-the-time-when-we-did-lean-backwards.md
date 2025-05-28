---
layout: post
title: Repost - The time when we did Lean backwards
author: Marcus Hammarberg
date: 2017-04-19 15:05:07
tags:
 - Lean
 - Agile
 - Life of a consultant
 - CodeBetter re-posts
---

### REPOST FROM CODEBETTER

I noticed that [CodeBetter](http://codebetter.com/marcushammarberg/) is slowing down. Maybe dying. I’m preserving [my post from there](http://codebetter.com/marcushammarberg/2014/01/07/the-time-when-we-did-lean-backwards/), here to my site.

## Original post

A couple of months ago I was very fortunate to work alongside a great team. They had a not so envious task before them, namely to introduce a new main concept into an legacy code base. You know, the code has been around for at least 5 years and now you need to add a concept that was no-one ever thought we would have in there.

They did that. In just 3-4 months and delivered with flying colors. I didn’t have much to do with that, I merely observed their work.

When they were done I proudly introduced the team to a new senior in the company and told him about their feat and how they had gone about doing it. His words: well, *that’s Lean backwards then*.

He was right, but I never thought about it until then. In this post I’ll describe how they worked, what the “lean” way would have looked like and what we can learn from the difference.

Let me just say that the way the team went about their worked, and the feature was a success in production. Very high quality (2 bugs reported if I’m not mistaken) and well received.
In order to not put any blame on that great team I will talk about “we” in this post. Although I didn’t have much to do with their success.

<!-- excerpt-end -->

## How the team did it

The feature that the team was going to add was a Cart. Yes, like a shopping cart. With a Cart follows the concept of an order, which was something brand new to this big site. Going in and poke around in the heart of the product was going to be big and scary.

The team approach this by getting together for a couple of days and throwing ideas around. There was some spiking and a lot of drawings and scenarios was discussed.

After just a couple of days (maybe a week) they came up with a plan, and was asked to [commit to deliver](https://www.marcusoft.net/2013/09/commitment-can-only-emerge-it-can-be.html) the feature before the summer. 2,5 months away.

A plan with a number of small changes to the code base was put into place. I think they did maybe 12 small releases with things “behind the scenes”. The first one took them just a couple of days to put out into production.

We were happy and impressed with that the feature was starting to take shape and already had parts of it in production. However, we ran into the obvious discussion and explanation with others in the company:

- “yes, it’s in production”
- “no, you can’t use it.”
- “no, you can’t see it.”
- “no, we’re not quite sure when we’re done… but it’s soon.”

As I said, after 12-13 release the back-end part of the feature was complete and the UI could be put into place on top of it. For most people this was represented with the little cart icon in the menu-bar. A very small feature.

It worked! It worked perfectly in fact, and everyone was happy. Or well… there was some squeaking on “why on earth did it take 3 months to put that little icon in place I never know. But ok, now it’s there.”.

It was about this time that the new senior came by and said: “that’s Lean backwards”

## What should the team have done?

At first when I heard that comment I repulsed and thought that he didn’t know what he talked about. Surely this was good; small, increments of the feature delivered in short intervals. What’s not to like?

But then I went back to [The Lean Startup](http://theleanstartup.com/) and started to think about what we had done. Or rather how a Lean Startup entrepreneur would have done it.

And they would probably have started with the last part. The cart-icon. Maybe also a placeholder page saying something like “There will be a cart here shortly. Would you like that?”.

Then we should have start measuring the traffic and collect feedback. Was this something the users liked or wanted? Did anyone click on the Cart-icon? How many? When? How often? Which kind of customers?

This kind of measuring was in place already at this client so setting this up would probably have taken a day. Two tops.
*And then the feedback would have started to come to us.*

Armed with that date we could then have proceeded, provided that the data showed us that we had a great reason to continue. The next “smallest possible step” from there would probably have been to fake it. With which I mean, fake a very simple page that just stored the data entered in a simple database, like MongoDB. maybe add a “Add to cart”-button on certain product-pages and have them saved to.

You can read more about this kind of ideas in the excellent book [Pretotyping](http://www.pretotyping.org/) by [Alberto Savoia](https://twitter.com/Pretotyping). They are closely linked to the ideas presented in Lean Startup.

As for the checkout-functionality we could have handled that manually. You know, send an email (yes, as simple as [mailto](http://en.wikipedia.org/wiki/Mailto)) and have a couple of guys managing it on the backend. It would have been messy, but it could be in place in a day or two probably.
*And then the feedback would have started to come to us.*

We would now, from the eyes of the public (and others in the company), have a working cart. Not fully featured and sure not fully implemented, since we still are faking it. But now we could start filling the functionality out with real code. And doing so where the manual management hurt the most first.

[![Software features and how they are used](http://codebetter.com/marcushammarberg/files/2014/01/features-used.jpg)](http://codebetter.com/marcushammarberg/files/2014/01/features-used.jpg)Picture from <http://pragprog.com/magazines/2011-02/way-of-the-agile-warrior>

Maybe, in doing so, we would discover that not all the things that we thought was important really was. Have you see the stats on how much of the software features we build that is really used?

Finally we would have a “complete” Cart-feature that contained the features our users (and we) really needed.

## So, what’s the difference then?

The second approach focus much more on learning, getting feedback and acting on that feedback, whereas the first approach is more “we know what to do – let’s just do it”.

I can already now hear the guys in the team objecting: “but in this case we did actually know”, “there was no other way” etc. It might have been, but that is always a bet you make. Are we so sure that we going to bet on this for 3 months with nothing delivered and then all at once.
Again, let me stress that the feature was a success. But it might have over delivered? Maybe other features, earlier would have helped our customers better? We will never know…

What would have been a very big difference is the time-to-market; it’s just a couple of days before something new showed up in production.
And then the feedback would have started to come to us.
This would have stilled much of the questioning for our progress, the need for plans and [“commitments”](https://www.marcusoft.net/2013/09/commitment-can-only-emerge-it-can-be.html), I think.

Also we would have started to get feedback on the feature much faster. I remember when the team did release the feature; it just took a day or two before they started to get ideas on what people was looking for, how to get that into the next release etc. That kind of feedback would have come to us much earlier. Much. Earlier.

Another thing is that we might probably have had new ideas on how to solve the problem, as we only parts of the problem. Would we have saved the orders differently than we did when we did a single big release, with all the features? Would the cart and the order product have been more autonomous services? More generic?

Finally, overall it might have taken more time. Not sure about that, since the end goal is not in sight when you start. Hey – even now I cannot say where we would have ended up. Somewhere great, that’s the only thing I know.

## Conclusion

The team did something amazing. And it didn’t take them very long either. But there was another way and I would have taken that if I got the opportunity to do it again.

When you think about it it’s your choice really;

- setting up your process in a Big Bang fashion bootstrap yourself for a series of bad news, delays, exceeded budgets and a risk that the finished product will disappoint the customer
- with small frequent, customer-facing, release you have a series of good news until, all of a sudden, you have exactly what your customer needed. And you will learn what from what you have done so far.

(Read about another[process with these problems here](https://www.marcusoft.net/2013/12/what-do-you-want-to-give-customers-bad.html) )
