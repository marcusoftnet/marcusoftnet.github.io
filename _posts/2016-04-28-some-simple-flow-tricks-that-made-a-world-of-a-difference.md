---
layout: post
title: "Some simple changes for flow that made a world of a difference"
author: "Marcus Hammarberg"
date: 2016-04-28 11:42:02
tags:
 - Lean
 - Kanban
 - Agile
---

When I started my current gig about 3 months ago the tension around releasing was tremendously high. Also we had failed the last couple of releases resulting in even worse relationships with our customer and messy rollback handling and procedures.

We have now done three very simple changes in our process and technology that made a big difference for us and for the relationship with our customer; ditch iterations, shorten release cycles and feature toggling.

In this post I wanted to tell you a little bit around how we did those and the benefits it had for us.

<!-- excerpt-end -->

## Ditching iterations

When I started the project the teams where working in sprints of two weeks, and releasing to production after 3 sprints; making a release every 6 weeks. Naturally each release contained quite a lot of new functionality and the "stakes" of failing the release was also quite high. A lot was riding on that everything worked out as expected.

As I told you in the intro the team had failed a few releases in a row, and sure enough, the first release with me aboard also failed. We had to make a partial rollback and then a hot fix a few days later.

This, in combination with the fact, that the team was maintaining the product they are developing made me feel that iterations maybe not was the best way to approach for this team to work. Scope of iterations could not be locked down since some room had to be made for things that needs to be fixed. And if you cannot lock down the scope of an iteration the use of having iterations, although short, is diminshed.

I simply suggested that we ditch the sprints and just work in a flow related manner; taking on new work as something else gets completed.

The team seemed to like that and we just did it.

## Shortening release cycles

The second thing I did without really asking for permission was to shortening the release cycles. When I got there a release was put into production every 6 weeks.

Now that we had ditched iterations I suggested that our releases would run every 4 weeks. What ever is ready to be deployed after 4 weeks is pushed into production.

We used the analogy of a boat leaving the harbour; the features that are ready is waiting on the dock, for the boat to leave. The timetable for the boat (releases) is set - if you miss the boat you will have to wait for the next.

We did one 4 week release cycle but it still felt a bit too bit. We were still nervous. There was still tension around release.

So, again without permission, I pushed for 2 weeks release cycles; the *boat* will leave every second week. That was a little bit better. But we ended up with a hot fix that needed to be squeezed in between, so after two 2 week releases we had to do one in between.

Together with our manager we decided to go for 1 week release cycles.

It made all the difference in the world. Finally tension around releasing was gone. But there's one thing more, that made that happen.

## Feature toggling

The final piece of the puzzle was something that two of our developers created since their feature got stalled; feature toggle.

It's nothing new in itself, and to be quite frank our feature toggle is very crude indeed. In our database we created a list of features that can be turned on or off. They then created a simple way to check that flag through code, so that you can toggle features in the code on or off.

Very simple it would look something like this:

```javascript
if(isFeatureEnabled("NewPriceEngine")){
  // new stuff
}
else{
  // old stuff
}
```

(It's a bit more advanced than that but that's the gist of it)

Now we could roll things out in production and turn it off if we needed to. Or if it was not finished completely, so that we could try out partial functionality for example.

And that was the final piece of the puzzle that brought us to the place where we are now.

## Current state

The three things above are very simple to do, but the implications of putting them into action was huge for us, not at least when it came to the relation between us and the customer.

The last two weeks the top manager our customer (the "business side" of the operation) has publicly said:

> Releasing more frequently was a stroke of genius. That took so much tension away from release and it just feel calm now. Thank you.

I totally agree, and here are some other things that happened due to these small but important changes:

* We never roll back anymore. That simplifies deployment **a lot**. Should something go wrong we simply turn it off

* The things that we release are **small**. with less effort in testing and less risk in deployment. Small often is better than big seldom.

* We can deploy functionality in parts; we can for example build our function ready while we wait for a dependent component to start sending their data. The means that we avoid [being blocked](http://butunclebob.com/ArticleS.UncleBob.ThePrimeDirectiveOfAgileDevelopment) which is really nice

* There's a general calmness coming from the fact that the *boat* will leave on a timed schedule, separate from how we develop code. Our concern now is just that the things that we say is ready to release is in fact ready to release and will not cause problems in production. That's so much nicer than to "try to make the release".

* In fact all talk about "will this feature make the release" is now gone. Quite simple, because a "No" is not that dangerous. If the feature misses the *boat* the next boat is leaving in 6 days. No worries. Before that was 6 weeks.

## What's next?

This is of course not our goal. For example one natural extension of this is to skip the boats all together and just release functionality once it's completed. Or in parts as we complete the parts.

The reason we haven't reached that point (yet) is that the deployment procedure is quite cumbersome and painful. Once a week is what we feel is ok right now - more frequently would be burning people out.

This is in turn has to do with the fact that our system is a big monolith and we have to deploy all of it in one go. That will most likely change later too.

Right now we are working with trying to be able to do [blue-green deployment](http://martinfowler.com/bliki/BlueGreenDeployment.html) which would allow us to do deployments during normal business hours and achieving a true 24/7 service.

That's next.

## Summary

These small things works together in giving us a much more harmonious environment to work in. It also gives us many options for deployment and enables us to move faster.

Best of all; none of it is hard. You can do it tomorrow.

## One more thing

Oh, why did we end up doing these things; we are focusing on flow. Flowing ideas to working features in production faster and faster. And that is something we will continue to do - and it will make us discover even more things that can help us in our context.
