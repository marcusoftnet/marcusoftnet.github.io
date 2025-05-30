---
layout: post
title: Marcus list of how to get problem in a system development project
date: 2007-12-19T12:47:00.000Z
author: Marcus Hammarberg
tags:
  - Life of a consultant
modified_time: 2007-12-19T13:26:36.977Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-8688277135535059373
blogger_orig_url: https://www.marcusoft.net/2007/12/marcus-list-of-how-to-get-problem-in.html
---

From time to time I hear myself saying; "That's a good way to get problems in the project/in the application/in the maintenance phase".

So I thought I'll start a list so that I can prove (for me) that I have "said it already, a long, long time ago". Of course this is mostly for fun but I have seen these items in many projects and many times.

So here you are; How to get problems:

- **Integrate with Office** - I have done this is a lot of   applications. Eventually it will work and it can be nice - but it is always problems. A lot of them and hard to find.
- **Mix technologies in the same application** - that is let .NET-applications call COM-components. If you mix old an new then the total "goodness" of the application will not be better than the old technology - if that even.
- **Create applications that have a lot of dependencies** - these hub-application are sometimes unavoidable but they always create a lot of problems in the business when they are deployed. And when the application is developed you get to the next problem in jiffy.
- **Involve a lot of persons to be able to solve a problem** - this will create a lagging in the project that will slow you down more and more the further down the project you will come.
- **Use web applications to do Windows application stuff** - web applications are very good to present a easy GUI. They can be made to do some pretty impressive stuff - but that will cost you and cause a lot of annoying problems during the project ("why is that label red?", "the will not fire on the first click" are some common comments from web developers that you'll never hear a Windows developer say). In a nutshell - let Windows handle advanced stuff and let web be simple GUI's.

That a few things from the top of my head. Don't get me wrong here - you could very well include some or all of these but then beware - you're in for some major trouble ahead. If you can avoid any of them - then the trouble will not occur.
