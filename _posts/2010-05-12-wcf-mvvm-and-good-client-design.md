---
layout: post
title: WCF, MVVM and good client design
date: 2010-05-11T21:56:00.001+02:00
author: Marcus Hammarberg
tags:
  - .NET
  - Life of a consultant
modified_time: 2010-05-11T21:56:18.222+02:00
blogger_id: tag:blogger.com,1999:blog-36533086.post-5876123677039343472'
blogger_orig_url: http://www.marcusoft.net/2010/05/wcf-mvvm-and-good-client-design.html
---


Up to now most of my assignments has not been client-related. Often the
project description and main focus is on the layers beneath the GUI. But
lately I have seen a shift in the industry and more so in my own
interest. Client-side stuff is coming on strong.

And it’s hard work to design a well structured client application. There
are a lot of patterns but the frameworks and “recommended” ways up to
now often doesn’t lend themselves well to those patterns. Ever tried to
do proper MVC with WebForms or WinForms – it’s not easy.

But that has also shifted. I have written a lot on
<a href="http://www.asp.net/mVC/" target="_blank">ASP.NET MVC</a> – that
of course supports the mother of all client patterns, <a
href="http://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller"
target="_blank">MVC</a>, in a great way. So enough said there.

But for “fat clients” such as windows clients there’s been a hazy
mystery for me. I know OF WPF but I don’t know WPF. And they seems to
talk a lot about the MVVM (Model-View-ViewModel) pattern.

To the extent of my knowledge now the MVVM pattern is an adaptation of
Martin Fowlers Presentation Model pattern. An adaptation that make full
use of the
<a href="http://msdn.microsoft.com/en-us/library/ms750612.aspx"
target="_blank">WPF DataBinding capabilities</a>.

I’ve found some great resources on this – starting with
<a href="http://blog.lab49.com/archives/2650" target="_blank">this
excellent presentation on the pattern</a>, by Jason Dolinger.
<a href="http://www.lab49.com/files/MVVM.Demo.sln.zip"
target="_blank">Here is his source code</a>

After that I thought that there must be frameworks that helps me with
this. And there are. About as many as there are WPF developers… Here is
a <a
href="http://stackoverflow.com/questions/1409553/what-framework-for-mvvm-should-i-use"
target="_blank">great StackOverflow post</a> that helps you choose one.

And following one of those links (to the
<a href="http://mvvmfoundation.codeplex.com/" target="_blank">MVVM
Foundation</a>) I finally found and read this great
<a href="http://msdn.microsoft.com/en-us/magazine/dd419663.aspx"
target="_blank">MSDN Magazine</a> article by Josh Smith.
