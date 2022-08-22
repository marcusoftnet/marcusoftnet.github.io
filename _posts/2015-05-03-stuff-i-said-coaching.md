---
layout: post
title: Stuff I said coaching
author: Marcus Hammarberg
date: 2015-05-03T15:35:18.000Z
tags:
  - Agile
  - Life of a consultant
  - Lean
  - Kanban
  - Things I say often
---

I had the great joy and exciting opportunity to do a agile coach gig the other week. In Kuala Lumpur for [Nintex](http://www.nintex.com/).

It was a really fun time and as usual I learned a lot on the way. I only hope that I could share a lot in the process.

When you're in front of people... that's where you all of a sudden find yourself saying things that you have not heard come out of your mouth before. It's really interesting because it's like the abstract ideas you have needs to be concertized and then some new things can come out. In another way than before, or emphasized differently.

In this post I wanted to summarize some of the things that I said during the 3 days I spent with the teams there.

<!-- excerpt-end -->

# Only teaching is not enough

First of all I learned something new about the whole setup. I have done a lot of presentations on [kanban](http://www.marcusoft.net/tags/#Kanban) and quite often I get the feedback that the examples was not concrete enough, or "didn't fit our situation".

This time I had a great opportunity to improve on that; the person that brought me to Nintex ([Christian Hope](https://twitter.com/frglps)) had the great idea to do 3 days. That gave me one day to do the normal introduction question and then some 1 on 1 time with each team. It proved to be a great recipe for success.

We also added a finally retrospective and gathering session where we could share among the teams.

I will most definitely run other coaching gigs in the same manner for better effect.

# Have a goal for each session

I was very bold before I got started with this session and asked my idol when it comes to many things - coaching is one of them, [Dan North](http://www.dannorth.net) for some tip. He was his usual nice self and wrote me an excellent [blog post](http://dannorth.net/2015/04/24/two-hours-per-team/) that you'll find very interesting to read.

I took away many things but the really big one that made a change for me was to set up a goal with each session with the team. Sounds really natural right, but I didn't really have the clear before I started.

Me and Christian took some time to go over each team and he gave me some background and helpful pointers. Then I set up a goal for each team and brought that to the session. Although I didn't share it plainly with each team I used it as my guiding star for our conversations.

Thanks a bunch for that help and blog post Dan!

# Stop changing - start experimenting

One of the things that I kept repeating during the days was to use the word "experiment" rather than "change".

This is a really good general change management tip, by the way. This is how I feel around the difference in the words:

<blockquote>
Change is scary. It's big and permanent. You need to change. We need to change. This is not good - please change it. One team even said it out loud: "We and people around us are a little bit afraid to change"
</blockquote>

<blockquote>Experiment is lightweight. It's just something we try out. Maybe it works or may it will not. Either way we will learn. Experiments have a natural short life feeling to it. We don't need to fear an experiment.
</blockquote>

Basically you cannot fail with an experiment. Your hypothesis can be invalidated but that's also learning. With change we can fail.

Another great thing about experiment is that it's very natural to have a measurement attached to it. How will we know if the experiment is validated or not.

Finally I like experiments as an approach because it's more natural to start where you are and do small steps towards a better future. What future? We don't know but it will be better. Our small experiments will guide us there.

Someone tweeted one of the ways I tried to sum this up:

<blockquote class="twitter-tweet" data-cards="hidden" lang="en"><p lang="en" dir="ltr">&quot;Stop changing and start experimenting&quot; - last day with <a href="https://twitter.com/marcusoftnet">@marcusoftnet</a> <a href="https://twitter.com/nintexlabs">@nintexlabs</a> <a href="http://t.co/qU8vuoEI9X">pic.twitter.com/qU8vuoEI9X</a></p>&mdash; Tang Tze Chin (@TzeTang) <a href="https://twitter.com/TzeTang/status/593304137825030144">April 29, 2015</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

# Measure trends not numbers

I kept coming back to rather stop focusing on numbers and start focusing on trends instead. This goes together with the previous paragraph.

For example, if we are focusing (or: experimenting) on trying to bring our [lead time](http://www.marcusoft.net/2015/05/flow-wip-and-waste.html) down, we should look at the overall trend and not mind individual spikes or lows that much. Things have a natural variation and we should be aware of those.

There's a whole field of research around this called "Statistical process control" (which incidentally also talks about "Theory of variation"). From there we can steal an often used chart called "Statistical process control chart", that I've found very useful to communicate with people around us, product owners, project managers etc. In some cases it has even replaced the need to for [up-front commitments and estimates](http://lizkeogh.com/2015/05/01/the-estimates-in-noestimates/)...

Here's an example:
<img src="/img/Statistical process control chart example.jpg" style="width:80%">

From this example we can see not only the natural variation of all the items finished but also two lines that helps us to predict the future a bit. There's not an average line here. That would be a start but it's also very coarse: "the average is 10.2... but it varies between 0.5 days and 120 days."

The other two lines that is added is much more interesting. That puts the "Statistical" into the "Statistical process control chart". Without going into too much details these lines are 1 [standard deviation](http://en.wikipedia.org/wiki/Standard_deviation) above and below the average. Using the [68-95-99.7](http://en.wikipedia.org/wiki/68-95-99.7_rule) rule this gives us statistical certainty (hehehehe....) that the next items we do will fall in this range, in 68% of the cases. Adding 2 standard deviations means that it falls in that range with 95% certainty and with 3 standard deviations it's 99.7%.

Sure, there will be stuff outside that too, but they are influenced by "special cause variations". Extraordinary things that might happen outside our control. Inside the range we find the normal variation. The "common cause" variation.

The more data we have the better data of course.

I've found that on more than one occasional that once this diagram is explained and communicated we can just keep it updated and people can make their own predictions or estimates on when we will complete the next item.

Also this have sprung discussions and understanding on that the smaller the items the less uncertainty we have in our predictions.

We have a section diving deeper on this topic in [Kanban In Action](http://bit.ly/theKanbanBook). If you want to learn how to create a ["Statistical process control chart" look here](https://hakanforss.wordpress.com/2011/06/23/control-chart-how-to-create-one-in-excel-2010/).

# How do we know that we’re making an impact

After that it's good to revisit another theme that kept coming up during my days at [Nintex](http://www.nintex.com/).

Because measuring lead- and cycle-time for our process, [number of bugs fixed](http://gojko.net/2011/05/17/bug-statistics-are-a-waste-of-time/) or even process improvements per month are great, but is it really interesting.

Yes - i think but only in conjunction with another measurement dimension: are we making an impact or not?

Because the features we are creating is not very useful if they are not used. I don't know of any kind of business where "keystrokes", "lines of code" or even "passing test" is something that you can sell to a customer.

No, they want features that can help them become more effective.

In our discussions we talked about defining this measurement as we start to work with our features. If for nothing else just to make sure that we are understanding what we are building in the same way.

The least amount of things we could measure is to see if anyone are using the feature or not. Then maybe in the way we thought. Defining WHAT and HOW to measure this will spring interesting discussion I promise.

Yes, it might require some extra logging or tracking to be written, but without that kind of data how we know where we are going? That might render us very [efficient without being at all effective](http://www.marcusoft.net/2014/10/effective-revisted.html). I know of no sadder waste than that; people doing good work without knowing the goal.

# Summary

Sometimes it's not until you have to explain yourself, when the "heat is on" that you find what you been thinking about. That happened to me when I was at Nintex, Kuala Lumpur.

Thank you guys! You brought out the best of me.
