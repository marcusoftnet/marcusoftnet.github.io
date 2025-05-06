---
layout: post
title: Different appSettings for each developer in the team - part II
date: 2010-10-22T08:23:00.002Z
author: Marcus Hammarberg
tags:
  - .NET
  - Life of a consultant
  - Visual Studio
modified_time: 2010-12-14T15:17:50.660Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5552055479284267781
blogger_orig_url: https://www.marcusoft.net/2010/10/different-appsetttings-for-each.html
---

In my [last post](https://www.marcusoft.net/2010/10/how-to-use-different-appconfig-for-each.html) I asked for comments, and it didn't take Anders very long time to come up with a better and more correct solution to the problem.

The downside of my solution is that you need to tweak the build process on a build server for example. We knew that BUT I left it for later solving. There is a rename to be done and a moving of the real app.config etc.

OK - the solution has to do with the [file-attribute on the AppSettings-node](http://msdn.microsoft.com/en-us/library/ms228154.aspx) in .config-files. With that attribute you can point to another file that contains one or more keys from the appSettings-node. Two important things about that:

1. If the file is not present it will use the settings in the original app.config
2. If the file is present the settings in it will override any attributes that are specified in both places

Here is what we did:

We created a localAppSettings.config that contains the AppSettings that we want to override. Please note that this only contains . No -nodes in here. Here is what it looks like:

![local settings](/img/localsettings.JPG)

We then changed the app.config to contain our standard configuration and to point to the localAppSettings.config. Please note that the path is relative TO THE PLACE WHERE THE TEST ARE RUN. In my case that was in `C:/Dev/Puls/Dev/PulsNet/GUI/PulsGui/LF.LIV.PEAAT/TestResults/localadmin_LF-E7A7A8B75E99%202010-10-22%2009_17_31/Out/` so the relative path is ... strange.

Here is how our app.config appsettings look like:

![app config](/img/app+config.JPG)

Finally we set the localAppSettings.config to be excluded from source control as I explained [in the last post.](https://www.marcusoft.net/2010/10/how-to-use-different-appconfig-for-each.html)

![solution](/img/solution.JPG)

This solution is much nicer with a lower impact for everyone... including the build server.

Thanks Anders!
