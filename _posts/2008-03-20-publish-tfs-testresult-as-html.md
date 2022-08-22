---
layout: post
title: Publish TFS testresult as HTML
date: 2008-03-20T12:33:00.005Z
author: Marcus Hammarberg
tags:
  - Tools - TFS - MSBuild
modified_time: 2010-12-14T15:22:38.281Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-3773215006802964327
blogger_orig_url: http://www.marcusoft.net/2008/03/publish-tfs-testresult-as-html.html
---

OK - this is one of thoose "now where has that file moved"-posting.

When you run tests in a TFS build with MSTest a .trx-file is created.
This file contains all the testresults for that run. However you can't
view it unless you have Visual Studio...

(Appearently you could publish the result to the Team Foundation Server
and then do a report but this is much simpler...)

Here is a tool, [trx2html](http://www.codeplex.com/trx2html), that
converts that .trx-file into a nice HTML-report. And that report could
then easily be published on the Team Portal.

And here are, based on [this
article](http://blogs.msdn.com/buckh/archive/2007/05/30/viewing-test-results-in-a-web-browser.aspx),
some steps on how to include the functionality in your build script:

1.  Download [the
    tool](http://www.codeplex.com/trx2html/Release/ProjectReleases.aspx?ReleaseId=10672)
2.  Include the RidoTask.dll in your solution or reachable on the server
    where the tests are run. I've included the dll in a solution folder
    in my solution, called SolutionItems\Tools
3.  Reference the msbuild task in your build file (.proj)
    \<usingtask
    assemblyfile="$(SolutionRoot)\SolutionItems\Tools\RidoTasks.dll"
    taskname="RidoTasks.trx2html"\>
4.  Convert the trx into html after TFS has dropped the results
    \<target name="AfterDropBuild"\>
    \<calltarget targets="CreateTRXReports"\>
    \</target\>

   \<target name="CreateTRXReports"\>
    \<createitem
    include="$(DropLocation)\\$(BuildNumber)\TestResults\\*.trx"\>
    \<output itemname="trxfiles" taskparameter="Include"\>
    \</createitem\>
    \<ridotasks.trx2html filename="%(trxfiles.Identity)"\>
    \</target\>
5.  Inform your project where to find your latest reports, which is the
    same directory as the testresult itself
   \<Exec Command="xcopy
    "$(DropLocation)\\$(BuildNumber)\TestResults\\*.htm"
    "$(TestResultReportPath)" /Q /H /R /Y" /\>

That's an easy way to keep everyone informed
