---
layout: post
title: How to apply a pull request on GitHub with TortoiseGit
date: 2011-01-24T08:53:00.001Z
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
  - Life of a consultant
modified_time: 2013-08-22T09:58:35.339Z
thumbnail: http://lh6.ggpht.com/\_TI0jeIedRFk/TT098Mo8gnI/AAAAAAAAAws/4E9E1y1stNo/s72-c/tortoise%20git%20sync%20window_thumb.jpg?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-492786643050013190
blogger_orig_url: http://www.marcusoft.net/2011/01/how-to-apply-pull-request-on-github.html
---




I am loving <a href="http://www.github.com/" target="_blank">GitHub</a>!
Especially the social collaboration that occur around the projects and
code. If you never committed code to a OSS project try it – it’s a
exhilarating feeling. And just imaging the other side of the coin – to
get suggestions and
<a href="https://github.com/marcusoftnet/KanbanBoards/pull/1"
target="_blank">improvements from other people sent to you</a>!
That’s the good news – the bad news (for me at least) is the Git is
something else. It’s great but it takes some getting used to. I’m not
there yet. For example the preferred way seems to be command line, and I
haven’t got used to that yet.
There are some GUIs available that help people like me to overcome the
abyss, the most well known is
<a href="http://code.google.com/p/tortoisegit/"
target="_blank">TortoiseGit</a>. That was the tool finally got me to
understand, use and love GitHub.
But when I got a pull request sent to me I hit a
brick wall. At the bottom of the page for the
<a href="https://github.com/marcusoftnet/KanbanBoards/pull/1"
target="_blank">a pull request in GitHub</a> there are some excellent
instructions for how to pull the request into your main branch. But I
couldn’t translate that into what to do in TortoiseGit. And that’s one
of the problems of a GUI on top of another system – the nomenclature is
not always the same and you will run into problems.
So here is ONE way to do it. I’m sure there is another better way but
this works.

1. Go to the pull request on GitHub (for example
    <https://github.com/marcusoftnet/KanbanBoards/pull/1>)
2. Add the extension “.patch” to the URL and download that file to your
    disk somewhere
3. Right-click the folder with your Git local repository (for example
    C:\Dev\MyProject) and select Git Sync... from TortoiseGit – which
    opens this window
    [<img
    src="http://lh6.ggpht.com/_TI0jeIedRFk/TT098Mo8gnI/AAAAAAAAAws/4E9E1y1stNo/tortoise%20git%20sync%20window_thumb.jpg?imgmax=800"
    title="tortoise git sync window" data-border="0"
    style="background-image: none; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; display: block; float: none; margin: 0px auto; padding-left: 0px; padding-right: 0px; padding-top: 0px;"
    width="420" height="341" alt="tortoise git sync window" />](http://lh3.ggpht.com/_TI0jeIedRFk/TT097jOf20I/AAAAAAAAAwo/tkMXMiPEwlw/s1600-h/tortoise%20git%20sync%20window%5B2%5D.jpg)
4. From the window select Apply patch
5. Choose Add from the next dialog and add the file you save in step 2
    above
    [<img
    src="http://lh4.ggpht.com/_TI0jeIedRFk/TT099PUuHxI/AAAAAAAAAw0/NLmF9zem8ME/add%20patch_thumb.jpg?imgmax=800"
    title="add patch" data-border="0"
    style="background-image: none; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; display: block; float: none; margin: 0px auto; padding-left: 0px; padding-right: 0px; padding-top: 0px;"
    width="420" height="343" alt="add patch" />](http://lh3.ggpht.com/_TI0jeIedRFk/TT098m3jSWI/AAAAAAAAAww/Jfw0T4QqEhA/s1600-h/add%20patch%5B2%5D.jpg)
6. Choose Apply
7. Now commit the patch to your master
8. Optionally push that change to a remote master

I know that I probably will be frowned upon by command liners out there
but this is a way I got around a serious problem.
It took me about 2 hours to find and apply this solution which is enough
time for not want to have to do it again.
