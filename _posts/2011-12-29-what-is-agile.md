---
layout: post
title: What is Agile?
date: 2011-12-29T10:08:00.001Z
author: Marcus Hammarberg
tags:
  - Agile
modified_time: 2012-01-01T20:40:46.550Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-3944511374658002557
blogger_orig_url: https://www.marcusoft.net/2011/12/what-is-agile.html
---

About a year ago, my project manager asked me to “just give a quick intro and overview; What is agile? 20 minutes or so…” At first, this didn’t seem too bad. But when I got home and started preparing, I realized how challenging it is to sum up agile!

For me, agile has become almost a lifestyle. Much of what I advocate or oppose relates to agile principles or practices. Now that [agile is 10 years old](http://10yearsagile.org/), the buzzword has evolved, and almost anything good or innovative in software is branded with agile ™.

Is TDD agile? If you're not doing TDD, are you not agile? Standups? Boards? The list goes on and on, and I couldn't come up with a definitive answer. Either everything had to be included to be agile, or nothing was left.

Like the story of the old woman who collects wood:

> She went out and started to pick up sticks from the ground:
> “I’ll manage that one”,
> “And if I manage that one I’ll surely manage this one”,
> “And if I manage that last one I will manage this one too”
> …
> After a while, she had way too much to carry. So she started to take
> sticks away again;
> “If I cannot manage that one, I’ll take it away”,
> “And if I couldn’t manage that one, I will have to take this one away too”...

So, I dodged that presentation.

But the question lingered, bothering me like a knitted Christmas stocking from grandma. Later in the autumn (or rather winter), I got another opportunity, and this time I took the chance to sort my thoughts on the matter. In this post, I’ll share my reflections. Yes, sorry for the long post – it’s essentially a 45-minute presentation, now in writing.

### Shu Ha Ri

I read an excellent book called [Coaching Agile Teams by Lyssa Adkins](http://www.coachingagileteams.com/), which introduced me to the martial arts concept of [Shu Ha Ri](http://en.wikipedia.org/wiki/Shuhari). This concept describes the phases of learning new skills:

- **Shu**: Learn the fundamentals and techniques. My mind often wanders to the Karate Kid and the famous wax-on, wax-off scene when I think of this level.
- **Ha**: Begin to challenge the rules based on the understanding of the fundamentals. For example, “What if I turn my hand like this?” or “In this situation, I might try this instead.” This is where you break the rules based on your acquired knowledge.
- **Ri**: Transcend the rules, improvising and creating new ones as needed, all while respecting the culture of the rules you learned and challenged at the first two levels.

### Wasn’t this about agile?

Okay, okay … I’m getting lost here. But I think the Shu Ha Ri model explains why many agile adoptions fail: we break the rules before fully understanding them. Or rather, we break the rules without understanding the reasons behind them. Why is it like that?

### We Love Our Tools – and a Word on Diets

Our industry loves and craves tools, guidelines, and best practices. We long for a short, sweet description that says, “Do this, and your software development project will succeed.” A [silver bullet](http://en.wikipedia.org/wiki/Silver_bullet) – even though [Brooks’ 1986 paper](http://en.wikipedia.org/wiki/No_Silver_Bullet) told us no such thing exists.

We know this, don’t we? We’re just hoping… Oh, we hope soo much. Like people still searching for a diet (only bananas, low carbon-high fat, pills, TV-shop), when we know that the answer is to eat less and work out more. It works every time. But we’re still hoping – maybe this blue pill will do the trick.

This longing for a quick fix explains the failure of many software methodologies and processes. For instance, [RUP](http://en.wikipedia.org/wiki/IBM_Rational_Unified_Process) was not intended to be used as many people used it. Nothing in RUP said to have year-long iterations. It explicitly mentioned that documentation templates were just that – templates to be modified. Yet we used all of them and all the headings, just to be sure.

Even the dreaded [Waterfall model](http://en.wikipedia.org/wiki/Waterfall_model) is a misconception and was mistakenly applied. The term was coined to reference a **flawed** model, yet our industry embraced it as if it were gospel. Why? Because it was something to hold on to.

> “The waterfall method you say…? I’ll take it”
>
> “But it’s **flawed!!** It was meant as a joke…"
>
> “Don’t care! It’s at least something”

[Dan North](http://dannorth.net/) gave an excellent [keynote at OreDev 2011](http://oredev.org/2011/sessions/embracing-uncertainty--the-hardest-pattern-of-all) where he said:

> “We’d rather be wrong than uncertain.”

Scary but true.

### Applies to Agile Processes

When agile emerged, starting with Scrum (at least in Sweden), we all thought:

> “Yes! That’s right! And with some rules along with it. Let’s go.”

So everyone started applying Scrum. Or at least tried. Or at least where it didn’t hurt too much. I have actually [never seen a Scrum implementation](https://www.marcusoft.net/2011/10/is-scrum-dead-is-scrum-aism.html) as it was meant to be; it’s always some part missing:

- Yeah, we do Scrum, but we don’t do standups/have a board/sit together.
- It was too hard to find a good Scrum master, so we have our own *applied* version of it.
- It’s Scrum-ish; we don’t meet our customers that often, and we have skipped iterations.

This is about not embracing the fundamentals that agile is based upon. Or, to return to the Shu Ha Ri analogy, we’re breaking the rules of agile without understanding why.

### What is Agile?

With that in mind, answering the question “What is agile” is not that hard:

> “An approach to software development based on the values and principles expressed in the [Agile Manifesto](http://www.agilemanifesto.org/)”

The Agile Manifesto highlights:

- Individuals and interactions over processes and tools
- Working software over comprehensive documentation
- Customer collaboration over contract negotiation
- Responding to change over following a plan

### But What Do They Mean in the Agile Manifesto?

I won’t presume to know exactly what they were thinking, but if we consider why they wrote what they did, we might learn something:

#### We are uncovering better ways of developing software by doing it and helping others do it

What’s behind this statement?

- “Uncovering” implies that they (and we) are still learning. This is not the truth once and for all.
- “Developing software by doing it” – all the signatories of the Agile Manifesto were developers, to my knowledge. They still had their hands in the dough.
- “Helping others” – this is based on experiences from many projects where they collectively were involved.

#### Individuals and Interactions over Processes and Tools

Why emphasize this?

Software is a **knowledge-creating** process – nobody knows the finished product before it’s done. Not even the customer. To succeed, we need to communicate frequently and effectively.

Focusing on individuals and their communication rather than on following a specific process or using a particular tool is key. If communication is effective, processes and tools become secondary.

What would change if you could talk to your end-customer/stakeholder each day? What is the number one thing hindering you from doing so? How can you change that?

#### Working Software over Comprehensive Documentation

This has been misinterpreted. It doesn’t say “No documentation” – it says “Working software **over** comprehensive documentation.” Documentation is needed, but working software is the only real measure of progress.

Why emphasize this?

Working software helps and delights the customer. Documentation alone doesn’t offer the same value. Delivering working software frequently allows for feedback, which is essential for improving and adapting.

Think about how happy your customer would be for a great requirements specification versus working software.

How can you measure the efficiency of creating working software? What documentation does the end-customer really need?

#### Customer Collaboration over Contract Negotiation

Why emphasize collaboration over contracts?

No one knows the finished product in advance, not even the customer. Contracts are often used to protect against uncertainty, but they can hinder collaboration.

In my experience, both sides often add extra time and resources to estimates to protect themselves, resulting in wasted time on contracts and budgets instead of delivering working software.

What could you stop doing if you sat next to your customers? How could you improve collaboration among different departments in your project?

#### Responding to Change over Following a Plan

This is at the heart of agile philosophy. How do you respond when a plan encounters problems?

Some people respond by making stricter plans and budgets, while others offer more flexibility for future projects.

Planning is essential, but I have found it more effective to make detailed plans for the short term and rough plans for the long term, acknowledging that things will change. Look up [Rolling Wave Planning](http://www.ayeconference.com/starting-with-rolling-wave-planning/) for more.

How would you set up your project differently if you knew that everything you have decided could change?

### So – Really, What is Agile?

Agile is a philosophy, a way to approach system development. There are no steadfast rules on how you should or shouldn’t do things.

To “become agile,” you and your team must apply this philosophy and then adjust your process and behaviors in small steps toward this thinking.

I find simple goal-statements, rephrased into questions, useful to guide myself and the teams I coach:

> “Will this (meeting, feature, schedule, prioritization) make our customer happier?”
>
> “If you were forced to deliver new functionality into production every month/week/day, what would change first to achieve that?”
>
> “How could we solve the number one hindrance you see to deliver every other week?”

### Conclusion

This is how I see the question and its answer today. My perspective will likely continue to evolve, but that’s part of being agile.

I hope you found something useful in this. I certainly did by forcing myself to write it down.
