---
layout: post
title: Dependency Injection - explained
date: 2007-03-30T07:11:00.000Z
author: Marcus Hammarberg
tags:
  - .NET
  - Life of a consultant
modified_time: 2007-03-30T07:51:48.406Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-340487749415014671
blogger_orig_url: https://www.marcusoft.net/2007/03/dependency-injection-explained.html
---

When I first read about Dependency Injection, I of course read the [famous article](http://www.martinfowler.com/articles/injection.html) by Martin Fowler... and to you I can say that I didn't get it. At all. Please don't tell anyone ;)

But after the presentation at [Avega](http://www.avega.se) by [Nicias Nilsson](http://www.niclasnilsson.se/) I finally got it. And the example below is a small rip of the DI-part of the presentation but it works as a reminder for me anyway.

Here we go:

Lets say that we have a class called SalesController that managers the business logic for sales. In order to work it has to get some product information which is stored in a repository called ItemInventory.

Below is a example implementation of SalesController

```c#
public class SalesController {
  ItemInventory item;
  public SalesController()  {
    //...
  }
  //...
}
```

This means that the SalesController is dependent to ItemInventory. That is not that good since:

- if you want to exchange ItemInventory for another implementation it will have major impact on SalesController
- the SalesController is quite hard to test, which in turn has to do with it being hard to isolate, or simpler you can't mock-up ItemInventory in a easy way

Lets use interfaces instead:

```c#
public class SalesController {
  IItemInventory item;
  public SalesController()  {
    //...
  }
  //...
}
```

We have now won that we easy can exchange ItemInventory against another class that implements IItemInventory. But is still is(can be) hard to test since you have to test ItemInventory as part of the test of SalesController.

Dependency Injection to the fore!

```c#
public class SalesController {
  IItemInventory item;
  public SalesController(IItemInventory item)  {   this.item = item;  }
  // ...
}
```

In this way we can send in the dependency of the class (ItemInventory in this case) to SalesController, or if you rather want we can **inject the dependency** of SalesController.

Now we can, in a testcase, send in a mock-up of ItemInventory to easy test the methods of SalesController.

Very short, to end this mega-post, Spring.NET gives you the possibility to do these injections via configuration-files, which further simplifies the testing process (i.e. a different config-file for the test-code).
