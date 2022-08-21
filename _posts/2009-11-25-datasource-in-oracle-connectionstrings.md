---
layout: post
title: DataSource in Oracle Connectionstrings
date: '2009-11-24T19:35:00.001+01:00'
author: Marcus Hammarberg
tags:
  - Tools
  - Life of a consultant
modified_time: '2010-12-14T16:23:30.890+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-4137345923394061671
blogger_orig_url: http://www.marcusoft.net/2009/11/datasource-in-oracle-connectionstrings.html
---


I had already forgot about this one… The
<a href="http://www.oracle.com/" target="_blank">Oracle</a>-way of doing
things is different and feels quite old to me.

Here is a short recap, it’s just for me later on – you could probably
skip the next paragraph…

Normally you configure your Oracle client (<a
href="http://www.oracle.com/technology/tech/windows/odpnet/index.html"
target="_blank">ODP.NET</a> for example) to use a datasource. This is
datasource is then searched for in a file called tnsnames.ora. In
tnsnames.ora you’ll find the server, port etc. that is needed to connect
to the database.
However – this means that you’ll need to make sure that tnsnames.ora is
present and correctly configured on all the servers you plan to deploy
your app on.

So – glad to be back with you – instead of this ugly tnsnames.ora thing
you can put all of that information into your connectionstring:

>     <connectionstrings>
>         <add name="ConnectionName" connectionstring="Data Source=(DESCRIPTION =(ADDRESS = (PROTOCOL = TCP)(HOST = hostname.host.se)(PORT = 1521))(CONNECT_DATA =(SERVER = DEDICATED)(SERVICE_NAME = servicename)));User Id=[your user];Password=[your pwd];" providername="Oracle.DataAccess.Client" />
>       </connectionstrings>
>
>




In this manner you will have “everything” you need in for the
application to work in the application .config. Not spread out in
different folder such as c:\app\client_1\network\admin or whatever.




I like! 
