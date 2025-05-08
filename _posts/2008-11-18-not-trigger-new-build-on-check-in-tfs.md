---
layout: post
title: Not trigger new build on check-in - TFS Build version of ExclusionFilters
date: 2008-11-18T08:56:00.001Z
author: Marcus Hammarberg
tags:
  - TFS
  - MSBuild
modified_time: 2008-11-18T08:56:59.177Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-9090563442531140247
blogger_orig_url: https://www.marcusoft.net/2008/11/not-trigger-new-build-on-check-in-tfs.html
---

OK - today we found out why we are building 650 builds each week...

As part of our build process, we are checking out (and in) a version-file and a SolutionInfo-file. The problem, however, lies in that we have a build trigger that starts a build on each new check-in. So each build triggers a new build that triggers a build that ... you get the picture.

I have created build processes before with the great build server [CruiseControl](http://cruisecontrol.sourceforge.net). In [CruiseControl](http://cruisecontrol.sourceforge.net) you have a configuration option called [ExclusionFilter](http://confluence.public.thoughtworks.org/display/CCNET/Filtered+Source+Control+Block) that solves this problem. You can tell CruiseControl not to trigger builds from certain users/files.

This option is not available for us TFS Build users. But there is still a way around this. It's a bit of a hack and is [described here](http://blogs.msdn.com/buckh/archive/2007/07/27/tfs-2008-how-to-check-in-without-triggering-a-build-when-using-continuous-integration.aspx).

The solution is to set a certain check-in comment for your check-ins that shouldn't trigger a new build. The comment is even a MSBuild variable called `$(NoCICheckinComment)`.

So here is a check-in that doesn't trigger a new build:

```xml
<Exec WorkingDirectory="$(CurrentSolutionRoot)" Command="$(TF) checkin /comment:&quot;New Version: $(Major).$(Minor).$(Build).$(Revision) $(NoCICheckinComment) &quot; /recursive Version.txt SolutionInfo.vb" />
```
