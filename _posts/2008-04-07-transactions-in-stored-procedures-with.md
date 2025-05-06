---
layout: post
title: Transactions in stored procedures with transaction scope
date: 2008-04-07T12:31:00.004Z
author: Marcus Hammarberg
tags:
  - VB.NET
  - .NET
  - C#
modified_time: 2008-04-09T11:35:18.428Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-293035297188284140
blogger_orig_url: https://www.marcusoft.net/2008/04/transactions-in-stored-procedures-with.html
---

Yesterday I got a question from a colleague who had run into trouble using the TransactionScope-construct in .NET.

The case was as follows; the are programming against a database whose stored procedures they cannot change. Some of these stored procedures are using calling each other and doing so under stored procedures. When the .NET-code is calling those stored procedures and doing so under TransactionScope they run into problems. The TransactionScope is not Complete-ing and the reader they are using in the TransactionScope simply returns empty (Nothing).

OK -first and foremost; don't mix! It's no good idea to have two guys deciding on when you are done. So use either the excellent Transaction support given in .NET 2.0 or use transactions in stored procedures. However...

To my colleague's defense it must be said that they cannot change the stored procedures they are using, so they are stuck. This is how you fix that situation (or well work around it is maybe more to the point).

In the connectionstring it is possible to add a parameter stating that you will not enlist in transactions:

```c#
new SqlConnection("connectionString;**Enlist=false**");
```

[Here](http://blogs.msdn.com/florinlazar/archive/2005/09/29/475546.aspx) is the article that pointed me to that direction.
