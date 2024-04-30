---
layout: post
title: Deploying often is better–agile for non-techies II
date: 2012-05-14T10:28:00.001Z
author: Marcus Hammarberg
tags:
  - Life of a consultant
  - Agile
modified_time: 2012-05-14T10:28:22.839Z
thumbnail: http://lh5.ggpht.com/-TR0aKa6a52g/T7DeMuK-SwI/AAAAAAAABO0/-0gfQCQXp38/s72-c/Deploy%252520seldom_thumb%25255B3%25255D.png?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-1785069010922658762
blogger_orig_url: http://www.marcusoft.net/2012/05/deploying-often-is-betteragile-for-non.html
---


This is the second post of some of the things that I find myself talking
to business people (and some technical folks too for that matter) when
trying to explain agile thinking. <a
href="http://www.marcusoft.net/2012/05/agile-is-good-for-business-part-i.html"
target="_blank">Here is the first if you want to read that</a>.

Again, the disclaimer, this is mostly stated before and probably doesn't
contain much new stuff if your an agile ninja guy. Please don't flame
me - I'm trying to explain this to people who have done other stuff
while you and i was geeking out in agile.

One thing that very often comes up is this notion of deployment, and
maybe that we rather make small deploys to the production environment
often rather than big one seldom.
For some that might seem like a no-brainer but actually it's quite the
other way around in most big companies where I've been. Let me tell you
such a story;

I was consulting at a big insurance company in Sweden and they, like
many many of their peer in that business, did 4 releases per year. They
did that because they wanted "stabile IT".

Let's stop awhile right there and think about that. What happens if you
deploy 4 times a year for stakeholders and projects waiting to deploy
new functionality? Well, the most obvious thing is that they try to cram
so much as possible into those releases; making them very big, with lot
of dependencies… and sadly we're often so keen on getting a feature into
"this release" that we might even sacrifice quality. And who can blame
them? You'll have to wait another 3 months before the next "release
train" is passing by here, right?

So after each of those 4 release per year there's a period of
instability, and some correction-lifting is taking place. A graph
picturing the stability of the IT-environments when doing a 4 big
releases each year is something like this:

[<img
src="http://lh5.ggpht.com/-TR0aKa6a52g/T7DeMuK-SwI/AAAAAAAABO0/-0gfQCQXp38/Deploy%252520seldom_thumb%25255B3%25255D.png?imgmax=800"
title="Deploy seldom"
style="background-image: none; border-bottom: 0px; border-left: 0px; padding-left: 0px; padding-right: 0px; display: block; float: none; margin-left: auto; border-top: 0px; margin-right: auto; border-right: 0px; padding-top: 0px"
data-border="0" width="404" height="142" alt="Deploy seldom" />](http://lh3.ggpht.com/--MouFJW1_MM/T7DeLvggFDI/AAAAAAAABOs/JzdVtaSN4jk/s1600-h/Deploy%252520seldom%25255B5%25255D.png)

About the time that I worked for that company I sat next to a couple of
guys from an online poker site in Sweden. We were on a Kanban course and
came to talk about delivering frequently as part of the course. I
related my clients problem and they just looked at me and asked:

> "Do you know how many times we delivered to production last year?"
> "No… 40?"
> "386!" – he said like it was nothing strange at all. At this point I
> had to pick up my chin that was down on the floor. But they went on:
> "Do you know what the last manual step is before we deploy?"
> "Eeeeeeh… Shutting down IIS?"
> "The developer checks in!"
> Now I had to reach for oxygen…

A couple of things to note about their story and achievement;

- Their production environment is VERY complicated since online gaming
    has regulations stating that your data needs to be stored on servers
    in your resident country.
- It wasn't for every application in their park, but for most of
    them.
- It had taken them a long time to get there.
- They were not done.

It got me thinking… What do you deploy with each release when you do 386
releases each year? Small, small stuff…And small stuff typically have
smaller dependencies and complexity than big ones.

In many of the big companies I have done consultancy in deploying is a
big thing. You often set up complete release project for crying out
loud. With complete organizations handling that specific release and all
the problems that goes into it.
And that only is need *because* the release big and complicated, with
a lot of dependencies.  Which the release will become when you do it
seldom.

So doing big releases seldom actually cost more money than doing small
releases often, just because they are done seldom. This part is driving
me crazy sometimes… but not now. I'm calm again.

Remember the big insurance company I talked about earlier. The one with
4 releases per year to get stable IT. I had the opportunity to talk to
them about Kanban and I had a slide on deploying frequently. So I took a
deep breath and then drew their "stability graph" and overlaid the one
from the online poker site. Like this:
[<img
src="http://lh5.ggpht.com/-cTCS0EVTpOk/T7DeO_vN6vI/AAAAAAAABPE/Xp5niW459cw/Deploy%252520often_thumb%25255B1%25255D.png?imgmax=800"
title="Deploy often"
style="background-image: none; border-bottom: 0px; border-left: 0px; padding-left: 0px; padding-right: 0px; display: block; float: none; margin-left: auto; border-top: 0px; margin-right: auto; border-right: 0px; padding-top: 0px"
data-border="0" width="404" height="136" alt="Deploy often" />](http://lh3.ggpht.com/-H8EBFmMPHe0/T7DeNtnkl-I/AAAAAAAABO8/2ivLQpr_KFQ/s1600-h/Deploy%252520often%25255B3%25255D.png)

Their reaction?

> "Aaaah - their production environment was never stable, then".

No - but if that is the goal then pull the plug of the server and you'll
get the most stable server you've seen. I promise.

That's not why we are here. Our customer doesn't pay us money for stable
IT. No really - they don't! They pay us money for working software in
production.

But of course you cannot change something like this in a jiffy. It takes
time. I seem to remember that the online poker site had worked with
their continuous deployment efforts for 2 years. But it's worth it and
the journey in itself leads to good things; breaking application
dependencies, automating procedures that previously was done manually
etc.

#### Conclusion

I'm a firm believer that small things is better than big things. And I
know that many organizations today is not organized to handle that, as
stated in <a href="http://en.wikipedia.org/wiki/Conway's_law"
target="_blank">Conways Law in 1968</a>, but the to start striving for
smaller and smaller things is always worth the journey.
