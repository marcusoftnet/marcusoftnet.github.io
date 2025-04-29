---
layout: post
title: Aspects - I love it!
date: 2008-11-19T10:23:00.001Z
author: Marcus Hammarberg
tags:
  - Life of a consultant
modified_time: 2010-12-14T15:23:11.103Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-3644009418423301654
blogger_orig_url: https://www.marcusoft.net/2008/11/aspects-i-love-it.html
---

Today I really harvested the full effect of our inclusion of [Aspect Orientation](http://en.wikipedia.org/wiki/Aspect-oriented_programming), by using the [Policy Injection block](http://msdn.microsoft.com/en-us/library/cc309507.aspx) of [Enterprise Library](http://www.codeplex.com/entlib).

And I must say; I am in love! I hereby solemnly declare that I never will use any other way to implement non-functional requirements, as long as I have a say in the question.

Why, you ask? Because all other ways are stupid! (I've picked up some [Linus Torvalds style](http://www.youtube.com/watch?v=4XpnKHJAok8)) Don't code - configure!

Here is the example that really convinced me: With a quite simple (very simple if you use the configuration tool for Enterprise Library) configuration block, I got the results from all the methods in a certain interface (system values from the database) to be cached.

Do you hear me? NO CODE did that! And it's so beautiful that my eyes are filled with tears.

Here is my configuration:

```xml
<!-- Caching policy for IDaVardeForrad REQUIRED! -->
<add name="CachingPolicy">
  <matchingRules>
    <add
      type="Microsoft.Practices.EnterpriseLibrary.PolicyInjection.MatchingRules.TypeMatchingRule,
      Microsoft.Practices.EnterpriseLibrary.PolicyInjection,
      Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
      name="Type Matching Rule">
      <matches>
        <add match="IdaVardeForrad" ignoreCase="false" />
      </matches>
    </add>
  </matchingRules>
  <handlers>
    <add expirationTime="00:01:00" order="0"
      type="Microsoft.Practices.EnterpriseLibrary.PolicyInjection.CallHandlers.CachingCallHandler,
      Microsoft.Practices.EnterpriseLibrary.PolicyInjection.CallHandlers,
      Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
      name="Caching Handler" />
  </handlers>
</add>
```