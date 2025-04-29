---
layout: post
title: AppHarbor, Nancy and the "Could not load file or assembly 'Nancy.ViewEngines.Razor.BuildProviders' error"
date: 2013-03-06T10:35:00.000Z
author: Marcus Hammarberg
tags:
  - Marcus private
  - Nancy
  - Tools
  - .NET
  - ContinuousDelivery
modified_time: 2013-03-06T10:35:19.266Z
thumbnail: /img/Screen+Shot+2013-03-06+at+09.28.37+.png
blogger_id: tag:blogger.com,1999:blog-36533086.post-2452370248443791950
blogger_orig_url: https://www.marcusoft.net/2013/03/appharbor-nancy-and-could-not-load-file.html
---

I've built a small application. Just something I threw together with a friend during a hack-session at the client. (It's a [dot voting](http://martinfowler.com/bliki/DotVoting.html) application and you can [try it here](http://dotvoter.appharbor.com/), if it's up :))

As we wanted something out there fast we built it with [NancyFx](http://www.nancyfx.org/) and [MongoDB](http://www.mongodb.org/) (a first for me) and we host it on [AppHarbor](https://appharbor.com/) with continuous delivery via [GitHub](http://support.appharbor.com/kb/getting-started/deploying-your-first-application-using-git). Since all of these (saved Mongo) has served me well in the past I was very surprised when we ran into problem.

When a commit is pushed to AppHarbor the application is compiled and the test (if any) are run. That worked fine for us but then a stage is run that's called "Site precompilation".

![Image](/img/Screen+Shot+2013-03-06+at+09.28.37+.png)

That failed with the following error:

> error ASPCONFIG: Could not load file or assembly 'Nancy.ViewEngines.Razor.BuildProviders' or one of its dependencies. The system cannot find the file specified.

This had me for quite a while when I got a tip on "disabling precompilation". In fact, the log tells me so also, at the very bottom:

> Website precompilation failed with exit code 1. Precompilation can optionally be disabled in application settings

The only thing was that I didn't understand the log. Hmmm ... haven't I been here before?

![Image](/img/Screen+Shot+2013-03-05+at+20.20.54+.png)

OK, cutting to the chase here. The last part of the log comes from [AppHarbor](https://appharbor.com/)  In fact, the precompilation is a [AppHarbor](https://appharbor.com/) thing that can be turned off. Go to your application settings, navigate to Build and click the "Disable precompilation" button. It's enabled by default.

That made my application compile and being deployed. We're back on the [SuperDuperHappyPath](http://elegantcode.com/2011/11/23/a-year-of-the-super-duper-happy-path/).

That problem cost us a lot of trial and error... and frustration. But now you don't have to experience the same thing.
