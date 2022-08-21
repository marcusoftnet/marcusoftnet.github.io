---
layout: post
title: Debugging WCF Service - the Service attribute
value in the ServiceHost directive could not be found
date: '2008-04-01T13:26:00.004+02:00'
author: Marcus Hammarberg
tags:
  - WCF
modified_time: '2010-12-14T16:20:33.311+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-2690269119710637624
blogger_orig_url: http://www.marcusoft.net/2008/04/debugging-wcf-service-service-attribute.html
---

We've got the "the Service attribute value in the <span
id="SPELLING_ERROR_0" class="blsp-spelling-error">ServiceHost</span>
directive could not be found" error message when we renamed (and moved)
and .<span>="blsp-spelling-error">svc</span>-file. There are not a very good
support for that in Visual Studio 2008.

The error message we've got had to do with us forgetting to rename the
class that implemented our <span>="blsp-spelling-corrected">interface</span> for the service (the
one with the operation-contract on it).

Here are the places you'll need to search and replace when you
do a rename:

-   The .<span>svc</span>-file itself
-   The markup-file of the .<span>svc</span>-file
-   The web.<span>config</span> of the service
-   The class that implements your service-contract interface

Then you'll have some trouble to update the reference that the clients
are using. Better remove it and then add it again.

<span id="SPELLING_ERROR_6" class="blsp-spelling-error">Hmmm</span> -
not very pretty this..
