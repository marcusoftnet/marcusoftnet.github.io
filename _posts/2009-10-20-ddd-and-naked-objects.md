---
layout: post
title: DDD and Naked Objects date: '2009-10-20T13:48:00.001+02:00'
author: Marcus Hammarberg
tags: -
Tools - DDD
  - .NET - Agile
modified_time: '2010-12-14T16:22:38.182+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-6357154258673076643
blogger_orig_url: http://www.marcusoft.net/2009/10/ddd-and-naked-objects.html ---

I’ve just learned about this and don’t want to loose the thought and
links surrounding it.

The first encounter I had with
<a href="http://en.wikipedia.org/wiki/Domain-driven_design"
target="_blank">DDD</a> was when
<a href="http://jimmynilsson.com/" target="_blank">Jimmy Nilsson</a> did
a presentation at
<a href="http://blog.avegagroup.se/elevate/" target="_blank">Elevate</a>.
One of the things he said did a profound <a
href="http://www.marcusoft.net/2009/02/ddd-coin-drops-for-marcus.html"
target="_blank">impression on me</a>, especially the part when he talked
about the database being a consequence of my domain model, not the other
way around.

OK – this got me thinking. Wouldn’t it be nice if it also was that way
with the GUI? The GUI being a consequence or reflecting what my domain
model captures?

Here is, to my very narrow knowledge, the solution – DDD with
<a href="http://www.nakedobjects.org/home/index.shtml"
target="_blank">Naked Objects</a>. Naked objects is
<a href="http://en.wikipedia.org/wiki/Naked_objects" target="_blank">an
architectural pattern</a> that adds a principle of the GUI being
automatically generated (or generated on the fly I presume) from the
model.

OK – but that cannot be used in production, of course – I hear some
people way in the back saying. No but – to quote a late post the
<a href="http://groups.google.com/group/dddsverige"
target="_blank">Swedish DDD-list on Google</a> (my translation):

> A story is considered done when there is an implementation of the
> Domain Model and a basic GUI, in which you can do anything, but only
> in one way and without any major afterthought. The users can then test
> the story with this GUI and think about how they really want to work.

Pretty cool, eh? Thank you Tomas.

There are some <a href="http://www.nakedobjects.net/home/index.shtml"
target="_blank">frameworks to help</a> you (be sure to check the
<a href="http://www.nakedobjects.net/video/video_list.shtml"
target="_blank">videos</a> out, especially
<a href="http://www.nakedobjects.net/video/code_only.shtml"
target="_blank">this one</a> and
<a href="http://www.nakedobjects.net/video/iterations.shtml"
target="_blank">the follow on</a>), some <a
href="http://www.pragprog.com/titles/dhnako/domain-driven-design-using-naked-objects"
target="_blank">books to read</a> and whole lot more to learn about
this.

But I like the idea so far.
