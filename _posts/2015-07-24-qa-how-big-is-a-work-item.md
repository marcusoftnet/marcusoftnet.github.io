---
layout: post
title: "QA: How big is a work item?"
author: "Marcus Hammarberg"
date: 2015-07-24 11:47:02
tags:

  - Agile

  - Kanban
  - Life of a consultant
---

Sometimes people email questions to me, directly. I love that (although I sometime need to postpone the answering for awhile) because it gives me such nice insight into how other teams work and function. Basically: I learn more and as you can see from the tag line of this blog... I'm into learning stuff.

The other day I got a question that I've heard before in variants. It's also very reasonable and a bit complicated to answer: "How big is a work item really?"

I also got permission to publish the whole question and my answer here.

<!-- excerpt-end -->

Here's the question from their email:

<blockquote>
	We use the Jira platform for managing tickets and are using the in-built kanban board for the same.
	I would like to know how we can manage Subtasks within Change Requests.
	Would it be  a good practice to have Change Requests and have subtasks in them? Or should we just have single development tasks?

	Could you please advise regarding this ?
</blockquote>

My answer was something like this:

When it comes to your question I have very little experience with [Jira](https://www.atlassian.com/software/jira) and cannot comment on how to solve it there. I can however give you some general advice and most likely you can do a much better job than me translating what that means into how to manage it in Jira.

I usually recommend the teams I coach to keep the work item customer facing. That is consider what the value of the "sticky on the board" represents for your user. Each work item can, and most often do, consist of smaller things. These I consider to be "steps in the process", most likely not interesting to the customer.

A simple question to see if it should be a work item or a subtask is to consider who is interested in the status of it. If it's the "customer" then make it a work item, if it's mainly for the team then make it a subtask.

Please note, that the "customer" can change. Let's say that one Change Request is about "Update the Finance Report for 2015". In that CR the subtask "Create new table in database" is not interesting for the "customer". However there might also be another change request, initiated by a DBA for example, to "Refactor database tables" which should be a work item.

In your case I would keep a Change Request as the "sticky on the board" and have the subtasks internal.

I hope this helps you.
