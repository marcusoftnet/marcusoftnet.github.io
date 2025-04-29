---
layout: post
title: Sprint Planner Helper – Session 7
date: 2009-02-11T21:15:00.001Z
author: Marcus Hammarberg
tags:
  - Sprint Planner Helper
modified_time: 2009-05-05T09:16:17.420Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5605745566373223322
blogger_orig_url: https://www.marcusoft.net/2009/02/sprint-planner-helper-part-8.html
---

I’ve been doing some major reworking of the repository that I am using, from being a product repository to being a `ProductOwnerRepository` and a `ProductBacklogRepository`. This took me more than one hour and therefore I did it as a prolonged check-out session.

Halfway through that prolonged session, I realized that I still don’t quite get the [repository pattern](http://martinfowler.com/eaaCatalog/repository.html) (by the way, [here is a great post about the repository pattern](http://blogs.hibernatingrhinos.com/nhibernate/archive/2008/10/08/the-repository-pattern.aspx)) or rather the way it’s being used in the [ASP.NET MVC Storefront Starter Kit](http://www.asp.net/learn/mvc-videos/#MVCStorefrontStarterKit). The thing that had me confused is the service… It feels like an extra layer on top of the repository that I don’t understand.

But 06:03 into part 8 of the video series, I got it… What [Rob Conery](http://blog.wekeroad.com/) is doing is to overload the constructor of the controller so that he can send in a fake version of the repository. Then the controller actions are creating the services, which take a repository interface as a constructor parameter (i.e., dependency injection). For me, that is **not** “testing only one thing.”

I am wondering if the services would be better off implementing an interface that can be mocked in the tests of the controller. In that way, you will only test the controller and service functionality separately.

OK – but what is a service then? Right now my repository and service contain the same functionality, which feels quite strange. From the definition on [Wikipedia](http://en.wikipedia.org/wiki/Domain-driven_design), we learn:

> Services: When an operation does not conceptually belong to any object. Following the natural contours of the problem, you can implement these operations in services.

So I guess I was a bit fooled by my years in layered architectures where there is a strict hierarchy. A method that gets something from a database doesn’t sit well in any entity and can therefore be placed in a service that gets it from a repository. Once the service returns the entity, it takes responsibility for all business rules. At least that’s how I understand it now.

I am still loving the way TDD is driving my design decisions. For a long time, I pronounced TDD as Test Driven Development, but as you use it, you realize that the last D is Design. You actually learn quite a lot about the code as you write your tests and make small design changes as you go along.

One good thing that I learned in my last project is to create a class that holds test data. This time I actually test-drove (?) the content of the data. So I have tests that test my test data… A bit strange maybe – but it worked out nicely.

I also took the time to rename my blog posts to number them 1..n instead of keeping track of which hour I am on… It felt too much like reporting time as a consultant.
