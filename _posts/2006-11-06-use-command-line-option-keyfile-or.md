---
layout: post
title:
  Use command line option '/keyfile' or appropriate project settings instead of
  'AssemblyKeyFile'
date: 2006-11-06T07:16:00.000Z
author: Marcus Hammarberg
tags:
  - .NET
  - Visual Studio
modified_time: 2010-12-14T15:19:05.671Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-1603842338209902601
blogger_orig_url: https://www.marcusoft.net/2006/11/use-command-line-option-keyfile-or.html
---

Ran into an old "friend" compiler error...

This error - actual warning, but if you like I have "all errors as
warnings" this will stop you in your steps - will occur in Visual Studio
2005 when you point to a snk-file from the AssemblyInfo-file.

Since this was the way to refer to snk-files in VS2003 this will
probably happen to you on your first try. There are a lot of people that
has written how to solve this, for example
<http://davidkean.net/archive/2005/08/25/1162.aspx>

The solution is to point to the key-file from the properties of the
project. However this has to be done by editing the projectfile in a
text editor. The article above gives instructions on how to do that.

"

To do this, following these instructions:

1. Open the project file (.csproj for C# or .vbproj for VB) in a text
   editor
2. Look for the \<**AssemblyOriginatorKeyFile\>** attribute within the
   first element or add it as a child
3. In between the start and end \<**AssemblyOriginatorKeyFile\>**
   element enter the absolute or relative path to the key file name, ie
   \<**AssemblyOriginatorKeyFile\><span
   class="cb1">.\\..\\..\Build\StrongNameKeys\MyKey.snk\</AssemblyOriginatorKeyFile\>**
4. Save the file and reload the solution/project. You will now notice
   that Visual Studio happily uses the entered key file name and don't
   forget to remove the old AssemblyKeyFile attribute

"
