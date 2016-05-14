---
layout: post
title: "Developer failure"
author: "Marcus Hammarberg"
date: 2016-05-11 12:00:00
tags:
 - Lean
 - Kanban
 - Life of a consultant
---

I got a request by a nice man call Brandon Garlock to share some failure of mine. My contribution will be part of a:

>collection of stories about experienced and established developers (such as yourself) and the failures, setbacks and hurdles they overcame over the course of their careers. It will serve as an educational guide, motivation and reference for burgeoning programmers as they learn their craft.

That sounds both fun, worthy and useful. And I'm very honored to be part of the story. Any experienced developer will tell you that the greatest learning came from overcoming, maybe not always doing, great hurdles.

I asked Brandon if I could share my story on this blog, as that how I mostly write stuff, and he kindly agreed.

<a name='more'></a>

At the time of this story was a young developer creating a support system for a municipal real estate organization. We were very excited to help this particular customer because they had a great need and a very old system they were working in (or against mostly) today. 

One day we got a request to start to handle the queuing management for the organization. This is a really big thing in Stockholm as the queues are long and keeping ordering fair and fast is essential. 

We did some initial interviews and went away building. The flow was immense. I can't remember the last time I had such a great time coding. We had developed other parts of the application and this just fitted right in there like a charm. 

After 6 weeks we were done, as in every known requirement coded and tested, and delpoyed.  It was time to demonstrate the application and recieve our due thank you's. Or so we think. 

I was assigned to demonstrate and started my demonstration: 

> Here on the first screen you fill out the information about the free appartement that you want to add to the queue and ...

I still remember the shiver of fear that went through me as I got interupted here: 

> Fill out?! Why? Surely the system must know all informatio about the appartments and tell us a few months before they will be available?! 

She was right of course. We had missed an essential business assumption and requirement. 

## What I learned

This story stays with me almost everyday I don't get to talk to an end user (or at least an end user proxy). Thinking that we *knew* what was the right thing was a dangerous detour that took us much longer to fix than the initial development. 

The problem is that it's very hard to know what you don't know… This is what's been referred to as the ["unknown unknowns" by some](https://www.wikiwand.com/en/There_are_known_knowns). The only safe way I've found to make sure that this doesn't bite you is to iterate fast and validate your assumptions early and often. 

Make smaller (yes, smaller than you think) release and show it to the user early is one way. Writing executable specifications in human readable form (using [Cucumber](https://cucumber.io/) or [SpecFlow](http://www.specflow.org)) is another.

Do whatever you can to ensure that you validate what you think is the correct as early as possible. Don't invest a lot of on your assumptions - they just might be as wrong as we were.