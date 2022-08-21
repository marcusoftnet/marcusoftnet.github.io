---
layout: post
title: MSBuild, refactor and targets in other files
date: '2008-10-20T08:30:00.001+02:00'
author: Marcus Hammarberg
tags: -
MSBuild modified_time: '2008-10-20T11:14:12.584+02:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-3420428001447646419
blogger_orig_url: http://www.marcusoft.net/2008/10/msbuild-refactor-and-targets-in-other.html
---


I found a very niffty little feature of MSBuild, that is really helpful
when it comes to structuring your build file.

In MSBuild the "sub-routines" are called targets and works just like
expected, that is you can call the targets and invoke them in the order
you like. BUT, there are no way of sending parameters to them - which at
first are very hard to understand.

From
<a href="http://dotnet.sys-con.com/node/253420" target="_blank">this
article</a> I learned how to do it. And it's not to hard. But it's a bit
of a hack... in my opinion.

Actually it's easier to describe it as it's intended from the outset, to
call targets in other files. Imagine that you create a MSBuild-file
called DeployScript.proj with a target called DeployIt. In order to
deploy to different environments we use some variables that instructs
MSBuild to deploy to different paths for example. Like the
$(PublishWebSitePath) in the example below:

> \<RemoveDir Condition="Exists('$(PublishWebSitePath)')"
> Directories="$(PublishWebSitePath)" /\>
>     \<MakeDir Directories="$(PublishWebSitePath)" /\>

We can now call the targets of the DeployScript.proj-file from another
file, with parameters, in the following manner:

> \<MSBuild Projects="DeployScript.proj" Targets="DeployIt"
> Properties="PublishWebSitePath=\\\\\[server\]\\\[share\]" /\>

And now it's quite easy to understand how to call targets in your own
MSBuild-file with parameters. It's works the same way as above. You just
give the current build-file name in the projects-value.

Using this technique you'll get a much better way of structuring your
build-files. And maybe even get some reusable stuff for your next
project...
