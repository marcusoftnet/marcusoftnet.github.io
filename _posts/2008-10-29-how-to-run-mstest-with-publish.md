---
layout: post
title: How to run MSTest with publish parameter as
MSBuild Exec-task
date: 2008-10-29T08:56:00.004+01:00
author: Marcus Hammarberg
tags:
  - TFS - MSBuild
  - TDD
modified_time: 2008-10-30T11:03:07.512+01:00
blogger_id: tag:blogger.com,1999:blog-36533086.post-1620713112862171086
blogger_orig_url: http://www.marcusoft.net/2008/10/how-to-run-mstest-with-publish.html ---

<span style="font-weight: bold;">\[UPDATED, see
[this](http://www.marcusoft.net/2008/10/right-way-of-calling-mstest-in-tfs.html)\]

I have created a task that runs some unit tests in a certain DLL and the
publish the result to a TFS service. We use this task in our TFS MSBuild
script in order to execute some integration tests in the last step of
the build process. In order to get some value from the integration tests
the solution needs to be deployed, for example.

The most tricky parts of figuring this out was:

-   The path to MSTest.exe - as it turns out there are a environment
    variable to the root of the Visual Studio Tools - %VS90COMNTOOLS%.
    And via that we can reach MSTest.exe with
    %VS90COMNTOOLS%\\..\IDE\MSTest.exe
-   To publish a build you need the buildId to send to the
    publishbuild-parameter of MSTest. It can easily be obtained from the
    TFSBuild parameter $(BuildNumber)

So here you are - my task to run tests and publish the results:

> \<!-- Run integrationtests --\>
> \<Target Name="RunIntegrationTests" Condition="'$(DeployPT)' ==
> 'true'"\>
> \<!-- Write nice message to log and in the build progress --\>
> \<BuildStep TeamFoundationServerUrl="$(TeamFoundationServerUrl)"
> BuildUri="$(BuildUri)"
> Name="Integrationstester"
> Message="$(PROMPT) Kör integrationstester mot den publicerade PT"
> Status="Succeeded" /\>
> \<Message Text="$(PROMPT) Kör integrationstester mot den publicerade
> PT" /\>
>
> \<!-- Vi kör testerna med ett dos-kommando mot MSTest eftersom vi
> vill köra det här i processen och inte i det normala test-flödet
> för TFSBuild.
> --\>
>
>
> \<Exec Command="&quot;%VS90COMNTOOLS%\\..\IDE\MSTest.exe&quot;
> /testcontainer:$(BinariesRoot)\Debug\Test.Integration.dll
> /publish:server.url /publishbuild:$(BuildNumber) /flavor:debug
> /platform:AnyCPU /teamproject:MyProject" ContinueOnError="false" /\>
>
> \</Target\>
