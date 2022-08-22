---
layout: post
title: Sprint Planner Helper – Session 8
date: 2009-02-12T23:02:00.001+01:00
author: Marcus Hammarberg
tags:
  - Sprint Planner Helper
modified_time: 2009-02-12T23:03:22.105+01:00
blogger_id: tag:blogger.com,1999:blog-36533086.post-5063613979911026979
blogger_orig_url: http://www.marcusoft.net/2009/02/sprint-planner-helper-session-9.html
---


This hour almost entirely was reading. I didn’t not feel comfortable yet
with terms Repository and Service, or how they relate to each other.

Also I feel that I have looked to much at the architecture of [ASP.NET
MVC Storefront Starter
Kit](http://www.asp.net/learn/mvc-videos/#MVCStorefrontStarterKit). I
have incorporated stuff that I didn’t thought to much about – stupid,
but I did it anyway.

But after a while I found this [introduction to
DDD](http://msdn.microsoft.com/en-us/magazine/dd419654.aspx) and it
explained some things for me. Here is how I understand the two
fore-mentioned concepts:

-   A **Repository** are classes and methods that is used to load stuff
    from a data store. They are often written in a way that is easily
    mocked or replaced during testing.
-   A **Service** is used to hold a process or a flow through a business
    logic that does not fit well on a class in the domain model. They
    are stateless and take the entity that they operate on as parameter
    or loads the entities into memory via a repository.

Right now – in my solution there is a strange layering going on… The
Controller is calling the Service that in turn calls the Repository.
Although that could happen there really is no need for it since I am
only getting stuff yet. If I later on need some functionality that
doesn’t fit well into my domain model I will introduce a service for
that.

Finally – so what I did was simply to remove the services and then
TDD:ed (hey, that looks funky) a way to inject a repository into the
Controller. It caused me to move things around a bit in the solution.
But for the better. I learned that test-projects should only contain
tests. TestData Repositories for examples are better placed in the
Repositories-assembly.

I am really going back and forth – but at least I know what I am doing.
And that’s the way you learn. Especially since I am on my own.
