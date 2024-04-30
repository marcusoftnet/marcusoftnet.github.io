---
layout: post
title: Specification by example with SpecLog–some initial thoughts
date: 2011-02-21T19:55:00.001Z
author: Marcus Hammarberg
tags:
  - BDD
  - Tools
  - Agile
modified_time: 2011-03-07T12:35:53.078Z
thumbnail: http://lh4.ggpht.com/\_TI0jeIedRFk/TWLDTkH_uhI/AAAAAAAAA5s/4g7epwLPr5U/s72-c/%5Bspecws1%5B2%5D_thumb%5B3%5D.jpg?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-1461423135737723573
blogger_orig_url: http://www.marcusoft.net/2011/02/specification-by-example-with.html
---


I have been talking about
<a href="http://en.wikipedia.org/wiki/Behavior_Driven_Development"
target="_blank">BDD</a> or specification by example almost everyday for
a year and half now. I still love the idea – executable specifications
that everybody concerned can read, so that you can talk about the
behavior of the system before a single line of code is written. Yeah –
you see as soon as I start to write about it, it’s hard to stop.

Most people (or roles rather) react positively to this idea; developers
love the possibility to get a details specification to start from,
testers see great promises in automating the tests and requirements
people love the traceability features and the level of detail that you
get down before you start.

It’s the workflow or process that is the “problem”. How do we organize
the work around this? Who write those features? Where are they updated?
I have <a href="http://www.marcusoft.net/2010/08/story-on.html"
target="_blank">blogged about</a> this <a
href="http://www.marcusoft.net/2011/01/specification-by-example-with-specflow.html"
target="_blank">several</a> times before, but as I learn I get more
insights on how this could done.

This post examines a new tool to support the early stages of the
life-time of a user story with scenarios – the fundament in a
specification by example process – the tool is called
<a href="http://speclog.org/" target="_blank">SpecLog</a> also from
<a href="http://www.techtalk.at/" target="_blank">TechTalk</a> (as
<a href="http://www.specflow.org" target="_blank">SpecFlow</a> is). It
looks promising – very promising indeed.

### Reflection

Please allow me to elaborate on something that I have been thinking on
for a while. If you don’t want to please skip ahead to the next heading.
It’s probably just me…

I often get the feeling that I need to sell in stuff like specification
by example,
<a href="http://en.wikipedia.org/wiki/Test-driven_development"
target="_blank">TDD</a>, pair programming, Scrum or other agile
practices to the business. Why is that? Why hasn’t it – during the
<a href="http://10yearsagile.org/" target="_blank">10 years that agile
has existed</a> – come one agile effort or requirement from the business
side? It’s always technology driven.

It might have to do with the fact that all the original signees of the
<a href="http://agilemanifesto.org/" target="_blank">Agile Manifesto</a>
(as far as I know) are techies…

It’s not big problem per se, but it’s getting slow to always push the
way we work. Often, in big organizations, I’m met with a head-tapping
“Yeah, you do that… development guys, if you want to work in short
sprints – go ahead” and then 5 years later the other parts of the
development process (requirements, test, deployment) wake up and tag
along.

Wouldn’t it be refreshing with a initiative from the business side, or
the deployment for a change?

Ah - now that I’ve got that (probably erroneous idea) out of my system
back to one of the areas where this has certainly happened

### The Specification by example process

The idea of using specification by example (or BDD if you like) is that
you meet and discuss a feature that is to be implemented. That
discussion is captured in concrete examples that can be automated and
run against the system to verify the state of the system.

Of course that means that you need to have some (in many cases a lot) of
knowledge about the feature you’re about to discuss. So most certainly
the requirements people meet with customers, users and other stakeholder
and write lot of documentation to capture the system, the business goals
and the benefit that the system will have for all actors.

There might be other work that needs to be done before you can write
scenarios even for Development or Test and other roles. But, quite
natural, most work need to be done in order to capture the functional
requirements of the features of the system.

All the background need is brought to a meeting in which a feature is
discussed and a feature with scenarios (concrete examples of usage of
the feature) is agreed upon. I often use this picture to show people
what I mean:

[<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TWLDTkH_uhI/AAAAAAAAA5s/4g7epwLPr5U/%5Bspecws1%5B2%5D_thumb%5B3%5D.jpg?imgmax=800"
title="Specifcation workshop"
style="background-image: none; border-right-width: 0px; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; margin-left: auto; border-left-width: 0px; margin-right: auto; padding-top: 0px"
data-border="0" width="400" height="260" alt="Specifcation workshop" />](http://lh5.ggpht.com/_TI0jeIedRFk/TWLDTKIijpI/AAAAAAAAA5o/W-zBmrjE5i0/s1600-h/%5Bspecws1%5B2%5D%5B5%5D.jpg)

### Hey? What about the customer?

Any true
<a href="http://www.urbandictionary.com/define.php?term=Agilista"
target="_blank">agilista</a> or BDD practitioner has now stopped
reading. Where’s the customer in that picture? Why not talk to her
directly?

Well – in my (humble) opinion big organizations seldom involve the user
or customer in the requirements process. Or even before the system is
built. They are sometimes (!) involved in the testing but I haven’t seen
an user in years. I envy the people who have direct contact with them
and can get first hand information but I haven’t.

Also herein lies a bit of confusion. BDD has got a firm grip in the
<a href="http://rubyonrails.org/" target="_blank">Ruby on Rails</a>
community which has brought us great tools such as
<a href="http://rspec.info/" target="_blank">RSpec</a> and
<a href="https://github.com/aslakhellesoy/cucumber/wiki/"
target="_blank">Cucumber</a> – that SpecFlow is a port of for example.
But that community often do websites. And, as it seems, has more direct
interaction with their customer. I haven’t had the good fortune to be
involved in a project like that.

When a insurance system is to be built you seldom get the requirements
from the end user. They are rather discussed and decided by business
analytics, domain architects and requirements specialists.

So when a picture and process like the one above is presented is come
across as a bit simplified at first. But I think it can be useful and
used even in such environment. And that were I live so I describe it as
I see it.

### But… who’s writing that stuff?

Well this is one of the most common question and discussion I get into.
It goes something like this:

Me: “yada yada yada \[for an hour\]… and that’s how specification by
example can be done!”
Them: “Way cool! And you know what? Then the requirements people could
write those scenarios themselves”
Me: “Well… but….”
Them: “No, really. That would be so cool. They write down the executable
specification and then the developers just need to fill it out”
Me: “I’m not sure that it will …”
Them: “Why not? Then we don’t even have to meet. It’s just a contract
that need to be fulfilled”

I made up that last sentence, but all other has been said. By me at
first... And admit that the idea sound somewhat compelling – the
customer writes the scenarios.

> But that is missing the point completely – the key thing was that you
> got together and put down your shared understanding of the problem!
> that’s what makes <a href="http://specificationbyexample.com/"
> target="_blank">specification by example</a> so powerful.

Who is writing the scenarios down is secondary – at least. I would even
argue that’s best done by a technician since you then can think about
the “technical” stuff in
<a href="https://github.com/aslakhellesoy/cucumber/wiki/gherkin"
target="_blank">Gherkin</a> such as <a
href="http://www.engineyard.com/blog/2009/15-expert-tips-for-using-cucumber/"
target="_blank">step reuse</a> ( \# 9), <a
href="https://github.com/aslakhellesoy/cucumber/wiki/scenario-outlines"
target="_blank">scenario outlines</a> and
<a href="https://github.com/aslakhellesoy/cucumber/wiki/Background"
target="_blank">using backgrounds</a> etc.

Now, don’t get me wrong – it’s SHOULD still be readable and understood
by everyone in the team, but it should also be maintainable and don’t
get out of control as the system grows.

### You mentioned a tool in the beginning?

So my feeling is that the support for writing Cucumber style features,
executing them and get reports are very good on the .NET platform. I
like SpecFlow but you could also look into
<a href="http://raconteur.github.com/" target="_blank">Raconteur</a> or
<a href="http://concordion.org/" target="_blank">Concordion.NET</a>.

But, in my suggested workflow above, there’s a lot of work that need to
be done before you’re at a level to start writing the concrete scenarios
in the examples down.

There’s different approaches to do this; <a
href="http://www.agileproductdesign.com/presentations/user_story_mapping/index.html"
target="_blank">user story mapping</a> or <a
href="http://tynerblain.com/blog/2008/06/09/use-case-to-actor-mapping/"
target="_blank">actor goal</a> to mention two. But the tooling has often
been stickies and whiteboards (which not is bad at all, but not a
computer tool per se). And the connection between that work and the
formalized feature and scenarios in Gherkin.

### SpecLog

... until now! SpecLog (<a href="http://www.speclog.org" target="_blank"
title="http://www.speclog.org/">www.speclog.org</a>) aims to bridge this
gap – and focus on the early stages of a user story. Long before it’s
even a user story actually. The tool is still in the early phases but I
see a lot of stuff that I like already, for starters – it’s good looking
<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TWQOd8ucxEI/AAAAAAAAA50/Fr52LAxOP8Y/wlEmoticon-smile%5B2%5D.png?imgmax=800"
class="wlEmoticon wlEmoticon-smile"
style="border-bottom-style: none; border-right-style: none; border-top-style: none; border-left-style: none"
alt="Smile" />:

[<img
src="http://lh4.ggpht.com/_TI0jeIedRFk/TWQOfjapXPI/AAAAAAAAA58/r12Qe_lbT90/example%20workspace%20in%20speclog_thumb.jpg?imgmax=800"
title="example workspace in speclog"
style="background-image: none; border-right-width: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px"
data-border="0" width="420" height="246"
alt="example workspace in speclog" />](http://lh4.ggpht.com/_TI0jeIedRFk/TWQOebAOuLI/AAAAAAAAA54/f0L9SwrZnGE/s1600-h/example%20workspace%20in%20speclog%5B2%5D.jpg)

Just imagine how boring this design could have been (think <a
href="http://www.codeguru.com/dbfiles/get_image.php?id=18481&amp;lbl=PART_1,_FIGURE_4_-_WORK_ITEM_PNG&amp;ds=20110207"
target="_blank">TFS Work item editor</a> and you get an idea). This
workspace, move-things-freely approach feels great and fosters an
atmosphere of creativity, I think. My thoughts goes directly to one of
the core principles of
<a href="http://www.kanban101.com/" target="_blank">Kanban – Visualize
work!</a>

Ok – it looks good, but is it functional. Well as always with products
like this it’s really hard to test them by yourself. The whole idea is
to use this as a team tool and that’s where is most useful. So I list
the things I like and don’t so far (second release, I have checked it
out... barely) and then let you be the judge.

It’s a 1.0 so it’s a real release, and works very well indeed. But it’s
still early and leaves some holes that will be filled later.

#### Likes

- supports a variety of ways to work and doesn’t force a process on
    you
- very informative website that talks a lot about the concepts behind
    the product. Great!
- love the concept of workspaces that you can arbitrary group your
    requirements on / in. You can even display the same requirement on
    several workspaces
- Great connection possibilities between the requirements and any
    checked in scenarios written in Gherkin.
- Possibility to write acceptance criteria separated from the actual
    Gherkin file (which you can link to). This means that, if you want
    to, you can write the acceptance criteria or scenarios and then
    formalize these as scenarios in Gherkin.
- Every template that is used can be customized to your need (Swedish
    for example). That’s just great – and follow the way of the Cucumber
    very well. The editor is a bit ... rough but that doesn’t matter.

#### Improvements-points

- I would love to be able to create refinements directly on the
    workspace, maybe by just dropping one on the other.
- Better visualization of the relationships between requirement on the
    workspace area...
- For big system I suspect that the search capabilities need
    improvement (saw something on Lucene in later releases, that’ll fix
    that...)
- Even if I don’t want to generate my Gherkin-content from the
    acceptance criteria (and I don’t!) – I would love to create the
    Gherkin-file and get the user story injected etc. Create my
    Gherkin-skeleton
- Even though the website is great I miss some manual to the product
    itself. The
    <a href="http://www.speclog.net/watch/" target="_blank">videos are
    great</a> but I stumble on details (see below)
- When I try to link a file I get an error message that says something
    like “Linking Gherkin is only supported when your using a shared
    repository with a version control system”. Ok ... I cannot do this
    in a single file that’s alright. But when I try to hook into one it
    seems like I need to hook into a server of sorts. Could I try this
    on my own computer? What if I want to use Git (or Github)? Hmmm –
    this is a strange – I probably miss something here...
- It
    <a href="http://www.speclog.net/buy/" target="_blank">costs money</a>...
    Well being a OSS-buff I needed to throw that in there. But I can
    understand it. For now.

### Conclusion

When I talk about agile requirements I have a slide that says:

> “It’s not in the tool”

meaning; it’s much more important to meet and talk (hmmm ...
<a href="http://agilemanifesto.org/" target="_blank">where have I read
this?</a>) about this things and get a common understanding than to have
a great tool. But when you do that (meet and talk) you will soon need to
stick that information somewhere. And when you start to automate
scenarios you soon need to keep a chain of work unbroken.

SpecLog looks very promising indeed – I would not be the least scared to
recommend it my clients already in this early stage. But I would have
some serious talk with them first on the agile requirements and testing
process they will.

See you later SpecLog – I promise.
