---
layout: post
title: WCF, WSDL and tempuri.org date: '2008-04-11T08:18:00.003+02:00'
author: Marcus Hammarberg
tags:
  - .NET -
WCF modified_time: '2008-04-11T08:45:18.425+02:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-4421399573659073116
blogger_orig_url: http://www.marcusoft.net/2008/04/wcf-wsdl-and-tempuriorg.html
---

It's
back! Just when we thought that we've seen the dreadful namespace
[http://tempuri.org](http://tempuri.org/) is coming back at us with full
power.

The feeling you get when a web service is exposed under the namespace
tempuri.org is that the developer of that web service is either sloppy
or don't now what he is doing.

Well, well - don't be like that when it comes to using WCF. Here is [an
article](http://www.pluralsight.com/blogs/kirillg/archive/2006/06/18/28380.aspx)
describing how to do it. The key points are quite easy:

-   Use the ServiceBehavior attribute. Note**:** on the **service
    implementation** - not on the contract!
-   Set the namespace-property to the namespace you want.

Here is an example (yes, i know, it's in dredded VB.NET):


<span
style="font-family:courier new;">\<ServiceBehavior(Namespace:="http://www.marcusoft.net/Services/2008/04/MyService",
)\> \_
Public Class MyServiceImplementation
implements IService</span><span style="font-family:courier new;">
</span><span style="font-family:courier new;">...
End Class</span>
