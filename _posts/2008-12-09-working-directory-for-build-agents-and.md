---
layout: post
title: Working directory for Build Agents and building
different branches
date: '2008-12-09T14:13:00.001+01:00'
author: Marcus Hammarberg
tags:
  - TFS - MSBuild
modified_time: '2008-12-09T14:13:58.165+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-8089000883201304042
blogger_orig_url: http://www.marcusoft.net/2008/12/working-directory-for-build-agents-and.html
---


We have been chasing a strange problem for a few days now. The scenario
is as follows;

We created a new TFS build server, that is - we set up the build service
on a new server. In our TFS Source control we had two branches with a
build definition for each. Finally we set up a Build Agent for the new
server via Visual Studio Team System.

But the builds failed! With error message "The path \[path\] is already
mapped in workspace \[workspace\]"

We didn't get why until we checked a property on the build agent;
Working Directory. This can be set by right-clicking on the
Builds-folder in Team Explorer, choosing the agent and the Edit.

On the Build Agent Properties page there is a WorkingDirectory-textbox.
This dictates where the agent should build. However - what not is shown
is that you can use a variable in the path: $(BuildDefinitionPath).

Since our build script uses relative paths it was very important that
the path looked the same in-different of the build definition. That is
we wanted a separate build folder for each build. The
$(BuildDefinitionPath) at the end of the WorkingDirectory-property of
the build agent solved it!
