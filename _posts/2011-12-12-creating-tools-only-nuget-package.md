---
layout: post
title: Creating a Tools-Only NuGet Package
date: 2011-12-11T20:30:00.001Z
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
  - SpecFlow
modified_time: 2011-12-11T20:51:57.425Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-8208460981540200585
blogger_orig_url: https://www.marcusoft.net/2011/12/creating-tools-only-nuget-package.html
---

I have started to help out in a new OSS project. The last one was [SpecFlow](http://www.specflow.org) and now it’s [Pickles](https://github.com/x97mdr/pickles). Pickles is a tool that takes .feature-files from SpecFlow or Cucumber and turns it into a nice living documentation. It’s a great addition to SpecFlow.

Ok – one of the things I have been doing in the Pickles project is to create [NuGet](http://www.nuget.org) packages for the project different runners and especially lately the PowerShell runner. This will be the main way to interact with Pickles locally, which basically means that you’ll just write a command in the [Package Manager Console](http://docs.nuget.org/docs/reference/package-manager-console-powershell-reference) to generate the documentation frictionless. Later you will probably run it as part of your NAnt or MsBuild build files.

I learned a great deal about PowerShell and NuGet when I put that NuGet package together and since it was quite some time since I blogged I thought I’ll write down my experiences. This post is a about the NuGet package. The goal of my package is to NOT add any references to any projects. I just want it to drop some assemblies as tools and then use the [“Import-Module”](http://technet.microsoft.com/en-us/library/dd819454.aspx) PowerShell command to make the commandlet I’ve written available to the Package Manager Console.

### NuSpec

[NuSpec is a file format](http://docs.nuget.org/docs/reference/nuspec-reference) in which you specify how your package should be built. It’s actually not necessary in most cases since NuGet can package a Visual Studio project file straight off. But if you want more fine-grained control over how the package is created then you might want to create the NuSpec-file by hand.

The NuSpec-file is just plain XML and here is mine:

```xml
<?xml version="1.0"?>
<package xmlns="http://schemas.microsoft.com/packaging/2011/08/nuspec.xsd">
  <metadata>
    <id>Pickles</id>
    <version>$version$</version>
    <title>Pickles - Gherkin Documentation Generator</title>
    <authors>Marcus Hammarberg</authors>
    <owners>Jeffrey Cameron</owners>
    <projectUrl>https://github.com/x97mdr/pickles</projectUrl>
    <requireLicenseAcceptance>false</requireLicenseAcceptance>
    <description>Pickles is an ...</description>
    <summary>A documentation generator ...</summary>
    <copyright>Copyright © Jeffrey Cameron 2010-2011</copyright>
  </metadata>
  <files>
    <file src="bin\Release*.dll" target="tools" />
    <file src="init.ps1" target="tools\init.ps1" />
  </files>
</package>
```

Most of the elements speak for themselves. At line 5, you can see how you can send in a version number to the NuGet Pack command. Lines 15-18 specify the files to include and where to place them in the deployed package. Noteworthy is the absence of any dependencies specification. Also, note the inclusion of a PowerShell file called `init.ps1`.

### Init.ps1

This is a PowerShell file that runs (if included) when a NuGet package installs. It’s perfect for doing installation stuff. Here is how the file looks like for me:

```powershell
param($installPath, $toolsPath, $package)

Import-Module (Join-Path $toolsPath Pickles.PowerShell.dll)

Write-Host "#############################"
Write-Host "Pickles installed."
Write-Host "Command usage (switches in brackets are optional):"
Write-Host "Pickle-Features -FeatureDirectory -OutputDirectory [-Language] [-TestResultsFile] [-SystemUnderTestName] [-SystemUnderTestVersion]"
Write-Host "#############################"
```

On line 1, we have some parameters that NuGet sends to us. On line 3 is the important stuff; here I do the Import-Module of the PowerShell commandlet I’ve written. The rest is just informative output to guide users on command usage.

### NuGet.exe and the Pack command

NuGet also has a command with which you can [do a lot of stuff](http://docs.nuget.org/docs/reference/command-line-reference). Here I was interested in the Pack command. It turns a .nuspec or a Visual Studio project file into a .nupkg file that then can be deployed separately. Here is my command that operates on the .nuspec file I described above:

```cmd
nuget pack Pickles.nuspec -Version %1
```

Nothing strange here, I simply point to the .nuspec file and pass a parameter as the version. This allows me to use this command (.cmd file) from a DOS prompt to create new packages by simply setting the version number of the package. So for version 0.3, I got a file called “Pickles.0.3.nupkg”.

### Trying out your package locally

A really nice feature of NuGet is that you can very easily set up a local NuGet repository. I’ve [blogged about that before](https://www.marcusoft.net/2011/09/creating-local-nuget-repository-with.html) and it’s done in just a few minutes. So to try my package out I simply copied it into my local repository (just a folder on my computer) and then went “Install-Package Pickles” in the Package Manager Console in Visual Studio. I even got intellisense for the package name.

### Conclusion and lessons learned

I had some strange problems with the references to dependencies for my package for a while. But when I cleaned my files up in order to write a [StackOverflow](http://stackoverflow.com) question about it… the problems went away. Typical! I must have messed up. But I learned one very important thing when trying your packages out; Increment the version number for each new version! Or start a new project to import your package into. I suspect that the cleanup didn’t always work as expected. All in all, this is a very nice way to deploy a tool, I think. It has taken me quite some time to put together but 70% of that has been me going back and forth trying to figure out why it didn’t work. Most likely that had to do with me using the same version number all the time.

The Pickles NuGet packages will be available from NuGet.org soon. Very soon.
