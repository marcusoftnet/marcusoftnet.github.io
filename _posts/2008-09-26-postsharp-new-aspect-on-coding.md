---
layout: post
title: PostSharp - a new aspect on coding
date: 2008-09-26T16:29:00.002+02:00
author: Marcus Hammarberg
tags:
  - VB.NET
  - .NET
  - Life of a consultant

  - Agile
modified_time: 2010-12-14T16:23:11.119+01:00
blogger_id: tag:blogger.com,1999:blog-36533086.post-6832974975942400336
blogger_orig_url: http://www.marcusoft.net/2008/09/postsharp-new-aspect-on-coding.html ---

Yesterday I went to an lecture at [Avega](http://www.avega.se/) by [Gael
Fraiteur.](http://gael.fraiteur.net/) who has built the [Aspect
Oriented](http://en.wikipedia.org/wiki/Aspect-oriented_programming)
framework [PostSharp](http://www.postsharp.org/).

This was right up my ally and quite frankly the AOP way of doing things
is something I have strived for but never knew how.

However the frameworks on the market all comes with an cost or buy-in.
Either you'll have to use some sort of factory or context
([Spring.NET](http://www.springframework.net/),
[Castle](http://www.davidhayden.com/blog/dave/archive/2007/03/14/CastleWindsorAOPPolicyInjectionApplicationBlock.aspx)
or
[PIAB](http://www.davidhayden.com/blog/dave/archive/2007/12/12/EnterpriseLibrary4ExcitedAboutDependencyInjectionApplicationBlockWithPIAB.aspx))
to create your objects or (as in the PostSharp case) it will hurt your
build time.

But Gael also tipped us on a way of combining PostSharp with Enterprise
Library
([PostSharp4EntLib](http://www.codeplex.com/entlibcontrib/Wiki/View.aspx?title=PostSharp4EntLib&referringTitle=Home))
to get "the best of both worlds". This seems reasonable to us since
we're currently using Enterprise Library for other stuff.

I am longing to get rid of the exception handling, tracing and logging
code once and for all...
