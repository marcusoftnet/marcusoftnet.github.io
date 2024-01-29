---
layout: post
title: "Do not put tasks on the board"
author: "Marcus Hammarberg"
date: 2024-01-26 16:00:00
tags:
  - Life of a consultant
  - Kanban
  - Lean
  - Agile
---

A common problem I see on #kanban boards is that we are moving tasks, not stories. This misses one of the core ideas of #lean, is hard to report status for, focuses on resource utilization, and invites compartmentalization (anti-teamwork). But other than that – it might be a good idea 😊 
Let me explain. 

<!-- excerpt-end -->

I often see tickets on (JIRA, we surrendered to its impact, haven’t we?) boards that are called `Develop X`, `Test X`, or sometimes even `Implement backend for X`, or `Update database index in table SOMETHING_USED_BY_X`. 

## Value for a user

The core idea of a user story is that it focuses on some value that we provide to a user. While developing this value we need to do a lot of small steps. For example, consider a report that needs to be created (I’ll leave it for you to make up a `So that …, As a …, I want …`` part). 

There are a whole bunch of tasks that we need to take there:

- Write the specification.
- Implement the web interface.
- Update the API
- Produce the report template.
- Write unit tests.
- Write integration tests.
- Perform regression testing to ensure that all the other reports still work. 
- Deploy the application.
- Write release notes.
- Etc. etc. etc. 

Let me ask you this – which of the steps above creates value? *The author left time for the audience to ponder. And then he continued*: Exactly! None of them. Or all of them together. Or ... wait a minute here.  

That’s the sad reality of software development – each task contributes to a whole, whose value is not realized until a user uses it in production. Until then the feature, and all its sub-tasks, is truly useless. 

But, I’m not denying that those steps are needed. It’s just that our user (you know, the person that pays our bills) don’t really care about those steps. She’s like “Whatever man – just give me the report. Before that, not really interested.” I’ve written about this before in the [blog post When was Lars happy](https://www.marcusoft.net/2019/09/when-was-lars-happy.html). 

Conversely, if we focus on the whole, we also automatically focus on the value for the user, in conversations about the ticket. This is something I’ve seen very beneficial throughout the development process. 

Mike Burrows puts it well in his [Working definition of done](https://blog.agendashift.com/2016/05/25/a-good-working-definition-of-done/)

> Done means that someone’s need was met. 

A task, part of the process of creating that value, is not that interesting and useful to the user (have you ever got a “Thank you” from a user for the great documentation you wrote, or test, or code or specification…?)

## Throwing across the wall

If the tickets are called `Update the backend API` or `Test that parameters are correctly managed` it’s very likely that people do exactly that. Which is good, but also inevitably leads to me focusing on only my job and leaving the rest to someone else:

- `There – that spec is now written. Developers will figure it out, or ask me I suppose.`
- `There – that was my code done! If there are any bugs in there, I presume the testers will find them.`
- `There – testing is done. I wouldn’t have written it like that, but hey – it works.`

Tasks focus our attention on tasks – user stories help us focus on the whole.
I’ve yet to meet a team that thinks that Quality is just the testers' responsibility (even though they are sometimes called Quality Assurance). Not it’s everyone’s responsibility – we together need to work on it. 

And you know what, having a tester to bounce ideas off is a great resource when writing both code and specifications. Having a developer next to you when doing testing is not that bad either. 

## Focus on resource utilization

A task is done by someone. The tasks on the board naturally shift our focus to the person doing the task. Which in turn shifts our focus to asking if people have things to do. I’ve already written about not focusing on keeping people busy in standups (https://www.marcusoft.net/2017/03/comments-on-board-practices-7.html) but I can reiterate one point here:

How many people, without anything to do, just put their feet up and wait? I’ve been in the IT industry for over 25 years and I’ve never seen it. What do we do instead? Start something new, of course. 

That means that work in process just went up, which both slowed down the process for not only that piece of work, but everything else in the process (there are [mathematical proofs for this](https://en.wikipedia.org/wiki/Little%27s_law) ) but also made the thing we are working on more complex as we now have more moving parts. 

It’s better to do nothing than to start new work. But I’m sure you are smarter than that and can ask:

- `Can I help someone out, to finish work that is ongoing?` Yes – even if it is something that you usually don’t do. Like developers testing for example
- `Can I help to prepare other work for upcoming steps` – like the specification work of the next feature?
- `Can I improve flow in our process, by improving our tools, test suites or reporting capabilities, so that we can move faster in the future?`

It’s not important that everyone has something to do – as long as value keeps flowing (<= that statement got me sacked from an assignment)

## Status reporting

If we have a lot of tasks on the board, it will get really hard for people around our team to understand what is going on. 

> How is that report story coming along?

> Great – we have updated both the API and the database index.

Instead, we want to talk about the progress of the story itself. Here I think much of the lure of breaking down into tasks stems from. Because then we can say things like 12/25 tasks are completed. In tools like JIRA, this happens automatically. 

And let’s use that then – but remember that the value of the story is not connected to the completion of the tasks. And that one task can take considerably longer than another… 

Better is to make smaller stories and move them faster across the board. There’s nothing building trust more than delivering value. If you then start to do some statistical analysis of how long stories usually take … pretty soon you will not be asked to report status at all. 

## Work in process limits

Limiting working in process (WIP) is also a great tool to use to hone your focus and work as a team. The value of WIP limits lessens significantly if you have tasks on the board, as tasks focus on parts of what makes the story. 

If you need to do 100 tasks to complete a story, I feel sorry for you, but other than that - the user of the feature *still* doesn't care. 

Long-time CEO of Scania, Leif östling said:

> The customer doesn't care how we are organized.

Exactly - the number of steps in your process is irrelevant to me. I'm using your product. 

Have WIP limits for stories – not tasks. 

## But what about the tasks then?

If you think that you need them to remember what to do – create them. Don’t have them on the board, is what I’m saying. They can be part of the stories that we don’t show and just use instead of a notepad next to our computer. 

Also, don’t track progress with the tasks, since that shifts focus back to what I talked about above. Use them a little to-do list, if you need. 

## Summary

Don’t have tasks on the board. It will ruin a lot of the good ideas behind kanban, lean, and agile. 

It might be hard to shift over, but your flow, value generation, focus on end users and teamwork will improve from doing it. 