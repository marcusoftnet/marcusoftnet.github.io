---
layout: post
title: Edit web.config in nice GUI
date: 2007-01-11T06:41:00.000Z
author: Marcus Hammarberg
tags:
  - .NET
  - Life of a consultant
modified_time: 2007-01-11T06:55:43.985Z
thumbnail: http://2.bp.blogspot.com/\_kkDJOSPNTLs/RaXeIy_TdNI/AAAAAAAAAEU/\_Paci\_-xwRQ/s72-c/iis60configsettings.JPG
blogger_id: tag:blogger.com,1999:blog-36533086.post-6228418697016228830
blogger_orig_url: http://www.marcusoft.net/2007/01/new-iis-dialogbox.html
---


Yesterday
was really intense! A complete day chasing a bug through the code and
around servers. Felt so good to find it after about 7 hours of searching
for me and a colleague.

When we ran around the servers and checked configurations i found a
dialog box in IIS 6.0 that i never saw before. I realize that this
probably is embarrassing to yield but i do it anyway.

There is a possibility to see and change the values of the web.config
file from IIS in a much nicer GUI than the usual "Visual" Notepad. You
can also change a lot of other configurations from this dialog.

[<img
src="http://2.bp.blogspot.com/_kkDJOSPNTLs/RaXeIy_TdNI/AAAAAAAAAEU/_Paci_-xwRQ/s400/iis60configsettings.JPG"
id="BLOGGER_PHOTO_ID_5018661602481894610" style="CURSOR: hand"
data-border="0" />](http://2.bp.blogspot.com/_kkDJOSPNTLs/RaXeIy_TdNI/AAAAAAAAAEU/_Paci_-xwRQ/s1600-h/iis60configsettings.JPG)

1. Right click your site or virtual directory and do Properties
2. Choose the ASP.NET-tab
3. Choose Edit-configuration
4. Now the web.config for your application is opened and displayed
    (fancy that!), with possibility change the values.

This is a much nicer presentation of all the values in the config-file,
easier to get an overview from. I like a lot, found a new friend i
think
