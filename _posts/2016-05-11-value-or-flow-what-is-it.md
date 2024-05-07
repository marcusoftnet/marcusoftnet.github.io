---
layout: post
title: "Flow or value - what is it, Marcus?!"
author: "Marcus Hammarberg"
date: 2016-04-29 12:00:00
tags:
 - Lean
 - Kanban
 - Agile
---

This post could be summaried as you summaries an argument among kids; and then he said, so I replied, and then she went, and I'm like SAY WAAAHHAT?! but also hmmmmm… and then I went back home and asked a few friends and then I went Aaaaaah! 

And then I learned something deeper of what I until that point only was a belief. 

The last week I was in a lively and good discussion, again, about user stories and value. I think user stories often is misused as just another tool to write requirements in. 

Also we discussed that flow is something that we really should strive for, but to what extent? Over value?!

As often, for me at least, it took a few days to think this through. That and some excellent help from some friends and tweeps. 

<!-- excerpt-end -->

I've been proposing, and we have [celebrated great victories](), by doing smaller releases with smaller items. However it causes some trouble and worry in the business side of things; when are these big things getting done? "There's no value in those small things - only when *all* of this big feature is done is there any value." is a phrase I've heard many times already. 

Classic and understandble worries when you start to do small incremental releases often. 

The specific case we discussed was a user story that didn't supply any (perceived) user value. In this case it's a feature that displays data from a third party system… but that system is not ready yet so no data is supplied yet. [Although… see this](#incremental-development).

Also there was talk about purely non-functional stuff like refactoring and other stories. There's no, apparent, customer benefit from that. Nothing that "is shown on the screen" as customer value was defined by one of the members in the group. I **do not** agree with that definition, just for the record. 

Now earlier in the discussion I had referenced Dr Reintersen nice little mnemonic:

> Value trumps flow, flow trumps waste elimination

This little verse is a very good reminder to keep our sights aligned when implementing lean. Lean is not about waste elimination first, as it's often implemented. It's about gaining flow. But flow in itself is not valuable - value is. Fancy that. This is the reason we are here producing values to our customers. 

I love that little phrase, but now it got me into trouble. 

> AHA! But you said 'value trumps flow' before. There's no value in a feature that doesn't display any data. It's better to wait until the entire thing

It was one of those times when I feel the learning flowing into yourself. Or "I was stumped", is another way to put it. 

Although I felt like citing Fletch: 

> It takes a great man to admit when he is wrong. I am not great.

Instead we started another discussion and moved on. 

### A little help from my friends

But as I got home I could not let that incident go. Because in my heart I still feel that it's better to do smaller stuff than bigger. *Even though* they might not produce customer value, I propose that doing small increments of functionality would be better. 

Now **Dr** Reinertsen and the little phrase I've fallen back to so many times proved me wrong. According to that *value* comes first - and it feels very hard to disagree. 

I tweeted [Håkan Forss](https://twitter.com/hakanforss) who is one of the more well-read guys I know on lean things and presented my problem. He's answer was short and sweet, but still telling;

> Yeah, sure value is always better. But it's proven a much easier way to first aim for flow.

He pointed to my (and his) favorite book on lean; [This is Lean](http://www.thisislean.com/) by Per Åhlström and [Niclas Modig](http://www.twitter.com/leanonmyself). In this book there's a very nice way of explaining what lean is really all about. I will just borrow part of it, read the book or [this post](https://hakanforss.wordpress.com/2012/03/26/lean-a-strategy-on-the-path-towards-nirvana/) by Håkan to get a fuller explaination. 

<img src="https://hakanforss.files.wordpress.com/2012/03/image8.png" alt="From https://hakanforss.wordpress.com/2012/03/26/lean-a-strategy-on-the-path-towards-nirvana/" width="100%" />

With this picture the authors of This is Lean wants to explain that Lean is a *business strategy* that aims to takes us to nirvana where resource utilization is optimal at the same time as flow effeiciency is optimal. This is aptly named nirvana because that place is something to aim for, but you probably never get there. Toyota has been working on their way for about 80 years and they are probably best in the world.

Ok - the key word here is *strategy*. A strategy is not a given. Something we *know* will happen. It's a plan - we don't *know* that it will work the best. We *believe* that, but it's still just one strategy out of many. Lean's strategy is to focus firstly on flow and then on resource efficiency. 

### Eeeeeh? Come again? What does that mean?

What Håkan meant with his comment was simply; starting by focusing on getting small things to flow faster has proven an easier way to come closer to nirvana. At least over trying to produce bigger, full featured things firstly and then get that process to go faster and faster. 

To put it in a very concrete setting; it's easier to start to get small "non-value" ([Although… ](#incremental-development)) things flow first, then finding a way to fill them with more and more value - over doing big "value" filled things and just trying to get them to flow faster. 

Saying to a team to try to work faster doing big things is a very tall order indeed, and has in my experience often led to bad quality and short cuts. Instead starting by slicing things up and accepting that some of the things have little or non value. 

### Also - why small always is better

There's another, much deeper running reason why smaller is to prefer; we simply don't know what will work out there. We have to get something out to our users and try it. Why invest many hours in building a perfect but wrong thing, when a much simpler but incomplete feature could show if there's a demand or not. 

Not many business I've come across can be sure about what will work. There are two ways to handle that uncertainty; pretend that you know and just keep building away or try to learn. Fast. 

I'm a proponent of the second alternative. 

## Summary

I was very happy that I ended up in this discussion and condurrum because now I had to ask Håkan and think it through one lap more. And thus I understood some more about why I feel strongly about smaller things always is preferable. 

### Incremental development

Just to be clear I think that there's end user value in that. In fact I think it's a perfect example of a first little releasable feature. If someone input the values directly into the database we could show them on the site. So we could verify that everything works as expected and even use it for parts of our system. 

Is this the finished product? No of course not. But we most likely will learn from that. Maybe the thing we built didn't produce the change in user behaviour we wanted. Hey - good to know before we build the big third party integration. 

This awesome picture by Henrik Kniberg tells the story greatly I think. Notice that the user didn't need a skateboard, he's not particular happy with that, but something got out and we learned from it. Because the last car is not the same as what the user ended up with in the big bang fashion. 

<img src="http://blog.crisp.se/wp-content/uploads/2014/10/Screen-Shot-2014-10-07-at-08.20.00.png" width="100%" alt="http://blog.crisp.se/author/henrikkniberg" />

[Henrik Kniberg](https://twitter.com/henrikkniberg) - a master teacher at work.

