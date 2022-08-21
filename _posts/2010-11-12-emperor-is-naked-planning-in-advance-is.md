---
layout: post
title: The emperor is naked–don’t ask me to estimate!
date: '2010-11-12T12:18:00.001+01:00'
author: Marcus Hammarberg
tags:
  - Life of a consultant - Agile
modified_time: '2010-11-12T16:12:30.686+01:00'
thumbnail: http://1.bp.blogspot.com/\_TI0jeIedRFk/TN0gsoa8xpI/AAAAAAAAAps/ftKzqoISnCA/s72-c/estimated+time+left.JPG
blogger_id: tag:blogger.com,1999:blog-36533086.post-6514925003307124771
blogger_orig_url: http://www.marcusoft.net/2010/11/emperor-is-naked-planning-in-advance-is.html
---


This is a well known truth for all doing agile method.

### Introduction

I'm doing a migration project right now. My team is great - could be the
best I've ever worked with. We're converting a big VB6 application to
VB.NET and WPF. And due to different reasons we decided to do this in
two phases:

1.  First migrate everything with a tool and then get it to work again.
    And write a [integration test that assures that the function works
    as
    expected](http://www.marcusoft.net/2010/05/using-atdd-in-conversion-project.html)
2.  Rewrite the underlying architecture bit by bit. Since we have
    integration tests in place we are shield from introducing any big
    bugs.

<div>

OK, the first phase mean that we worked our way through the old code,
form by form. It was 265 of them and we created a simple tracking tool
in Excel that classified each form as S, M, L or XL (based on size in
KB). As we progressed we tracked the time we put in on all the things we
did. Finally we could estimate how long time it would take us, and how
much of that, that was left.

</div>

<div>

 

</div>

<div>

Of course the usual stuff happened. Two day into phase 1 my project
leader (who also is a great guy, that really have adopted agile
thinking, but I think he forgot himself :)) asked me "When are you
done?". I hate to being forced to answer that question without any data
so I actually put it off for two weeks. But then the question came
again... "Now you must know... When are you done?".

</div>

<div>

### Data gathering

Since I know that this question cannot be answered with any certainty,
but rather is a guess, I started to track data that would back that up.
Here is our last month day by day - how much time is left to do. (And do
remember that this is a great team, that update this calculation several
times every day):

</div>

<div class="separator" style="text-align: center; clear: both">

</div>

<div>

<div class="separator" style="text-align: center; clear: both">

<a
href="http://1.bp.blogspot.com/_TI0jeIedRFk/TN0gsoa8xpI/AAAAAAAAAps/ftKzqoISnCA/s1600/estimated+time+left.JPG"
style="margin-left: 1em; margin-right: 1em" data-imageanchor="1"><img
src="http://1.bp.blogspot.com/_TI0jeIedRFk/TN0gsoa8xpI/AAAAAAAAAps/ftKzqoISnCA/s400/estimated+time+left.JPG"
data-border="0" width="400" height="268" /></a>

</div>



### Analysis

From this we can see that:

</div>

<div>

-   when we first started to track time left (that took a few days) we
    guess that we had about 670 hours left. 
-   just a few days later we started to discover how hard this was...
    and our estimate boomed to 2108 hours left. 
-   then it rolled along for a few weeks. We didn't add that much but no
    time was reduced also. Everybody we're here. No people sick. It just
    stayed up in the 2100-range with a peak of 2268 at 2010-10-25.
-   Then all of a sudden it started to fall. Why? Well we started to
    remove things that we didn't had to do (not used anymore), we could
    reuse code we already written, we got better on doing this etc. 
-   And now (2010-11-12) we're at 602 hours left.

<div>

I wouldn't be to surprised if the hours will rise some and fall some
during the days left. I am quite sure that it wont be a steady line down
to zero from today.

</div>

</div>

### Conclusion

<div>

When I was asked "When are you done?" I would have answered "In 670
hours" if I've used the data we had at hand. This was wrong.
But (and this may come as a surprise) if I answered that question two
weeks later I would have answered "In 2074 hours" and I'd also be
wrong....
So when could I've been right? Never! And that is because [Software
development is a learning
process](http://en.wikipedia.org/wiki/Lean_software_development#Amplify_learning)
more than anything else. You uncover more and more of the complexities
of the project as you go.

For agilistas this is old news, of course. We know this. But the
question still comes.
Just the other week we're asked to estimate when phase 2 is done. By
then we hadn't even decided what goes into it. So it still happens.

What to do?
Just give me a date when you want it done. And we'll try to fill it with
the most important functionality, in the best quality we can manage in
that timespan.
I'm sorry. The emperor is naked - you cannot estimate a software project
with any certainty.

</div>
