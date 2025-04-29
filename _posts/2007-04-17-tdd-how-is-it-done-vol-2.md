---
layout: post
title: TDD - how is it done? Vol 2
date: 2007-04-17T11:57:00.000Z
author: Marcus Hammarberg
tags:
  - .NET
  - Agile
  - TDD
modified_time: 2007-04-17T12:05:01.769Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5105649867606006552
blogger_orig_url: https://www.marcusoft.net/2007/04/tdd-how-is-it-done-vol-2.html
---

When
digging around for TDD stuff I have started [a small
series](http://marcushammarberg.blogspot.com/2007/04/tdd-how-is-it-done.html)
(?) about how to actually implementing the good ideas and promises from
TDD.

Found another good article on the practicalities for Test Driven
Development. This one is about [Mock
Objects](http://msdn.microsoft.com/msdnmag/issues/04/10/NMock/).

The minute after you start to think about doing TDD through all your
code you find yourself pondering about how to test only the current
layer. For example the business layer has references to the Data Access
layer (as it often do) but I only want to test the business layer. This
is solve by Mock objects, which [the
article](http://msdn.microsoft.com/msdnmag/issues/04/10/NMock/) is
about.

Also some issues about configuration arises. Like; how can I assure that
the mocked objects are used in a test run but now in a debug run...
There are some references about that also in the article.
