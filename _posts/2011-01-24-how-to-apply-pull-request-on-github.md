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
blogger_id: tag:blogger.com,1999:blog-36533086.post-492786643050013190
blogger_orig_url: http://www.marcusoft.net/2011/01/how-to-apply-pull-request-on-github.html
---

I am loving [GitHub](http://www.github.com/)!

Especially the social collaboration that occurs around projects and code. If you’ve never committed code to an OSS project, try it—it’s an exhilarating feeling. And just imagine the other side of the coin—to receive suggestions and [improvements from others](https://github.com/marcusoftnet/KanbanBoards/pull/1)! That’s the good news. The bad news (for me, at least) is that Git is something else. It’s great but takes some getting used to. I’m not there yet. For example, the preferred way seems to be the command line, which I haven’t quite mastered.

There are some GUIs available to help people like me overcome the abyss, with TortoiseGit being one of the most well-known tools. TortoiseGit was the tool that finally helped me understand, use, and love GitHub.

However, when I received a pull request, I hit a brick wall. The instructions at the bottom of the [pull request page on GitHub](https://github.com/marcusoftnet/KanbanBoards/pull/1) are excellent for pulling the request into your main branch, but translating that into what to do in TortoiseGit was challenging. GUI nomenclature isn’t always aligned with command line terms, leading to confusion.

Here is ONE way to apply a pull request using TortoiseGit. This method may not be perfect, but it works:

1. Go to the pull request on GitHub (for example, <https://github.com/marcusoftnet/KanbanBoards/pull/1>).
2. Add the extension `.patch` to the URL and download that file to your disk somewhere.
3. Right-click the folder with your Git local repository (for example, `C:\Dev\MyProject`) and select **Git Sync...** from TortoiseGit. This opens the sync window:

   ![TortoiseGit Sync Window](/img/tortoise%2520git%2520sync%2520window_thumb.jpg)

4. In the window, select **Apply patch**.
5. Choose **Add** from the next dialog and add the file you saved in step 2:

   ![Add Patch](/img/add%2520patch_thumb.jpg)

6. Choose **Apply**.
7. Now commit the patch to your master branch.
8. Optionally, push the change to a remote master.

I know that command line purists might frown upon this method, but it was a solution that worked for me. It took me about 2 hours to figure out, which is why I’m sharing it to save others from the same hassle.

Feel free to comment and ask questions!
