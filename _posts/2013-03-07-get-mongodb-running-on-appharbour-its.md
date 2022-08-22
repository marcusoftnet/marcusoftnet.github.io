---
layout: post
title: Get MongoDB running on AppHarbour - it's an AppSetting thing
date: 2013-03-07T08:32:00.001Z
author: Marcus Hammarberg
tags:
  - Nancy
  - Tools
  - .NET
  - ContinuousDelivery
modified_time: 2013-03-07T08:32:05.227Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-2488664060079678455
blogger_orig_url: http://www.marcusoft.net/2013/03/get-mongodb-running-on-appharbour-its.html
---



<div dir="ltr" style="text-align: left;" trbidi="on">

I have been playing around a bit with [MongoDB](http://www.mongodb.org/)
for the first time of my life. It's really a very nice experience and
have a lot of the "just works"-feeling that I have started to get used
to from frameworks like [NancyFx](http://www.nancyfx.org/) and
Simple.Data.

But when i pushed it to AppHarbor I ran into problems. That all had with
me not reading stuff properly…

AppHarbor has a nice feature that replaces stuff in your .config files
on deploy. That could be used for setting Production-environment values
to your environment configuration. For example changing the connection
string for a database.

The add-on for Mongo DB at AppHarbor has a nice article describing this
in detail. But I read it quickly and put the connection string in the
-node of the web.config.

It should be added as an . As the documentation clearly points out. So
you want this:

> <span style="font-size: x-small;"><span
> style="font-family: Courier New, Courier, monospace;">
> <span
> style="font-family: 'Courier New', Courier, monospace;">key="MONGOHQ_URL"
> value="mongodb://localhost/DotVoter"/\> <span
> style="font-family: 'Courier New', Courier, monospace; font-size: x-small;">

</div>

That MONGOHQ_URL is a special name that the MongoDB add-on looks for at
deploy time. It's replaced with your configuration variable (see
AppHarbor-\>\[Your application\]-\>Configuration Variables) that is
created for you when you add the MongoDB add on.

You can then read that value as simple as this:

> <span
> style="font-family: Courier New, Courier, monospace; font-size: x-small;">private
> readonly MongoCollection \_collection;

        <span
style="font-family: Courier New, Courier, monospace; font-size: x-small;">public
MongoRepository()
<span
style="font-family: Courier New, Courier, monospace; font-size: x-small;">
      {
<span
style="font-family: Courier New, Courier, monospace; font-size: x-small;">
          var connectionString =
<span
style="font-family: Courier New, Courier, monospace; font-size: x-small;">

 ConfigurationManager.AppSettings.Get("MONGOHQ_URL");
<span
style="font-family: Courier New, Courier, monospace; font-size: x-small;">
<span
style="font-family: Courier New, Courier, monospace; font-size: x-small;">
          var client = new MongoClient(connectionString);
<span
style="font-family: Courier New, Courier, monospace; font-size: x-small;">
          var server = client.GetServer();
<span
style="font-family: Courier New, Courier, monospace; font-size: x-small;">
<span
style="font-family: Courier New, Courier, monospace; font-size: x-small;">
          var con = new MongoUrlBuilder(connectionString);
<span
style="font-family: Courier New, Courier, monospace; font-size: x-small;">
          var db = server.GetDatabase(con.DatabaseName);
<span
style="font-family: Courier New, Courier, monospace; font-size: x-small;">
          \_collection =
db.GetCollection(typeof(T).Name.ToLower());
<span
style="font-family: Courier New, Courier, monospace; font-size: x-small;">
      }

With that in place … it just works!
