---
layout: post
title: ReSharper and the messed up Intellisense
date: 2008-06-04T10:24:00.007Z
author: Marcus Hammarberg
tags:
  - VB.NET
  - Tools
modified_time: 2010-12-14T15:22:38.275Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5443905703235417361
blogger_orig_url: https://www.marcusoft.net/2008/06/resharper-and-messed-up-intellisense.html
---

Let me at the start of the post first say that I love [ReSharper](http://www.jetbrains.com/resharper/index.html). It is by far the best refactoring support that can be found for VB.NET. I haven't yet used it for C# but are told but [esteemed colleague](http://blogg.joakimsunden.se/) that it rocks.

But... (there is always a but isn't it?) it [messes up the Intellisense in my Visual Studio](https://www.marcusoft.net/2008/05/visual-studio-2008-intellisense-not.html). The same colleague (kudos to Joakim) tipped me on how to solve it and here it is;

Open the options for ReSharper and choose `Intellisense->General->Use Visual Studio`. This will not give you as much support for "Smart Completion" but I'll take that over missing Intellisense everyday in the week, and twice on Sundays.

Next - open the Visual Studio options and recheck that you have Intellisense enabled for are your languages.

Finally restart the Visual Studio - just to be sure that this is saved properly.

Again - the refactoring support with ReSharper is great compared to everything else out there, for VB.NET. But this is not so good - at least now you know how to solve it. Hopefully this will be fixed in the [next version](http://www.jetbrains.net/confluence/display/ReSharper/ReSharper+4.0+EAP+Notes).
