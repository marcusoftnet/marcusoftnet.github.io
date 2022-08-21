---
layout: post
title: 'ÖreDev day \#5 – keynote and morning'
date: '2009-11-06T12:06:00.001+01:00'
author: Marcus Hammarberg
tags: - BDD -
Tools
  - .NET - ÖreDev - NHibernate - Agile
modified_time: '2011-11-09T21:49:22.612+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-7581226974756991164
blogger_orig_url: http://www.marcusoft.net/2009/11/oredev-day-5-keynote-and-morning.html
---


##### Information overload and managing flow

The last day kicks off with a keynote given by
<a href="http://www.hanselman.com/blog/" target="_blank">Scott
Hanselmann</a>, who is one of my "heroes" if you like. I always wanted
to see him live, he is usually informative and really funny. Here is
some off his tips on the subject:

Effectiveness – doing the right things

Efficiency – doing the things right (jumping off a cliff in a efficient
way :))

Triage – sort information. Don’t leave things in your inbox

Do it – drop it – delegate it – defer it = pick one.

Sort your data streams (twitter, email, colleague) into Signals and
Noise

Email that you’re cc:ed on are not as important To:

Mailing list

Don’t check emails in the morning - “If you are the fastest responder to
a problem, you will get all the problems.”

Check email three times a day – for 20 minutes each.

You cannot beat the system by putting in more hours.

Use the <a
href="http://www.marcusoft.net/2009/08/pomodoro-being-agile-and-focused-on.html"
target="_blank">Pomodoro Technique</a> and schedule your work (emailing,
phoning, blogging, coding etc.)

Audit your input and streamline it.

“You can’t cut if you don’t measure” – Scott Hanselmann

Tools

-   <a href="www.rescuetime.com/" target="_blank">Rescue Time</a> –
    introspective retrospectives
-   <a href="http://www.43folders.com/" target="_blank">43 folders</a>
    looks quite messy but powerful
-   Sync to paper – check out <http://pocketmod.com/>
-   Write things down that you want to do during a week. And check that
    the list is done or not at the end of the week
-   <a href="http://www.evernote.com/" target="_blank">Evernote</a>
-   <a href="http://www.rememberthemilk.com/" target="_blank">Remember the
    milk</a> instead of todo.txt
-   Use email rules as above (to:/cc: and calendar invites)

This was very funny and informative. The funniest is that he did
basically the same as the Zen-guru Marc Lesser. But oh so different…

##### The Pair Programming Show

This promise to be great. The first slide says “How to teach pair
programming?” It looks to be, just as the title, as a show. With props
and the whole thing – nice. The presentation is done by
<a href="http://niclasnilsson.se/" target="_blank">Niclas Nilsson</a>
and <a href="http://blog.crisp.se/hansbrattberg/" target="_blank">Hans
Brattberg</a>

Also they promise to show some of the bad things that we can experience
when teaching/learning pair programming.

Pair programming is about; communication, learning and communication. So
be patient, split time with keyboard equal, talk, not show. It’s hard!
But the only way to get everybody up to speed.

Without an engaged navigator you don’t collaborate and share mind. Then
you get any of the advantages of pair programming. A complicated
operation is always performed with two doctors. Would you rather have
one?

There are now giving some
<a href="http://www.agitar.com/solutions/why_unit_testing.html"
target="_blank">great points</a> on why pair programming is feasible and
economical. For example
<a href="http://www.agitar.com/images/defect_chart.gif"
target="_blank">this chart</a>.

It’s easier to stand up for code quality and not “hacking” when you are
two people together… Also it’s harder to hide technical debt.

They had an excellent summary slide of benefits with too much for me
reloop here.

##### Breaking out of dependency hell

This talk is given by a tired
<a href="http://www.ayende.com" target="_blank">Ayende</a>. He has
promised to use his designated victim method… Better stay alert.

He talked about the use
<a href="http://en.wikipedia.org/wiki/Dependency_injection"
target="_blank">Dependency Injection</a>,
<a href="http://en.wikipedia.org/wiki/Inversion_of_control"
target="_blank">Inversion of Control containers</a> and
<a href="http://en.wikipedia.org/wiki/Convention_over_configuration"
target="_blank">Convention over configuration</a> to manage solution
complexity.

Using a Inversion of Container will make us feel like you lose control
of your dependencies. And that is the whole idea – if you micro-manage
your dependencies will give you a static system that is hard to change
(<a href="http://www.oodesign.com/open-close-principle.html"
target="_blank">Open-Close-principle</a>, open for extension but closed
for modification).

Another benefit from using an IoC is that you get opportunity to use
<a href="http://en.wikipedia.org/wiki/Aspect-oriented_programming"
target="_blank">aspect-oriented programming</a>, to handle cross cutting
concerns.
