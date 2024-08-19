---
layout: post
title: DDD and Naked Objects
date: 2009-10-20T11:48:00.001Z
author: Marcus Hammarberg
tags:
  - Tools - DDD
  - .NET
  - Agile
modified_time: 2010-12-14T15:22:38.182Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-6357154258673076643
blogger_orig_url: http://www.marcusoft.net/2009/10/ddd-and-naked-objects.html
---

I recently discovered something intriguing and wanted to share it along with some useful links.

My initial encounter with [Domain-Driven Design (DDD)](http://en.wikipedia.org/wiki/Domain-driven_design) was through a presentation by [Jimmy Nilsson](http://jimmynilsson.com/) at [Elevate](http://blog.avegagroup.se/elevate/). His talk had a profound impact on me, particularly his point that the database should be a consequence of the domain model, not the other way around.

This got me thinking: wouldn’t it be beneficial if the GUI were also a reflection of the domain model, rather than being developed separately?

Enter DDD with [Naked Objects](http://www.nakedobjects.org/home/index.shtml). Naked Objects is an [architectural pattern](http://en.wikipedia.org/wiki/Naked_objects) where the GUI is generated directly from the domain model, either automatically or on-the-fly.

Some might argue that Naked Objects isn’t suitable for production environments. However, as discussed on the [Swedish DDD list on Google](http://groups.google.com/group/dddsverige) (my translation):

> A story is considered done when there is an implementation of the Domain Model and a basic GUI, in which you can do anything, but only in one way and without any major afterthought. The users can then test the story with this GUI and think about how they really want to work.

Cool concept, right? Thanks to Tomas for the insight!

For those interested, there are some [frameworks available](http://www.nakedobjects.net/home/index.shtml) to get started, along with [videos](http://www.nakedobjects.net/video/video_list.shtml) and [books](http://www.pragprog.com/titles/dhnako/domain-driven-design-using-naked-objects) that provide further details. 

I’m excited by the potential of this approach and look forward to learning more.
