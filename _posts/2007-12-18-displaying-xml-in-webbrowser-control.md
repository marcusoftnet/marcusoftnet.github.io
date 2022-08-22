---
layout: post
title: Displaying XML in WebBrowser control
date: '2007-12-18T08:20:00.000+01:00'
author: Marcus Hammarberg
tags:
  - VB.NET
  - Visual Studio
modified_time: '2010-12-14T16:19:05.499+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-2986599029917462335
blogger_orig_url: http://www.marcusoft.net/2007/12/displaying-xml-in-webbrowser-control.html
---

This is one of those "how can this be hard stuff", and after
checking the Net i couldn't find anything much about how to do it.

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
`''' `


''' Transforms the XML-string with the sent-in XSL-string
'''


''' the xml to transform
''' the xsl to use for the transformation
''' a memorystream with the result of the
transformation
'''
''' An example of a call to set the XML in a webbrowser
''' WebBrowser1.DocumentStream
= TransformXML(<span
id="SPELLING_ERROR_13" class="blsp-spelling-error">xml,
My.Resources.PositionsDetaljer)
'''
Friend Shared Function TransformXML(<span
id="SPELLING_ERROR_15" class="blsp-spelling-error">ByVal <span
id="SPELLING_ERROR_16" class="blsp-spelling-error">xmlString As
String, <span id="SPELLING_ERROR_17"
class="blsp-spelling-error">ByVal <span id="SPELLING_ERROR_18"
class="blsp-spelling-error">xlsString As String) As <span
id="SPELLING_ERROR_19" class="blsp-spelling-error">MemoryStream
Dim <span id="SPELLING_ERROR_20"
class="blsp-spelling-error">memStream As <span
id="SPELLING_ERROR_21" class="blsp-spelling-error">MemoryStream =
Nothing
Try
' Create a <span id="SPELLING_ERROR_22"
class="blsp-spelling-error">xml-document from the sent-in <span
id="SPELLING_ERROR_23" class="blsp-spelling-error">xml-string
Dim <span id="SPELLING_ERROR_24"
class="blsp-spelling-error">xmlDoc As New <span
id="SPELLING_ERROR_25" class="blsp-spelling-error">XmlDocument
<span id="SPELLING_ERROR_26"
class="blsp-spelling-error">xmlDoc.<span id="SPELLING_ERROR_27"
class="blsp-spelling-error">LoadXml(<span id="SPELLING_ERROR_28"
class="blsp-spelling-error">xmlString)

' Load the <span id="SPELLING_ERROR_29"
class="blsp-spelling-error">xls into another document
Dim <span id="SPELLING_ERROR_30"
class="blsp-spelling-error">xslDoc As New <span
id="SPELLING_ERROR_31" class="blsp-spelling-error">XmlDocument
<span id="SPELLING_ERROR_32"
class="blsp-spelling-error">xslDoc.<span id="SPELLING_ERROR_33"
class="blsp-spelling-error">LoadXml(<span id="SPELLING_ERROR_34"
class="blsp-spelling-error">xlsString)

' Create a transformation
Dim trans As New <span id="SPELLING_ERROR_35"
class="blsp-spelling-error">XslCompiledTransform
trans.Load(<span id="SPELLING_ERROR_36"
class="blsp-spelling-error">xslDoc)

' Create a memory stream for output
<span id="SPELLING_ERROR_37"
class="blsp-spelling-error">memStream = New <span
id="SPELLING_ERROR_38"
class="blsp-spelling-error">MemoryStream()

' Do the transformation according to the <span id="SPELLING_ERROR_39"
class="blsp-spelling-error">XSLT and save the result in our
memory stream
trans.Transform(<span id="SPELLING_ERROR_40"
class="blsp-spelling-error">xmlDoc, Nothing, <span
id="SPELLING_ERROR_41" class="blsp-spelling-error">memStream)
<span id="SPELLING_ERROR_42"
class="blsp-spelling-error">memStream.Position = 0
Catch ex As Exception
Throw ex
End Try

Return <span id="SPELLING_ERROR_43"
class="blsp-spelling-error">memStream
End Function


The final part is almost trivial:
`WebBrowser1.DocumentStream = TransformXML(m_message, My.Resources.IEXMLDefaultStyle)`

One last <span id="SPELLING_ERROR_47"
class="blsp-spelling-corrected">gotcha though - don't set any of
the Document properties in the constructor of the form. Do it in the
Load-event handler or later.
