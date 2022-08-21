---
layout: post
title: WCF with handcrafted WSDL generated no
FaultExceptions
date: '2009-01-07T11:07:00.001+01:00'
author: Marcus Hammarberg
tags:
  - Life of a consultant
  - WCF
modified_time: '2009-01-07T11:07:14.585+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-6397917165602429158
blogger_orig_url: http://www.marcusoft.net/2009/01/wcf-with-handcrafted-wsdl-generated-no.html
---


This is problem that has haunted us for the good part of the autumn and
winter;

early on in our design process we chose to create the WSDL for our
services by hand. This decision mainly had to do with that you can
express stuff in XSD that WCF-attributes doesn't support, such as string
length etc.

Also we were using the <a
href="http://www.idesign.net/idesign/DesktopDefault.aspx?tabindex=5&amp;tabid=11#Faults"
target="_blank">ErrorHandlerAttribute</a> found in the excellent book
"<a
href="http://www.amazon.co.uk/Programming-WCF-Services-Juval-Lowy/dp/0596526997"
target="_blank">Programming WCF Services</a>" by
<a href="http://www.oreillynet.com/pub/au/741" target="_blank">Juwal
Löwy</a>.

What we saw was that even though we had created the wsdl for handling
the fault and their details correct, we didn't get the details over to
the client (that is the T of FaultException\<T\>). We checked the wsdl
and the generated client proxy (and it's wsdl) file over and over, and
line by line but just couldn't find it.

And finally it dawned on us... It was Mr Löwy's fault ;). Seriously - it
was the use of the <a
href="http://www.idesign.net/idesign/DesktopDefault.aspx?tabindex=5&amp;tabid=11#Faults"
target="_blank">ErrorHandlerAttribute</a> that caused the problem. The
WSDL was correct all along.

The <a
href="http://www.idesign.net/idesign/DesktopDefault.aspx?tabindex=5&amp;tabid=11#Faults"
target="_blank">ErrorHandlerAttribute</a> operates on the message level
which I understand as; it actually generates the SOAP-message/XML that
is returned to the client. Since that SOAP-message wasn't specified in
our WSDL we got this problem.

That was really a long way around to get some details back, but I hope
and think that it was worth it. At least we learned some interesting
stuff about how the WCF inner workings works.
