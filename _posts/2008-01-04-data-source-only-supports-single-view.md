---
layout: post
title: The data source '' only supports a single view named 'DefaultView'
date: 2008-01-04T09:16:00.000Z
author: Marcus Hammarberg
tags:
  - LINQ
modified_time: 2008-01-04T09:21:34.024Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-2553240381198016864
blogger_orig_url: https://www.marcusoft.net/2008/01/data-source-only-supports-single-view.html
---

I am trying the LinqDataSource out and ran into the error message:
"The data source '' only supports a single view named 'DefaultView'",
when I had configured my datasource and tried to use it from a
DropDownBox.

After some frustration and hair pulling (as always) I found the reason;
i had set the DataMember on the datasource. This was not needed since my
datasource specified only one "table". And now - as I am writing this i
understand that that's what the error message is trying to tell me.

So - to get around the "The data source '' only supports a single view
named 'DefaultView'" - error message simply remove the DataMember value
where you are using the datasource.
