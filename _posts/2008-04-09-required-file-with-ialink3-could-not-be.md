---
layout: post
title: Required file 'alink.dll with IAlink3' could not be found - and the solution
  to it
date: 2008-04-09T06:03:00.001Z
author: Marcus Hammarberg
tags:
  - Programming
  - Life of a consultant
modified_time: 2008-04-09T06:03:57.771Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-6751370494112070271
blogger_orig_url: https://www.marcusoft.net/2008/04/required-file-with-ialink3-could-not-be.html
---


OK - a bit irritating but the first time I tried to compile ... well
anything (a console-application in this case) on my newly installed
Visual Studio 2008 on Vista - I got this error:

Required file 'alink.dll with IAlink3' could not be found

Fortunately a lot of people seems to be having the same problem. Here is
one guy describing <a
href="http://vladsnotes.hrybok.com/PermaLink,guid,c21d581f-9b92-41d8-8196-d8e4c05e7943.aspx"
target="_blank">the solution</a>. But just to be sure I've copied the
solution into here:

=========
The solution was to install two Windows Update items found on the Visual
Studio 2008 DVD in the
"**\<dvddrive\>:\WCU\dotNetFramework\dotNetMSP\x64**" folder (for 32-bit
version look in the "\<dvddrive\>:\WCU\dotNetFramework\dotNetMSP\x86"
folder):

1. NetFX2.0-KB110806-v6000-x64.msu. Run it, wait forever, reboot when
it's done.
2. NetFX3.0-KB929300-v6000-x64.msu. Run it, wait forever, reboot when
it's done

========
