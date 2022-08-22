---
layout: post
title: Are you coding for change or stability - the
followup post
date: '2013-04-24T09:00:00.000+02:00'
author: Marcus Hammarberg
tags:
  - .NET - Lean
  - Agile
modified_time: '2013-04-24T09:00:09.964+02:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-7663992142364497452
blogger_orig_url: http://www.marcusoft.net/2013/04/WhatDoYouOptimizeFor2.html ---

<div dir="ltr" style="text-align: left;" trbidi="on">

In my [last
post](http://www.marcusoft.net/2013/04/WhatDoYouOptimizeFor.html) I
related two stories that I've been a part of and that got me thinking
about what we (or me at least) code for: change or stability.

The post got attention (amazing attention for a small time blogger like
me, actually almost afraid of writing now :S) and quite a lot of
questions was posed. These of course got me thinking even more and I
realized that I needed to follow up on the post. So here it is: some
thoughts (and some answers) to questions and arguments I've had during
the last week.



### Mindset vs practice

<div>

What I bluntly failed to convey in the first post was the mindset aspect
of it all. For me the difference in approaches was one of mindset in
what we develop; do we write the code thinking that it will change or
that this is the last time we ever touch or see it?

</div>

<div>



</div>

<div>

For me this completely change the way I approach not only writing the
code but also thinking about the problem. If I take on the mindset that
this will be changed I would try to make change easy (more on that
later) and I might to do the smallest thing possible to get something
out there and learn from that. 

</div>

<div>



</div>

<div>

Maybe it isn't me changing this code the next time - how can I make it
super-easy for the next developer to understand what I was thinking, so
that she can make the change easier. 

</div>

<div>



</div>

<div>

A interesting thought experiment (or do you dare do this in practice?)
is to [take on a
constraint](http://www.marcusoft.net/2013/01/on-constraints.html) that
you will start rewriting your code base after a certain number of
months. No code, in this module, will live longer than 3 months, for
example. What would that do to the way you approach the design? The
coding? The testing? The documentation?

</div>

<div>



</div>

<div>

Yes, yes... that's probably impossible for most of us. But use it as a
thought. What would happen? What would we gain from that? What would we
loose from that? 

</div>

### "WHAT WAS CHANGED IN THE GAME SPECIFICATION???"

<div>

This was one of the questions I got asked on
[Reddit](http://www.reddit.com/r/programming/comments/1cocmn/are_you_coding_for_change_or_for_stability/) and
it's a fair one. If you remember from the [last
post](http://www.marcusoft.net/2013/04/WhatDoYouOptimizeFor.html) our
professor gave us a programing task to build a game, and then told us
that he was going to change something in the specification after a
couple of weeks. 

</div>

<div>



</div>

<div>

For my team (3 people; Magnus, Mats and me) the change was to introduce
a new player. An computer controlled player that mimicked your every
move but 3 turns after you. We called him "the mimic monkey" (Härmapan
in Swedish).  

</div>

<div>



</div>

<div>

There we're other changes as well; adding graphical interfaces, changing
the language that you used to instruct the person, being able to script
the player etc. 

</div>

<div>



</div>

<div>

The concept was one that we never had thought of when we started to
create the game and it took us some time to think about how to introduce
that into the game. When we coded it, if my mind serves me right, it
took us about a day or two.  

</div>

<div>



</div>

<div>

The change was easier since we had created a lot of infrastructure and
generic constructs to support additions and changes. MOST of them was
never used.... Some proved useful for the particular change at hand. 

</div>

<div>

### Generic vs simple

</div>

<div>

And that brings us to my final point. This was one of my first exposures
to object oriented programming. We had just learned about design
patterns and used them all over. We built our code to be as generic as
possible, for every line (or well... method at least) we thought things
like:

</div>

<div>

-   maybe this will be changed? 
-   We can break this out to a base class. 
-   If this is a interface we can swap the implementation
-   Couldn't this be read from a file...

<div>

You see where I'm going. Most of these things were never used of course,
during the short course that we took. If the project had gone on for
several year, more things that we built into the first generic and
flexible design maybe had been. 

</div>

</div>

<div>



</div>

<div>

It is summed up in this excellent [XKCD
cartoon](http://imgs.xkcd.com/comics/the_general_problem.png):

</div>

<div class="separator" style="clear: both; text-align: center;">

<a href="http://imgs.xkcd.com/comics/the_general_problem.png"
data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
src="http://imgs.xkcd.com/comics/the_general_problem.png"
data-border="0" width="400" height="166" /></a>

</div>

<div>



</div>

<div style="text-align: left;">

I've changed. 

</div>

<div>

I now much rather preferred something small, simple and hardcoded over a
generic flexible solution. I've come to realized that the added
complexity does seldom get used. 

</div>

<div>



</div>

<div>

It doesn't mean that I'm throwing everything I know overboard, but I use
the tools only when they helps me write stuff simple. I strive to write
simple rather than flexible code. 

</div>

<div>



</div>

<div>

For me changing simple stuff is faster than changing stuff that was
written with flexibility in mind. I love the ideas behind
[micro-service-architectures](https://www.google.se/url?sa=t&rct=j&q=&esrc=s&source=web&cd=6&cad=rja&ved=0CFwQtwIwBQ&url=http%3A%2F%2Fvimeo.com%2F55042628&ei=-0l2UYysFsj24QT2gIGwCQ&usg=AFQjCNG_gTkI29ZCVc-DgnHYqwNvwyOEpg&sig2=zS8h0yQDvmvwaTK9Ec2NXg&bvm=bv.45512109,d.bGE) that
a lot of people talks about these days. That is: super small (often
nothing bigger than classes) service that talk to each other in a
uniform way.

</div>

<div>



</div>

<div>

Yes - that creates a lot of services, but it's still simple to grasp
since you don't have to take them all in, all of the time. You just have
to concern yourself with this little service and the once that it use.
You can even allow yourself to duplicate stuff if needed (not to
absurdum of course).

</div>

<div>



</div>

<div>

If one of the services is cumbersome to understand and handle; let's
rewrite it. Let's split it up into 5 smaller ones. All of this is simple
and fast since the service are small. 

</div>

<div>

### Conclusion

</div>

<div>

That's coding for change for me. In the [Agile
Manifesto](http://agilemanifesto.org/) we read: "Responding to change
over following a plan" and one of the
[principles](http://agilemanifesto.org/principles.html) states:
"Simplicity--the art of maximizing the amount 

</div>

<div>

of work not done--is essential."

</div>

<div>



</div>

<div>

That's why I love frameworks like
[NancyFx](http://www.nancyfx.org/) ([Sinatra](http://www.sinatrarb.com/)
on .NET) and
[Simple.Data](https://github.com/markrendle/Simple.Data) that helps me
write super small services in a few, easy to read and understand lines
like these:

</div>



<div>

This little service get all the users with a given name and returns it
to the caller in the format requests (look into [Nancy content
negotiation](https://github.com/NancyFx/Nancy/wiki/Content-Negotiation)
for more on that). Simple. Tiny. Easy to change.

Oh yeah - a final word: I sure hope that I change my mind about all of
this. Often. It would be super scary to think that I would know it all
now. Brrrr.

Code for change. Change will come. Change is good. 

</div>

</div>
