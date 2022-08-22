---
layout: post
title: Creating a tools only NuGet package
date: '2011-12-11T21:30:00.001+01:00'
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
  - SpecFlow
modified_time: '2011-12-11T21:51:57.425+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-8208460981540200585
blogger_orig_url: http://www.marcusoft.net/2011/12/creating-tools-only-nuget-package.html
---


I have started to help out in a new OSS project. The last one was
<a href="http://www.specflow.org" target="_blank">SpecFlow</a> and now
it’s
<a href="https://github.com/x97mdr/pickles" target="_blank">Pickles</a>.
Pickles is a tool that takes .feature-files from SpecFlow or Cucumber
and turns it into a nice living documentation. It’s a great addition to
SpecFlow.

Ok – one of the things I have been doing in the Pickles project is to
create <a href="http://www.nuget.org" target="_blank">NuGet</a> packages
for the project different runners and especially lately the PowerShell
runner. This will be the main way to interact with Pickles locally,
which basically means that you’ll just write a command in the <a
href="http://docs.nuget.org/docs/reference/package-manager-console-powershell-reference"
target="_blank">Package Manager Console</a> to generate the
documentation frictionless. Later you will probably run it as part of
your Nant or MsBuild build files.

I learned a great deal about PowerShell and NuGet when I put that NuGet
package together and since it was quite some time since I blogged I
thought I’ll write down my experiences. This post is a about the NuGet
package.



The goal of my package is to NOT add any references to any projects. I
just want it to drop some assemblies as tools and then use the
<a href="http://technet.microsoft.com/en-us/library/dd819454.aspx"
target="_blank">“Import-Module”</a> PowerShell command to make the
commandlet I’ve written available to the Package Manager Console.

#### NuSpec

<a href="http://docs.nuget.org/docs/reference/nuspec-reference"
target="_blank">NuSpec is a file format</a> in which you specify how
your package should be built. It’s actually not necessary in most cases
since NuGet can package a Visual Studio project file straight off. But
if you want more fine-grained control over how the package is created
then you might want to create the NuSpec-file by hand.

The NuSpec-file is just plain XML and here is mine:

<div id="codeSnippet"
style="border-bottom-style: none; text-align: left; padding-bottom: 0px; line-height: 12pt; background-color: #f4f4f4; border-left-style: none; padding-left: 0px; width: 100%; padding-right: 0px; font-family: 'Courier New', courier, monospace; direction: ltr; border-top-style: none; color: black; border-right-style: none; font-size: 8pt; overflow: visible; padding-top: 0px">

```
   1: <?xml version="1.0"?>
```

```
   2: <package xmlns="http://schemas.microsoft.com/packaging/2011/08/nuspec.xsd">
```

```
   3:   <metadata>
```

```
   4:     <id>Pickles</id>
```

```
   5:     <version>$version$</version>
```

```
   6:     <title>Pickles - Gherkin Documentation Generator</title>
```

```
   7:     <authors>Marcus Hammarberg</authors>
```

```
   8:     <owners>Jeffrey Cameron</owners>
```

```
   9:     <projectUrl>https://github.com/x97mdr/pickles</projectUrl>
```

```
  10:     <requireLicenseAcceptance>false</requireLicenseAcceptance>
```

```
  11:     <description>Pickles is an ...</description>
```

```
  12:     <summary>A documentation generator ...</summary>
```

```
  13:     <copyright>Copyright © Jeffrey Cameron 2010-2011</copyright>
```

```
  14:   </metadata>
```

```
  15:   <files>
```

```
  16:     <file src="bin\Release*.dll" target="tools" />
```

```
  17:     <file src="init.ps1" target="tools\init.ps1" />
```

```
  18:   </files>
```

```
  19: </package>
```

</div>



Most of the elements speaks clearly for themselves (I’ve shorten the
content of some for readability):



-   At line 5 you can see how you can send in a version number to the
    NuGet Pack command (see below)
-   Line 15-18 specifies the files I want to include and where I want
    them to appear in the deployed package
-   Noteworthy is that I don’t specify any dependencies here. I don’t
    want to add any references to the target project. I simply want to
    copy some files.
-   Note also that I’m including a powershell file called init.ps1 – see
    below about that file. 



#### Init.ps1



This is a PowerShell file that runs (if included) when a NuGet package
installs. It’s perfect for doing installation stuff. Here is how the
file look like for me:



<div id="codeSnippetWrapper">



<div id="codeSnippet"
style="border-bottom-style: none; text-align: left; padding-bottom: 0px; line-height: 12pt; background-color: #f4f4f4; border-left-style: none; padding-left: 0px; width: 100%; padding-right: 0px; font-family: 'Courier New', courier, monospace; direction: ltr; border-top-style: none; color: black; border-right-style: none; font-size: 8pt; overflow: visible; padding-top: 0px">

```
   1: param($installPath, $toolsPath, $package)
```

```
   2: 
```

```
   3: Import-Module (Join-Path $toolsPath Pickles.PowerShell.dll)
```

```
   4: 
```

```
   5: Write-Host "#############################"
```

```
   6: Write-Host "Pickles installed."
```

```
   7: Write-Host "Comand usage (switches in brackets are optional):"
```

```
   8: Write-Host "Pickle-Features -FeatureDirectory -OutputDirectory [-Language] [-TestResultsFile] [-SystemUnderTestName] [-SystemUnderTestVersion]"
```

```
   9: Write-Host "#############################"
```

</div>

</div>




-   On line 1 we have some parameters that NuGet are sending to us. It’s
    basically some paths to different folder that might be interesting
    to us
-   On line 3 is the important stuff; here I do the Import-Module of the
    PowerShell commandlet I’ve written.
    In order to get it to work I have to use another PowerShell command
    that joins paths to import it from the right folder
-   The rest is just me writing out some interesting information (?) to
    inform the user how to use the command



These simple lines will “install” the commandlet into the Package Manger
console and it can now be used. With full intellisense for all
parameters of the command. Nice!



#### NuGet.Exe and the Pack command



NuGet also have a command with which you can
<a href="http://docs.nuget.org/docs/reference/command-line-reference"
target="_blank">do a lot of stuff</a> but here I was interested in the
the Pack command. It turns a .nuspec or a Visual Studio project file
into a .nupkg file that then can be deployed separately.



Here is my command that operate on the .nuspec file I described above:



<div id="codeSnippetWrapper">



<div id="codeSnippet"
style="border-bottom-style: none; text-align: left; padding-bottom: 0px; line-height: 12pt; background-color: #f4f4f4; border-left-style: none; padding-left: 0px; width: 100%; padding-right: 0px; font-family: 'Courier New', courier, monospace; direction: ltr; border-top-style: none; color: black; border-right-style: none; font-size: 8pt; overflow: visible; padding-top: 0px">

```
   1: nuget pack Pickles.nuspec -Version %1
```

</div>

</div>



Nothing strange here,  I simply point to the .nuspec-file and pass a
parameter as version. This allows me to use this command (.cmd-file)
from a DOS-prompt to create new packages by simply setting the version
number of the package.



So for version 0.3 I got a file called “Pickles.0.3.nupkg”.



#### Trying out your package locally



A really nice feature of NuGet is that you can very easily set up a
local NuGet repository. I’ve <a
href="http://www.marcusoft.net/2011/09/creating-local-nuget-repository-with.html"
target="_blank">blogged about that before</a> and it’s done is just a
few minutes.



So to try my package out I simply copied it into my local repository
(just a folder on my computer) and then went “Install-Package Pickles”
in the Package Manager Console in Visual Studio. I even got intellisense
for the package name.



#### Conclusion and lessons learned



I had some strange problems with the references to dependencies for my
package for a while. But when I cleaned my files up in order to write a
<a href="http://stackoverflow.com" target="_blank">StackOverflow</a>
question about it… the problems went away. Typical! I must have messed
up.



But I learned one very important thing when trying your packages out;
Increment the version number for each new version! Or start a new
project to import your package into. I suspect that the clean up didn’t
always work as expected.



All in all this is a very nice way to deploy a tool I think. It have
taken me quite some time to put together but 70% of that have been me
going back and forth trying to figure out why it didn’t work. Most
likely that had to do with me using the same version number all the
time.



The Pickles NuGet packages will be available from NuGet.org soon. Very
soon.
