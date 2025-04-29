Here's a revised version of your post:

```markdown
---
layout: post
title: ASPxPivotGrid – A Mighty Web Control
date: 2009-10-16T14:40:00.001Z
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
  - Life of a consultant
  - ASP.NET MVC
modified_time: 2010-12-14T15:22:38.183Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-127983959711797815
blogger_orig_url: https://www.marcusoft.net/2009/10/aspxpivotgrid-mighty-web-control.html
---

This might be one of the most impressive web controls I've ever used.

The application we're developing includes a feature that lets users manipulate columns and rows, similar to Excel's PivotTable functionality. When I first saw this (considering the application was built with older ASP technologies), I was a bit apprehensive as it looked quite complex.

However, I was introduced to the [ASPxPivotGrid](http://www.devexpress.com/Products/NET/Controls/ASP/Pivot_Grid) by [DevExpress](http://www.devexpress.com), and it turned out to be fantastic. This control replicates Excel's pivot functionality almost perfectly with minimal coding. It also supports exporting to PDF, Excel, HTML, CSV, and more.

Here's a basic example of how to use the Pivot Grid programmatically, rather than configuring it at design time:

```csharp
// In .Designer.cs...

var ds = HämtaData(SQL1); // Returns some data from the database

ASPxPivotGrid1.DataSource = ds;
foreach (var column in ds.Tables[0].Columns)
{
    ASPxPivotGrid1.Fields.AddField(new PivotGridField(column.ToString(), PivotArea.FilterArea));
}
```

Keep in mind that you need to place this code in the `Page_Init` event for it to function correctly. And while we're at it—those WebForms events can be quite intricate, but that's why I'm glad ASP.NET MVC offers a simpler approach.