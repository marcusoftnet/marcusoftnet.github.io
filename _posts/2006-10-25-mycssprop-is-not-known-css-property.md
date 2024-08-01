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

![CSS Error](/img/csserror.1.jpg)

My good friend Fredrik "Fran" Anfelter found the solution to a very irritating problem.

If Visual Studio 2005 is set to "Treat all warnings as error" with warning level 4 (which both are good practices), you will get a LOT of errors for any CSS properties that are defined by you. This happens because no XML schema exists to validate those properties for the .css file.

However, there is a setting in Visual Studio 2005 that will help you get rid of those errors. Under Tools → Options → Text Editor → CSS → CSS Specific, you can find the dialog to the right.

Simply uncheck the "Detect unknown properties," and the errors will be a memory from the past.

The "formally correct" solution would have been to include an XML schema that validates the properties used in the css-file. Two problems, though:

- How do you point the XML schema to the CSS stylesheet?
- Who has the time to keep that schema up to date just to get rid of the errors?
