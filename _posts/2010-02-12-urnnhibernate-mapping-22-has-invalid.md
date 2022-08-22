---
layout: post
title: >-
  ‘urn:nhibernate-mapping-2.2' has invalid child element 'property' and Fluent
  NHibnerate
date: 2010-02-12T10:29:00.001Z
author: Marcus Hammarberg
tags:
  - .NET
  - NHibernate
modified_time: 2010-12-14T15:19:35.812Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-8565856852452716878
blogger_orig_url: http://www.marcusoft.net/2010/02/urnnhibernate-mapping-22-has-invalid.html
---



OK – this was almost driving me crazy.

For demonstration purposes I had used the
<a href="http://wiki.fluentnhibernate.org/Auto_mapping"
target="_blank">automapping feature</a> of
<a href="http://wiki.fluentnhibernate.org/" target="_blank">Fluent
NHibnernate</a>.  In a very standard way – I used all of the conventions
out of the box.

Except… I forgot to check the conventions. For example for primary keys
the convention is to name it **Id**. Exactly that! Not ID or id or
anything.
