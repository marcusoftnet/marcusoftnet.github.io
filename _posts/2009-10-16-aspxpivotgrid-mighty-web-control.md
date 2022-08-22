---
layout: post
title: AspxPivotGrid – a mighty web control
date: 2009-10-16T14:40:00.001Z
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
  - Life of a consultant
  - ASP.NET MVC
modified_time: 2010-12-14T15:22:38.183Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-127983959711797815
blogger_orig_url: http://www.marcusoft.net/2009/10/aspxpivotgrid-mighty-web-control.html
---


OK – this might well be one of the “biggest” web control I ever used.

The application we’re building has a feature that let’s the user play
around with columns and rows to their need. Much like the Pivot-features
of Excel. When I first saw this (current application is developed in
ASP.OLD mind you) I shivered a bit since it looked pretty messy.

But along came (well, a developer at the customer told me about it) the
<a href="http://www.devexpress.com/Products/NET/Controls/ASP/Pivot_Grid"
target="_blank">Aspx Pivot Grid</a> from
<a href="http://www.devexpress.com" target="_blank">DevExpress</a>.

It’s pretty amazing since is almost completely replicates the
functionality from Excel with very little code. Also it comes with the
possibility to export to PDF, Excel, HTML, CSV etc.

Here is a short example on how you use the pivot grid in a very crude
fashion, in code rather than configuring it at design time.
           // In .Designer.cs...

           {
               var ds = HämtaData(SQL1); // Returns some data from the database

                ASPxPivotGrid1.DataSource = ds;
                foreach (var column in ds.Tables[0].Columns)
                {
                    ASPxPivotGrid1.Fields.AddField(new PivotGridField(column.ToString(), PivotArea.FilterArea));
                }
            }

Oh yeah – notice that you’ll need to be in the Page_Init event for this
to work… Those crazy WebForms guys and their events – why go complicated
when ASP.NET MVC is so easy :)
