---
layout: post
title: Error “The provider did not return a ProviderManifestToken string” with SQL Compact Edition
date: 2011-02-16T12:51:00.001Z
author: Marcus Hammarberg
tags:
  - .NET
  - SpecFlow
modified_time: 2011-02-16T13:34:46.482Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-6161852859030600182
blogger_orig_url: https://www.marcusoft.net/2011/02/error-provider-did-not-return.html
---

I was totally terrified when this happened to my yesterday. I had prepared a little website to use on a [SpecFlow](http://www.specflow.org) demonstration. I had run it several times and it worked fine. But all of a sudden – when I was doing one of those “just checking” it failed on me with this (“The provider did not return a ProviderManifestToken string”) error.

The site was using Entity Framework Code first with [SQL CE as described here](http://weblogs.asp.net/scottgu/archive/2011/01/11/vs-2010-sp1-and-sql-ce.aspx)

[Goggling for it didn’t](http://www.google.se/search?sourceid=chrome&amp;ie=UTF-8&amp;q=The+provider+did+not+return+a+ProviderManifestToken+string) help me to much but I suddenly realized that something was missing. I had used [MvcScaffolding](http://blog.stevensanderson.com/2011/01/28/mvcscaffolding-one-to-many-relationships/) to create the database, but I hadn’t added any entries into the .config. Neither had MvcScaffolding but it was totally a slip from me. So I simply added this:

```xml
<connectionStrings>
  <add name="[Name from you dbContext class]" connectionString="DataSource=|DataDirectory|AnyName.sdf" providerName="System.Data.SqlServerCe.4.0"/>
</connectionStrings>
```

A few words here:

- When adding this connection string the database got created. You might have to regenerate it (simply update your model to do), I’m not sure about that
- You need the name of the connection string should equal the name of the `DbContext` class that your using
- What or where the site got it’s data from before this I don’t know. There was no database present in the App_Data-directory before I did this fix.

My demo-site is saved. My demos for SpecFlow works as expected. I am happy!
