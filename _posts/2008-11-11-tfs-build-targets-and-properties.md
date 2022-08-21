---
layout: post
title: TFS Build targets and properties - the official
list
date: '2008-11-11T10:41:00.001+01:00'
author: Marcus Hammarberg
tags: - TFS - MSBuild
modified_time: '2008-11-11T10:41:42.055+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-6662911047123782891
blogger_orig_url: http://www.marcusoft.net/2008/11/tfs-build-targets-and-properties.html
---


For some time now people has been turning to me at my customer for
answerers regarding [TFS
Build](http://msdn.microsoft.com/en-us/library/ms181710(VS.80).aspx). I
have learned a great deal from that but sometimes I feel like I haven't
made sure that I understood the underlying thought from Microsoft.

One of those areas is that the TFSBuild.proj-file is not your ordinary
[MSBuild](http://msdn.microsoft.com/en-us/library/ms171452.aspx)-file.
Or rather; it's is but is run by Team Foundation Server and you get to
configure it and it's properties. This is what I though and I was
actually right. Phew!

There are some properties and targets that you can override in order to
customize the build process. You can think of these targets like events
being fired, and you can hook into them and customize their actions. And
this is quite easy once you know how.

But then I often get the question; "Ok - what can I configure". I
haven't had a good answer ([this was my best so
far](http://www.marcusoft.net/2007/05/teamsystem-builds.html)) but now I
found a list of the customable targets and properties.

-   [Customizable Team Foundation Build
    Targets](http://msdn.microsoft.com/en-us/library/aa337604.aspx) (and
    their run order)
-   [Customizable Team Foundation Build
    Properties](http://msdn.microsoft.com/en-us/library/aa337598.aspx)

Also I found out that any properties you define in the build script can
be sent-in as a parameter. Either from the command-line (or textbox for
command line arguments in the Visual Studio GUI) or via the .rsp-file.
If the already has a value that value will be overridden with the
sent-in value. The value you set in the .proj-file can be though of like
a default-value.

So - some good finding for a lazy Tuesday mooring in the couch. Abbe is
sound asleep and I am doing MSBuild. Life is good.
