---
layout: post
title: >-
  Error “The provider did not return a ProviderManifestToken string” with SQL
  Compact Edition
date: 2011-02-16T12:51:00.001Z
author: Marcus Hammarberg
tags:
  - .NET
  - SpecFlow
modified_time: 2011-02-16T13:34:46.482Z
thumbnail: >-
  http://lh6.ggpht.com/\_TI0jeIedRFk/TVvIRpWMf2I/AAAAAAAAA5U/Qa9CiARpmHw/s72-c/wlEmoticon-confusedsmile%5B2%5D.png?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-6161852859030600182
blogger_orig_url: http://www.marcusoft.net/2011/02/error-provider-did-not-return.html
---


I was totally terrified when this happened to my yesterday. I had
prepared a little website to use on a
<a href="http://www.specflow.org" target="_blank">SpecFlow</a>
demonstration. I had run it several times and it worked fine. But all of
a sudden – when I was doing one of those “just checking” it failed on me
with this (“The provider did not return a ProviderManifestToken string”)
error.

The site was using Entity Framework Code first with <a
href="http://weblogs.asp.net/scottgu/archive/2011/01/11/vs-2010-sp1-and-sql-ce.aspx"
target="_blank">SQL CE as described here</a>

<a
href="http://www.google.se/search?sourceid=chrome&amp;ie=UTF-8&amp;q=The+provider+did+not+return+a+ProviderManifestToken+string"
target="_blank">Goggling for it didn’t</a> help me to much but I
suddenly realized that something was missing. I had used <a
href="http://blog.stevensanderson.com/2011/01/28/mvcscaffolding-one-to-many-relationships/"
target="_blank">MvcScaffolding</a> to create the database, but I hadn’t
added any entries into the .config. Neither had MvcScaffolding but it
was totally a slip from me. So I simply added this:

``` brush:
<connectionStrings>
  <add
   name="[Name from you dbcontext class]"
   connectionString="DataSource=|DataDirectory|AnyName.sdf"
  providerName="System.Data.SqlServerCe.4.0"/>
</connectionStrings>
```

A few words here:

- When adding this connection string the database got created. You
    might have to regenerate it (simply update your model to do), I’m
    not sure about that
- You need the name of the connection string should equal the name of
    the DbContext class that your using
- What or where the site got it’s data from before this I don’t know.
    There was no database present in the App_Data-directory before I did
    this fix. <img
    src="http://lh6.ggpht.com/_TI0jeIedRFk/TVvIRpWMf2I/AAAAAAAAA5U/Qa9CiARpmHw/wlEmoticon-confusedsmile%5B2%5D.png?imgmax=800"
    class="wlEmoticon wlEmoticon-confusedsmile"
    style="border-bottom-style: none; border-right-style: none; border-top-style: none; border-left-style: none"
    alt="Confused smile" />
My demo-site is saved. My demos for SpecFlow run. I am happy!
