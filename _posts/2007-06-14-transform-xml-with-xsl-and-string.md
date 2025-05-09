---
layout: post
title: Transform XML with XSL, and string
date: 2007-06-14T06:55:00.000Z
author: Marcus Hammarberg
tags:
  - VB.NET
modified_time: 2007-06-14T11:43:29.854Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5447969887586774494
blogger_orig_url: https://www.marcusoft.net/2007/06/transform-xml-with-xsl-and-string.html
---

This took us a while to find and put together. I don't want to have to go through it again.

This function takes a xml-string and transforms it with the sent-in XSL (also string). The output is returned as a memory stream that, for example, can be set in a web browser controls DocumentStream property.

Here is the code (yes, in my favorite new language VB.NET ;)):

```vb
Friend Shared Function TransformXML(ByVal xmlString As String, ByVal xslString As String) As MemoryStream

  Dim memStream As MemoryStream = Nothing
  Try
    ' Create a xml document from the sent-in string
    Dim xmlDoc As New XmlDocument
    xmlDoc.LoadXml(xmlString)

    ' Load the xsl as a xml document, from the sent-in string
    Dim xslDoc As New XmlDocument
    xslDoc.LoadXml(xslString)

    ' Create and load an transformation
    Dim trans As New XslCompiledTransform
    trans.Load(xslDoc)

    ' Create a memory stream to hold the response
    memStream = New MemoryStream()
    Dim srWriter As New StreamWriter(memStream)

    ' Transform according to the xsl and save the result in the memStream
    ' variable
    trans.Transform(xmlDoc, Nothing, memStream)

    ' Set the initial position of the memorystream
    memStream.Position = 0
  Catch ex As Exception
     Console.Write(ex.ToString())
  End Try
  Return memStream
End Function
```
