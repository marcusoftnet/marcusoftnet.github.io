---
layout: post
title: Converting Class library project to MS Test project
date: 2008-09-02T12:52:00.005Z
author: Marcus Hammarberg
tags:
  - Life of a consultant
modified_time: 2010-12-14T15:20:33.249Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-6665008742715776220
blogger_orig_url: https://www.marcusoft.net/2008/09/converting-class-library-project-to.html
---

We have encountered a problem when renaming and restructuring Visual Studio projects. (There are numerous problems with that but here is one that really cause us to ponder for a while.) We create a standard Class Library project and moved some unit test files into it. Of course we should have create a test project instead but now we didn't - ok...

The problem was that the unit tests didn't show up in the test view. The solution was to add the following line into the project file (ripped from a working test project)

```xml
<projectTypeGUIDs>
  {3AC096D0-A1C2-E12C-1390-A8335801FDAB};{F184B08F-C81C-45F6-A57F-5ABD9991F28F}
</projectTypeGUIDs>
```

The GUID's are (probably) just my GUID but the important stuff is that you'll need to add the `projectTypeGUIDs` for your project in order to make it a test project.

**[UPDATED]**
Oh yeah - you'll need to unload the project file and edit it manually in a text editor. I wrote this in an hurry and missed that little tidbit of information. Sorry.
