---
layout: post
title: Displaying XML in WebBrowser control date: '2007-12-18T08:20:00.000+01:00'
author: Marcus Hammarberg
tags: -
VB.NET - Visual Studio modified_time: '2010-12-14T16:19:05.499+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-2986599029917462335
blogger_orig_url: http://www.marcusoft.net/2007/12/displaying-xml-in-webbrowser-control.html
---

This is one of those "how can this be hard stuff", and after
checking the Net i couldn't find anything much about how to do it.

The case is as follow; say that you have some XML that you want to
display to the user. What better way than to use the nice format used by
Internet Explorer itself. So you use the <span>="blsp-spelling-error">WebBrowser</span> control in Visual Studio
2005 and simply pour the XML into the <span>="blsp-spelling-error">DocumentText</span>-property... But hey -
where are my tags? Where is the formatting?

So how do you display XML in the <span>="blsp-spelling-error">WebBrowser</span> then? Well the simplest
way is to save the XML-file to disk and simply start it with
Process.Start. This might also be quite enough for some solutions.

But if you need to do this over and over you want to work with the
XML-file in memory. In order to get the nice formatting you'll need to
do some XML transformations also.

So get the IE XML <span>="blsp-spelling-corrected">style sheet</span> for displaying <span
id="SPELLING_ERROR_4" class="blsp-spelling-corrected">XML</span> (from
here for example:
<http://www.biglist.com/lists/xsl-list/archives/200003/msg00769.html>)
and import it as a resource in your project. You could also hold it as a
string variable but that is not as nice.

The following method does the transformation for you:
`''' `


''' Transforms the XML-string with the sent-in <span
id="SPELLING_ERROR_5" class="blsp-spelling-error">XSL</span>-string
'''


''' the <span>="blsp-spelling-error">xml</span> to transform
''' the <span>="blsp-spelling-error">xsl</span> to use for the transformation
''' a <span>="blsp-spelling-error">memorystream</span> with the result of the
transformation
'''
''' An example of a call to set the XML in a <span>="blsp-spelling-error">webbrowser</span>
''' <span>="blsp-spelling-error">WebBrowser</span>1.<span
id="SPELLING_ERROR_11" class="blsp-spelling-error">DocumentStream</span>
= <span>="blsp-spelling-error">TransformXML</span>(<span
id="SPELLING_ERROR_13" class="blsp-spelling-error">xml</span>,
My.Resources.PositionsDetaljer)
'''
Friend Shared Function <span>="blsp-spelling-error">TransformXML</span>(<span
id="SPELLING_ERROR_15" class="blsp-spelling-error">ByVal</span> <span
id="SPELLING_ERROR_16" class="blsp-spelling-error">xmlString</span> As
String, <span id="SPELLING_ERROR_17"
class="blsp-spelling-error">ByVal</span> <span id="SPELLING_ERROR_18"
class="blsp-spelling-error">xlsString</span> As String) As <span
id="SPELLING_ERROR_19" class="blsp-spelling-error">MemoryStream</span>
Dim <span id="SPELLING_ERROR_20"
class="blsp-spelling-error">memStream</span> As <span
id="SPELLING_ERROR_21" class="blsp-spelling-error">MemoryStream</span> =
Nothing
Try
' Create a <span id="SPELLING_ERROR_22"
class="blsp-spelling-error">xml</span>-document from the sent-in <span
id="SPELLING_ERROR_23" class="blsp-spelling-error">xml</span>-string
Dim <span id="SPELLING_ERROR_24"
class="blsp-spelling-error">xmlDoc</span> As New <span
id="SPELLING_ERROR_25" class="blsp-spelling-error">XmlDocument</span>
<span id="SPELLING_ERROR_26"
class="blsp-spelling-error">xmlDoc</span>.<span id="SPELLING_ERROR_27"
class="blsp-spelling-error">LoadXml</span>(<span id="SPELLING_ERROR_28"
class="blsp-spelling-error">xmlString</span>)

' Load the <span id="SPELLING_ERROR_29"
class="blsp-spelling-error">xls</span> into another document
Dim <span id="SPELLING_ERROR_30"
class="blsp-spelling-error">xslDoc</span> As New <span
id="SPELLING_ERROR_31" class="blsp-spelling-error">XmlDocument</span>
<span id="SPELLING_ERROR_32"
class="blsp-spelling-error">xslDoc</span>.<span id="SPELLING_ERROR_33"
class="blsp-spelling-error">LoadXml</span>(<span id="SPELLING_ERROR_34"
class="blsp-spelling-error">xlsString</span>)

' Create a transformation
Dim trans As New <span id="SPELLING_ERROR_35"
class="blsp-spelling-error">XslCompiledTransform</span>
trans.Load(<span id="SPELLING_ERROR_36"
class="blsp-spelling-error">xslDoc</span>)

' Create a memory stream for output
<span id="SPELLING_ERROR_37"
class="blsp-spelling-error">memStream</span> = New <span
id="SPELLING_ERROR_38"
class="blsp-spelling-error">MemoryStream</span>()

' Do the transformation according to the <span id="SPELLING_ERROR_39"
class="blsp-spelling-error">XSLT</span> and save the result in our
memory stream
trans.Transform(<span id="SPELLING_ERROR_40"
class="blsp-spelling-error">xmlDoc</span>, Nothing, <span
id="SPELLING_ERROR_41" class="blsp-spelling-error">memStream</span>)
<span id="SPELLING_ERROR_42"
class="blsp-spelling-error">memStream</span>.Position = 0
Catch ex As Exception
Throw ex
End Try

Return <span id="SPELLING_ERROR_43"
class="blsp-spelling-error">memStream</span>
End Function


The final part is almost trivial:
`WebBrowser1.DocumentStream = TransformXML(m_message, My.Resources.IEXMLDefaultStyle)`

One last <span id="SPELLING_ERROR_47"
class="blsp-spelling-corrected">gotcha</span> though - don't set any of
the Document properties in the constructor of the form. Do it in the
Load-event handler or later.
