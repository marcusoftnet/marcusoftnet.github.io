---
layout: post
title: Different appSetttings for each developer in the
team - part II
date: '2010-10-22T10:23:00.002+02:00'
author: Marcus
Hammarberg
tags:
  - .NET
  - Life of a consultant
   - Visual Studio
modified_time: '2010-12-14T16:17:50.660+01:00' thumbnail:
http://2.bp.blogspot.com/\_TI0jeIedRFk/TMFGTGC3m5I/AAAAAAAAAo4/Vjz4vce3L4Q/s72-c/localsettings.JPG
blogger_id: tag:blogger.com,1999:blog-36533086.post-5552055479284267781
blogger_orig_url: http://www.marcusoft.net/2010/10/different-appsetttings-for-each.html
---

In my [last
post](http://www.marcusoft.net/2010/10/how-to-use-different-appconfig-for-each.html)
I asked for comments, and it didn't take Anders (Granåker) very long
time to come up with a better and more correct solution to the
problem.

The downside of my solution is that you need to tweak the build process
on a build server for example. We knew that BUT I left it for later
solving. There is a rename to be done and a moving of the real
app.config etc.

OK - the solution has to do with the [file-attribute on the
AppSettings-node](http://msdn.microsoft.com/en-us/library/ms228154.aspx)
in .config-files. With that attribute you can point to another file that
contains one or more keys from the appSettings-node. Two important
things about that:


1.  If the file is not present it will use the settings in
    the original app.config
2.  If the file is present the settings in it will override any
    attributes that are specified in both places

<div>

Here is what we did:

</div>

<div>

We created a localAppSettings.config that contains the AppSettings that
we want to override. Please note that this only contains . No -nodes in
here. Here is what it looks like:

</div>

<div>



</div>

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://2.bp.blogspot.com/_TI0jeIedRFk/TMFGTGC3m5I/AAAAAAAAAo4/Vjz4vce3L4Q/s1600/localsettings.JPG"
data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
src="http://2.bp.blogspot.com/_TI0jeIedRFk/TMFGTGC3m5I/AAAAAAAAAo4/Vjz4vce3L4Q/s320/localsettings.JPG"
data-border="0" width="320" height="50" /></a>

</div>

<div>



</div>

<div>

We then changed the app.config to contain our standard configuration and
to point to the localAppSettings.config. Please note that the path is
relative TO THE PLACE WHERE THE TEST ARE RUN. In my case that was in
*C:/Dev/Puls/Dev/PulsNet/GUI/PulsGui/LF.LIV.PEAAT/TestResults/localadmin_LF-E7A7A8B75E99%202010-10-22%2009_17_31/Out/*
so the relative path is ... strange.

</div>

<div>

Here is how our app.config appsettings look like:

</div>

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://3.bp.blogspot.com/_TI0jeIedRFk/TMFGSxbnL1I/AAAAAAAAAo0/jof6Ic7_xOA/s1600/app+config.JPG"
data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
src="http://3.bp.blogspot.com/_TI0jeIedRFk/TMFGSxbnL1I/AAAAAAAAAo0/jof6Ic7_xOA/s320/app+config.JPG"
data-border="0" width="320" height="118" /></a>

</div>

<div>



</div>

<div>

Finally we set the localAppSettings.config to be excluded from source
control as I explained [in the last
post.](http://www.marcusoft.net/2010/10/how-to-use-different-appconfig-for-each.html)

</div>

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://2.bp.blogspot.com/_TI0jeIedRFk/TMFGSL1yu3I/AAAAAAAAAow/TVmTgoHVyns/s1600/solution.JPG"
data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
src="http://2.bp.blogspot.com/_TI0jeIedRFk/TMFGSL1yu3I/AAAAAAAAAow/TVmTgoHVyns/s1600/solution.JPG"
data-border="0" /></a>

</div>

<div>



</div>

<div>

This solution is much nicer with a lower impact for everyone...
including the build server.

</div>

<div>

Thanks Anders!

</div>
