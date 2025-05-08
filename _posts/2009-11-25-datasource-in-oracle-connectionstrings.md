---
layout: post
title: DataSource in Oracle Connection Strings
date: 2009-11-24T18:35:00.001Z
author: Marcus Hammarberg
tags:
  - Tools
  - Life of a consultant
modified_time: 2010-12-14T15:23:30.890Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-4137345923394061671
blogger_orig_url: https://www.marcusoft.net/2009/11/datasource-in-oracle-connectionstrings.html
---

Here's a useful tip for managing Oracle connections: Instead of relying on the `tnsnames.ora` file, which can be cumbersome to configure and distribute, you can include the connection details directly in your connection string. This way, all necessary information is contained within your application's configuration file.

Here's an example connection string:

```xml
<connectionStrings>
    <add name="ConnectionName"
         connectionString="Data Source=(DESCRIPTION =(ADDRESS = (PROTOCOL = TCP)(HOST = hostname.host.se)(PORT = 1521))(CONNECT_DATA =(SERVER = DEDICATED)(SERVICE_NAME = servicename)));User Id=[your user];Password=[your pwd];"
         providerName="Oracle.DataAccess.Client" />
</connectionStrings>
```

This approach simplifies deployment by consolidating configuration into a single place. I find this method quite convenient!
