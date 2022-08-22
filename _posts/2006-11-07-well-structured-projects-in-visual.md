---
layout: post
title: Well structured projects in Visual Studio 2005
date: 2006-11-07T07:31:00.000+01:00
author: Marcus Hammarberg
tags:
  - .NET
  - Visual Studio
modified_time: 2010-12-14T16:19:05.667+01:00
blogger_id: tag:blogger.com,1999:blog-36533086.post-5231053951955942248
blogger_orig_url: http://www.marcusoft.net/2006/11/well-structured-projects-in-visual.html
---

[<img
src="http://photos1.blogger.com/blogger2/4958/4459/200/project%202.jpg"
style="FLOAT: right; MARGIN: 0px 0px 10px 10px; CURSOR: hand"
data-border="0" />](http://photos1.blogger.com/blogger2/4958/4459/1600/project%202.0.jpg)

<div>

[<img
src="http://photos1.blogger.com/blogger2/4958/4459/200/project%201.jpg"
style="FLOAT: left; MARGIN: 0px 10px 10px 0px; CURSOR: hand"
data-border="0" />](http://photos1.blogger.com/blogger2/4958/4459/1600/project%201.0.jpg)

<div>

[](http://photos1.blogger.com/blogger2/4958/4459/1600/project%202.jpg)

<div>

[](http://photos1.blogger.com/blogger2/4958/4459/1600/project%201.jpg)

<div>

This might be an obvious thing for some but i have missed its full
potential for a while. And thank You Stefan for pointing it out to me.

There is a new feature in Visual Studio 2005 called Solution Folders.
These are only a structure-thing and does not effect the namespace or
naming of the things in it. The primary use for Solution Folders was
probably to hold things common for the whole solution, like snk-files,
build-scripts etc.

But another very nice feature is the ability to structure projects
within the solution. Say that You have a number of projects (see top
picutres to the left). Often You will only be in one project at the time
and also they can be quite hard to get an overview of. So by simply
introducing some solution folders i've got an ordered view of my
projects, in the calling order of the architecture (see top picture to
the right) And nothing has changed in the naming of my folder.




The solution folder structure is saved completly within the solution
file (.sln) and don't reflect the file system.

A solution folder is created by right-clicking anywhere on the
solutionfile and then choosing Add-\>New solution folder. The projects
are added by simply dragging them to the folder.




A final note - if a folder is added within a project the folder name
will be a part of the namespace of the items in the folder. This can of
course also be handy - but the difference needs to be understood.

</div>

</div>

</div>

</div>
