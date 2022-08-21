---
layout: post
title: Validating WCF-messages with WSDL
date: '2008-08-14T07:59:00.005+02:00'
author: Marcus Hammarberg
tags:
  - SOA -
WCF
modified_time: '2008-08-14T08:33:51.879+02:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-6621610237746349724
blogger_orig_url: http://www.marcusoft.net/2008/08/validating-wcf-messages-with-wsdl.html
---

When you first think about it, it's quite strange that no
validation, takes place out-of-the-box ,against the <span
id="SPELLING_ERROR_0" class="blsp-spelling-error">WSDL</span> that
describes a service (<span>="blsp-spelling-error">asmx</span> or [<span>="blsp-spelling-error">WCF</span>](http://en.wikipedia.org/wiki/Windows_Communication_Foundation)).
Then you (read: I) forget it and all of a sudden you don't think that
much about it; the generated proxy or services code doesn't contain
logic. Period.

It's even more so when you only create services that is generating <span
id="SPELLING_ERROR_3" class="blsp-spelling-error">WSDL</span> when
asked. BUT (and it's a big but ;)) - when you start doing [Contract
First](http://en.wikipedia.org/wiki/Design_by_contract) you are actually
specifying the [<span>="blsp-spelling-error">WSDL</span>](http://en.wikipedia.org/wiki/Web_Services_Description_Language)
first and then generate the code... then the question arises again.

I mean <span>="blsp-spelling-corrected">you're</span> specifying things in the
<span id="SPELLING_ERROR_6" class="blsp-spelling-error">WSDL</span> that
doesn't get generated into the code. Things like format, lengths and
stuff like that. It's a bit strange that it's lost. And the best
scenario is that it's simply validated when the request is received.

Lo and behold - here is [<span>="blsp-spelling-error">mr</span> <span>="blsp-spelling-error">Skonnard</span> with a brilliant
solution](http://www.pluralsight.com/community/blogs/aaron/archive/2006/04/20/22181.aspx).
Here are [some other
articles](http://www.codeplex.com/WCFSecurity/Wiki/View.aspx?title=How%20To%20-%20Perform%20Message%20Validation%20with%20Schemas%20in%20WCF&referringTitle=How%20Tos)
brushing on the same subject.

Thanks to <span>="blsp-spelling-error">Fredrik</span> for finding this, especially
since I serious doubted that it could be done. We are trying to
implement it now - I'll get back to you with our experience in a while.
