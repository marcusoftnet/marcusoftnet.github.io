---
layout: post
title: Including namespaces in new VB.NET classes
date: 2007-04-20T13:31:00.000Z
author: Marcus Hammarberg
tags:
  - VB.NET
  - Visual Studio
modified_time: 2010-12-14T15:19:05.627Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-7517380477412776424
blogger_orig_url: https://www.marcusoft.net/2007/04/including-namespaces-in-new-vbnet.html
---

(UPDATE 2007-04-26 after reading this see
<http://marcushammarberg.blogspot.com/2007/04/chose-your-battles.html>)

When converting myself from C# to VB.NET I found one thing that annoyed
me very much; when you create a new class in VB.NET the namespace is not
included in the file.

After a long and hard search I found out that there is a bit of a
cultural difference here that comes into play. On the project-file for
VB.NET project you'll find a setting called Root Namespace. The text you
write here gets pre-pended to all classes a compile-time. So if you
project has a namespace called Marcusoft.Business and you create a class
called Product, the complete namespace for the class is
Marcusoft.Business.Product.

Note that the Root Namespace gets pre-pended even if you state a
namespace in the class. With Root Namespace to Marcusoft.Business and
Namespace Entities above the class declaration the complete namespace
for the class would be Marcusoft.Business.Entities.Product.

Appearently this is ok with VB.NET developers. So far how VB.NET
works...

The sad part is that Visual Studio 2005 doesn't include the namespace in
classes that you create. But after an even harder and longer search i
found out about the [Export
Template-functionality](http://msdn.microsoft.com/msdnmag/issues/06/01/CodeTemplates/default.aspx).
Find my short version below

1. Remove the Root Namespace from all your project. Now and forever!
2. Create a new shiny class in your project
3. Include the right namespace declarations and other things that you
   want in all your, for example comments, regions etc.
4. Save the file
5. Choose File-\>Export Template
6. Go Item template and go through the rest of the wizard
7. Distribute the created zip-file in your project. Your project
   members need to put it in their Document and Settings\Visual Studio
   2005\My Exported Templates-folder and restart the studio
8. Viola!

This solves some of the namespace problem but the
folder-problem (i.e. if you create a folder in your project and put the
class in there) is not solved... yet.
