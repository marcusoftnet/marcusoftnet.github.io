---
layout: post
title: Managing dynamic controls in an ASP.NET page
date: 2008-05-08T05:40:00.008Z
author: Marcus Hammarberg
tags:
  - .NET
  - C#
modified_time: 2010-12-14T15:20:33.286Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-6971485611318880487
blogger_orig_url: http://www.marcusoft.net/2008/05/managing-dynamic-controls-in-aspnet.html
---


The last couple of days (well actually for my parts it's more like
months or years) we have been discussion the management of dynamic
controls in ASP.NET pages. In my experience this is a very common
scenario and i haven't still found a great way to handling it.

To explain better I'll just a very simple fictive scenario; imagine that
a page has a button "Create new control". Next to the button is a
textbox in which you can type the typename of the control to create
(CheckBox, TextBox etc.). When you click the button the control, of the
right type, is created.

Now for the "hard" part. Below the created control is another button
"What was entered?". When that button is clicked the code should, of
course, read the content of the dynamically created control and print
the value that was entered.

Pretty simple, eh? Well it's not so simple as it first seems... Not for
me anyway. And I still haven't seen a great solution to this problem.

The problem has to do with that the controls have to be recreated on the
page before they are read in the code-behind of the "What was
entered?"-button. In this [great
article](http://aspnet.4guysfromrolla.com/articles/092904-1.aspx) Scott
Mitchell tells us that the best place to do so is in the
Page_Init-event. This event is fired really early in the page lifecycle,
before Page_Load and all the click-events.

It might be that the article is based upon a old framework, but in [this
article](http://msdn.microsoft.com/en-us/library/ms178472.aspx) from
Microsoft the Page_PreInit (fired even earlier) is suggested as the best
place to re-create dynamic controls.

I found myself thinking; "Hey it's all the same to me - I can't create
the controls until I am in the button-click-event since that's when I
know the data (the controltype the user entered) that the GUI-creation
is based on can be access.".

This is the dilemma that I so often found myself or team-mates in. The
question "But they doesn't exists yet" has been uttered more times than
I care to think about.

The solution we came up with ([Jens Andersson](http://www.shmup.net/)
actually) is to store the data that the GUI is based on in
state-variable - Session, Hidden field or something else. Then you can
re-create the GUI in those early stages (PreInit, Init or Load - doesn't
seem to matter for this simple case) based on the data stored in the
state.

For me the big aha-experience was that the GUI only needs to be
RE-created. That is when the GUI first is created, in the "Create new
control"-click event you set the data, the GUI is based on, in session.
On all subsequent postbacks the dynamic GUI can be RE-created in the
early stages of the page lifecycle.

Thanks to all been involved in this solution. I have been pondering over
this for at least two years. If anyone want to see the example in code
email me at marcus dot hammarberg
(a) avega dot se (in your face spam-bots ;))
