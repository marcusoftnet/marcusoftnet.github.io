---
layout: post
title: Debugging WCF Service - the Service attribute value in the ServiceHost directive could not be found
date: '2008-04-01T13:26:00.004+02:00'
author: Marcus Hammarberg
tags:
  - WCF
modified_time: '2010-12-14T16:20:33.311+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-2690269119710637624
blogger_orig_url: http://www.marcusoft.net/2008/04/debugging-wcf-service-service-attribute.html
---

We've got the "the Service attribute value in the <span
id="SPELLING_ERROR_0" class="blsp-spelling-error">ServiceHost
directive could not be found" error message when we renamed (and moved)
and .svc-file. There are not a very good
support for that in Visual Studio 2008.

The error message we've got had to do with us forgetting to rename the
class that implemented our interface for the service (the
one with the operation-contract on it).

Here are the places you'll need to search and replace when you
do a rename:

- The .svc-file itself
- The markup-file of the .svc-file
- The web.config of the service
- The class that implements your service-contract interface

Then you'll have some trouble to update the reference that the clients
are using. Better remove it and then add it again.

Hmmm -
not very pretty this..
