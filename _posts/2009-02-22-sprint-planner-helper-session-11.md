---
layout: post
title: Sprint Planner Helper – Session 11
date: 2009-02-21T22:30:00.001Z
author: Marcus Hammarberg
tags:
  - Sprint Planner Helper
  - TDD
modified_time: 2009-02-21T22:30:40.161Z
thumbnail: http://lh6.ggpht.com/\_kkDJOSPNTLs/SaCAj6mqXeI/AAAAAAAAAhs/q5kHDnspv6E/s72-c/sprintplannerhelpergui1_thumb%5B1%5D.jpg?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-5399120244865118545
blogger_orig_url: http://www.marcusoft.net/2009/02/sprint-planner-helper-session-11.html
---


It’s been a while since I did some code on the project. Abbe has been
quite sickly and I have not had the time. No worries – it’s all a hobby
;)

OK – what I have done since last time (2 x 15 min I think) is to produce
a list of Product on my web page. With this fancy layout…

[<img
src="http://lh6.ggpht.com/_kkDJOSPNTLs/SaCAj6mqXeI/AAAAAAAAAhs/q5kHDnspv6E/sprintplannerhelpergui1_thumb%5B1%5D.jpg?imgmax=800"
title="sprintplannerhelpergui1"
style="border-right: 0px; border-top: 0px; display: inline; border-left: 0px; border-bottom: 0px"
data-border="0" width="386" height="212"
alt="sprintplannerhelpergui1" />](http://lh3.ggpht.com/_kkDJOSPNTLs/SaCAjQSVUTI/AAAAAAAAAho/OLO2yJ2vMTw/s1600-h/sprintplannerhelpergui1%5B3%5D.jpg)

That made me realize that I could have added some disclaimer when it
comes to the UI. I made a certain css-class for the productlist, so
someone can help me out later. I will make it functional now – not
pretty.

I also came to realize that my model may be enhanced with some status
for the product items and aggregated values for how much that is done
for a product. I TDD’ed them out and added them to the GUI. Which took
me forever since I got stuck on LINQ-issues. Here is a [excellent
site](http://msdn.microsoft.com/en-us/vcsharp/aa336746.aspx) for help in
these matters.
