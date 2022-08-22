---
layout: post
title: Are you coding for change or for stability?
date: 2013-04-18T06:00:00.001Z
author: Marcus Hammarberg
tags:
  - Lean
  - Life of a consultant
  - Agile
modified_time: 2013-04-23T09:01:49.830Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-4901344307200799475
blogger_orig_url: http://www.marcusoft.net/2013/04/WhatDoYouOptimizeFor.html
---




Let me tell you a story: when I was in university I took an "advanced"
object oriented programming course. This was my first exposure to the
topic and I was lost big time. The course was taught in
[SmallTalk](http://en.wikipedia.org/wiki/Smalltalk) had a very different
format; the first day we got an assignment from the professor that ran
throughout the 4 week course.

We were very excited since we were going to write a game. An old-school
text-input adventure game a la
[Zork](http://en.wikipedia.org/wiki/File:Screenshot_of_Zork_running_on_Frotz_through_iTerm_2_on_Mac_OSX.png).
We teamed up three people in groups and went to the professor smalled
crammed room. Here we got the instructions on a single sheet of paper.
We almost ran out of there.

Just as we reached the door of the room he called us back (I'm sure he
had time that call to perfection):

> "Oh yeah, almost forgot. Two weeks from now I will come by and change
> something fundamental of that game description. Continue as you were."

I've told this story a number of times to system
development teams (and some product owners) and the reactions are almost
the same every time:


-   There's laughter all around the room. Or giggling at least. Quite
    often some "Pfffft" can be heard 
-   "Oh man - that's one tall order!"
-   "What a hard professor - that's almost an impossible task"



The thing is: he didn't tell us what he was going to change. Just that
*something* was going to change. In two weeks. 






How do you think we approached that taks? 




We coded very defensively. 




-   "Oh my - what if he decides to change this?" 
-   "This probably needs to be an interface, if we are asked to
    implement it differently"
-   "No - that needs to be extracted since we then can change that part
    without touching part X"



Things like that. All in all it was an excellent assignment that thought
me a lot about programming OOP and Small Talk. Thank you professor
[Davidson](http://people.dsv.su.se/~alan/)!

As a consequence we ended up with a very modular system that was easy to
change parts of and when that frightful day came when the specification
was altered we actually managed to change that in a day and then
continue writing cool features like a GUI and scary monsters.

We had optimized for change. Because professor Davidson told us it was
coming.

### And again

Let me tell you a story: this a story about a system that is developed
about 25 years ago. It is a business critical system in a big Swedish
company. When I say business critical I mean the products handled in it
constitute about 80% of the company revenue.

Right from the bat they where very thorough and kept a great
documentation. They also implemented a rigid change process. Changes in
this is system should not happen a lot, since that would be quite risky
or at least have a great impact if failed.

That scared the company so much that a long array of measures where
taken to prevent problems in the system; the code was documented in
pseudo-code by someone else than the person that wrote the code. The
person that wrote the code was not allowed to test the code (that she
wrote).

The same, risk-management measures, where taken when writing
specifications. People wrote specifications in several ranks so that
things was checked and double-checked before handed over to the IT-side
of business.

Fast-forward 25 years and we still have the structure around
documentation and risks in place. Things seldom fail but the system is
very slow. About 30 weeks from "accepted on backlog" to "delivered in
production". There's ca 20 ppl involved in the ranks from idea to
specification in the hands of the programmer (that by the way calls
themselves **constructors** since that's all they really do, translate
pseudo-code in Swedish to COBOL).




Everything around the setup for this system was to handle risk and
changes by aiming for stability. Because we thought that change were
going to be a exception. Sadly that's the only thing that the business
wants to do: change. And faster and faster. When the system was built
there was no talk at all about exposing it's data on the internet. Hey -
there wasn't even an internet.

They system was optimized for stability.
Let me also underline that I don't think lesser of the people in the
second story. They are great people but they were thrown into a system
that was optimized for stability. That's very risky.

### Conclusion

These two stories got me thinking.

-   What am I optimizing for when I write my code today?
-   Change will always come. I know that from the outset. "I will change
    something in that spec during the 25 years the system will live".
    How do I try to handle that?
-   Do I precieve change as a risk or an enabler? Being able to change
    fast is a business advantage and a way to manage risk. How do I make
    my code being easy to change?
-   What kind of documentation do I need in a system that I'm going to
    change a lot?



What do you optimize for?

I wrote a follow-up
[post](http://www.marcusoft.net/2013/04/WhatDoYouOptimizeFor2.html) on
this topic if you want to read more.





