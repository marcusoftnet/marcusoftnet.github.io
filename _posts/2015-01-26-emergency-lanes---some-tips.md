---
layout: post
title: Emergency lanes - some tips
author: Marcus Hammarberg
date: 2015-01-26T09:20:05.000Z
tags:
  - Agile
  - Kanban
  - Scrum
---

One of the things that first made [kanban](http://bit.ly/theKanbanBook) known and loved was the introduction of emergency lanes. Or at least the lack of fixed scope for a sprint where sudden urgent work items was hard to handle in other methods.

Many kanban boards have an emergency lane. However often I see it abused (or being feared to be abused) and hence it will not be as useful as it could be. It's a really great tool, both for "product owners" and the team alike. In this post I wanted to share some policies that I've found useful to manage emergency-lanes (or equivalent).

<!-- excerpt-end -->
# Emergency lanes

The rationale behind having a emergency lane is that sometimes works comes in that is truly is an emergency and it then feels a bit strange to put it a Todo-column and wait until it's time for it.

Emergency is emergency. And since an emergency is an emergency then we need to treat it as such.

It's just common sense. The lane is just a formalization of what you'd do in an emergency anyway. Picture the scene: everyone is happily working along and then someone from support comes running. He skids to a full stop at your desk screaming; "The discount calculations are completely off. Everyone gets 90% discounts right now. We're losing money by the second!"

What would you do?
You would not put it in the Todo-column at the bottom and then tell the man to wait for, "Oh I don't know... 2-5 days", and then go back to whatever you are doing.

No - we would drop everything, involve everyone we need to figure out the bug and then start to fix it. If business rules needs to be changed, we'd pull people from meetings, testing would be done before testing of anything else and this would be deployed "off schedule".

Emergency is emergency.

# Class of service

The "emergency" work above is what's known as a class of service. That's is a classification of certain types of work and the policies on how to treat them.

Often this is visualized as a separate lane on the board. It should also have some policies attached to it so that we know how it should be treated.

Even though it's a class of service I've noticed that many teams tend to refer to it as "the emergency lane". So I will do that in this blog post to.

# Common policies

Here are a few principles that I've used and seen used by teams I've coached. Not a single team have implemented all of these principles - experiment and choose what works best for you.

## Have a lane of it's own

To distinguish the emergency (or urgent) work from other work many teams creates a separate swim lane. Some teams also write the work on a separate colored sticky (pink or red) to make it stand out.

## Prioritized over all other work

If there's work in the emergency lane that work has highest priority. That means that we drop whatever we are doing right now and try to help move the emergency work forward.

If I cannot help I can go back to my ordinary work but should be ready to be pulled in again.

For example; if I work with testing and cannot directly help in resolving the issue I might prepare a testing environment to test the fix in. And start reading up on the test cases. Or automate them. Just to be ready to test the fix fast once it's time to test it.

## Doesn't count against WIP limits

This policy also means that we do *not* count these items against the WIP limits on the board. Should a column have a WIP limit of 2 and we have 2 items in there, we happily pull this in as it's prioritized over all other work. We leave the original items in their place, so we can come back to them.

## One at the time

There can only be one emergency going on at the time. This follows naturally by the last "Prioritized over all other work"-policy but this can also be abused.

Basically we are increasing our Work In Process for a short while during the life time of the emergency. In doing so we are, according to the mathematics in [Littles Law](http://en.wikipedia.org/wiki/Little%27s_law), slowing the other work in our process down.

This is the *toll* or *fee* we are paying for flowing one item faster; we're slowing the other work down. In the case of an emergency that's of course ok, but it cannot be the normal case.

## Max X per month / week

Some teams have a limit on how many emergencies there can be in a month or week. This can be visualized as check boxes next to the emergency swim lane. When an emergency is added we check one box.

The idea is to make us think a little bit harder before jumping into calling it an emergency; "Hmmm... that would be the second emergency we use this month. It's only the 8th... And we only have 2 left then. Is it worth it? Or should this just be ordinary work?"

## Obligatory retrospective

A very useful and reasonable practice is to always hold a retrospective after an emergency. I've even seen that as a separate step for emergency items.

First of all; we should strive to treat emergencies as anomalies. They should not happen. So if they do we still want to know [why](http://www.marcusoft.net/2015/01/things-i-say-often-why.html) it happened and see what we can do to prevent it happening again.

Also I've seen this act as something that make us think about if it is an emergency or not. "If you put it in here as an emergency... we will call you to an retrospective when it's done. You have to come - such are the rules of emergency items, you know."

# The 'now everything will be an emergency'-fear

With the policies above in place much of the biggest fear from development teams around emergencies lanes goes away. I've yet to introduce emergency lanes to a team without seeing two gut reactions:

- product owner eyes glitter: Yes - fast lane to production!
- development team bummed out: No - now everything will be an emergency!

I have also yet to see this fear becoming reality. Not in a single team, where I've tried this, have the fear become reality.

# A story about escalating principles

In one team I was a member of we had a micromanager as product owner. No, he wasn't really small but rather he handed out the tasks to each person according to what he wanted them to work on. The result was a resigned team and really disruptive work.

I asked the product owner if I could create a visualization for the team, so that we all knew what we where working on. He liked the idea. The board was very basic;

- Todo
- Development
- Testing
- Deployment
- Verification - we called the product owner to verify the function in production
- Done

I told him that he owned the Todo-column. He could do whatever he wanted with the items in there. Reorder them, remove or add. The only rules was that the items was prioritized from top to bottom and he could not have more than 6 items in the column.
He agreed.

We also added an emergency lane and implemented the principles mentioned above; specifically we had the rule of 1 item at the time, prioritized above all other work and max 3 items per week. He was now ecstatic.
And the team was happy too - the got a much nicer situation once they had started to work with something.

But really we've given the product owner a very nice three level escalating procedure for work:

- If it's an emergency he could put it in the emergency lane. The team would then drop everything and go to work on it. But he could only do that 3 times per month. As intended he used these very scarcely
- If it was urgent but not an emergency he could put it into the Todo-column on top. The team would then pick it up as soon something else was finished. That meant within a couple of days. In the beginning he used this option a lot. After awhile that calmed down a bit since he felt "like it was destroying my abilities to predict and plan"
- For normal work he just added it at the bottom of the Todo column as the team pulled in new work into Development.
