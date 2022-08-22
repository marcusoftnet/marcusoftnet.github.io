---
layout: post
title: Validating WCF-messages with WSDL
date: 2008-08-14T05:59:00.005Z
author: Marcus Hammarberg
tags:
  - SOA
  - WCF
modified_time: 2008-08-14T06:33:51.879Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-6621610237746349724
blogger_orig_url: http://www.marcusoft.net/2008/08/validating-wcf-messages-with-wsdl.html
---


When you first think about it, it's quite strange that no
validation, takes place out-of-the-box ,against the <span
id="SPELLING_ERROR_0" class="blsp-spelling-error">WSDL that
describes a service (asmx or [WCF](http://en.wikipedia.org/wiki/Windows_Communication_Foundation)).
Then you (read: I) forget it and all of a sudden you don't think that
much about it; the generated proxy or services code doesn't contain
logic. Period.

It's even more so when you only create services that is generating WSDL when
asked. BUT (and it's a big but ;)) - when you start doing [Contract
First](http://en.wikipedia.org/wiki/Design_by_contract) you are actually
specifying the [WSDL](http://en.wikipedia.org/wiki/Web_Services_Description_Language)
first and then generate the code... then the question arises again.

I mean you're specifying things in the
WSDL that
doesn't get generated into the code. Things like format, lengths and
stuff like that. It's a bit strange that it's lost. And the best
scenario is that it's simply validated when the request is received.

Lo and behold - here is [mr Skonnard with a brilliant
solution](http://www.pluralsight.com/community/blogs/aaron/archive/2006/04/20/22181.aspx).
Here are [some other
articles](http://www.codeplex.com/WCFSecurity/Wiki/View.aspx?title=How%20To%20-%20Perform%20Message%20Validation%20with%20Schemas%20in%20WCF&referringTitle=How%20Tos)
brushing on the same subject.

Thanks to Fredrik for finding this, especially
since I serious doubted that it could be done. We are trying to
implement it now - I'll get back to you with our experience in a while.
