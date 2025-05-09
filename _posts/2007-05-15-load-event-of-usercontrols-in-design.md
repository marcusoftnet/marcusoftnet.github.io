---
layout: post
title: Load-event of UserControls in design mode
date: 2007-05-15T12:06:00.000Z
author: Marcus Hammarberg
tags:
  - Visual Studio
modified_time: 2010-12-14T15:19:05.593Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-3713039309925097026
blogger_orig_url: https://www.marcusoft.net/2007/05/load-event-of-usercontrols-in-design.html
---

Ran into another problem just now...

If you have code in the Load-event of a Windows user control, it will fire when the user control is shown in Visual Studio at design-time. This can be troublesome if the code doesn't compile or needs some runtime-only variables.

However all Windows forms controls (forms, user controls etc.) inherits from ComponentModel which in turn has a property that's called DesignMode. This property is true when the Component (control in our case) is shown in design-mode in Visual Studio.

Beware for this [special case though](http://dotnetjunkies.com/WebLog/mjordan/archive/2003/12/01/4117.aspx)...
