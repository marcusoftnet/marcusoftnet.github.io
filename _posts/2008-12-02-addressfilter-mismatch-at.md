---
layout: post
title: AddressFilter mismatch at the EndpointDispatcher
date: 2008-12-01T22:33:00.002Z
author: Marcus Hammarberg
tags:
  - .NET
  - Life of a consultant
  - WCF
modified_time: 2009-01-12T06:58:37.499Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-6824020646545763659
blogger_orig_url: https://www.marcusoft.net/2008/12/addressfilter-mismatch-at.html
---


The complete error message was: "The message with To '\[my service
address\]' cannot be processed at the receiver, due to an AddressFilter
mismatch at the EndpointDispatcher."

We got this message when we deployed our services to the production
environment. In this environment we first encounter
[BIG-IP](http://www.f5.com/products/big-ip/) and clustering. And that's
when we hit this brick wall.

The scenario was that [BIG-IP](http://www.f5.com/products/big-ip/) had
one DNS-name/Ip-address that "forwarded" request to two different
servers. However when we accessed the servers with
[wsHttpBinding](http://msdn.microsoft.com/en-us/library/system.servicemodel.wshttpbinding.aspx)
we ran into trouble and the above mentioned error message.

The strange thing was that it worked fine with
[basicHttpBinding](http://msdn.microsoft.com/en-us/library/ms731361.aspx),
which puzzled us for a while.

Well, thanks to the excellent knowledge in the
[Avega](http://www.avegagroup.se/) Microsoft community, we got an
answerer in matter of minutes.

As [this
post](http://msdn2.microsoft.com/en-us/library/system.servicemodel.servicebehaviorattribute.addressfiltermode.aspx)
points out you can handle the problem by setting the
[AddressFilterMode](http://msdn.microsoft.com/en-us/library/system.servicemodel.servicebehaviorattribute.addressfiltermode.aspx)
to Any, which basic means - ignore addressfiltering.

As far as I understand WCF matches the address property for the client
and the server and if it doesn't match (according to AddressFilterMode)
the above mentioned error message is thrown.

And for the strange behavior that basicHttpBinding worked it must have
to do with that basicHttpBinding doesn't care about that kind of
matching. I believe that it has to do with WS-Addressing and that is not
a part of basicHttpBinding.

I love to be challenged about this - this is just what we figured out in
the project.

Thanks to all that helped us solve this.
