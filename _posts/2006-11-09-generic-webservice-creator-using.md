---
layout: post
title: Generic webservice creator using generics and delegates
date: 2006-11-09T14:19:00.000Z
author: Marcus Hammarberg
tags:
  - .NET
  - Visual Studio
modified_time: 2010-12-14T15:19:05.663Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-7122064333594698841
blogger_orig_url: https://www.marcusoft.net/2006/11/generic-webservice-creator-using.html
---

This now contains an update
<https://www.marcusoft.net/2006/11/more-about-generic-webservces.html>.
Be sure to look it up for a more elegant solution.
====================================================

Yesterday was spent with my nose deep down the documentation of .NET
2.0, pondering poses and headscratching.

But the reward was a quite cool little hack that solved a tricky problem
in our solution.

In my current project we're are using some webservices and these all
need to be configured in the same way. These configurations has to do
with setting the URL in runtime, using other credentials, caching and
maybe other things that we want to be able to do for all webservices.

So what I wanted is a WebServiceCreator with methods that creates the
webservices and does the requested configurations. So my first thought
was to use generics - and that was right for quite a while.

I created a class WebServiceCreator that has one (and so many overloads
we need:-)) method:

public static TWebService
GetWebService(string WebServiceURL)
where TWebService : SoapHttpClientProtocol

This means that when this method is called TWebService needs to be replaced
with the type that GetWebService should return -
and that type needs to be a SoapHttpClientProtocol - which
all the webservice proxies inhierties. So the call would look something
like this:

<span
style="font-family:courier new;font-size:85%;">DemoWebService.Service
wss = WebServiceCreator.GetWebService(\[WebServiceURL\]);

So far just my thoughts and hopes on how this would work.... but the
inner workings of the GetWebService-method was a bit
trickier.

Somewhere someone would have to instanciate the WebService by calling a
constructor. Since the GetWebService-method only
manages generic types (TWebService) this would be very
tricky... The following code would of course not compile:

<span style="font-size:85%;">TWebService wss = new
TWebService();

The solution to this problem was to use a delegate that "points" to a
method that creates the webservice of the right type. This delegate is
then passed as a parameter to the GetWebService-method. The delegate
looks like this:

<span style="font-family:courier new;font-size:85%;">public delegate
TWebService WebServiceConstructorDelegate();

GetWebService is then
updated to look like this (sorry for the weird indentation):

<span style="font-size:85%;">public static TWebService GetWebService (
<span style="font-size:85%;">WebServiceConstructorDelegate
<span style="font-size:85%;">ConstructorForWebService, string
WebServiceURL)
where TWebService : SoapHttpClientProtocol

And when you call GetWebService you supply a method that creates the
webservice like this (really sorry for the indentation):

<span style="font-size:85%;">DemoWebService.Service wss =
WebServiceCreator.GetWebService(

<span style="font-size:85%;">new
WebServiceCreator.WebServiceConstructorDelegate(pCreateDemoWebService)
,\[WebServiceURL\]);

And then of course the small pCreateDemoWebService that is
sent-in as delegate above is very simple:

<span style="font-size:85%;">private DemoWebService.Service
pCreateDemoWebService()
{
return new Epas.Shared.Tests.DemoWebService.Service();
}

But hey - what's this? Now we have a WebService creator that creates
webservices of any type in a uniform way. So there is only one place to
handle of code like that.

This is an excellent example on the power of generics and the first time
i found a real business use for it with C#.
If you want a complete code example please email me about it.
