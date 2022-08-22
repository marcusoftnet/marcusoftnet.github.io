---
layout: post
title: Dos-script to delete all Visual Studio Intermediate files
date: 2009-09-04T09:52:00.001+02:00
author: Marcus Hammarberg
tags:
  - Tools
  - Life of a consultant
modified_time: 2010-12-14T16:22:38.191+01:00
blogger_id: tag:blogger.com,1999:blog-36533086.post-349034536879017212
blogger_orig_url: http://www.marcusoft.net/2009/09/dos-script-to-delete-all-visual-studio.html
---


I have a USB-stick which acts as my backup. As I program a lot
compilation and unit testing produces a lot of trash (.pdb, Test
Results, obj-files etc). I don’t want or need a backup of those.

Today <a
href="http://stackoverflow.com/questions/755382/i-want-to-delete-all-bin-and-obj-folders-to-force-all-projects-to-rebuild-everyth"
target="_blank">I found a short script</a> that removes those file.
Since I have folders named “bin” I want to keep I tweaked it a bit into
this:

>     FOR /F "tokens=*" %%G IN ('DIR /B /AD /S Debug') DO RMDIR /S /Q "%%G"
>
>     FOR /F "tokens=*" %%G IN ('DIR /B /AD /S _Resharper*') DO RMDIR /S /Q "%%G"
>
>
>     FOR /F "tokens=*" %%G IN ('DIR /B /AD /S TestResults') DO RMDIR /S /Q "%%G"
>
>
>     FOR /F "tokens=*" %%G IN ('dir /b /A /S *.vsmdi') DO RMDIR /S /Q "%%G"
>
>

I don’t know if you are like me and don’t know the first things of DOS.
Well this script deletes the following:

- All Debug-folders (both obj/Debug and bin/Debug)
- All folders that Resharper generates for you
- All TestResults folder (<a
    href="http://www.marcusoft.net/2009/02/save-some-space-limit-number-of-old.html"
    target="_blank">they can be massive!!</a>)
- All the crazy vsmdi-files that hold testlist for you
