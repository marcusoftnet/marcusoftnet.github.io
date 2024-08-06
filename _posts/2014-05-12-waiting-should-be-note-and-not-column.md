---
layout: post
title: "“Waiting” should be a note and not a column"
date: 2014-05-12T06:46:00.001Z
author: Marcus Hammarberg
tags:
  - Tools
  - Team Yayasan
  - Lean
  - Life of a consultant
  - Kanban
  - Agile
modified_time: 2014-05-12T06:46:20.318Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-3379764614197030165
blogger_orig_url: http://www.marcusoft.net/2014/05/waiting-should-be-note-and-not-column.html
---

Quite often when you create a visualized version of your workflow you end up with a waiting column. This is where items go while you are waiting for someone else, or something else to happen before you can continue to work on it.

It might look something like this on your board:

![example1](/img/example1_thumb%2525255B66%2525255D.png)

For example, you are writing a report and need feedback on the report before you can continue. Sadly, that person (Daphne, let’s call her that) who can give you feedback is sick, so you’ll have to wait until Daphne is back again. You are blocked on this item and cannot complete it. (Coders, exchange the word “report” for “module” and you’ll be able to tag along :smile:). You move the sticky to the waiting column and pull the next one…

This is a bad idea. Waiting-columns are a place where work items go to die. Slowly.

I have now explained the contents of this blog post to a number of teams, although it’s simple, and thought that I should write it down so that I don’t have to restate it over and over. First, if you move the sticky out of the Doing column, you are losing information about its current status. It’s now not Doing, it’s waiting. For all but the very trivial boards (as above), this is a problem when you are unblocked again. Most boards have, and should have, more columns to more finely describe the stages of your workflow. To do, Analyze, Developing, Testing, Deploying, and Done is another quite trivial example, but a bit better.

![example2](/img/example2_thumb%2525255B114%2525255D.png)

For the record, these trivial examples might be useful. The first one is the default for many [Personal Kanban](http://www.personalkanban.com/) boards, and this second example is a great starting point for a software development team. But we should change it as needed.

Let’s say that Daphne is sick for three weeks. Plenty of time for you to forget where that sticky actually was, let alone what it was about.

Secondly, when you move the sticky to the Waiting column, it’s just Waiting. You really don’t know why, for what, or how long it’s been there. It’s like a cemetery for work items, or at least a waiting room for the caretaker.

Thirdly (related to no 2), when should that item be moved out of there? What if that takes much more time than you first expected? How could you know when it’s time to act and when it’s not?

I’m sure you can come up with more items if you wanted to. Here’s my suggestion for what to do instead.

## What to do instead

The habit that I’ve grown into is to **not** move the work item note but rather put another, waiting note on top. On this little note, I can write the reason for me being blocked and also track the number of days I’ve been waiting. Like this, for example:

![2014-05-12 11.45.04](/img/2014-05-12%2525252011.45.04_thumb.jpg)

This means that the original work item card is intact with all its attributes to describe it:

- The description is beneath the waiting note, and I can have a look at it if I need to remember what it was about.
- My avatar is still on there so I know who will check in on the progress of this matter.
- The work item is still in the same column, so we know how far it has progressed.
- We have created a little dot for each day we have been waiting for Daphne. Maybe we have a policy not to wait more than 5 days before trying something else. Or, we can use this number as material for an improvement discussion with a third party or another department: “Hey, review guys, we have been tracking some data for a while and on average we are waiting for you to review our things for 6 days. That’s, also on average, 60% of our total lead time of 10 days. Can we discuss this? How can we help you?”

There’s nothing really earth-shattering about this, and most teams get here after a while, but now you can take the shortcut here and improve further.

## Callbacks on your board

Oh yeah, one more thing. I once met a team that was waiting a lot. In fact, if I remember correctly, they had a waiting stage between every doing stage in their workflow. And it was maybe 80-90% of the total time. It looked like this, kind of:

![longwait](/img/longwait_thumb%2525255B250%2525255D.png)

I hope that none of you end up in a state like that. There’s a time and place to stop waiting as well. If you end up waiting for each thing you do, maybe you should do them differently?

When programming JavaScript and Node programming, there’s a lot of [calling back](www.marcusoft.net/2014/03/javascript-callbacks-cant-live-with.html) taking place. That is, you start something that takes time and ask the third party performing the work to call you back when they are done. In the meantime, your application is freed up to do something else, like answering the next request, for example.

When the other party has finished processing his thing (saving something to a database, for example), he’ll ping you back with a status update about the work being done.

I think this can be used as a model for how we can design our work in situations when we end up waiting a lot. Do the first part of the work, send it to the third party to do their part (Daphne doing review in our case) and tell them to call you back when they are done. Your first item is done, and you can go on to something else.

Once Daphne is done she’ll tell you that your report looked great, here are a few spelling errors and then you can print it (or whatever). You now create a new work item, put it in the queue to be worked on, do the work when your capacity allows, and then complete the report.

### Objections

> No wait a minute here… What if Daphne doesn’t call me back?

Well… maybe it was not important then? The wait-work-wait team I mentioned above was waiting for 4 months in one instance, to get a decision on how a bug should be treated. If you haven’t answered in 4 months – it is not important!

If it is important she will come back.

> No wait a minute here… What if it’s important to me and not to Daphne?

Well, don’t move it off the board then, but use the suggestions from above. One tool is seldom good for all things.
