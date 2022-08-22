---
layout: post
title: Applying the Switch framework to broken builds
date: 2011-12-22T11:54:00.001Z
author: Marcus Hammarberg
tags:
  - Life of a consultant
  - TFS
  - Agile
modified_time: 2011-12-22T13:11:02.033Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-1877650632727020736
blogger_orig_url: http://www.marcusoft.net/2011/12/applying-switch-framework-to-broken.html
---


I’m rereading a great book –
<a href="http://www.heathbrothers.com/switch/" target="_blank">Switch by
the Heath Brothers</a> and it inspires me. The last time I read this
book it inspired me <a
href="http://www.marcusoft.net/2010/10/no-more-bugs-thought-experiment.html"
target="_blank">to write a post</a> and it’s happening again.

The book is about change, how to accomplish change and especially in
situations where you are not in power or control. In short – how to talk
to and influence others to understand the need for change and follow
through on it.

One very smart thing is that you can download a cheat sheet that
contains the ideas in a nutshell – <a
href="http://www.heathbrothers.com/resources/download/switch-framework.pdf"
target="_blank">the Switch Framework</a> – for free. Of course it’s not
much use if you haven’t read the book, so you better do that first.
Could very well be the best book you read.

I thought I would apply the reasoning in the framework to a real life
situation and see if I get any ideas on how to get forward. I haven’t
implemented this yet but I’ve been reasoning about it with myself and
other for quite some time now.

So this is, like many post on this blog, a learning experience for me
and I’m sharing it with you. Please supply any feedback to me. I would
love to hear your thoughts on the matter.
### The Problem – Broken build indifference

To have <a href="http://en.wikipedia.org/wiki/Continuous_integration"
target="_blank">continuous integration (CI)</a> for your source control
nowadays is almost mandatory. But if I think back it was a very novel
thing for many developers just a few years back.

#### CI

In short CI means that you have an automated way to get the latest
source code, compile it, run unit test and integration tests (if
present) and then deploy it to an environment for testing. You should
run this as often you can, at least daily but it’s not uncommon to do a
full build on each check-in.

In my experience it’s one of biggest quality improvers you can add to
development process or team. It give you a base line for the current
quality of the system and a pulse and a sense of going forward, each
check-in makes the system just a little better than before. It’s quality
guarantor of the source code checked in. You know that it’s good enough
to pass the compile and tests in the build script.

An automated build is a guarantor that the build is done in the same way
each time. If you get it to work once it will follow the same procedure
each time, which gives you much reliable deployments to all environments
(to production for example).

Also it give stakeholders around you a way to get hold of the “latest
and greatest” whenever they want.

#### The catch

There’s only one catch… you need to fix broken builds. In fact you
should make that the top priority for the team. Always fix broken builds
as soon as they happen. But that is of course boring… and irritating …
and sometimes even makes you angry as you might not have been the person
that was responsible for the check-in that broke the build.

This is the root to a lot of argumentation and inventions; a blame hat,
red blinking lights, monitors that shows you when the build broke and
who was responsible etc. etc.

In some teams I’ve been in, people after awhile give up. “This build
broke… So what – he has broken the build six times in a row”, “Who
cares? Broken build, I’ll fix it with my next check-in next Friday”. And
if someone in the team starts reasoning like that it doesn’t take long
before others tag along. Before long the build process is often
side-stepped and stuff is thrown together and into production in an
ad-hoc fashion. It all resembles the
<a href="http://en.wikipedia.org/wiki/Broken_windows_theory"
target="_blank">broken window syndrome</a>, actually

So, back to the topic of the post, how do you CHANGE this behavior? Well
– let’s try out the Switch Framework.

### The Switch framework – a short introduction

Hey, I cannot start applying the framework without giving a short
introduction. In order to understand it you should know this at least;

The authors have a image of the human psyche that they build a lot of
their reasoning on; the image of a Rider on an Elephant (borrowed from
Jonathan Haidt). The elephant is our emotion and the rider is our
rational side. The rider controls the elephant with some reins from his
topside position. The only problem is that if the six-ton elephant wants
to go into the bushes to have something to eat … those reins will not
help much.

In order to accomplish change you will have to address both the rider
and the elephant part of people. The rider need clear instructions while
the elephant need motivation and some reasons for why this should be
done. Finally you need to shape the path on which they are going to be
traveling. The Switch framework gives you some guidelines on how to
accomplish that. 

And there… I have now summed up about 4 pages in the book. Read the rest
to get the full picture.

### Applying Switch to the Broken build indifference problem

So here is my thinking on what you can do to help a team that’s
experiencing the problem I described above.

#### Direct the rider

The rider probably knows that a solid CI is a good thing, most of the
developers do. The problem here though is more that we need to put the
attention on the broken builds and fix them, which probably is mostly an
elephant-problem (of lazyness). So to the “rider” we need to supply
information and arguments on why this is good.

**Follow the bright spots.**

In the book the authors talk about finding situations where the wanted
behavior has been a success. People who already are doing this and
succeeds with it.

We might find other teams that can talk to our team about the benefits
of fixing a broken build right away. Or find situations when that have
helped us find stuff that would have ended up being a problem later on.

**Script the critical moves**

This is putting emphasis on concrete measures that one can take to make
it crystal clear and easy to follow. 

In our case that might be a technical solution; for example some tools
don’t accept commits or check-ins when the build fails. In Team
Foundation Server this is called gated check-ins and simply hinders bad
code from entering the system. Mind you that the build we still break…
but you will have to fix it before you can continue.

We also need to make sure that everyone understands and can follow the
actual build process. With great logging (not too much though) and
simplified build scripts that doesn’t tries to do everything. In my
experience the build script is often done by one person (and he/she
sweats and swears over it). And when it works you “just leave it”.
Maybe we should go through it together and make sure everybody
understands what is going on. And even simplify it and the stuff it
does. “Does everybody get what happens when we’re running our
integration tests”?

**Point to the destination**

I love this part – it’s like sending a postcard from the future when
this have been applied. Look who wonderful stuff is over here. All our
problems is just gone. Nice, huh?

Here we can talk about how we can be more responsive and faster in our
process. “Due to our rock solid build and deployment process we can now
deploy a new version into production, safely, in under 8 minutes. Look
ma’. No hands!”

#### Motivate the elephant

The elephant is all about feeling and getting the emotions on our side.
Here are the steps for that.

**Find the feeling**

This part is about getting a sense of urgency, or feeling that this
needs to be fixed. There’s a great example in the book where somebody
shows an inventory problem by pouring out all the different gloves that
the company is buying on a table. 424 different kinds. That made a
feeling of “WOW! How can we go on doing this? This must be fixed!” stick
with people seeing the pile of gloves.

For the broken build we could start tracking data on how much time
people are spending on untangling bad source code they got when doing a
Get. Or how many times outside stakeholders are using a faulty version
of our system, or even waiting for us to put another one together.

Make people feel the pain they are inflicting on each other. But here we
have to tread carefully and not fall into the blame game, which I think
is bad. Jellying and hitting people with treats or humiliations cannot
be the answer. But helping them to see that their behavior is hurting
others might.

**Shrink the change**

In this part Switch is asking us to make the first steps easier. Giving
us ahead start and a sense of that we’re already are on our way.

In the broken build problem this should not be too hard. We have the
process in place. “Some (3/5) builds are working – we just have to try a
little harder and we’re almost there”

**Grow the people**

Here you’re trying to create a team-feel, to get a feeling of belonging
and some small peer pressure into the game.

I’ll leave this one with a (tweaked) quote;

> “I dream of the day when a broken build is a major thing and a release
> to production is not”

could be

> “On this team a broken build is a major thing and a release to
> production is not”

#### Shape the path

Often we think that change is hard because of people, but in reality
it’s often the situation and the environment the people are in that is
the problem. This part is all about changing the environment to help and
support the change.

**Tweak the environment**

Maybe some simple change in the way we work or the environment we’re
acting in can be change to facilitate the change in a big way. A great
example of this is the Amazon 1-Click-buy. They simplified their
checkout process to be one simple click, which of course resulted in an
increase in sales.

I often find that build scripts and the stuff they are doing is very
complicated. Maybe we should split the CI build into just doing a
compile and running the unit tests. That will leave us in a pretty good
state for ensuring that the code quality is good enough to commit into
the source repository. We can then have separate build running a couple
of times a day, that runs the Integration level test and (if they pass)
deploy to a test environment.

This will be much easier to understand and we will get faster builds.
The testing environment will still be stable and updated a couple of
times a day is still very good.

**Build habits**

This is about moving your action into the muscle memory, and thereby
making them “free”. We do it without thinking about it – reducing the
workload of the rider.

A checklist is a very good idea of this. Here you could think of
introducing separate steps or checklist on a board that make you go
through this. I suggest you read <a
href="http://hakanforss.wordpress.com/2011/09/05/standard-work-in-software-developmentpart-2/"
target="_blank">Håkan Forss blog on this matter</a>. It’s a great way to
make stuff standard and hence a baseline for quality.

**Rally the herd**

Here we want to make the behavior contagious so that it’s automatically
inflicted on new team members and teams around us. This will help us to
grow as well.

I suggest that you make team talk with each other and exchange ideas.
Maybe a show-and-tell-session on build automation at the Friday
afternoon coffee?

### Conclusion

Well – that was a great way of generating ideas and sorting out my
tangled mind on the matter.

There are a number of actions that you can take to fight indifference on
broken builds. Some are technical and some are just behavioral, just as
expected. I haven’t implemented all of these in my current team, but
will sure try to start to.

If you read this and think that I have forgotten something or got
something wrong – please comment below.
