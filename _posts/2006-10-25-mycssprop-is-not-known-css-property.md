---
layout: post
title: myCssProp is not a known CSS property name
date: 2006-10-25T12:06:00.000Z
author: Marcus Hammarberg
tags:
  - .NET
  - Visual Studio
modified_time: 2010-12-14T15:19:05.676Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-8811774914758431524
blogger_orig_url: http://www.marcusoft.net/2006/10/mycssprop-is-not-known-css-property.html
---


[<img
src="http://photos1.blogger.com/blogger2/4958/4459/320/csserror.0.jpg"
style="FLOAT: right; MARGIN: 0px 0px 10px 10px; CURSOR: hand"
data-border="0" />](http://photos1.blogger.com/blogger2/4958/4459/1600/csserror.1.jpg)
My good friend Fredrik "Fran" Anfelter found the solution of a very
irritating problem.

If Visual Studio 2005 is set to Treat all warnings as error, with
warning level 4 (which both are good practices) you will get a LOT of
error for any CSS-properties that is defined by you. This has to do with
that no XML-schema exists to validate those properties for the
.css-file.

However there is a setting in Visual Studio 2005 that will help you to
get rid of those errors. Under Tools-\>Options-\>Text Editor-\>CSS-\>CSS
Specific the dialog to the right can be found.

Simply uncheck the "Detect unknown properties" and the errors a but a
memory from the past.

The "formally correct" solution would have been to include a XML-schema
that validates the properties used in the css-file. Two problems though:

- How do you point the xml-schema to the css-stylesheet?
- Who has the time to keep that schema up to date just to get rid of
    the errors?
