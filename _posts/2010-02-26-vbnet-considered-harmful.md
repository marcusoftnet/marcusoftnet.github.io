---
layout: post
title: Vb.net considered harmful date: '2010-02-26T09:19:00.001+01:00'
author: Marcus Hammarberg
tags: -
VB.NET
  - .NET - C# modified_time: '2010-02-26T09:23:06.710+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-8741078323839573558
blogger_orig_url: http://www.marcusoft.net/2010/02/vbnet-considered-harmful.html ---

I have once again been forced into using VB.NET which I am
<a href="http://www.marcusoft.net/2007/03/vbnet-or-c.html"
target="_blank">not very fond of</a>.

My points up to now has been that the language in itself is not that
bad. But the support (refactoring etc.) in Visual Studio is much worse
than for C#. Also, there is a culture in the VB.NET community (as I
understand) to hide complex stuff from your user. So for example you
cannot see the references you have in your project until you hit “Show
all files”. Another example for the sub-par support you get when using
VB.NET.

My final point up to now is that the most common reason to chose VB.NET
over C# is that you have VB6-programmers that is to be converted into
VB.NET programmers. The problem is that VB.NET automatically (yeah, you
can and SHOULD turn it off) include the <a
href="http://msdn.microsoft.com/en-us/library/microsoft.visualbasic.aspx"
target="_blank">Microsoft.VisualBasic</a> in all new projects. Which
gives you the possibility to continue using Visual Basic syntax and
commands, such as CLen(“a string”) and completely miss the OO point in
.NET framework.

You could argue that all this is opinions by me. And maybe it is, but as
more advanced stuff was and is being introduced into in .NET Framework
(from 3.0 and forward) VB.NET is cracking down according to me.

Lamdas and anonymous methods for example is suffering heavily from
VB.NET demand on typing all parameters and the fact that you have to use
a “\_” as a line ending when formatting long lines.

Take a look at these two examples, from the
<a href="http://code.google.com/p/moq/" target="_blank">Moq</a> <a href="http://code.google.com/p/moq/wiki/QuickStart"
target="_blank">Quickstart</a>:

C#

VB.NET

<span class="small">I used the
<a href="http://www.developerfusion.com/tools/convert/csharp-to-vb/"
target="_blank">Developer Fusion C# to VB.NET conversion tool</a> to
translate the code as I cannot make it by hand in VB.NET. I fail every
time. I also used <a href="Pastie.org" target="_blank">pastie</a> to
shared the code. It doesn't support VB.NET syntax. Sorry for
that.</span>

What we now have is the language obstructing you and confusing you with
syntax. That makes the whole concept harder to understand – and it’s
quite hard to grasp from the outset for VB6-developers.

So from my point of view VB.NET makes your program harder to read and
understand, and you have lesser support in Visual Studio (don’t know
about <a href="http://monodevelop.com/" target="_blank">MonoDevelop</a>)
and finally it includes all of Visual Basic so you stand the risk that
your developers use non-standard syntax and commands.
