---
layout: post
title: WCF configuration or Do it yourself
date: 2008-04-10T10:32:00.006Z
author: Marcus Hammarberg
tags:
  - WCF
modified_time: 2010-12-14T15:20:33.297Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-548239126291337484
blogger_orig_url: http://www.marcusoft.net/2008/04/wcf-configuration-or-do-it-yourself.html
---


Configuration of WCF-services is a vast area... anyone who looked
into the subject are sure to agree on that. The whole idea with
WCF-services is that you can via configuration tweak the behavior and
appearance of a service without having to change any internal logic of
the service.

When I tried my first services I was "tricked" into choosing one of the
pre-manufactured project templates that Microsoft ships with Visual
Studio 2008. This was bad decision. The number of configuration
properties and stuff generated for me was so great that I didn't
understand the true important stuff that I needed to know.

However, this Tuesday we had a interesting visitor at
[Avega](http://www.avega.se/) - [Christan
Weyer](http://blogs.thinktecture.com/cweyer/). He gave an introduction
on WCF. From that lecture I got so much more than from what the
templates showed me.

So this is what you really need to configure on your service:

- Name - the name of the service
- Endpoint
  - Address - where to reach your service
  - Binding - how to reach your service (protocol)
  - Contract - the contract definition of the service

Here is an example:
<span style="font-family: courier new">\<system.serviceModel\>
\<services\>
<span style="font-family: courier new">  \<service
name="Tjanster.ListDataTjanst"\>
   \<endpoint
      address=""
      binding="wsHttpBinding"
      contract="Tjanster.Contracts.IListData"
   <span style="font-family: courier new">/\>
  \</service\>
\</services\><span style="font-family: courier new">
\</system.serviceModel\>

That's it! A bit more easy to read and understand the 50+ attributes
that Visual Studio generates for you.

On the client it gets even worse with the number of attributes that
Visual Studio generates. The only things you need to do is to configure
the endpoint you're using. Like this:

<span style="font-family: courier new">\<system.serviceModel\>
\<client\>
   \<endpoint
     address="http://localhost:3214/ListData.svc"
     binding="wsHttpBinding"
     contract="svcListData.ListDataTjanst"
   /\>
\</client\>
\</system.serviceModel\>

I am working on some details for how ConfigurationName, Name and
Namespace relates to all this but I'll get back to that when i know how
it works...
