---
layout: post
title: >-
  TF203007 Cannot create the label because the version controlled item […]
  already exists or has been specified more than once
date: 2010-05-28T18:38:00.001Z
author: Marcus Hammarberg
tags:
  - Life of a consultant
  - TFS
modified_time: 2010-05-28T18:38:53.799Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-7602326061290665776
blogger_orig_url: http://www.marcusoft.net/2010/05/tf203007-cannot-create-label-because.html
---


OK – I just broke my old “longest blog post title” but this was a
problem we ran into today.

As I understand the message some kind of duplication has taken place,
but I don’t know what to do about it. Well I found <a
href="http://social.msdn.microsoft.com/Forums/en/tfsversioncontrol/thread/de1cae9f-c49a-4803-afa3-82545d44112b"
target="_blank">this on a msdn-forum</a>:

> This error is cause by one of your developer was deleted file and
> added exactly same file back in instead using undeleted feature, and
> in the backend database, TFS give this file new file id which has
> exactly same server path; therefore, when you are trying to label, it
> throws an exception which complaining file already existed. To work
> around this issue, you have to manually open label and remove \[…\]
> Then you should be able to label again.

OK. One of those - “That’s strange, but it works”. Thank you <a
href="http://social.msdn.microsoft.com/Profile/en-US/?user=AndyPham&amp;referrer=http://social.msdn.microsoft.com/Forums/en/tfsversioncontrol/thread/de1cae9f-c49a-4803-afa3-82545d44112b&amp;rh=E2eIGcrgtMyTPVaEFIrTFrvt3s4NruVU2IIG%2bwzWs20%3d&amp;sp=forums"
target="_blank">AndyPham</a>.
