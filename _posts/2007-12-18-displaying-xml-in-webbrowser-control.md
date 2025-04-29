---
layout: post
title: Displaying XML in WebBrowser control
date: 2007-12-18T07:20:00.000Z
author: Marcus Hammarberg
tags:
  - VB.NET
  - Visual Studio
modified_time: 2010-12-14T15:19:05.499Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-2986599029917462335
blogger_orig_url: https://www.marcusoft.net/2007/12/displaying-xml-in-webbrowser-control.html
---

This is one of those "how can this be hard stuff", and after
checking the Net I couldn't find anything much about how to do it.

The case is as follow; say that you have some XML that you want to
display to the user. What better way than to use the nice format used by
Internet Explorer itself. So you use the WebBrowser control in Visual Studio
2005 and simply pour the XML into the DocumentText-property... But hey -
where are my tags? Where is the formatting?

So how do you display XML in the WebBrowser then? Well the simplest
way is to save the XML-file to disk and simply start it with
Process.Start. This might also be quite enough for some solutions.

But if you need to do this over and over you want to work with the
XML-file in memory. In order to get the nice formatting you'll need to
do some XML transformations also.

So get the IE XML style sheet for displaying XML (from
here for example:
<http://www.biglist.com/lists/xsl-list/archives/200003/msg00769.html>)
and import it as a resource in your project. You could also hold it as a
string variable but that is not as nice.

The following method does the transformation for you:

```vb
''' Transforms the XML-string with the sent-in XSL-string
''' the xml to transform
''' the xsl to use for the transformation
''' a memorystream with the result of the transformation
'''
''' An example of a call to set the XML in a web browser
WebBrowser1.DocumentStream = TransformXML(xml, My.Resources.PositionsDetaljer)

Friend Shared Function TransformXML(ByVal xmlString As String, ByVal xlsString As String) As MemoryStream

Dim memStream As MemoryStream = Nothing
Try
  ' Create a xml-document from the sent-in xml-string
  Dim xmlDoc As New XmlDocument
  xmlDoc.LoadXml(xmlString)

  ' Load the xls into another document
  Dim xslDoc As New XmlDocument
  xslDoc.LoadXml(xlsString)

  ' Create a transformation
  Dim trans As New XslCompiledTransform
  trans.Load(xslDoc)

  ' Create a memory stream for output
  memStream = New MemoryStream()

  ' Do the transformation according to the XSLT and save the result in our
  memory stream
  trans.Transform(xmlDoc, Nothing, memStream)
  memStream.Position = 0
Catch ex As Exception
  Throw ex
End Try

Return memStream
End Function
```

The final part is almost trivial:

```vb
WebBrowser1.DocumentStream = TransformXML(m_message, My.Resources IEXMLDefaultStyle)
```

One last gotcha though - don't set any of the Document properties in the constructor of the form. Do it in the Load-event handler or later.
