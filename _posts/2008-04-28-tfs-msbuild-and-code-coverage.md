---
layout: post
title: TFS, MSBuild and Code Coverage
date: '2008-04-28T13:48:00.006+02:00'
author: Marcus Hammarberg
tags:
  - TFS

  - TDD
modified_time: '2010-12-14T16:20:33.290+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-2920252063191246961
blogger_orig_url: http://www.marcusoft.net/2008/04/tfs-msbuild-and-code-coverage.html ---
When you have a testing framework in place you of course want to test it
each build. But of course, you also want to know much code your tests
are covering, a.k.a. CodeCoverage.

It is in a way quite easy to accomplish in your build script. The only
catch is the complete lack of documentation. Benjamin Day [led the
way](http://blog.benday.com/archive/2007/02/09.aspx) (he he - it
rhymes).

What you need to do is two things:


1.  First configure the tests to run. This is easily done by adhering to
    good naming standards (all test assemblies ending with tests.dll).
    Then you can add create an item group called TestContainer, like
    below. This will run through all your tests.

       <ItemGroup>
           <TestContainer Include="$(OutDir)\%2aTests.dll" />
        </ItemGroup>

2.  Secondly (and here is the secret) you need to specify that the tests
    are to be run under code coverage.
   The easiest way to do this is to setup a .testrunconfig-file with
    Visual Studio. Such a file is always created for you
    (LocalTestRun.testrunconfig). If you double-click it and editor
    opens in which you can add code coverage. Do so and then save the
    file as another name, for example CodeCoverage.testrunconfig.
   Finally add a property in your build script (in a
    property-group-item) which is called
    RunConfigFile with the relative path to your
    CodeCoverage.testrunconfig. For example:

       <RunConfigFile>$(SolutionRoot)\CodeCoverage.testrunconfig</RunConfigFile>

So as I said - not very hard (about two lines of code) but also very
well hidden.
