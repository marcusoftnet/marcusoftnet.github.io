---
layout: post
title: My Mouse Pointer Disappeared in Visual Studio When Using a Dark Theme
date: 2011-08-30T12:55:00.001Z
author: Marcus Hammarberg
tags:
  - Tools
  - Life of a consultant
  - Visual Studio
modified_time: 2011-08-30T12:55:43.187Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-8495699296690358537
blogger_orig_url: http://www.marcusoft.net/2011/08/my-mouse-pointer-disappeared-in-visual.html
---

I recently started using a dark theme for Visual Studio. For those who haven’t checked out [Studio Styles](http://studiostyl.es/), it’s a fantastic site for finding great themes. I'm currently using the [Son of Obsidian](http://studiostyl.es/schemes/son-of-obsidian) theme, but I also recommend checking out the [Coding Instinct Theme](http://studiostyl.es/schemes/coding-instinct-theme) created by my colleague [Torkel](http://www.codinginstinct.com).

However, I ran into an issue where the mouse pointer became almost invisible when editing text in the code editor with the dark theme. The pointer turned a dark gray, blending into the dark background, which was extremely frustrating.

After some digging, I found a solution in an old [discussion](http://weblogs.asp.net/infinitiesloop/archive/2006/08/06/Join-the-Dark-Side-of-Visual-Studio.aspx). The fix involves changing the mouse pointer scheme in the Windows Control Panel. Here’s how you can do it:

1. **Open Control Panel**
2. **Navigate to Appearance and Personalization**
3. **Go to Personalization**
4. **Click on Change Mouse Pointers**

This will open the Mouse Properties window:

![Mouse Color Scheme](/img/mouse%25252520color%25252520scheme_thumb%2525255B2%2525255D.jpg)

5. **Select the Scheme called "Windows Black"**

This will change the mouse pointer to a brighter color that stands out against the dark backgrounds, making it visible again in Visual Studio.

With this change, I can now see the mouse pointer clearly and continue working comfortably. I hope this tip helps anyone else who encounters the same issue!
