---
layout: post
title: Lean UX with effect map - from HeltSonika
date: 2013-06-17T19:51:00.004Z
author: Marcus Hammarberg
tags:
  - Tools - Lean
  - Agile
modified_time: 2013-06-18T19:18:25.753Z
thumbnail: >-
  http://1.bp.blogspot.com/-8_0fODNcsQE/Ub9oQmn3VrI/AAAAAAAABhw/44Lsv73oLBQ/s72-c/Screen+Shot+2013-06-17+at+21.48.26+.png
blogger_id: tag:blogger.com,1999:blog-36533086.post-798473969077811208
blogger_orig_url: http://www.marcusoft.net/2013/06/LeanUXEffectMap.html
---




I ran across a <a
href="http://heltsonika.wordpress.com/2012/10/11/lean-ux-med-effektkartan/"
target="_blank">great post</a>
by <a href="https://heltsonika.wordpress.com/om/" target="_blank">Dan
Kindeborg</a> that thought me a lot of about effect mapping (prequel to
<a href="http://www.impactmapping.org/" target="_blank">Impact
mapping</a>). "Sadly" it was in Swedish and I got to keep the material
to myself... Or well no - that's not how I roll. So asked Dan for
permission to translate the <a
href="http://heltsonika.wordpress.com/2012/10/11/lean-ux-med-effektkartan/"
target="_blank">original post</a> here on my blog. He was totally fine
with that so here it is.
When you read stuff about UX and design below it's Dan's word. Don't
worry - i still know nothing about that. But I learned a lot by reading
this I hope you do too. So, from the next paragraph when you read "I
think" it's actually Dan thinking. Just so you know. Over to Dan.

## Lean UX with effect map

An IT-project is often started with an idea about how business impact
can be created. Someone has invented a new way to make money, or a way
to streamline their business to save money. But IT-projects are
expensive and nobody knows if the idea will fly or not. The person that
came up with the idea *thinks* that there's a customer-base that will
use the perceived product. There's a big risk in investing
10 millions in realizing the idea. And**how will the ideas be realized?
A new Intranet can look and work in a myriad of ways.

<a href="" id="more"></a>
Dated, technology driven organization hops to it and starts to develop
directly, without putting any effort in examining how the product will
be designed and styled.

### One (of many) problems with traditional user-centric work

If you have come a bit further you might work user-centric in a
traditional way (like waterfall or agile - but only in the development
phase) and thinks that they have solved this problem. Instead of
"guessing" who the user groups are and what they need we head out and
collect information about the current situation by doing interviews,
observations and data analysis. When this is done we create design
specifications that is tested out on the target audience and then is
handed over to the developer that implements it.

The target audience needs are mapped out. That's great. But does that
mean that we *know* that this product, that will set us back 10 millions
will be useful and create an impact? Hardly. The methods we UX designers
has picked up is far from fail safe. They work fine in answering the
question: *How should this product be designed to be as good \[useful\]
as possible?* but they have a hard time answering the question *Will
people pay for or use this product?*

### Lean UX

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://1.bp.blogspot.com/-8_0fODNcsQE/Ub9oQmn3VrI/AAAAAAAABhw/44Lsv73oLBQ/s1600/Screen+Shot+2013-06-17+at+21.48.26+.png"
data-imageanchor="1"
style="clear: right; float: right; margin-bottom: 1em; margin-left: 1em;"><img
src="http://1.bp.blogspot.com/-8_0fODNcsQE/Ub9oQmn3VrI/AAAAAAAABhw/44Lsv73oLBQ/s320/Screen+Shot+2013-06-17+at+21.48.26+.png"
data-border="0" width="320" height="200" /></a>

<a href="http://www.amazon.com/gp/product/0307887898/"
target="_blank">The Lean Startup</a> is a product development approach
created by Eric Ries, built around the idea that instead of spend the 10
million and hope that we will deliver the product in two years, we
instead spend a smaller sum to build a minimal version of the product
(MVP) that we can deliver in a month. The minimal version is used to
gain insights about the target audience, insights that you then use to
improve and build the next version.

The benefits of this approach (compared to the traditional user-centric
approach) is that you continuously will deliver business impact and that
you gain insights from the target audience that deep interviews have a
hard time to get at:

- Will the target audience use / pay for the product?
- How will the users adjust their lives after the product, when they
    have used it for several months?
- How will the usage of the product change over time?
- Will the users learn how the product works?

Since "building" might mean implementing as well as building a clickable
prototype, UX designers and developers needs to work in parallell to be
able to work in this fashion - which gives us a lot of **amazing
consequences,** referred to as Lean UX. Lean UX is Build-Measure-Learn
in cross-functional teams where developers and UX designers cooperate
and gain shared understanding instead of producing, handing over and
read design specifications. I've written about this before in my article
series <a
href="http://heltsonika.wordpress.com/2012/05/28/varfor-vi-maste-borja-samarbeta/"
target="_blank">The waterfall swamp</a>.

### What is a MVP?

We will soon get to how this all can work in practice but first some
more fluffy stuff, since it's important to define what a MVP (minimal
viable product) is in Lean UX context. It's not easy either.

I think that it's valid to describe a MCP as *an experiment that aims to
validate a hypothesis.* The hypothesis could be (for example): "I think
more people would visit our intranet if it had more pictures of
employees". To validate the hypothesis I need an experiment.
The traditional UCD-experiment could be to send out a survey to the
users and ask them to answer if the think that they would visit the
intranet more if it had pictures of employees. A safe experiment could
be to build that functionality into the intranet and measure if the
usage is increasing or not.

The hypothesis is *something that we thing will make an impact.* The
experiment is the *smallest step we can take to validate if the
hypothesis is correct.* In the early stages in the project we want to
find the *hypothesis that creates the most impact* - and that's where
the effect map comes in.

## Defining a MVP with an effect map

Since I recently started to define a MVP with the help of my old
favorite modell the effect map I thought I would share how I did that
via an example.

#### The idea - The handyman service

<div style="text-align: left;">

An IT-effort starts, as I said, with an idea, good or bad, about how you
can earn or save money. Let's imagine that I'm an entrepreneur and that
this is my idea:

> People refurbish their houses and apartments like there's no tomorrow.
> But there's no real good services for instructions on how to install a
> washing machine or how to install parquet floor. I want to create a
> site where you in a simple way can get access to that kind of
> instructions.

### 1 -  Build an initial effect map - a hypothesis for the entire effort

Ideas and visions are great, they are often interesting but not seldom
thought all the way through. I almost every time (regardless of working
traditional or with lean) start a project with, together with the
stakeholders (people with money, ideas or business knowledge) build an
effect map during one or more workshops. The effect map covers the
business impact (or the effect goal), our target audiences that we think
help us reach the business impact, their needs or incentive and how we
can support those needs.

There's several benefits that can be reaped by building an effectmap
together with the stakeholders instead of directly talk about the
functionality of the system:

- You reason, in a structured fashion, from business goals and target
    audiences (user centric) instead of having people sitting around and
    "make up" things without really saying why this is a good idea
- The group creates a common understanding kring the campaign, summed
    up in a clear model that everyone can understand.
- When you talke about functionality you can easily end up
    sub-optimizing by forgetting a target audience group or incentive
    for them
- It's soon clear how well you know your audience and areas where you
    need to get more information.

The effect map that we create is initially built around *guesses* about
who our target audiences are, their  needs and what we need to do to
support them. It will make up a kind of base-hypothesis for the entire
project.

#### Effect goal - what do we want to achieve

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://1.bp.blogspot.com/-rSq-mf4UbJc/Ub9oQdAa9tI/AAAAAAAABhs/0T2PCSWUKpQ/s1600/Screen+Shot+2013-06-17+at+21.48.20+.png"
data-imageanchor="1"
style="clear: left; float: left; margin-bottom: 1em; margin-right: 1em;"><img
src="http://1.bp.blogspot.com/-rSq-mf4UbJc/Ub9oQdAa9tI/AAAAAAAABhs/0T2PCSWUKpQ/s320/Screen+Shot+2013-06-17+at+21.48.20+.png"
data-border="0" width="320" height="111" /></a>

The first step when building an effect map is to formulate an effect
goal. What do we want to achieve or how will we make/save money with
this idea?

In our example we want people to pay for a service with instructions
for DIY'ers.

#### Target audiences - WHO will contribute to the effect goal?

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://3.bp.blogspot.com/-rBfOltwshP8/Ub9oQBVgxCI/AAAAAAAABho/3vVzOHV-dXQ/s1600/Screen+Shot+2013-06-17+at+21.48.16+.png"
data-imageanchor="1"
style="clear: right; float: right; margin-bottom: 1em; margin-left: 1em;"><img
src="http://3.bp.blogspot.com/-rBfOltwshP8/Ub9oQBVgxCI/AAAAAAAABho/3vVzOHV-dXQ/s200/Screen+Shot+2013-06-17+at+21.48.16+.png"
data-border="0" width="200" height="149" /></a>

Who will help us sell DIY'ers instructions? Well, firstly we have the
people that will pay for the instructions. We think that both DIY'ers
and professionals would pay for this, and we also think that these two
groups is quite different from each other. There's also editors, someone
have to write the instructions, right?

#### Driving forces - what does the target audience want or need?

What does the target audience need and want - which are the driving
forces that will make them want to  contribute to the effect goal? We
think that, for example, the DIY'ers want help where ever they are, even
when they are standing bent over a washing machine with the screw driver
in one hand.

#### Measures - what can we do to support those needs?

This is the first time we talk about functionality, information and
other things that will make our target audiences happy and successful.
My entire example map looks like this:

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://2.bp.blogspot.com/-QKz38hzrKfE/Ub9oO7NaD0I/AAAAAAAABhY/tH6OfAROszE/s1600/Screen+Shot+2013-06-17+at+21.48.08+.png"
data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
src="http://2.bp.blogspot.com/-QKz38hzrKfE/Ub9oO7NaD0I/AAAAAAAABhY/tH6OfAROszE/s640/Screen+Shot+2013-06-17+at+21.48.08+.png"
data-border="0" width="640" height="432" /></a>

<div class="separator" style="clear: both; text-align: center;">

### 2 - Encircle prioritized target audiences, driving forces and measures - what is most important?

In the next step the goal is to use this effect map hypothesis to
prioritize. Which target audience, which driving forces and what
measures is absolutely critical for us to succeed? We would like to
break off a **one** small aspect of our service that we think will be
the key to make or save money - and that will be tested with our MVP.
But it's not that seldom that more than one aspect that cooperate to
make a service  or product sellable.

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://1.bp.blogspot.com/-gA9y2lPf_cg/Ub9oPDggbhI/AAAAAAAABhg/MsVuRD2pIkI/s1600/Screen+Shot+2013-06-17+at+21.47.58+.png"
data-imageanchor="1"
style="clear: right; float: right; margin-bottom: 1em; margin-left: 1em;"><img
src="http://1.bp.blogspot.com/-gA9y2lPf_cg/Ub9oPDggbhI/AAAAAAAABhg/MsVuRD2pIkI/s320/Screen+Shot+2013-06-17+at+21.47.58+.png"
data-border="0" width="320" height="216" /></a>

In our example we think that the **DIY:er** is the absolutely most
important target audience. My idea was a service that turns
towards amateurs, the DIY:ers are abundant out there and they are the
ones that will pay for the service.

We think that the most important driving force in the example is **Needs
help fixing at home** and the most important measure is that there are
great **graphical instructions** on how to go about to fix something in
your house.

### 3 - Formulate a hypothesis - what is our prioritized goal?

To get the correct focus when we're building our MVP (an experiment that
validates the hypothesis) we need to formulate what should be tested
(what is prioritized) in the form of a hypothesis. When we do that it
will also be clear that the effect map is just built around nothing than
a bunch of **assumptions** that need to be validated. Our hypothesis:

> We think that DIY:ers needs help with fixing their homes and will pay
> for instructions on how to do home refurbishing, if they get graphical
> descriptions on how to fix stuff around the house.

The hypothesis in general form:

> We think that \[target audience\] \[driving force\] and will \[effect
> goal\] if they get \[feature\]

There! Now we have summed up this projects core as a hypothesis. The
hypothesis is powerful since it's short and consice but also because it
includes both the *effect goal, the target audience, the driving force
and the feature*.

### 4 - Define a MVP - what is the smallest possible thing we can build to validate the hypothesis?

In the last step we define the MVP (or the experiment) itself, in order
to start building. This can be done in different ways and in levels. The
questions is *what is the smallest thing we can build to validate the
hypothesis?* In the example with the DIY-service we can imagine a lot of
different experiments. We would build an old-fashion interactive
prototyp that we test on the target audience, but that doesn't deliver
business value in a continuous fashion. The question, also, is if that
really would be enough to validate the hypothesis? Let's instead go for
implementing a first version of the service that let's amateurs pay for
graphical descriptions for home fixing.  

How to the define the MVP is contextual. I like to start off from a
number of scenarios that the service will support (step-by-step: how
would the DIY:er get to the instruction?), draw wire frames on how the
service would work based of those. <a
href="http://www.agileproductdesign.com/presentations/user_story_mapping/index.html"
target="_blank">Jeff Pattons story maps</a> is an excellent way to
interconnect the user scenarios with User stories and prioritize among
those. Here are some example scenarios:

- The DIY:er downloads and pays for the DIY:er application
- The next the the DIY:er is about to install is newly bought washing
    machine
- He picks up his mobile and open the app
- Searches for "washing machine" and get's a list of instructions for
    washing machines
- He choses the instruction for "install washing machine"
- Reads the instruction
- Goes back to the store to get more material
- Open the app again to double check which pipe-parts that is needed
- Goes back home again and installs the machine

When we have the scenarios and the user stories in place the team can
start to take a look on how to implement them, and with a little
developer magic we'll soon have a working DIY:er application. This
application is **not** complete, as noted before, but there for us to
validate the hypothesis and start delivering some business value.

## Next step - measure, learn and improve

When the first MVP is built we can start to measure the usage of it, but
also combine that with traditional methods as deep interviews and
observations. Now we could take contact with and interview the users
that's actually using our service, not just our *potential* users. And
if we should end up with no users, well then we could get back to the
effect map and change the base hypothesis or just abort the project all
together.

Every new thing we learn about the target audience is added to the
effect map. When the next build-iteration is planned we can go back to
the map and extract a new hypothesis. Next step maybe is to find out if
we can make the service attractive to professionals, or we stay on our
prioritized target audience. It all comes down to what we see give us
the most business value, at the specific time.

The new hypothesis is used to improve our product, so that the product
in the next iteration becomes an experiment that is used to validate
*several* hypothesis. When you run out of hypothesis to validate, or if
someone says "Stop" for budget reasons, then you're done and have a
guaranteed useful product that the users likes!

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://1.bp.blogspot.com/-Y3Q5s_M79k8/Ub9oO3EmJTI/AAAAAAAABhQ/3sR52OYVvyU/s1600/Screen+Shot+2013-06-17+at+21.47.48+.png"
data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
src="http://1.bp.blogspot.com/-Y3Q5s_M79k8/Ub9oO3EmJTI/AAAAAAAABhQ/3sR52OYVvyU/s640/Screen+Shot+2013-06-17+at+21.47.48+.png"
data-border="0" width="640" height="318" /></a>

## The best of two worlds

There's a lot of gain from instead of starting with traditional methods
instead deliver business value early, improve continuous and cooperate
in cross functional teams. But there's nothing that says that this way
of working not can be combined with traditional UX-methods and models
like interviews, observations, user surveys and building prototypes
etc.

When we have a hypothesis and before we start building the first slice
of the product, for example, we could run a quick user survey to do a
first check-up if the target audience and the driving force aligns with
what we think.

You're allowed to cherry-pick from the both worlds and adjust to the
current situation. I do that.

##

## Read more

There's so much to write about this way of working. Luckily there's more
than I that have done that:

- [The UX of MVP:s](http://www.andersramsay.com/the-ux-of-mvps/) av
    Anders Ramsay
- [Experiments
    101](http://mindtheproduct.com/2012/08/experiments-101/) av Simon
    Cast
- [Lean Startup is Great UX
    Packaging](http://uxdesign.smashingmagazine.com/2012/10/10/lean-startup-is-great-ux-packaging/) av
    Tomer Sharon
- [Continous Discovery](http://kaeru.se/entry_18.php) av Martin
    Christensen
- [Lean UX is not just for lean
    startups](http://www.jeffgothelf.com/blog/lean-ux-is-not-just-for-lean-startups/) av
    Jeff Gothelf
- [Agile UX vs Lean
    UX](http://www.andersramsay.com/agile-ux-vs-lean-ux/) av Anders
    Ramsay
- [Lean UX: Getting out of the deliverables
    business](http://uxdesign.smashingmagazine.com/2011/03/07/lean-ux-getting-out-of-the-deliverables-business/) av
    Jeff Gothelf
