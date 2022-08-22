---
layout: post
title: How to get rid of multiple .vsmdi-files
date: 2008-03-26T07:28:00.005Z
author: Marcus Hammarberg
tags:
  - TFS
  - TDD
modified_time: 2008-03-26T07:45:34.311Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-7174602734773481204
blogger_orig_url: http://www.marcusoft.net/2008/03/how-to-get-rid-of-multiple-vsmdi-files.html
---

Here is a thing that have created a lot of confusion and frustration
in our projects; when you have a Microsoft Test project under source
control the .vsmdi-files gets created multiple times. In one project we
have 48 of them. All under source control.

I have even been in contact with Microsoft but they only showed me a
workaround that didn't did the complete trick.

Here is a guy that seem to [have solved
it](http://kjellsj.blogspot.com/2006/04/vsmdi-file-weak-spot-of-vsts-test.html).
Looks very promising. What you need to do is:

- Delete all the vsmdi-files from Source Control
- Make sure that all the developers and testers deletes all the
    vsmdi-files locally as well
- Create one .vsmdi-file, by running the test locally at one
    workstation. Check that file into Source Control
- Follow the steps in [this
    article](http://blogs.vertigosoftware.com/teamsystem/archive/2006/06/23/Beware_the_Team_Test_VSMDI_file.aspx)
    to make the .vsmdi-files become non-mergable for the Team Foundation
    Server project.
    **\[UPDATE\]**
    To be able to do this you'll need the permission
    "AdminConfiguration" which apparently is a separate permission.

Quite easy - when you now how to avoid it.
