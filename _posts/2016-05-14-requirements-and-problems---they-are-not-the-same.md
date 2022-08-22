---
layout: post
title: Requirements are not problem/opportunity descriptions
author: Marcus Hammarberg
date: 2016-05-14T12:59:58.000Z
tags:
  - Agile
  - Lean
  - Life of a consultant
  - Kanban
---

A few weeks back a [team mate](twitter.com/anjonsson), developer and agile dude extraordinare, said something profound:

> I'm used to people coming to me with problems they need solved. Not solutions.

It was in a backlog grooming meeting and we were discussing if the item was ready for the development team to start to work on or not. It was. Well and ready. But the people writing the *requirements* felt that it was not worked through enough.

At the time I just giggled a little about this but it got me thinking and herein lies the heart in how the work with a backlog changes when you start to "do agile" or work in shorter releases.

<!-- excerpt-end -->

I'm reading [Jeff Pattons](jpattonassociates.com) awesome book [User Story Mapping](jpattonassociates.com/user-story-mapping/) and it's full of learnings on close to every page. In one episode mr Patton retells the events when he questioned *Why* a certain item needed to be in the requested way, what the real *goal* was. The answer was short and brutal "They are requirements" and a meaning look.

> I learned that day that Requirements means "Shut up"

The section ends. Fun, sad and true all at the same time.

## Requirements are solutions

It dawn on me that a Requirement is a specification on **How** something should work. Most Requirement documents I've read tells a lot of details on where it should be stored and implemented in different systems, which services that should be called.

In one particular horrible story I remember that the developers had stopped calling themselves developer and used the phrase "constructors" instead. That was an apt name, because the "system designers" that was the instance before them wrote pseudo code in Swedish that they later translated into COBOL.

There's no problem to solve, that's already done by others. All that's left is to translate the description of the Requirement in Swedish (or some other language) into code. That's what we are waiting for. Can you please do that faster?

## Why?

But where does this come from? When was it ever a good idea to write Requirements? Well, I think it's a great idea if you are very interested in how it's going to be built. That it's built correct according to you.

One circumstance and context is the outsourcing world; I write a document defining for "them" what to build and I send it to the other end of the world. "They" code the system up to my specification. When I get it back I check that they followed my requirement and we then together argue over who misunderstood what in my specification.

## Long lead times

The problem is closely related to long lead times - once I send the document to "the others" it will take a long time before they finish and I get the implemented system back. I have to make sure that it is correct, well written and easy to follow. Hey - it's actually specifying how the system should be built.

## User stories express needs

User stories are not requirements. They express needs (or problems if you want to go down that route). "If only I could see the X value on the overview page", "Imagine if we could get some kind of type ahead search for names…" or "Looking through order history really is a pain."

After each of those you can add

> Could you help me fix that? Please?

That's a much nicer way than stating a "requirement" that needs to be fulfilled. After each requirement I feel that you could add "… or else" and stare at the people already late with an angry face.

In the User Story mapping book mr Patton restates in many places:

> User stories are meant to be told - not written.

## I used to write Requirements. What should I do now?

First of all you probably are a domain expert. Which means that your knowledge and skills are plenty in demand to help the team to build the right thing.

Secondly, one thing that I often miss and that a development team have a hard time to articulate is the business metrics around what success looks like. Defining and quantifying the goals of a particular feature helps us to aim correctly, not build the wrong thing and not build too much of a thing. Again from the User story mapping book:

> Your goal is to build as little as possible to reach the desired outcome

Also note that everything that we are producing in a system development process is cost. It's not value until the feature is in production, used by users. Code, testing, documents etc should be kept to a minimum to ensure that we can move quickly.

# Summary

User stories are not small requirements. They completely change the relation between the product owner and the people that can help him to reach the goals of the product.

With Requirements a product owner expresses How the system should be built. The team then writes that in code.

With User stories a product owner express a need or a problem that the team can help him to solve. The How is up to the team. The Why (and definition of what success would look like) is up to the product owner.

