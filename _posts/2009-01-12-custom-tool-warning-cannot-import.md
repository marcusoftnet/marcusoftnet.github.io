---
layout: post
title: 'Custom tool warning: cannot import
wsdl:portType'
date: '2009-01-12T15:10:00.001+01:00'
author: Marcus
Hammarberg
tags:
  - .NET
  - Life of a consultant
   - WCF
modified_time: '2009-01-12T15:11:43.467+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-1861622144976994737
blogger_orig_url: http://www.marcusoft.net/2009/01/custom-tool-warning-cannot-import.html
---


I chased this bug for a while - more and more frustrated... This was
what happened: I updated a WCF Service Reference and got this error (or
actually warning) in the Error List of Visual Studio. Also I saw that
the Reference.vb was totally empty.

OK - after some trying of my own (why do I do that over and over? Don't
think - steal from others...) I though of searching the Net and of
course found the answer in five seconds.

<a
href="http://travisspencer.com/blog/2007/11/approaches-to-defining-fault-c.html"
target="_blank">Here is a guy</a> that solved it - but the header and
description of the post is quite different so I'll try to give my own
explanation here.

In the Configure Service Reference... dialog box there is an option
"Reuse types in referenced assemblies". Exactly what that means is hard
to grasp (<a href="http://www.google.com/search?hl=en&amp;q="
data-reuse+types+in+referenced+assemblies"&meta=" target="
data-_blank"="">just try for yourselves</a>) - but I understand it as
the tool tries to download the assemblies that the service is
referencing.

The solution, however, don't have much to do with understanding that (if
you don't want to) - simply clear that box and regenerate. It works!

![](http://www.travisspencer.com/stash/blog_images/Service_Reference_Settings_Dialog_Box.gif)
