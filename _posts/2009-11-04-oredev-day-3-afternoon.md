---
layout: post
title: ÖreDev Day 3 – Afternoon
date: 2009-11-04T15:26:00.001Z
author: Marcus Hammarberg
tags:
  - .NET
  - ÖreDev
  - NHibernate
  - Agile
  - WCF
modified_time: 2011-11-09T20:49:22.573Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-3732020210808748696
blogger_orig_url: http://www.marcusoft.net/2009/11/oredev-day-3-afternoon.html
---

### The Fallacy of Efficiency

Dan North delivered an insightful talk on not blindly pursuing efficiency, emphasizing the difference between efficiency (effort expended) and effectiveness (outcomes achieved). His presentation was full of valuable insights and thought-provoking ideas. I hope to share the slides here soon, as it's challenging to summarize his points adequately. Dan North is definitely worth checking out—he's both brilliant and entertaining.

### Explorations of [NHibernate](https://www.hibernate.org/343.html)

Stephen Bohlen, known for his rapid presentation style, discussed various add-ons for NHibernate. Here are some highlights:

- [Rhino Tools](http://sourceforge.net/projects/rhino-tools/)
- [uNhAddins](http://code.google.com/p/unhaddins/)
- [NHibernate Validator](http://www.codinginstinct.com/2008/05/nhibernate-validator.html), including a [fluent interface](http://brendanjerwin.github.com/2009/03/11/using-nhibernate-validator-with-fluent-nhibernate.html)
- [NHLambdaExtensions](http://code.google.com/p/nhlambdaextensions/)
- [NHibernate Burrow](http://sourceforge.net/projects/nhcontrib/develop) for business transactions without hitting the database
- [Fluent NHibernate](http://fluentnhibernate.org/), which I have previously praised
- [NHProfiler](http://nhprof.com/)
- [HornGet.NET](http://code.google.com/p/hornget/)

The session was packed with information, making it hard to keep up, but it was immensely valuable.

### Productive WCF

As the day progressed, Juval Löwy presented on enhancing productivity with WCF. Key takeaways included:

- [WCFServiceHost](http://msdn.microsoft.com/en-us/library/bb552363.aspx) for generic WCF hosting, useful for debugging
- [WCFTestClient](http://msdn.microsoft.com/en-us/library/bb552364.aspx) for testing WCF services
- Instrumentation with `<diagnostics performanceCounters=”all” />`
- [WCF Service Configuration Editor](http://msdn.microsoft.com/en-us/library/ms732009.aspx) in Visual Studio
- [Microsoft Service Trace Viewer](http://msdn.microsoft.com/en-us/library/ms732023.aspx) for trace analysis
- [InProcFactory](http://en.csharp-online.net/WCF_Essentials—Implementing_InProcFactory_T) for creating WCF services from .NET classes on the fly

The session was informative and packed with practical tips.

### Accessing Data in the Azure Cloud

Julia Lernman’s talk addressed the challenges of understanding Azure from a developer's perspective. This session provided a solid introduction to cloud data access, which was beneficial as I’m still learning the nuances of cloud computing.

Overall, a packed and informative afternoon at ÖreDev. I'm running low on batteries but will try to capture more from the final sessions if possible.
