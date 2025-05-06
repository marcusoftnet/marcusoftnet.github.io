---
layout: post
title: How to Use Different app.config for Each Developer
date: 2010-10-20T07:04:00.003Z
author: Marcus Hammarberg
tags:
  - BDD
  - .NET
  - Life of a consultant
  - Agile
modified_time: 2010-12-14T15:18:09.697Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-4159732501731910010
blogger_orig_url: https://www.marcusoft.net/2010/10/how-to-use-different-appconfig-for-each.html
---

**UPDATED**: See [this post](https://www.marcusoft.net/2010/10/different-appsetttings-for-each.html) for a different way to do this.

In our current team, we’re doing a [lot of integration testing](https://www.marcusoft.net/2010/08/using-bdd-with-specflow-wpf-and-white_14.html), which means we need a well-known state in the database before each test run. We have solved this with a simple restore of a known backup before each test run (using the handy BeforeTestRun attribute of [SpecFlow](http://www.specflow.org/)). But we have run into some issues...

This approach means we end up destroying the database for each other all the time during development. So we created a small database for each developer and restored that before each test run. But again, it came back to bite us.

The database name and backup name we’re restoring is stored in app.config, which means you need to change that on your local machine. A simple slip on check-in might have you distribute your app.config to the whole team, putting us back to square one.

I tried to solve this with user settings, but that didn’t seem to work for test projects. It probably has to do with the fact that a test project is a class library and doesn’t hold an App Domain. It’s MSTest that runs the test, so it’s probably MSTest’s config that needs to be tweaked.

But we’ve found a simple (and yes, more brute) way to do this:

- I created an `app.master.config` that contains all the keys and settings we’re using for test runs on the build server.
- I checked in that `app.master.config`.
- I then created an `app.config` in my own project and changed the keys to my personal settings.
- And then, here’s the key step: I selected the app.config and went to "Exclude from project" in the Source Control menu.

![Exclude from source control](/img/exclude+from+sourcecontrol.png)

This made the app.config part of my project locally but prevented it from being checked in. When another developer pulls down the code, the app.config is needed by the project (I presume from the .vbproj file). So they can create an app.config of their own and use their settings in that file.

This works fine. Is there another way to accomplish the same thing? Please let me know.
