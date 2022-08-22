---
layout: post
title: Aspects - I love it!
date: 2008-11-19T10:23:00.001Z
author: Marcus Hammarberg
tags:
  - Life of a consultant
modified_time: 2010-12-14T15:23:11.103Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-3644009418423301654
blogger_orig_url: http://www.marcusoft.net/2008/11/aspects-i-love-it.html
---


Today I really harvested the full effect of our inclusion of
<a href="http://en.wikipedia.org/wiki/Aspect-oriented_programming"
target="_blank">Aspect Orientation</a>, by using the
<a href="http://msdn.microsoft.com/en-us/library/cc309507.aspx"
target="_blank">Policy Injection block</a> of
<a href="http://www.codeplex.com/entlib" target="_blank">Enterprise
Library</a>.

And I must say; I am in love! I hereby solemnly declare that I never
will use any other way to implement non-functional requirements. As long
as I have a say in the question.

Why - you ask? Because all other way is stupid! (I've picked up some
<a href="http://www.youtube.com/watch?v=4XpnKHJAok8"
target="_blank">Linus Torvalds style</a>) Don't code - configure!

Here is the example that really convinced me; With a quite simple (very
simple if you use the configuration tool for Enterprise Library)
configuration block I got the results from all the methods in a certain
interface (system values from database) to be cached.

Do you hear me? NO CODE did that! And it's so beautiful that my eyes are
filled with tears.

Here is my configuration:

> \<!-- Caching policy for IDaVardeForrad REQUIRED! --\>
> \<add name="CachingPolicy"\>
> \<matchingRules\>
> \<add
> type="Microsoft.Practices.EnterpriseLibrary.PolicyInjection.MatchingRules.TypeMatchingRule,
> Microsoft.Practices.EnterpriseLibrary.PolicyInjection,
> Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
>
> name="Type Matching Rule"\>
> \<matches\>
> \<add match="IdaVardeForrad" ignoreCase="false" /\>
> \</matches\>
> \</add\>
> \</matchingRules\>
> \<handlers\>
> \<add expirationTime="00:01:00" order="0"
> type="Microsoft.Practices.EnterpriseLibrary.PolicyInjection.CallHandlers.CachingCallHandler,
> Microsoft.Practices.EnterpriseLibrary.PolicyInjection.CallHandlers,
> Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
>
> name="Caching Handler" /\>
> \</handlers\>
> \</add\>
