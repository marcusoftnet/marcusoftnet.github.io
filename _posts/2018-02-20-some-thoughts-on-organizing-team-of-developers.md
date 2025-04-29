---
layout: post
title: "Some thoughts on organizing a team of developers"
author: "Marcus Hammarberg"
date: 2018-02-20 08:34:00
tags:
 - Agile
 - Scrum
 - Kanban
 - Lean
---

Got a question in an email the other day, asking some advice. Nowadays when that happens I ask permission to publish the answer here to not [waste keystrokes into the email-bin](http://keysleft.com/).

The question was from my friend Jonas, that works in a start-up that is growing rapidly. He kindly granted me permission to answer here. He was asking this (my translation):

> We are on the brink of a substantial expansion and I was wondering if I could pick your brain on experiences and best practices for how to organize a team of developers.
>
> We're thinking about a team of 4-6 people that has responsibility for a specific part of the product. What roles and responsibilities should be in, or out, of the team?

And in a follow-up mail:

>In particular, the product owner role and what that role does and doesn't do. I like the PO very local and present, but many people seem to have the PO outside the team as an ordering function. For me, the PO is the one that maximizes the customer value, prioritize the backlog but also helps the team to reach their full potential.

Well… that was a very thoughtful and great question. Thank you for asking me. I'll try to match the question with an answer at the same level.

<!-- excerpt-end -->

Just so that it has been said; this will, of course, be a general answer based on my experiences, and without any particular experience from your context.

It's important to say that because your organization and team setup should be there to try to reach the goal of the organization. The team setup is just another tool. One that we might need to change in response to new opportunities and challenges. Growing rapidly for example.

When it comes to recommendations I wanted to talk about 2 things as the basic premise for my recommendation; flow and Conway's law. Let's start with the latter.

## Conway law

[Melwin Conway](https://en.wikipedia.org/wiki/Conway%27s_law) was a computer scientist that way back (1968) coined his famous law:

> organizations which design systems ... are constrained to produce designs which are copies of the communication structures of these organizations.

Or for simpletons like me:

> Our product/code will be structured as our organization is structured

For years I thought about this law as something bad, and something that we should try to steer away from. Then my friend [Tobbe Gyllebring](http://twitter.com/drunkcod) said something that made me think; it is a law, you know. You cannot escape it.

He said something else, more on that later, but that is the thing that got me thinking. Because Mr. Conway observed a law. In the scientific sense. It will happen. We can choose to fight it (for the rest of our existence) and I've seen many organizations do precisely that. In these organizations you will hear comments like;

> Everything is slowed down due to our dependencies

> We can't get anything done by ourselves, we depend on A, B and sometimes C & D too

And [my favorite](https://www.marcusoft.net/2016/04/what-are-you-optimized-for-then.html):

> The value stream cuts across many organizational borders.

(Take it easy start-up-Jonas, there are tips in here soon. Just need to lay the groundwork first.)



But, there's an opportunity in the Conway's Law too. This is what Tobbe was talking about; [the reverse Conway manuver](https://vimeo.com/108017431). In short; if this is a law (i.e. it will happen) we can also use that fact to our advantage. For example by building teams as we want our product/code organized.

If you make teams called input, compute and output - what will happen with your code base? Well, there might be some problems at first but after awhile; you will probably have input, compute and output components. Separated and within them, the teams can move, hopefully, relatively independent. The way they talk with each other needs to be well-structured and established, but within they are free to do what they need.

The problems arise when you try to do stuff across these boundaries; like a project cutting across all of these at once for example. That would then create the same kind of problematic dependencies as we often have in other organization.

So, the tip from Tobbe and Melwin is:

> Set up your organization as you want the product/code to be organized

## Flow

But why really? Dependencies will always be there, right? There's no escaping them either.

No, that is true. But the problem with [dependencies is that they slow down the flow of value](https://www.marcusoft.net/2018/02/flow-and-dependencies.html). And we sure want a fast and smooth flow, because that ensures that we learn faster, deliver value faster, innovate faster, keep risk down, can change decisions faster and more frequently etc.

Basically all the good stuff (TM)!

In fact! Let's make that the goal of how we organize our teams:

> Optimize for flow of value!

That means that we want the decisions we make around team structure and organization to ensure that value flows smooth and fast. This is a great North Star and helps us to make tradeoffs and decision.



And just for completeness - not optimizing for flow would be something like optimizing for resource utilization. Or in other words, ensuring that everyone is busy all the time. That is a noble art that has been mastered by … no-one that I've met.

Even if we should succeed with that (everyone 100% busy), imagine what that would mean:

* No time for reflection
* No time for improvements
* No flexibility
* No customer focus or time to listen to them

Don't go there. Trust me on this.

## Tips using a flow-perspective

(Startup-Jonas - take our your notepad; the tips are starting now)

> We're thinking about a team of 4-6 people that has responsibility for a specific part of the product.

Yes! That sounds very reasonable since they now (according to Conway) will structure that part of the product as a separate thing, where they can move independently within.

But let me ask you a few questions, from the perspective of the flow as our guiding star:

4-6 people? Do you think that it will help value to flow? Would 2 teams of 3 people be better? What kind of problems would that cause… to flow? How would you see these problems? Any metrics for that?

If you are not sure (and you are not - that's ok. No one is); try for awhile and see if it works. Do retrospectives frequently and reflect on your current flow and see how the structure is helping you. [*Change* when needed.](https://www.marcusoft.net/2013/10/YesITalkAboutChange.html)



> a team of developers

Really? What about testers? Are the developers testing? All the way? Can they deploy as needed?

This, dear startup, used to be a big problem back in the days, at least in big organizations. Nowadays - serverless and deploying is a distant memory of pain.

But will the developers be in charge of testing? Great. How can you ensure that they both built the right thing and built the thing right? Check out [Specification by example](https://gojko.net/books/specification-by-example/?src=/) for one (!) way to do that.

Do you need other roles in there to improve flow? Designers? Product people? Marketing? What would improve flow? Or rather how can we ensure flow?



> In particular, the product owner role and what that role does and doesn't do. I like the PO very local and present, but many people seem to have the PO outside the team as an ordering function.

Yes indeed. Let's talk upstream work? This is, in some organizations, a very tricky question.

What if the PO is outside the team? Will that improve flow? Here are two different takes:

* No - because then the team will have to wait to ask the PO what to do next and also to know if they have built it right
* Yes - because the team knows what to do next really well. This means that the PO can prepare the work that is upcoming and ensure a smoother flow of the right features at the right time?

Ensuring that the team and PO are in sync means that you will have a faster flow. The best, easiest and cheapest way I know is to have the PO sit with the team. Have the upstream work on the same board as the developer work.

It's just another kind of work - that is better to sync on frequently rather than on bi-weekly-demo meeting. Just like developers doing some front-end, some back-end, and some admin work - everything doesn't need to be done together, but sync frequently.

My experience is that more frequently syncs leads to better flow.



> For me the PO is the one that maximizes the customer value, prioritize the backlog but also helps the team to reach their full potential.

Yes. But how does it help the flow that this is separated from the team? A PO that drops feature requests into the team, is not part of the team. In my book that is a dependency that we have decided to create in our organization.

That last part (`but also helps the team to reach their full potential`) was interesting. For me the PO's responsibilities are absolutely that; when it comes to delivering value (building the right thing, now). This is done by grooming and preparing work (maybe together with developers(!)) that then can flow smooth and fast.

When it comes to making them a team of their full potential that could be the POs work, but it could also be someone else. Like anyone in the team, a lead in the team or another function like a coach.

## Conclusion

Thanks for a great question, that really made me think!

My recommendation and experience tell me that you should take **flow** as a leading North Star and see how you could organize your teams for improved flow. Then you have something to lead your decisions;

> Will this improve flow? How, tell me?

Remember Conway's law and that it is a law. Don't fight it - use it!

The best of luck to you!
