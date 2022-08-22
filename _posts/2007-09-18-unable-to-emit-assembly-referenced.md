---
layout: post
title: Unable to emit assembly: Referenced assembly
does not have a strong name'
date: 2007-09-18T12:46:00.001+02:00
author: Marcus Hammarberg
tags:
  - VB.NET
  - .NET
  - Visual Studio
modified_time: 2010-12-14T16:19:05.536+01:00
blogger_id: tag:blogger.com,1999:blog-36533086.post-5310005411164515714
blogger_orig_url: http://www.marcusoft.net/2007/09/unable-to-emit-assembly-referenced.html
---


<div align="left">

Hmmm - another "Why does VB.NET hides so many useful things from me?"
thing that adds to my determination to vote for C# whenever i get the
chance.

The case is as follows; you have a project that you want to strong name.
However it references a assembly that not is strong named. That will
give you the following error from the compiler:

</div>

<div align="left">


`Unable to emit assembly: Referenced assembly [...] does not have a strong name`

</div>

<div align="left">

</div>

<div align="left">

</div>

<div align="left">

So the solution (for us C#-junkies) is to go into the project properties
and put your .snk file into the box for "Wrapper Assembly Key File"
(under "Common Properties" and "General").

</div>

<div align="left">

</div>

<div align="left">

However if you use VB.NET then you're stuck! There is no box like that
because the VB.NET-team of Microsoft thinks that is to hard for us to
handle, or something.

</div>

<div align="left">

</div>

<div align="left">

[Here is one
solution](http://www.novicksoftware.com/TipsAndTricks/tip-vb-net-tlimp-strong-name.htm)
which is quite hard to pull of if you have many projects in your
solution. Haven't found any better so far...

</div>

<div align="left">

</div>

<div align="left">

</div>
