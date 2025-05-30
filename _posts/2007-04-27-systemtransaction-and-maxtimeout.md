---
layout: post
title: System.Transaction and maxTimeout
date: 2007-04-27T05:45:00.000Z
author: Marcus Hammarberg
tags:
  - .NET
  - Life of a consultant
modified_time: 2007-04-27T05:52:15.807Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-3176416818371085872
blogger_orig_url: https://www.marcusoft.net/2007/04/systemtransaction-and-maxtimeout.html
---

I love the new System.Transaction found in .NET 2.0. I have been and will continue to use it in my applications.

When you compare it with for example the Enterprise Service management it's so slim and lightweight. And the scaling up to SQL 2005 Transactions when need is a feature that will be nice when that kick in.

My favorite among them all, though, is the TransactionScope, which makes a nice and easy visual way of showing what is part of the transaction and not.

However, I found out a small glitch yesterday. Apparently there is a configuration value (maxTimeout) hidden away in the machine.config-file on each computer. This value defaults to ten minutes and that value overrides any values found in other configs (web.config or app.config).

So - if you need long running transaction you will have to tweak that value. See this articles for more information.

- <http://blogs.msdn.com/madhuponduru/archive/2005/12/16/504730.aspx>
- <http://msdn2.microsoft.com/en-us/library/system.transactions.configuration.defaultsettingssection.aspx>
- <http://msdn2.microsoft.com/en-us/library/system.transactions.configuration.machinesettingssection.aspx>

But ... I still love it!
