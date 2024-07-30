---
layout: post
title: Low WIP, Hairdressers, and Lean Operation Strategy
date: 2013-05-29T13:38:00.003Z
author: Marcus Hammarberg
tags:
  - Lean
  - Kanban
  - Agile
modified_time: 2013-05-29T13:38:40.861Z
thumbnail: /img/Screen+Shot+2013-05-29+at+10.13.46+.png
blogger_id: tag:blogger.com,1999:blog-36533086.post-5197645370134929012
blogger_orig_url: http://www.marcusoft.net/2013/05/low-wip-hairdressers-and-lean-operation.html
---

I was at the hairdresser yesterday. I'm not very particular about my hair, but it was starting to look a bit like this:

![Dolph](/img/dolph-lundgren-flat-top-rocky.jpg)

When I want it to be more like this guy to the left.

The conversations at most hairdressers in Sweden are not very interesting, mostly due to the fact that I'm not interested in hair, particularly mine. So while I was seated in the chair, thoughts from some discussions on prioritization and flow for a team at a client came to mind.

Low WIP and flow are concepts that are well understood and often implemented at this particular client, but the implications of such a strategy were interesting. And, oddly enough, I saw some great strategies implemented at my hairdresser.

I sat down with some guys, and we talked about [Mob Programming](http://mobprogramming.org/) as they had read my [blog post on the topic](http://www.marcusoft.net/2013/05/nothing-beats-give-crap-but-you-cannot.html). Specifically, we talked about the great flow of work that would arise from having everyone work on one and the same thing at the same time. A WIP of 1.

I said something like:

> If you have all the people in the room needed to solve the problem at hand, there's no way to get better flow than doing that.

Of course, someone objected. His choice of words was very interesting:

> Yes - but it would be very inefficient.

He was right and wrong at the same time.

### Flow Efficiency Versus Resource Utilization

![This is lean](/img/Screen+Shot+2013-05-29+at+10.13.46+.png)

In the great book [This is Lean](http://thisislean.com/) (read it now... I mean right now. Stop reading this blog and pick up the book - I won't be offended), they use an illustration to explain what Lean really is. It's just a simple diagram, like the one to the right.

I won't go into all the details on how to explain what Lean is here. For now, we can just understand "Resource efficiency" as making sure that our resources or people are utilized to the max. Maximizing "Flow efficiency," on the other hand, is making sure that work is flowing through our process as fast as possible. Read my friend [Håkan Forss' post on the topic](https://hakanforss.wordpress.com/2012/03/18/the-balancing-act-of-getting-to-process-efficiency-nirvana/) instead. But this gives us a great framework to discuss our topic at hand.

Because with a team doing mob programming, you would have great flow efficiency. Work could not be moving along faster than that. But, as my colleague said: "That's not very efficient!" No - not from a resource efficiency perspective.

And herein lies the crux of the matter: Lean is a strategy that helps us find a good balance between the two axes in our diagram. Lean does that by focusing on flow efficiency first and then resource efficiency.

### Firemen, Mob Programmers, and Hairdressers

What does that mean in practice then? Well, if it was as easy as to always maximize only flow, then we could just let the whole company do one single thing. But we don't do that. Because that would mean that a large percentage of the company would not do anything productive. On the other hand, the moment we needed anyone to help the work to flow, they would have time ready since they're just waiting around.

That's very expensive and is not used in many settings. High-risk settings are places where you could find very low WIP. The fire department, for example; they mostly sit around and wait for work ("put out fire") to do. We, as a society, gladly pay them to since the risk of them being busy with other things when we call them is something that we shy away from.

But do they really just "sit around"? No, they train, they maintain their equipment, and do a lot of preventive work (education, for example). And pose for calendars. But, rest assured, if a fire alarm goes off, they put everything down and run for it.

What about software development teams? If we have a complete team in the room with a single keyboard, is everyone active? No, not typing. There might even be specialists (designers, database experts, or business analysts, for example) that can zone out and maybe even do other stuff. As long as they can leave it and join the group when we need them, that's quite alright.

They might even do stuff that helps us move things forward faster. Instead of being nervous about "not having something to do," you should see if you can help move work forward.

![Kid hair cut](/img/image001.jpg)

When I was sitting in that strange hairdresser chair, which always makes me feel like I'm strapped down against my will, I was getting my hair cut. All of a sudden, a customer entered the shop. What did the hairdresser do? She was cutting my hair. I got her spending time. On the other hand, this customer wanted to buy some wax or maybe book an appointment later.

Of course, she stopped cutting my hair for a while and went over to the customer. She served the customer and then went back to me. But how did she know what to do? Why did she prioritize the new customer over me? If she did that five times in a row, I would feel scuffed... but so would the customers that she didn't attend.

### Value, Flow, and Waste Elimination

There's a quote from [David J. Anderson](http://www.agilemanagement.net/) (I think) that sums up the strategy here:

> Value trumps flow, and flow trumps waste reduction.

That quote is deceivingly simple, but here's how I understand it. Waste reduction is great since that gives us better flow. We want to try to get better flow of work through our process as much as we can. Even more so than reducing waste. That is, if we can get better flow by adding waste, that might be the way to go.

For example, adding the "waste" of having a lot of programmers in the same room working together on the same problem is wasteful from a resource utilization perspective. But that's alright since it's great for our flow. Until the point where we find it too expensive.

But wait - what if someone walks into the room and says that there's a safe full of money lying out on the street. The only thing we would have to do is to stop what we're doing now and go out there and get it. We could then reason about how much value that would give us compared to the time we put in, and consequently the decrease in flow. And then go out, with the whole team, and get the safe.

That's what the hairdresser did as well. As the new customer entered the shop, she thought:

> "I can sell this guy a can of wax in 30 seconds. Or book a new time that will give us 300 SEK in a week in a minute. This guy, that obviously doesn't care about his hair anyway, can wait for me. And the others waiting to have their hair cut will probably not mind being bumped 30 seconds."

If this customer would turn out to take more than five minutes, she would probably drop the service and ask him to come back. And if 15 people entered the shop at the same time, she could ask for help from other hairdressers in the shop. Or ask me if it was okay to wait.

These policies were probably implicit. Or they might have been written on the wall in the coffee room. I don't know. That doesn't matter. She did.

### Conclusion

What are you optimizing for? Do you know your team's prioritizations? Do you know when to break them? Do you know why? Can you make these policies more explicit to help your team?
