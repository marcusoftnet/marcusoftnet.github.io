---
layout: post
title: Load-event of UserControls in design mode date: '2007-05-15T14:06:00.000+02:00'
author: Marcus Hammarberg
tags: - Visual
Studio modified_time: '2010-12-14T16:19:05.593+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-3713039309925097026
blogger_orig_url: http://www.marcusoft.net/2007/05/load-event-of-usercontrols-in-design.html
---

Ran into another problem just now...

If you have code in the Load-event of a Windows <span
id="SPELLING_ERROR_0" class="blsp-spelling-error">usercontrol</span>, it
will fire when the <span>="blsp-spelling-error">usercontrol</span> is shown in Visual Studio
at design-time. This can be troublesome if the code doesn't compile or
needs some <span>="blsp-spelling-error">runtime</span>-only variables.

However all Windows forms controls (forms, <span>="blsp-spelling-error">usercontrols</span> etc.) inherits from
<span>="blsp-spelling-error">ComponentModel</span> which in turn has a
property that's called <span>="blsp-spelling-error">DesignMode</span>. This property is true
when the Component (control in our case) is shown in <span
id="SPELLING_ERROR_6" class="blsp-spelling-error">designmode</span> in
Visual Studio.

Beware for this [special case
though](http://dotnetjunkies.com/WebLog/mjordan/archive/2003/12/01/4117.aspx)...