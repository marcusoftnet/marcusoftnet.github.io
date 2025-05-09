---
layout: post
title: TeamSystem, MSBuild and ClickOnce
date: 2007-06-04T06:02:00.000Z
author: Marcus Hammarberg
tags:
  - TFS
  - MSBuild
modified_time: 2011-10-03T10:32:50.080Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-2160098077060148442
blogger_orig_url: https://www.marcusoft.net/2007/06/teamsystem-msbuild-and-clickonce.html
---

I've finally got around to work a bit more with our build script, which we are running on top of Team System. I've once coded a build script based on other products (CruiseControl.net, NUnit etc.) so i hoped and thought that this wouldn't differ to much. However sometimes your hopes gets fulfilled and sometimes... well, you'll see.

Firstly building build scripts for Team Systems are more like responding to events that gets fired by the Team System build engine, than writing the flow yourself. Which events get fired and which order they fire in can be found [here](https://www.marcusoft.net/2007/05/teamsystem-builds.html).

Also - the start of building build scripts with Team System is a wizard, which is nice but all that it's really doing is generating the stub for the MSBuild-script-file for you. If you want to tweak it (and you want) you'll have to code in the "scary" MSBuild/XML-language.

And finally the Team System doesn't come with loads of new functionality for MSBuild. So I still cast my vote on the MSBuild Community Task for anything slightly out of the box. They can be found and downloaded [here](http://msbuildtasks.tigris.org/). I also got confirmed from Microsoft that ClickOnce-handling and versioning is not supported with the tasks included in Team System. Microsoft recommended me to use the MSBuild Community Tasks.

So - now to my build script. What we wanted to do was fairly simple (we thought); we just wanted to build the application and then perform a ClickOnce-publish to a certain location, in such a way that the latest version of the application automatically would be downloaded for any user accessing it.

This is how I did it:

First I created an `itemGroup` (called ClickOnceProjects) with parameters for the ClickOnce-deployment. This item group could be repeated for all projects that is to be published with ClickOnce.

```xml
<ItemGroup>
  <ClickOnceProjects Include="$(SolutionRoot)\$(ProjectNamespace).UI.Win\$(ProjectNamespace).UI.Win.vbproj">
    <ProjectPublishProperties>InstallUrl=\\[servername]\Install\</ProjectPublishProperties>
    <PublishDirectoryName>$(ProjectNamespace).UI.Win.publish</PublishDirectoryName>
    <DeploymentFolderClient>$(ClickOnceDropLocation)</DeploymentFolderClient>
    <ExecutableName>App.exe</ExecutableName>
    <DeploymentThumbPrint>$(SolutionRoot)\$(ProjectNamespace).UI.Win\$(ProjectNamespace).UI.Win_TemporaryKey.pfx</DeploymentThumbPrint>
    <DeploymentPublishProperties> Configuration=Release;ProductName=App;PublisherName=Us; GenerateManifests=true;WebPage=default.htm</DeploymentPublishProperties>
  </ClickOnceProjects>
</ItemGroup>
```

On the `**AfterGet**`-target (which gets called by the TeamSystem-build-engine when the sourcefiles are retrieved from SourceControl) I do the following:

1. Check out `Version.txt` which is a file with the version number
2. Check out `Solution.vb`. This is a AssemblyInfo-file that is shared (linked-in) in all the projects of our solution. In this way we can get the same version number for all our assemblies.
3. Update the version number by incrementing the revision number with one. For this we used the \<Version\>-task from MSBuild Community Task like:

    ```xml
    <Version VersionFile="$(SolutionRoot)\SolutionItems\Version.txt" RevisionType="Increment">
      <Output TaskParameter="Major" PropertyName="Major" />
      <Output TaskParameter="Minor" PropertyName="Minor" />
      <Output TaskParameter="Build" PropertyName="Build" />
      <Output TaskParameter="Revision" PropertyName="Revision" />
    </Version>
    <Message Text="New version: $(Major).$(Minor).$(Build).$(Revision)"/>
    ```

4. Then the SolutionInfo.vb gets deleted and recreated with the new version number by using the AssemblyInfo-task like:

   ```xml
   <DeleteCondition="Exists('$(SolutionRoot)\SolutionItems\SolutionInfo.vb')" Files="$(SolutionRoot)\SolutionItems\SolutionInfo.vb" />
   <!-- Recreate SolutionInfo.vb -->
   <Message Text="SYSTEM_NAME: Recreating Solution.vb"/>
   <AssemblyInfo
      CodeLanguage="VB"
      OutputFile="$(SolutionRoot)\SolutionItems\SolutionInfo.vb"
      ComVisible="false"
      CLSCompliant="false"
      AssemblyConfiguration="Release"
      AssemblyCompany="CompanyName"
      AssemblyProduct="SystemName"
      AssemblyCopyright="Copyright © Company 2007"
      AssemblyVersion="$(Major).$(Minor).$(Build).$(Revision)"
   />
   ```

Now the Team System build engine will go about and do it's stuff compiling etc. But then on the **AfterDropBuild-**target (when the executables is dropped to the build location) I publish the ClickOnce-applications (specified in the item group above) as follows:

1. Clean the content of the publish-location so that only the latest version of the build is available: `<RemoveDir Directories="$(ClickOnceDropLocation)" /><MakeDir Directories="$(ClickOnceDropLocation)" />`
1. Then do a MSBuild-publish. This creates variables/output that contains the files for the ClickOnce-deployment. All important for this task to execute successfully is that you control the version number (which we do as shown above). The task is executed as follows:

  ```c#
  <MSBuild
    Targets="Publish"
    Projects="@(ClickOnceProjects)"
    Properties="%(ClickOnceProjects.ProjectPublishProperties);%(ClickOnceProjects.DeploymentPublishProperties); PublishUrl=%(ClickOnceProjects.DeploymentFolderClient); MinimumRequiredVersion=$(Major).$(Minor).$(Build).$(Revision); ApplicationVersion=$(Major).$(Minor).$(Build).$(Revision)">

    <Output TaskParameter="TargetOutputs" ItemName="PublishTargetOutputs"/>
  </MSBuild>
  ```

1. The output of this target is then moved to the publish-location like so:

   ```c#
   <CreateItem Include="@(ClickOnceProjects->'%(RelativeDir)bin\Release\SystemName.publish***.*')">
      <Output TaskParameter="Include" ItemName="FilesToPublish"/>
   </CreateItem>
   <!--Copy the publication-files to the server-->
   <Copy
    SourceFiles="@(FilesToPublish)"
    DestinationFiles="@(FilesToPublish->'%(DeploymentFolderClient)\%(RecursiveDir)%(Filename)%(Extension)')"
    SkipUnchangedFiles="false"
   />
   ```

Then of course we check-in the Version.txt and the SolutionInfo.vb on a successful build (as the last part of the **AfterDropBuild**-target) and do undo check-out on it on a failure (the **BeforeOnBuildBreak-**target)

This is how we got the Gods of ClickOnce, MSBuild and Team System to work together in wonderful harmony. I am sure that this is only one of many ways you can do this, but this is one way and it works.

I realize that this can be hard to read and understand so please don't hesitate to contact me for the build-script-file or more information.
