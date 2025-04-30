---
layout: post
title: Nancy.Testing - testing (razor) views
date: 2013-02-04T07:48:00.000Z
author: Marcus Hammarberg
tags:
  - Nancy
  - Tools
  - .NET
  - C#
modified_time: 2014-06-21T00:09:55.449Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-1820569848746353017
blogger_orig_url: https://www.marcusoft.net/2013/02/NancyViewTesting.html
---

I'm in the middle of writing a blog post series on Nancy.Testing and this bit me a bit (sorry, couldn't resist myself).

I have written a lot about how to test web-responses and all the great stuff that comes with it, but totally forgot about view. I assumed that it "just worked". And it does but... well read on. It's really simple.

Keeping the story short - let's cut to the code: There's some really important settings to make here. If you don't you'll end up with an (as always in Nancy btw) excellent error message, something like this:

```txt
Nancy.ViewEngines.ViewNotFoundException:
> Unable to locate view 'FariyTaleFigure'


Currently available view engine extensions: sshtml,html,htm,cshtml,vbhtml
>

> Locations inspected:
> views/SimpleDataModuleWithView/FariyTaleFigure-sv-SE,views/SimpleDataModuleWithView/FariyTaleFigure,SimpleDataModuleWithView/FariyTaleFigure-sv-SE,SimpleDataModuleWithView/FariyTaleFigure,views/FariyTaleFigure-sv-SE,views/FariyTaleFigure,FariyTaleFigure-sv-SE,FariyTaleFigure

> Root path: C:\Dev\DiscoveringNancyThroughTests\DiscoverNancy.Tests\NancyAndSimpleData.Tests\bin\Debug
```

Oh yeah - the two settings you need to do:

- First install the Razor (or the view engine of choice) NuGet package: Install-Package Nancy.Viewengines.Razor
- Then set the ["Copy to output directory" property to "Copy if newer](https://groups.google.com/forum/?fromgroups=#!searchin/nancy-web-framework/testing$20razor$20views/nancy-web-framework/NE6jFpkdaMM/D8a8N717OqcJ)". You'll reach that setting by hitting F4 on the Razor file, the `.cshtml`.

After that it'll "just work".

You can read more about the awesome [testing capabilities of Nancy here.](https://www.marcusoft.net/2013/01/NancyTesting1.html) My code can [be found here.](https://github.com/marcusoftnet/DiscoveringNancyThroughTests)
