---
layout: post
title: Real answere - Type '\[typename\]' is not
CLS-compliant, interface, tests and dependency injection date: '2008-03-06T07:31:00.004+01:00'
author: Marcus Hammarberg
tags: - VB.NET
modified_time: '2010-12-14T16:20:33.349+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-8327565985541635680
blogger_orig_url: http://www.marcusoft.net/2008/03/real-answere-type-typename-is-not-cls.html
---

The [previous
post](http://marcushammarberg.blogspot.com/2008/03/type-typename-is-not-cls-compliant.html)
about <span>="blsp-spelling-error">CLS</span>-compliant classes is right in a
way but the real answer lies in that when you create a test project with
Visual Studio, the created <span>="blsp-spelling-corrected">Assembly</span> is marked as <span
id="SPELLING_ERROR_2"
class="blsp-spelling-error">CLS</span>-compliant.

This is done in the <span>="blsp-spelling-error">AssemblyInfo</span>.vb (or .cs depending on
your choice). I am not quite sure on why this is done but can imagine
that it has to do with that the <span>="blsp-spelling-corrected">test project</span> wants to be open for
calls on all lot of different classes and components.

However in our case we only had to remove the <span
id="SPELLING_ERROR_5"
class="blsp-spelling-error">CLSCompliant</span>(true) from the <span
id="SPELLING_ERROR_6"
class="blsp-spelling-error">AssemblyInfo</span>.vb-file and everything
was back to normal.
