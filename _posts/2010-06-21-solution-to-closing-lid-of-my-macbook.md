---
layout: post
title: Solution to closing the lid of my MacBook cause it to get VERY hot
date: 2010-06-21T16:51:00.001+02:00
author: Marcus Hammarberg
tags:
  - Marcus private
  - Life of a consultant
modified_time: 2010-06-21T16:51:34.943+02:00
blogger_id: tag:blogger.com,1999:blog-36533086.post-4895996666339004651
blogger_orig_url: http://www.marcusoft.net/2010/06/solution-to-closing-lid-of-my-macbook.html
---


OK – this might not be one of my ordinary subjects but this was soooo
annoying. Sometimes when I closed the lid of my MacBook Pro there were
something still running. This caused the battery to drain in about 20
minutes and the computer to go very, very hot. For the first time ever I
actually burned myself on a computer.

I have checked around the net for a solution, and even went into a
MacStore but as the error comes and goes there’s not much security in
the tips.

As suspected one process doesn’t have time to close down and just keeps
running. But which one?

In my case it was something called Safe Sleep (that prevents unsaved
data from being lost if the power goes out). This is disabled by the
following commands in a Terminal window:

>     sudo pmset -a hibernatemode 0
>
>
>     sudo nvram "use-nvramrc?"=false
>
>

Thank you
<a href="http://www.macfixer.net/articles/184/" target="_blank">MacFixer
for that solution</a> – works perfect
