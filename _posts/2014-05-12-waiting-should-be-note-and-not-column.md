---
layout: post
title: “Waiting” should be a note and not a column
date: 2014-05-12T06:46:00.001Z
author: Marcus Hammarberg
tags:
  - Tools - Team Yayasan  - Lean
  - Life of a consultant
  - Kanban
  - Agile
modified_time: 2014-05-12T06:46:20.318Z
thumbnail: http://lh4.ggpht.com/-ackfKbH6pEU/U3BuGyHsEFI/AAAAAAAADbE/gnl-qSLU6Og/s72-c/example1_thumb%25255B66%25255D.png?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-3379764614197030165
blogger_orig_url: http://www.marcusoft.net/2014/05/waiting-should-be-note-and-not-column.html
---


Quite often when you create a visualized version of your workflow you
end up with a waiting column. This is where items goes while your are
waiting for someone else, or something else to happen before you can
continue to work on it.

It might look something like this on your board:

[<img
src="http://lh4.ggpht.com/-ackfKbH6pEU/U3BuGyHsEFI/AAAAAAAADbE/gnl-qSLU6Og/example1_thumb%25255B66%25255D.png?imgmax=800"
title="example1"
style="border-top: 0px; border-right: 0px; background-image: none; border-bottom: 0px; float: none; padding-top: 0px; padding-left: 0px; margin-left: auto; border-left: 0px; display: block; padding-right: 0px; margin-right: auto"
data-border="0" width="310" height="230" alt="example1" />](http://lh4.ggpht.com/-34LizO1_ViA/U3BuEwQYwLI/AAAAAAAADa8/Fo6A52mGN8A/s1600-h/example1%25255B68%25255D.png)

For example, you are writing a report and need it feedback on the report
before you can continue. Sadly that person (Daphne, let’s call her that)
that can give you feedback is sick, so you’ll have to wait until Daphne
is back again. You are blocked for this item and cannot complete it.
(Coders, exchange the word “report” for “module” and you’ll be able to
tag along <img
src="http://lh5.ggpht.com/-Acf6q22vbek/U3BuHeY7HVI/AAAAAAAADbM/5hPnJ7txGJE/wlEmoticon-smile%25255B2%25255D.png?imgmax=800"
class="wlEmoticon wlEmoticon-smile"
style="border-top-style: none; border-bottom-style: none; border-right-style: none; border-left-style: none"
alt="Smile" />). You move the sticky to the waiting column and pull the
next one…

This is a bad idea. Waiting-columns is a place where work items goes to
die. Slowly.

I have now explained the contents of this blog post to a number of
teams, although it’s simple, and thought that I should write it down so
that I don’t have to restate it over and over.
First if you move the sticky out of the Doing column you are losing
information about it’s current status. It’s now not Doing it’s waiting.
For all but the very trivial boards (as above) this is a problem when
you are unblocked again. Most board have, and should have more column to
more fine grained describe the stages of your workflow. To do, Analyze,
Developing, Testing, Deploying and Done is another quite trivial
example, but a bit better.

[<img
src="http://lh5.ggpht.com/-CmWYAnzpf3A/U3BuI1XFlGI/AAAAAAAADbc/e5uPhb6hhaQ/example2_thumb%25255B114%25255D.png?imgmax=800"
title="example2"
style="border-top: 0px; border-right: 0px; background-image: none; border-bottom: 0px; float: none; padding-top: 0px; padding-left: 0px; margin-left: auto; border-left: 0px; display: block; padding-right: 0px; margin-right: auto"
data-border="0" width="457" height="104" alt="example2" />](http://lh4.ggpht.com/-IywtStJADOM/U3BuIMoP_5I/AAAAAAAADbU/Pmf0Pikh1Mo/s1600-h/example2%25255B116%25255D.png)

For the record, these trivial examples might be useful. The first one is
the default for many
<a href="http://www.personalkanban.com/" target="_blank">Personal
Kanban</a> boards, and this second example is a great starting point for
software development team. But we should change it as needed.

Let’s say that Daphne is sick for three weeks. Plenty of time for you to
forget where that sticky actually was, let alone what it was about.

Secondly, when you move the sticky to the Waiting-column it’s just
Waiting. You really don’t know why, for what or how long it’s been
there. It’s like a cemetery for work items, or at least a waiting room
for the care taker.

Thirdly (related to no 2), when should that item be move out of there?
What if that takes much more time than you first expected? How could you
know when it’s time to act and when it’s not?

I’m sure you can come up with more items if you wanted to. Here’s is my
suggestion for what to do instead.

# What to do instead

The habit that I’ve grown into is to **not** move the work item note but
rather put another, waiting note on top. On this little note I can write
the reason for me being blocked and also track the number of days I’ve
been waiting. Like this, for example:

[<img
src="http://lh4.ggpht.com/-N7NI9w1rDEo/U3BuK_7QjcI/AAAAAAAADbs/Pz4g1g2EBAI/2014-05-12%25252011.45.04_thumb.jpg?imgmax=800"
title="2014-05-12 11.45.04"
style="border-top: 0px; border-right: 0px; background-image: none; border-bottom: 0px; padding-top: 0px; padding-left: 0px; border-left: 0px; display: inline; padding-right: 0px"
data-border="0" width="244" height="148" alt="2014-05-12 11.45.04" />](http://lh6.ggpht.com/-oJWRyS_ORrs/U3BuKMGhNNI/AAAAAAAADbk/MTZ8c4psWUI/s1600-h/2014-05-12%25252011.45.04%25255B2%25255D.jpg)

This means that the original work item card is intact with all it’s
attributes to describe it:

- the description is beneath the waiting note and I can have a look at
    it if I need to remember what it was about
- my avatar is still on there so I know who will check in on the
    progress of this matter
- the work item is still in the same column so we know how far it has
    progressed
- we have created a little dot for each day we have been waiting for
    Daphne. Maybe we have a policy not to wait more than 5 days before
    trying something else. Or, we can use this number as material for an
    improvement discussion with a third part, or another department:
    “Hey, review guys, we have been tracking some data for awhile and in
    average we are waiting for you to review our things 6 days. That’s,
    also in average, 60% of our total lead time of 10 days. Can we
    discuss this? How can we help you?”

There’s nothing really earthshattering about this, and most teams get
here after awhile, but now you can take the shortcut here and improve
further.

# Callbacks on your board

Oh yeah, one more thing. I once met a team that was waiting a lot. In
fact, if I remember correctly, they had a waiting stage between every
doing stage in their workflow. And it was maybe 80-90% of the total
time. It looked like this, kind of:

[<img
src="http://lh3.ggpht.com/-wHK4upZ3_X4/U3BuMSkBQ4I/AAAAAAAADb8/AE8nIx0F33U/longwait_thumb%25255B250%25255D.png?imgmax=800"
title="longwait"
style="border-top: 0px; border-right: 0px; background-image: none; border-bottom: 0px; padding-top: 0px; padding-left: 0px; border-left: 0px; display: inline; padding-right: 0px"
data-border="0" width="494" height="126" alt="longwait" />](http://lh5.ggpht.com/-g1Koiap-4Ps/U3BuLa9rloI/AAAAAAAADb0/ue-MICMUtkg/s1600-h/longwait%25255B252%25255D.png)

I hope that no one of you end up in a state like that. There’s a time
and place to stop waiting as well. If you end up waiting for each thing
you do, maybe you should do them differently?

When programming JavaScript and Node programming, there’s a lot of <a
href="www.marcusoft.net/2014/03/javascript-callbacks-cant-live-with.html"
target="_blank">calling back</a> taking place. That is, you start
something that takes time and as the third party performing the work to
call you back when they are done. In the mean time your application are
freed up to do something else, like answering the next request for
example.

When the other party has finished processing his thing (saving something
to a database for example), he’ll ping you back with an status about the
work being done.

I think this can be used as a model for how we can design our work in
situations when we end up waiting a lot. Do the first part of the work,
send it to the third party to do their part (Daphne doing review in our
case) and tell them to call you back when they are done. Your first item
is done and you can go on to something else.

Once Daphne is done she’ll tell you that your report looked great,
here’s a few spelling errors and then you can print it (or whatever).
You now create a new work item, put it in the queue to be worked on, do
the work when your capacity allows and then complete the report.

### Objections

> No wait a minute here… What if Daphne doesn’t call me back?

Well… maybe it was not important then? The wait-work-wait-team I
mentioned above was waiting for 4 months in one instance, to get
decision in how a bug should be treated. If you haven’t answered in 4
months – it is not important!

If it is important she will come back.

> No wait a minute here… What it’s important to me and not to Daphne?

Well, don’t move it off the board then, but use the suggestions from
above. One tool is seldom good for all things.
