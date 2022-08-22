---
layout: post
title: More on WCF configuration
date: 2008-10-22T13:26:00.001+02:00
author: Marcus Hammarberg tags:
modified_time: 2008-10-22T13:26:35.756+02:00
blogger_id: tag:blogger.com,1999:blog-36533086.post-3177796519915879546
blogger_orig_url: http://www.marcusoft.net/2008/10/more-on-wcf-configuration.html ---

In my [last
post](http://www.marcusoft.net/2008/10/configuration-of-wcf-binding.html)
I mentioned the great WCF service/client configuration editor that ships
with Visual Studio 2008. I haven't used it much but rather done "it" by
hand - which has been quite painful from time to time.

Here is a [great introduction to the
editor](http://keithelder.net/blog/archive/2008/01/17/Exposing-a-WCF-Service-With-Multiple-Bindings-and-Endpoints.aspx)
that shows off some of the great capabilities of it.

Another "tip", if you like, that I found on my way through the
configuration jungle is that the binding part is complete separated from
the other part of the configuration. Also, the client and server binding
should be configured the same way (at least for a single endpoint). This
means, and is actually quite effective, that you can copy the binding
part from one .config-file to another to get the same configuration. An
easy but very helpful tip.
