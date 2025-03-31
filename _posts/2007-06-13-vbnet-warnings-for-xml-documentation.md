---
layout: post
title: VB.NET - warnings for XML documentation, denied
date: 2007-06-13T05:47:00.000Z
author: Marcus Hammarberg
tags:
  - VB.NET
  - Visual Studio
modified_time: 2010-12-14T15:19:05.575Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-8743873172538316941
blogger_orig_url: http://www.marcusoft.net/2007/06/vbnet-warnings-for-xml-documentation.html
---

When you generate system documentation from the XML comments in your
code you want a way to be sure that the quality of the comments are as
good as they can be, and in the earliest stage possible.

One way to accomplish this would have the compiler to issue an warning
for all missing, faulty or un-matched
comments it finds during compilation. In Visual Studio 2005 and C# this
is very easy by setting the warning level to 4, treat all warning as
errors and generating XML documentation.

VB.NET however... is another story all together, and again I understand
that this is a choice. It's like a philosophy of the language;
VB.NET stands for simplicity and getting help from the environment where
C# stands for control and managing the nitty-gritty details. However AI or
help from the environment in my opinion very often leads to
situations where you want to get around the "help" but is unable because
OF the "help".

So for VB.NET the only warnings you can get are:

- Implicit Conversion - 41999, 42016
- Late binding call could fail at run time -
  42017,42018,42019,42032,42036
- Implicit type; call could fail at run time - 42020,42021,42022
- Use of variable prior to assignment - 42030,42104,42108,42109
  - Function/Operator without return value - 42105,42106,42107
- Unused local variable - 42024
- Instance variable accesses shared member - 42025
- Recursive operator or property access - 41998,42004,42026
- Duplicate or overlapping catch blocks - 42029,42031

None of these talk about missing/faulty documentation. It doesn't
help to generate XML documentation and treat all
warnings as error (as the settings in the project properties are
called). Missing documentation will still run through the compiler like
open water...

So we're stuck. And will remain stuck! When I learned this, from a
Microsoft contact, I also learned that this is not subject to changes in
the future.

I've spent some hours looking for a solution to the problem but this is
roads end, as I see it. VB.NET can't help you out. Another way of doing
it would be to convert the code to C# and run the compiler against that
code to see if any comments are missing. But how to automate that? Is
that at all "nice"? What about compile times?

I am a bit disappointed on VB.NET right
now... but I'll try to get over it.
