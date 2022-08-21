---
layout: post
title: Not trigger new build on check-in - TFS Build
version of ExclusionFilters
date: '2008-11-18T09:56:00.001+01:00'
author: Marcus Hammarberg
tags: - TFS - MSBuild
modified_time: '2008-11-18T09:56:59.177+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-9090563442531140247
blogger_orig_url: http://www.marcusoft.net/2008/11/not-trigger-new-build-on-check-in-tfs.html
---


OK - today we found out why we are building 650 builds each week...

As part of our build process we are checking out (and in) a version-file
and a SolutionInfo-file. The problem however lies in that we have a
build trigger that starts a build on each new check-in. So each build
triggers a new build that triggers a build that ... you get the picture.

I have created build processes before with the great build server
<a href="http://cruisecontrol.sourceforge.net"
target="_blank">CruiseControl</a>. In
<a href="http://cruisecontrol.sourceforge.net"
target="_blank">CruiseControl</a> you have a configuration option that
is called <a
href="http://confluence.public.thoughtworks.org/display/CCNET/Filtered+Source+Control+Block"
target="_blank">ExclusionFilter</a> that solves this problem. You can
tell CruiseControl not build trigger build from certain users/files.

This option is not around for us TFS Build users. But there are still a
way around this. It's a bit of a hack and is <a
href="http://blogs.msdn.com/buckh/archive/2007/07/27/tfs-2008-how-to-check-in-without-triggering-a-build-when-using-continuous-integration.aspx"
target="_blank">described here</a>.

The solution is to set a certain Check-In comment for your check-ins
that shouldn't trigger a new build. The comment is even a MSBuild
variable called $(NoCICheckinComment).

So here is a check-in that doesn't trigger a new build.

> \<Exec WorkingDirectory="$(CurrentSolutionRoot)" Command="$(TF)
> checkin /comment:&quot;New Version:
> $(Major).$(Minor).$(Build).$(Revision) $(NoCICheckinComment) &quot;
> /recursive Version.txt SolutionInfo.vb" /\>
