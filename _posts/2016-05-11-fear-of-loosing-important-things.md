---
layout: post
title: "Our fear of forgetting important things"
author: "Marcus Hammarberg"
date: 2016-04-29 12:00:00
tags:
 - Lean
 - Kanban
 - Agile
 - Life of a consultant
---

The last couple of weeks an old "friend" has made its appearance: *fear*. This time it is a special kind of fear that I've seen many times in organizations that started their agile journey: the *fear of forgetting important things*.

In this post, I wanted to talk a little bit about that just as a concept and then give a few pointers and indicators on what you can do to get rid of that fear.

## What's with this fear really?

Often this particular fear manifests itself by very long lists of work not done, or backlogs that just go on and on. I've seen lists of more than 500 items, some of them more than 3 years old.

And yes - they are all important. Prioritized but important.

## We don't want to lose it

Often when I ask about why we should keep it there, the answer is something along the lines:

> It's good to have it there so that we don't lose it.

Now, that's a worthy cause, but totally irrational. Because how can you lose or forget to do something that is important?

If you forget an item it's per definition not important. In Swedish important ("viktigt") is related to the word "has weight". The [Webster Dictionary](http://www.merriam-webster.com/dictionary/important) defines important as:

> having serious meaning or worth : deserving or requiring serious attention

Something that I forget doesn't have "serious meaning or worth" - then I wouldn't forget it. At least not if I knew what our goals are.

### There's so much work done in it

Sure there might be loads of work done in old requirement documents and things that we have talked about, drawn, thought long and hard about etc. etc.

The only sad part is that the world around us is not the same. We have most likely made changes in the system that we are going to implement the feature in. Or the systems around ours have changed. Or the people have changed.

I have a little question that I ask people to show that requirements rot, and to try to find the best-before-date

> If I write a requirement on a paper here and put it on this table. Would you want to start implementing it in 1 year without changing or looking at it? 6 months? 3 months?

The most common answer is around 1-3 months depending on the requirement. Because (most) everyone realizes that requirements rot. Therefore, we want to write as little as possible (just as with code, by the way) to remember the conversations we had, **and** we want to do that as close as possible to the implementation of the feature.

But that requires that you know your goals and strategies for getting there.

### It's been waiting so long

This is another very common objection. "They have waited for such a long time", "We talked about this several years ago" etc.

First of all that ties into what I mentioned above about requirements and ideas rotting over time, but secondly; this has waited the longest is probably not a very wise business priority.

We are here now. The world looks like this. These are our goal and here's the strategies we are working with right now. Given all that; what is now the most important thing we can do to get us closer to our goal.

## Strategies and tools

I will not analyze too much about why this happens but I think it's a residue from the time when you got one change per 12 months to change your mind. That work had to be perfect and could not be changed. So we put in a lot of work into it and if someone (like I'm doing) would say: bah - that's not important. Well, then that would hurt. Plenty.

I get that. But we are now, most of us, moving much much faster than that. Hey - even business strategies for online business are not that long-lived. You often get a chance to say what is the next most important thing several times a month. Releases several a week. Or per day even.

However, that requires a very different approach to how to handle requirements and initiatives on what to do next. Just as many things will change once you start to iterate faster, so will this part of your process.

If you read closely above you might have noticed that I repeated a few things. That was not by accident. Because instead of getting detailed control on the *how* and *what* control will shift to steering more from the *why* part. Why are we doing this? What does success look like? What business metrics do we want to affect?

This is the "change in the world" (Jeff Patton) that we want to achieve. The What/How part of how it's implemented is not very interesting. If we can accomplish the change in a radically different way than first envisioned, and in doing so writing less code, that would be **awesome**.

Code is cost, as [Dan North](https://dannorth.net) puts it. And quite frankly so is everything we do in order to produce *working software in production, used by users*. That last part is the value.

### Impact map

One of the more powerful tools I've seen to handle the overarching strategies and highlight the *why*-part of development is [Impact mapping](https://www.impactmapping.org/).

It's basically a very simple mind map showing **Why** we are doing something - what is the impact we are trying to achieve, **Who** we need to influence to make that change, **How** do we need to change their behavior and finally **What** do we need to build to accomplish that change.

![Impact mapping in a nutshell from www.impactMapping.com](https://www.impactmapping.org/assets/im_template.png)

There's an [awesome book and site](https://www.impactmapping.org) and I urge you to check this out. It's a great tool for any product owner.

### Story mapping

Right now I'm reading a book on [Story mapping](http://jpattonassociates.com/user-story-mapping/), a book and tool by Jeff Patton, that I'm somewhat familiar with. This tool is great because it tells the high level story of what a system is trying to accomplish but also drills down into the details for each story.

![User story mapping from http://jpattonassociates.com/user-story-mapping/](http://jpattonassociates.com/wp-content/uploads/2015/01/StoryMapping.png)

Another thing that I really like about User story mapping is that it encourages us to do small things, in a way that we don't lose track of the overall picture.

This is another great book and tool that you should really pick up if you're into agile product development or doing any lean work within your organization.

### Backlog as a mindmap

Similar to both of the tools above is simply to just visualize your backlog as a mindmap. Just a mindmap over the features of the system and how they are related. Then just show with some simple indicators where you are working today, what is done, what scares you etc.

I tried this in one team I was helping. Their task was "the complete platform rewrite" and understandably people around them got worried about their progress and started to ask many questions and require a lot of reporting. Even the management team of the company showed big concerns.

The product owner and a few other guys just got into a room and drew a big mindmap over the areas in the system and filled out details for what they were doing now and what was done, what was next. They even had some icons (dragons) for stuff that they were unsure about.

You can see the mind map below:

We then brought the management team into the room with the mindmap and simply asked:

> Tell us how we are doing

From this simple visualization they could actually answer all questions they had. It was a very powerful technique to make sure that you had the overview and overall progress before your eyes, without adding any extra reporting burdens.

## Summary

I think that our fear of forgetting important things is irrational, but hinges on us trying to use old tools in a new way of working.

We can get the same, and much better, control of what is the next important thing to do using other tools.
