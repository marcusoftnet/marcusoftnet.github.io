---
layout: post
title: More on Enterprise Library (EntLib), ODP.NET and type mapping
date: 2008-09-04T18:08:00.001Z
author: Marcus Hammarberg
tags: null
modified_time: 2008-09-04T18:08:58.121Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-6357478391735284163
blogger_orig_url: https://www.marcusoft.net/2008/09/more-on-enterprise-library-entlib.html
---


The [last
time](https://www.marcusoft.net/2008/08/enterprise-library-oracletypes-and.html)
I wrote about this I was a bit too fast to get all the intricate details
down. One of those details blew up in my face today.

The main reason for why it took me the better part of the afternoon to
sort out had to do with some really confusing name-setting. Here is was
confused me;

- the namespace
    [System.Data.Oracle](http://msdn.microsoft.com/en-us/library/system.data.oracleclient.aspx)
    Microsoft has provided a implementation of a Oracle client provider.
    Keyword: Microsoft -this implementation doesn't contain all the
    functionality in Oracle databases.
- cause of that Oracle has given us the Oracle.DataAccess.Client or
    [ODP.NET](http://www.oracle.com/technology/tech/windows/odpnet/index.html)
    for short. In this you'll have all the things you'll need.

Both of these inherits from the generic
[DbCommand](http://msdn.microsoft.com/en-us/library/system.data.common.dbcommand.aspx)
(and uses the same name for almost everything) and can hence be
converted into DbCommand but not into each other (of course - but this
took me about 1,5 hours to grasp, since the both are called
OracleCommand but are in separate namespaces...)

So far so good - go with ODP.NET to get the details and probably the
best implementation of the data provider for .NET, I've got it.

But I use the [Enterprise Library Data Access Block
(4.0)](http://www.codeplex.com/entlib) - will not ODP.NET become a
problem, I said to myself. Enterprise Library doesn't know anything
about ODP.NET and only uses DbCommand internally.

Well no, because as you easily can use any data provider in the
config-file
([ConnectionString](http://msdn.microsoft.com/en-us/library/bf7sd233.aspx)-section)
AND the Oracle.DataAccess.OracleCommand inherits from DbCommand you're
home free.

In fact you'll get the best of two worlds. When you need the nitty
gritty details (like [CollectionType / Associative
Arrays](http://www.oracle.com/technology/oramag/oracle/07-jan/o17odp.html))
you can create a OracleParameter or Command and send it as parameter to
your command. When the standard DbCommand is enough you'll use it and
it's features.

So I simply removed some of the features from [my earlier
post](https://www.marcusoft.net/2008/08/enterprise-library-oracletypes-and.html)
such as the OracleDatabase (I only use the generic stuff) and kept other
things such as the methods to create OracleParameters, since I'll need
some details found in the OracleParameter class.

I works so nicely. A big thank you to [Jens](http://www.shmup.net/) for
pointing me in the right direction when I was lost in the inheritance
structures.
