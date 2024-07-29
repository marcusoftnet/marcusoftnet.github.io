---
layout: post
title: WCF with Handcrafted WSDL Generated No FaultExceptions
date: 2009-01-07T10:07:00.001Z
author: Marcus Hammarberg
tags:
  - Life of a consultant
  - WCF
modified_time: 2009-01-07T10:07:14.585Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-6397917165602429158
blogger_orig_url: http://www.marcusoft.net/2009/01/wcf-with-handcrafted-wsdl-generated-no.html
---

This problem has haunted us for the good part of the autumn and winter.

Early on in our design process, we chose to create the WSDL for our services by hand. This decision was mainly due to the need to express details in XSD that WCF attributes don't support, such as string length.

We were also using the [ErrorHandlerAttribute](http://www.idesign.net/idesign/DesktopDefault.aspx?tabindex=5&amp;tabid=11#Faults) from the excellent book ["Programming WCF Services"](http://www.amazon.co.uk/Programming-WCF-Services-Juval-Lowy/dp/0596526997) by [Juwal Löwy](http://www.oreillynet.com/pub/au/741).

What we observed was that, even though we had created the WSDL for handling faults and their details correctly, we didn't get the fault details over to the client (i.e., the `T` of `FaultException<T>`). We checked the WSDL and the generated client proxy (and its WSDL) file over and over, line by line, but just couldn't find the issue.

Finally, it dawned on us... It was Mr. Löwy's fault. Seriously, it was the use of the [ErrorHandlerAttribute](http://www.idesign.net/idesign/DesktopDefault.aspx?tabindex=5&amp;tabid=11#Faults) that caused the problem. The WSDL was correct all along.

The [ErrorHandlerAttribute](http://www.idesign.net/idesign/DesktopDefault.aspx?tabindex=5&amp;tabid=11#Faults) operates at the message level, which means it generates the SOAP message/XML that is returned to the client. Since that SOAP message wasn't specified in our WSDL, we encountered this problem.

It was a long road to discover this issue, but I believe it was worth it. At least we learned some interesting details about how WCF's inner workings function.
