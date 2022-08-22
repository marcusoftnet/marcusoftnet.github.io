---
layout: post
title: "From push to pull - the essence of kanban"
author: "Marcus Hammarberg"
date: 2017-08-23 10:47:16
tags:
 - Lean

  - Kanban

  - Agile
  - Life of a consultant
---

I have been working with a team now for close to 6 months. It's the same old story; team has a lot of very important things to do from 4-5 different stakeholders around the company, team try to keep up, stakeholders around them get upset with the slow progress on the "features", team struggles under a lot of tech debt that team postponed earlier to get faster progress on the "features".

If you've been in any larger IT organisation the last 20 years, you know this story. Your basic "hard-working, well-intending, trying to cope with the demand from the organisation"-development team.

What I've found fascinating with this team, except that the engineers are amazing developers, is that the whole team feels trap. I've asked them numerous times to cut down on work in process (WIP) or cutting items into smaller pieces. Every time I've got confused looks and people say things like:

> But it's already on our backlog. We cannot do anything about that.

The other day we tried to do something about this and in doing that we found a key principle from lean that was missing here. We also discovered two different aspects of planning that helped us to sort this up.

In this post, I wanted to share what I learned about these principles and ideas. And show what we did. There's nothing earthshattering here. It's just [kanban in action](http://bit.ly/theKanbanBook) and some lean thinking.

<!-- excerpt-end -->

## Who knows what is important… now?

As I mentioned above the team has 4-5 groups of stakeholders around the company. This is not uncommon and neither is the way we handle this. We have put a proxy for these groups in front of the stakeholder groups.

This person is in many organisations referred to as a product owner. Which, in all honesty, is a pretty misleading title since there's no ownership to take, nor is there a product to govern as much as different projects and stakeholders competing over the sparse capacity of the team.

Our product owner, as most I've seen in this complicated role, is doing a great job. He even told me that he went through the backlog and filtred out the items on our list from the different stakeholders. Then he went through the list and sorted them in prioritized order. To the best of his knowledge.

He sent an email out and said: this is how I understood it - do you agree? He didn't have to wait long. One of the stakeholders wrote back in return:

> Mostly ok, but item 3, 6 are the same. 4 and 5 can be removed as they are not interesting anymore.

This was the first time we started to feel that something is not right in the way that we do things. Because who knows best the needs of a stakeholder? That's right - the stakeholder themselves.

I think that we in many organisations create more problems than we avoid by accepting the items from many stakeholders onto our backlog. The priority is based of timing and need - and the people that know this the best the ones closest to the need. Reminds me a bit of [David L. Marqueet excellent saying](http://www.marcusoft.net/2014/06/move-information-to-authority-and-not.html):

> Move the authority to the information!

Finally, saying No (which by many is hailed as key product owner skill, I included) becomes hard and akward. Imagine the conversation:

> Stakeholder: Please do feature X now!
>
> Product owner / team: NO! We are doing feature Z. If you don't like that go to the feature X stakeholder and tell him.

Worse - if the product owner or team doesn't say anything, we have silently accepted that we will work on the item. And the stakeholder now leaves prioritizing up to the team members in their daily work.

### Going to pull

In this particular company, where the story takes place, anyone can create issues in a company-wide accessible issue tracker. This is great since it's very open and transparent system. The problem is that items land on different teams backlogs without prior notice.

On average our team handles 3-8 items per day that lands in our "inbox". They vary in both size, area, complexity and importance. The team will now end up comparing the items that just arrived with the once that we already have on our backlog since before.

Here's another situation where saying No because awkward. First we could say no to the incoming issue or suggestion;

> Hey, guys! Could you pleaseNO!
>
> Sorry, I was just askingNO! NOOOOOoooo!

Pretty awkward for both parties. So maybe we down-prioritize things that we already have on our backlog instead. How would that play out?

> Oh, by the way. Remember that thing that we said last week that we are going to work on? Not happening. Stakeholder Z wanted another thing, so we throwed your thing out.

This type of conversations is something that I've forced the team into. Sorry...… Because I asked ~~demanded~~ by the team that they put in a limit of the number of things in their Inbox.

We had noticed that our backlogs kept growing, never shrunk and things way down on the backlog never got done. By putting in this limit we at least make it clear where our limit is and the awkward conversation can be held earlier. I've found, from painful experiences, that hard conversations grow exponentially harder the longer you wait to have them.

> Oh, by the way. Remember that thing that we promised that we were going to do **6 months** ago? Yes, the one we have not talked about since.
> Not happening!

I think that the way to solve this situation is to shift the flow of work from push to pull. Now, we are very lucky to be in a company where most [people speaks warmly and nice top each other](http://www.marcusoft.net/2017/01/kindness.html) so make this shift is not dramatic.

Right now a **stakeholder** would ask:

> Can you please do this other things too? Fast, if you can?

But I think a better way is to have the **team** say:

> Pardon me, dear stakeholder. How are the kids?
> Oh, just wanted to tell you that we, in a day or two, have room for one more of your items. Which one would you like us to work on next?

The difference in these two conversations is the direction if you can see through my vain attempts to be funny. Because, just as the stakeholder should know what is most important now, the team should know what a reasonable work-load is for them. Now.

![An over-capacity loaded donkey](/img/donkey-in-air-cart.jpg)

The picture above is my favorite picture on the topic of pull and capacity planning on the internet. I could probably do an entire 3 hour introduction to lean based on this picture alone.

Anyways… the problem is obvious with the picture above. More troublesome is that the donkey knows. Oh, she knows so well, when they are close to his maximum capacity. I could hear the scream of the donkey as she feels the hooves take flight on the second to last bag.

And in the situation the donkey is in now, no value gets created. No bags are delivered. The donkey knows that. Let the donkey say when enough is enough.

Same goes for teams. No other comparisons made between donkeys and teams.

### Where should we spend our valuable capacity next?

That leaves one part of the puzzle. We have said that:

* Stakeholder knows best what is most important to work on. Now. Because they are closest to that information
* The team knows what a suitable workload is for them. Now. Because they are closest to that information.

The level that is missing is the (operational) strategy. Where is the capacity best spent, right now? I don't think that one stakeholder is the best person to make that judgment, at least not as long as that stakeholder is competing about the same capacity as other stakeholders. Which, is the normal situation in my experience.

Rather decisions like these should be made with a large scope in mind; what is best for the company-kind of thinking. This is probably best done in some kind of operational planning, leadership bi-weekly get together. In fact, this type of meeting has been called *[strategy review](http://blog.kanbanery.com/the-seven-kanban-cadences/)*, in the kanban community.

Out of this meeting, we want to have clear directions on how the capacity should be allocated between the different stakeholders for the upcoming period. Here's an example on what can come out of such a meeting:

Given what we know now with our company and local priorities we have decided that for team X priorities the capacity like this:

* Company project 1 gets 40% of your capacity since that is … well, our company bet #1. We want progress in that area still - let's divide capacity for it.
* Stakeholder B has a lot of small needs that needs be completed before the report at the end of the month, so they will get 20% of the capacity
* The team get 20% of the capacity to decide on how to handle technical debt
* The rest is left as slack time or to be used for emergencies.

You can, of course, argue for and against these priorities. I can already now hear poor Stakeholder C that have not been granted any capacity at all for the last 5 strategy reviews screaming in agony. Maybe next meeting, C-ey. Maybe next...

But rememer that we are now discussing capacity planning. It's not about **what is most important now**, because that is something that the stakeholder is best suited to know and care about.

We are not asking the team to take on more work, it's just about how to divide their capacity, **on a suitable workload level**.

If a company is under pressure to do many things there should be frantic activity in the prioritizing and capacity planning work - the work for the team should be … just as normal. This is better both from a human, quality and speed of flow perspective

#### Percentage?! Dream your dream, sonny

When I first started to think about this I felt like was dancing close to handling percentages of … gulp … resources (that is humans, for the rest of us) in a project. But that's not really what I mean.

You could be lucky and be a team of five people that can work on all parts of your area. In our example above that plays out nicely (40% = 2 people, 2x20%=1+1 person and the last of us on slack/goalie/first-line-support work).

But I've found that counting cards are both easier and more flexible. As we take one "company bet 1"-card down, we should check that the balance of the number of cards on the board adds up to the balance what we decided.

This means that cards need to be roughly equal in size. My suggestion is that we slice them up to a suitable size; what we think will take a team member a couple of days, is a good starting point. If they are not in that size as we get the wishes from the stakeholders we can help them to slice the item up. Maybe that is a good first column on our board. Or if it's time consuming, as in taking up much of our valuable capacity; we can help the stakeholder to do it by herself.

This way of slicing stories into suitable sizes is sometimes referred to as [Goldilocks estimation](http://www.marcusoft.net/2016/03/sml-estimates-dont-start-from-days.html) and gives you much more benefits than to try to guess how long something will take. Now you can easily, and comfortably just count the number of cards on your board.

#### Reporting

One extra feature that is easily accomplished when the team pulls in small chunks of work is an easy and informative way to report progress. After just a few weeks with working with the system, the team would know how many items they complete per week.

The stakeholder can use this information to further prioritize the backlog of his need:

> From the last months worth of work we see that we complete about 2 items per week from your backlog.
>
> The backlog is now 549 [true! I was there, Marcus comment] items long. It will take us about 6 years to go through all of it

That might not qualify as good news but it's honest and now we can do something about our reality, rather do something about our guesses about the future.

### First ever kanban team… In the world

Remember above when I said that one stakeholder probably not is the best person to decide on how the capacity should be divided. That exact situation was the situation that Dragos was in when he created the first ever kanban team in software development.

This is documented in [David J. Anderssons seminal book on Kanban](https://www.amazon.com/Kanban-Successful-Evolutionary-Technology-Business/dp/0984521402), but the story goes a little like this;

The worst support team in Microsoft was handed to [Dragos Dumitriu](http://edu.leankanban.com/users/dragos-dumitriu). They had 4 stakeholders, spread across the globe, a huge backlog and "nothing" got done. Dragos estabilshed a WIP limit on the inbox of the team and then simply called the stakeholders up in a meeting stating:

> We have room for 4 more - what do you want… now?

For my inner eye, I see how he then took cover behind a sturdy desk. But in reality… they actually pretty quickly got in agreement. There was some bargaining between them ("Ok, you can have three now, but then you will have to wait until the rest of us have had at least two each. Ok?").

Before long, the meeting was a scheduled email that was sent out as the Inbox-column was growing smaller and the stakeholders responded to that email to replenish the Inbox of the team.

Oh, by the way. That team became, with the exact same staffing, the best performing team within all of Microsoft. Within a year. Pull is powerful.

### How to set this up practically

Ok - that was a lot of story telling and some ranting. How can this be done in practice? I think it's simple to accomplish.

Here are a few first steps:

* Ensure (or help) each stakeholder to create a prioritized list of things that they want to be done by you.

  Make sure that this list is not part of your board or responsibility.

  It can be in an issue tracker, spreadsheet, a [mindmap on a whiteboard](http://www.impactmapping.org/) - whatever works best for that particular stakeholder. The important thing is that the stakeholder needs to be able to answer the question:

  > What do you want us to work on now?

* As work comes sent to you make sure to send that work to the correct stakeholder, for them to make a prioritization with what is on that board now. That prioritization is better done by the people that are closest to the information of the prioritization.

  Remember that most likely one of the stakeholder is the team itself, as they should have some capacity allocated for them to handle technical debt. You can become a great role model for other stakeholders on how to handle a backlog

* Let the team decide on a suitable workload (in number of items).

  There's many ways to do this but remember that lower is preferable, but too low means that you can cause all work to be halted any problem.

  I usually start with 1,5 item per person and then decide with the team that we will try to lower this each week until it starts to be painful.

* Establish a capacity division between your stakeholders, if that is not known. If it's not known just make up a capacity division and then call for a meeting with the stakeholders to discuss it.

  You probably know pretty well, but if not you have just called your first ever strategy review meeting.