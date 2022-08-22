---
layout: post
title: How to use different app.config for each developer
date: '2010-10-20T09:04:00.003+02:00'
author: Marcus Hammarberg
tags:
  - BDD
  - .NET
  - Life of a consultant
  - Agile
modified_time: '2010-12-14T16:18:09.697+01:00'
thumbnail: http://1.bp.blogspot.com/\_TI0jeIedRFk/TL6UwdakgVI/AAAAAAAAAos/gccn5IEttRM/s72-c/exclude+from+sourcecontrol.png
blogger_id: tag:blogger.com,1999:blog-36533086.post-4159732501731910010
blogger_orig_url: http://www.marcusoft.net/2010/10/how-to-use-different-appconfig-for-each.html
---

**\[UPDATED\] See** [**this
post**](http://www.marcusoft.net/2010/10/different-appsetttings-for-each.html)
**for a different way to do this.**
In our current team we’re doing a <a
href="http://www.marcusoft.net/2010/08/using-bdd-with-specflow-wpf-and-white_14.html"
target="_blank">lot of integration testing</a> which means that we need
a well known state in the database before each test run. We have solved
this with a simple restore of a known backup before each test run (with
the handy BeforeTestRun-attribute of
<a href="http://www.specflow.org/" target="_blank">SpecFlow</a>). But we
have run into some issues…
That means that we destroying the database for each other all the time
during development. So we created a small database for each developer
and restored that before each test run. But again it jump back and bit
us, I wont say where…
The database name and backup name we’re restoring is stored in
app.config which means that you need to change that on your local
machine. A simple slip on check-in might have you distribute your
app.config to the whole team, and we’re back on square one.
I tried to solve this with user settings but that didn’t seem to work
for test project. I probably has to do with the fact that a test project
is a class library and doesn’t hold a App Domain. It’s MSTest that runs
the test so it’s probably MSTest’s config that need to be tweaked.
But we’ve found a simple (and yes, more brute way I agree) to do this:

- I created an app.master.config that contains all the keys and the
    settings we’re using on test run on the build server.
- I checked in that app.master.config
- I then created an app.config in my own project and changed the keys
    to my personal settings.
- And then, and here’s the thing, I selected the app.config and went
    Exclude from project in the Source Control menu.

|                                                                                                                       |
|:---------------------------------------------------------------------------------------------------------------------:|
|                                                           <a
  href="http://1.bp.blogspot.com/_TI0jeIedRFk/TL6UwdakgVI/AAAAAAAAAos/gccn5IEttRM/s1600/exclude+from+sourcecontrol.png"
                        data-imageanchor="1" style="margin-left: auto; margin-right: auto;"><img
   src="http://1.bp.blogspot.com/_TI0jeIedRFk/TL6UwdakgVI/AAAAAAAAAos/gccn5IEttRM/s320/exclude+from+sourcecontrol.png"
                                     data-border="0" width="320" height="56" /></a>                                     |
|                                       Excluding app.config from source control                                        |

This made the app.config be part of my project locally but not been
checked in. BUT, when another developer pull down the code the
App.config is needed by the project (I presume from the .vbproj-file,
haven’t checked that). So they can create an app.config of their own and
use their settings in that file.
This works fine. Is there another way to accomplish the same thing?
Please let me know about it.
