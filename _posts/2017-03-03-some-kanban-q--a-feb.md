---
layout: post
title: "Some kanban Q & A Feb 2017"
author: "Marcus Hammarberg"
date: 2017-03-03 09:04:44
tags:
 - Agile
 - Lean
 - Kanban
---

My job is to help clients to use and adapt the principles of lean and agile to achieve a better flow of value. Sometimes I get questions from friends and old clients about how to do specific things. And sometimes I get questions from complete strangers.

Last Tuesday was such a day when Emily reached out via email and asked me three insightful questions.

I was happy to do that and my "fee" was that I can publish the questions and my answers here on the blog. So you're reading my payment

<!-- excerpt-end -->

### When applying this process how did you educate your customers?

If you with customers mean the people downstream from us, receiving the value of our work, I often recommend transparency and small steps. One of the best things with kanban is the first principle of "Start where you are". That means that for starters with don't change a thing - we just make our process more visualized or transparent. This, in turn, would create an open atmosphere and show what is going on.

### What were their main objections, how did you overcome them?

The most common objection is that people downstream from us are not ready to receive smaller batches of work more frequently. For example, they might have release schedules of their own to adjust to.

Also, I've sometimes found problems with people not being able to keep up with frequent changes in communicating with customer support etc.

Both of these problems have been overcome with [Feature toggles](https://martinfowler.com/articles/feature-toggles.html) that enable us to deploy a feature to production, without releasing it to the public. It can, for example, be hidden for all users but ourselves.

Read more in the excellent book on [Continuous Delivery](https://www.amazon.com/Continuous-Delivery-Deployment-Automation-Addison-Wesley/dp/0321601912)

### Once they bought into this how did you keep them involved? Do you regularly involve them in prioritization meetings?

Yes, the whole idea of lean is to move small things through the entire workflow faster. Little by little this would involve people upstream and downstream from us in our work. From the beginning, not much might change but in the long run, our whole way of cooperating could be very very different.

For example, it's not uncommon for Toyota to first send Lean sansei's to their suppliers to educate them and change their processes to be more aligned with Toyotas way of working. Ultimately Toyota very often ends up buying their suppliers (or at least large portions of their shares).

But that is the long-long term perspective. For starters, a strong emphasizes on transparency and continuous improvements of the relationship, through regular improvement workshops could be a great start.

### From the internal team perspective, I imagine that one of your team members might be working on more than one project ...

That was too long to be a heading. The whole question is:

> From the internal team perspective, I imagine that one of your team members might be working on more than one project at a time e.g. an iOS developer might be primarily working on a new project but also supporting some previous app that he worked on, Correct? In this situation, how do you create that visualization and how do you perform capacity planning?

There are many ways to visualise this. I would recommend [Kanban In Action](http://bit.ly/theKanbanBook) for many ideas as to how. Especially check the chapter on classes of services that is one way to classify work into different classes. Each class of service then have a policy adhered to it so that people knows how to handle, prioritize and behave around that kind of work.

A very common way to visualize this is to create separate "swimlanes" across the board with a policy for how to prioritize. There's often an expedite lane; work put into here and we'll let all other work go and only work on that. The entire team stops and does that. Doing that, of course, makes that expedited item move really fast - but at the cost of all other work slowing down.

With a swimlane for things that we support we might have a policy that says that within 2 days we pick those items up. A little looser prioritization but still a help to help those items flow faster.

## Conclusion

Thank you, Emily. Great questions. I hope you and your organizations benefitted a little bit from my answers.

I also hope that you, dear reader, got something out of these answers.
