---
layout: post
title: What does technical debt feel like?
author: Marcus Hammarberg
date: 2017-08-07T09:15:24.000Z
tags:
  - Agile
  - Lean
  - Programming
---

The other day a man that I respect very high, [Jabe Bloom](https://twitter.com/cyetain), tweeted a question:

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Dear tweeter friends.<br><br>In a tweet or two... could you describe what Technical Debt /feels/ like? <a href="https://twitter.com/hashtag/twitterBasedResearch?src=hash">#twitterBasedResearch</a><a href="https://twitter.com/hashtag/plsRT?src=hash">#plsRT</a></p>— Jabe Bloom (@cyetain) <a href="https://twitter.com/cyetain/status/893803861189767172">August 5, 2017</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
I tweeted a response but that question got me thinking. I wanted to expand a little bit further than a tweet and this post is where I did that.

<!-- excerpt-end -->

No-one ever wants to create technical debt. Some of it is created accidentally since we learn new things, requirements and learn about how the feature is performing in the real life.

For example, you have most likely said or heard the following:

> Oh?! The product id can be blank?

> What - why don't they fill that part out?

> Whoa! That page got A LOT more traffic than we estimated. We need to optimize those database calls. Now!

All of those "What?", "Oh?" or "Whoaaaa!" are indicators that you will soon get an opportunity to learn and clean up your code base. Technical debt has been discovered. There will be great rejoicing and celebration when we have made it better.
But my experience is something different. By far the most common creation of technical debt (in my experience) is choices we make or are made to make.

In these case you will hear dialog like this:

> Dev: We really need to fix this or this will break horribly in the future

> Boss/Project manager/Product owner: Sure, but could you work around it for now?

> D: Yes, but then you have to PROMISE that we get to do it later.

> B: Sure...

> D: No! Promise!

> B: I, your boss, PROMISE.

You know what? It never gets fixed. And then the problem happens. Blame is dished out. Another emergency fix gets done and some more technical debt gets created. It's documented in new features that never that we are promised to do get time to do later.

All with the best intentions. From both sides.


The original question was - how does technical debt **feel?**

For me, that feels like we have been tricked or ripped off. And it has happened many times so we feel even more stupid for walking into the same "trap" again and again.

It's very sad but also close to reality. In my experience.

The only times I have not experienced those events are in companies driven by developers-gone-product-managers. That knows the problems of building up technical debt. And in those companies technical debt is treated as unfinished code:

> Everything is done but the code is only covered to 30% with unit tests
>
> Ok - tell me when that is up to at least 80% so that we can deploy.
Now most people making the decision to not address technical debt are of course not stupid or un-teachable. It's just that the pressure from other sources (dead lines, contracts, and promises to higher authorities in the organization) is higher.

Related is probably the fact that we are in the **soft**ware business. You would never create hardware that has technical debt.

> Yeah, this food processor works, but we've never tried it longer than 30 seconds at the time.
>
> The steering should work now.
>
> Yup - the TV has a great picture, but we had to do with wires rather than on a circuit board as we normally do. Let's ship!

With software, we can defer some very important decisions to later. I'm not sure it's a good idea though.

# Conclusion

The best time to handle technical debt is … now. When you write the code. It will never be a better time at least. It might be another time, but never a better time.

I have never experienced a situation where technical debt (that we know of) is easier to fix a few weeks (months, years) down the line.
Here's my response to the [original tweet](https://twitter.com/cyetain/status/893803861189767172) for reference:

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Like being ripped off; problems from shortcuts we were asked to take, promised to get time to fix later and getting blamed for when it fails <a href="https://t.co/SQV9xgi2TO">https://t.co/SQV9xgi2TO</a>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
