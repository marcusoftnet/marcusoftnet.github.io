---
layout: post
title: Chose your battles
date: 2007-04-26T05:18:00.000Z
author: Marcus Hammarberg
tags:
  - VB.NET
  - Visual Studio
modified_time: 2010-12-14T15:19:05.619Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-4999671088852773853
blogger_orig_url: http://www.marcusoft.net/2007/04/chose-your-battles.html
---

When trying
to force something to be what you want you have to know when to give up
and when to keep trying a little while longer... that's my lesson from
this week.

Last friday (?) [i wrote about namespaces in
VB.NET](http://marcushammarberg.blogspot.com/2007/04/including-namespaces-in-new-vbnet.html)
and how to make them appear a the top of the class file automatically.
Well I learned a lot about VB since then (actually!) and one of the
things are the philosophy of VB.NET. VB.NET comes from a long row of
Visual Basic releases, who all are alike in the way that the frees the
user from having to care about the stuff behind the scene.

(If you don't like VB.NET please feel free to exchange the word "frees"
to "hides" in the previous sentence :))

Although there are lesser and lesser stuff tucked away there are still
some inheritance from that traditions and Default Namespace is one of
them. In the VB.NET community it's considered a good thing since you
don't have to write it.

I would stretch it so far as to say that you have to like it and then
use it of totally get rid of it. Here's your choices

- Put some namespace in the Default Namespace-textbox of the project.
  When you create new classes don't add any namespace (or only the
  subnamespace for this special class). This is good since you don't
  have to write so much
- Blank the Default Namespace-box and write the complete namespace at
  the top of every class you create. This is the route our project has
  taken. It's a bit more writing but give you all the control. Also
  it's probably the non-vb-way I presume but don't care.
