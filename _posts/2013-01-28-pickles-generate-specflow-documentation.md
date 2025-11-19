---
layout: post
title: "Pickles - Generate SpecFlow Documentation from MSBuild and PowerShell"
date: 2013-01-28T12:54:00.000Z
author: Marcus Hammarberg
tags:
  - BDD
  - Tools
  - Specification by example
  - SpecFlow
modified_time: 2013-07-30T18:15:45.084Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5238097084946695251
blogger_orig_url: https://www.marcusoft.net/2013/01/pickles-generate-specflow-documentation.html
---

If you're doing [specification by example](http://specificationbyexample.com/) or [BDD](http://en.wikipedia.org/wiki/Behavior-driven_development), you will soon realize that the tooling still points towards developers. With that, I mean that [Cucumber](http://cukes.info/) and [SpecFlow](http://www.specflow.org/) allow you to write your executable specifications in plain text, but you still check it into the source repository. This is, of course, a good thing since you'd want to version the specification with your code - but it also effectively hides it and keeps the spec out of reach for any non-developing member of the team.

Make no mistake here: the .feature-file is the master and original. That's how it should be since it's versioned together with the code. But we want everyone on the team to be able to read the specifications and see the test result easily. So we generate documentation off the .feature-files.

[Pickles](https://github.com/picklesdoc/pickles) is a nice OSS framework that helps you solve this problem by generating documentation in a variety of formats from your specifications. This can be done in build scripts to keep the site up to date.

In this blog post, I'll show you two easy ways to include the generation of an HTML site from your features with [Pickles](https://github.com/picklesdoc/pickles): via PowerShell and via MSBuild. Let's start with the latter since I know that one best.

## Pickles and How to Get It

Pickles describes itself as: "Pickles is an open-source living documentation generator that works on feature files written in the Gherkin language, popularized in tools like Cucumber and SpecFlow." It's run by [Jeffrey Cameron](https://github.com/x97mdr) and has a thriving community. I've done some small commits but love the tool and "sell" it to almost every client doing specification by example.

There are other tools like this such as [Relish](https://www.relishapp.com/) and [SpecLog](http://www.speclog.org/). But they both have a cost associated with them. In the Relish case, you can get it for free but then you have to publish your specs on their site, something that most companies don't want. SpecLog is a great tool but not a perfect fit for just documentation. It's more for collaboration around the early phases of Specification by Example.

[Pickles supports 4 formats](https://github.com/picklesdoc/pickles/wiki/ArgumentsDocumentationFormat) (HTML, Word, DITA, and JSON) with HTML being the most common one and also the default value for the runners. I should tell you that a new version of the HTML site is on the way. The one that's generated now is static and doesn't allow search and stuff. The JSON format (one of my small contributions) was thought of as being the foundation for a JavaScript-based site. The new HTML site looks a lot like what we dreamt of then. It will be great!

The simplest way to get hold of Pickles is from [NuGet](http://nuget.org/packages/pickles). This will download all the runners (MSBuild, PowerShell, NAnt, and Console) and, in fact, allow you to run Pickles directly from the NuGet console (package manager I think it's called).

This can be a good start but pretty soon you'll need to start using this in a build script. To be able to demo that easily I've created a little bundle with all the [Pickles files in one zip](https://dl.dropbox.com/u/2408484/picklesLab.zip).

The folder structure is like this:

- pickles - Pickles stuff that I've downloaded via NuGet
  - MsBuild - just the stuff you'll need to call Pickles from MSBuild
  - PowerShell - just the stuff you'll need to call Pickles from PowerShell
- Specs - a big structure with a lot of .feature files that you can use as a demo. Deep in the belows of that structure (/Specs/bin/debug/TestResult.xml) you'll find a test result file that is important if you want to display the test result.

### MSBuild

Enough talk already: let's get down to business and create a little MSBuild file that you can incorporate (or call) from your build script.

The example build script shows it all really:

```xml
<Project xmlns="http://schemas.microsoft.com/developer/msbuild/2003" ToolsVersion="4.0">

  <UsingTask AssemblyFile=".\pickles\PicklesDoc.Pickles.MSBuild.Tasks.dll" TaskName="Pickles" />

  <PropertyGroup>
    <FeatureDirectory>.\Specs\Features</FeatureDirectory>
    <OutputDirectory>.\Docs\Features</OutputDirectory>
    <DocumentationFormat>Html</DocumentationFormat>
    <OutputName>Features</OutputName>
    <SystemUnderTestName>MyProject</SystemUnderTestName>
    <SystemUnderTestVersion>1.0.0.0</SystemUnderTestVersion>
    <TestResultsFile>.\Specs\bin\Debug\TestResult.xml</TestResultsFile>
  </PropertyGroup>

  <Target Name="GenerateDocumentation">
    <MakeDir Directories="$(OutputDirectory)" />
    <Pickles FeatureDirectory="$(FeatureDirectory)"
             OutputDirectory="$(OutputDirectory)"
             DocumentationFormat="$(DocumentationFormat)"
             OutputName="$(OutputName)"
             SystemUnderTestName="$(SystemUnderTestName)"
             SystemUnderTestVersion="$(SystemUnderTestVersion)"
             TestResultsFile="$(TestResultsFile)" />
  </Target>

</Project>
```

Let's go through it line by (interesting) line:

- On line 5, you import the `PicklesDoc.Pickles.MSBuild.Tasks.dll` that contains the Pickles task. This is where you get the ability to access the Pickles functionality. You need to have that DLL and all of its dependencies (found in the Pickles/msbuild-folder in my download) accessible from your build script.
- We then set up a PropertyGroup (lines 7-16) for all the currently supported variables. Doing this allows you to override these values if you were to call this file from another file. You can, of course, write this directly in the Pickles task if you want to.
- Line 18 sets up our target (in MSBuild lingo a target contains several tasks. Think of it like a method calling out to other methods).
- On line 19, we create a new directory with [MakeDir](http://msdn.microsoft.com/en-us/library/s2448zz7.aspx).
- Lines 20-26 call Pickles with all the supported parameters. It's pretty self-explanatory. The only ones that are required are FeatureDirectory and OutputDirectory. The others default to:
  - Format: Html
  - ResultsFormat: NUnit

You can try this out by opening a Visual Studio Command Prompt and go:

```powershell
msbuild PicklesMsBuild.proj
```

The most common problems you'll run into is that Pickles and its dependencies cannot be found. Make sure you point the using-statement (line 5) to the place where all the dll's are. I've used relative paths from the root of my [sample](https://dl.dropbox.com/u/2408484/picklesLab.zip).

### PowerShell

I'm by no means a PowerShell master. Ok - I'm a total noob. There I've said it. But I got plenty of help from the guys at Tradera (thanks Torkel and Frank).

A lot of build scripts are executed using PowerShell scripts and you can call Pickles from PowerShell as well. This is, strangely enough, my second contribution. I've created a little commandlet called "Pickle-Features". Come on - that was fun. Please?

To call into Pickles you can do the following:

```powershell
## Import module
Import-Module .\pickles\Pickle-Features.psm1

## Run Pickles
Pickle-Features -FeatureDirectory ".\Specs\Features" -OutputDirectory ".\Docs\Features" -DocumentationFormat "Html" -OutputName "Features" -SystemUnderTestName "MyProject" -SystemUnderTestVersion "1.0.0.0" -TestResultsFile ".\Specs\bin\Debug\TestResult.xml"
```

Let's go through that one line by line too. You'll recognize the parameter names, etc.:

- Lines 2-9 are setting up the variables for our script. Change this to match your situation.
- Line 12 imports the module (DLL with the [commandlet](http://msdn.microsoft.com/en-us/library/windows/desktop/dd878294(v=vs.85).aspx)). This is needed in order to call into the commandlet.
- Lines 15-21 call Pickles with all our parameters. As before, remember that only the FeatureDirectory and the OutputDirectory are required. I've supplied them all for clarity and for you to extend.

### Summary

There we go - a helper for you to call Pickles from MSBuild and PowerShell. Remember that you can call it from [NAnt and as a console application](https://github.com/picklesdoc/pickles/wiki) too. It works much the same and is easy to figure out how to get to work from these samples.

Pickles will greatly enhance how the non-developers on your team can read and access the specification. You want them to read, comment, and be a part of daily work with the specs. Don't let developer-centric tools stop you from doing that.

My example as described above can be [downloaded here, as a zip](https://dl.dropbox.com/u/2408484/picklesLab.zip).
