---
layout: post
title: ASP.NET MVC – Running Transformation Error
date: 2009-03-01T21:15:00.001Z
author: Marcus Hammarberg
tags:
  - Life of a consultant
  - ASP.NET MVC
modified_time: 2009-03-07T21:58:15.133Z
thumbnail: http://lh3.ggpht.com/_TI0jeIedRFk/Sar6-Cdw99I/AAAAAAAAADI/UjxSu9mWZxk/s72-c/templatedprocessing_thumb2.jpg?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-8862835742123198589
blogger_orig_url: http://www.marcusoft.net/2009/03/aspnet-mvc-running-transformation-error.html
---

**UPDATED**  
This is solved. [See this](http://www.marcusoft.net/2009/03/aspnet-mvc-running-transformation-error_07.html).

I ran into this problem:

[![Template Processing resulted in 1 Errors: Error: Running Transformation](http://lh3.ggpht.com/_TI0jeIedRFk/Sar6-Cdw99I/AAAAAAAAADI/UjxSu9mWZxk/templatedprocessing_thumb2.jpg?imgmax=800)](http://lh4.ggpht.com/_TI0jeIedRFk/Sar69EE5xHI/AAAAAAAAADE/nKOvDq_M6gE/s1600-h/templatedprocessing4.jpg)

It appeared when I added an Edit-view for an inline view-data class. That is, I created a special class to hold the view data that the controller is acting upon, and that class is declared inside the controller.

When the Add view-dialog (which I love by the way) of the [ASP.NET MVC](http://www.asp.net/mvc/) closes with OK – this dialog appears.

I think it’s a bug in the RC-release, but I am not sure. I’ll send this to the ASP.NET MVC team and see what they have to say.

I am not sure that I will have the view data class as part of the other class since that violates the [Single Responsibility Principle (SRP)](http://en.wikipedia.org/wiki/Single_responsibility_principle) – but if I do, I get this crash.

The more reason for me to move it then! I’ll do that…
