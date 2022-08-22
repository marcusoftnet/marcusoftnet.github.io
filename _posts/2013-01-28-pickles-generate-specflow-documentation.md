---
layout: post
title: Pickles - generate SpecFlow documentation from MsBuild and PowerShell
date: 2013-01-28T12:54:00.000Z
author: Marcus Hammarberg
tags:
  - BDD
  - Tools
  - Specification by example
  - SpecFlow
modified_time: 2013-07-30T18:15:45.084Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-5238097084946695251
blogger_orig_url: http://www.marcusoft.net/2013/01/pickles-generate-specflow-documentation.html
---


<div dir="ltr" style="text-align: left;" trbidi="on">

If your doing <a href="http://specificationbyexample.com/"
target="_blank">specification by example</a> or
<a href="http://en.wikipedia.org/wiki/Behavior-driven_development"
target="_blank">BDD</a> you will soon realize that the tooling still
points towards developers. WIth that I mean, that
<a href="http://cukes.info/" target="_blank">Cucumber</a> and
<a href="http://www.specflow.org/" target="_blank">SpecFlow</a> allows
you to write your (executable) specifications in plain text, but you
still check it into the source repository. This is of course a good
thing since you'd want to version the specification with your code - but
it also effectively hides it and keeps the spec out of reach for any
non-developing member of the team.

Make no mistake here: the .feature-file is the master and original.
That's how it should be since it's versioned together with the code. But
we want everyone in the team to be able to read the specifications and
see the test result easily. So we generate documentation off the
.feature-files.

<a href="https://github.com/picklesdoc/pickles"
target="_blank">Pickles</a> is a nice OSS framework that helps you solve
this problem by generating documentation in a variety of formats from
your specifications. This can be done in build scripts to keep the site
up to date.

In this blog post I'll show you two easy ways to include the generation
of an HTML-site from your features with
<a href="https://github.com/picklesdoc/pickles"
target="_blank">Pickles</a>: via PowerShell and via MSBuild. Let's start
with the latter since I know that the best.

If you want to skip ahead you can
<a href="https://dl.dropbox.com/u/2408484/picklesLab.zip"
target="_blank">download my code here.</a>

### Pickles and how to get it

<div>

Pickles describes itself as: "Pickles is an open source living
documentation generator that works on feature files written in the
Gherkin language, popularized in tools like Cucumber and SpecFlow". It's
run
by <a href="https://github.com/x97mdr" target="_blank">Jeffrey Cameron</a> and
has a thriving community. I've done some small commits but love the tool
and "sell" it to almost every client doing specification by example.




There are other tools like this like
<a href="https://www.relishapp.com/" target="_blank">Relish</a> and
<a href="http://www.speclog.org/" target="_blank">SpecLog</a>. But they
both have a cost associated with them. In the Relish case you can get it
for free but then you have to publish your specs on their site,
something that most companies doesn't want. SpecLog is a great tool and
not a perfect fit for just documentation. It's more for collaboration
around the early phases of Specification by example.




<a
href="https://github.com/picklesdoc/pickles/wiki/ArgumentsDocumentationFormat"
target="_blank">Pickles supports 4 formats</a> (Html, Word, DITA and
json) with HTML being the most common one and also default value for the
runners. I should tell you that a new version of the HTML-site is on the
way. The one that's generated now is static and doesn't allow search and
stuff. The Json-format (one of my small contributions) was thought of as
being the foundation for a javascript based site. The new HTML site
looks a lot like what we dreamt of then. It will be great!




The simplest way to get hold of pickles is from
<a href="http://nuget.org/packages/pickles" target="_blank">NuGet</a>.
This will download all the runners (MSBuild, Powershell, Nant and
Console) and, in-fact, allow you to run Pickles directly from the NuGet
console (package manager I think it's called).




This can be a good start but pretty soon you'll need to start using this
in a build scrip. To be able to demo that easily I've created a little
bundle with all the
<a href="https://dl.dropbox.com/u/2408484/picklesLab.zip"
target="_blank">Pickles files in one zip</a>.




The folder structure is like this:

</div>

<div>

pickles - pickles stuff that I've downloaded via NuGet

- MsBuild - just the stuff you'll need to call Pickles from MsBuild
- Powershell - just the stuff you'll need to call Pickles from
    PowerShell

Specs - a big structure with a lot of .feature files that you can use as
a demo. Deep in the belows of that structure
(/Specs/bin/debug/TestResult.xml) you'll find a testresult file that is
important if you want to display the tests result.

</div>

### MSBuild

<div>

Enough talk already: let's get down to business and create a little
MsBuild file that you can incorporate (or call) from your build script.




The example build script shows it all really:




Let's go through it line by (interesting) line:

On line 5 you import the <span
style="background-color: white; font-family: Consolas, 'Liberation Mono', Courier, monospace; font-size: 12px; line-height: 16px; white-space: pre;">PicklesDoc.Pickles.MSBuild.Tasks.dll that
contains the Pickles task. This is where you get the ability to access
the Pickles functionality. You need to have that DLL and all of it's
dependencies (found in the Pickles/msbuild-folder in my download)
accessible from you build script.

We then set up a PropertyGroup (lines 7-16) for all the currently
supported variables. Doing this allows you to override these values if
you where to call this file from another file.
You can of course write this directly in the Pickles-task if you want
to.

Line 18 sets up our target (in msbuild lingo a target contains several
tasks. Think of it like a method calling out to other methods)

On line 19 we create a new directory with
<a href="http://msdn.microsoft.com/en-us/library/s2448zz7.aspx"
target="_blank">MakeDir</a>

Line 20-26 calls Pickles with all the supported parameters. It's pretty
self-explanatory. The only ones that is required are FeatureDirectory
and OutputDirectory. The other defaults to:

- Format: Html
- ResultsFormat: Nunit

<div>

You can try this out by openening a Visual Studio Command Prompt and go:

</div>

<div>

 msbuild PicklesMsBuild.proj




The most common problems you'll run into is that Pickles and it's
dependencies cannot be found. Make sure you point the using-statement
(line 5) to the place where all the dll's are. I've used relative paths
from the root of my
<a href="https://dl.dropbox.com/u/2408484/picklesLab.zip"
target="_blank">sample</a>.

</div>

</div>

### PowerShell

I'm by no means a powershell master. Ok - I'm a total noob. There I've
said it. But I got plenty of help from the guys at Tradera (thanks
Torkel and Frank).

A lot of build scripts are executed using powershell scripts and you can
call Pickles from powershell as well. This is, strangely enough, my
second contribution. I've created a little commandlet called
"Pickle-Features". Come on - that was fun. Please?

To call into pickles you can do the following:
Let's go through that one line by line too. You'll recognize the
parameter names etc.:

- Line 2-9 is setting up the variables for our script. Change this to
    match your situation.
- Line 12 imports the module (DLL with the <a
    href="http://msdn.microsoft.com/en-us/library/windows/desktop/dd878294(v=vs.85).aspx"
    target="_blank">commandlet</a>). This is needed in order to call
    into the commandlet
- Line 15-21 calls Pickles with all our parameters. As before,
    remember that only the FeatureDirectory and the OutputDirectory is
    required. I've supplied them all for clarity and for you to extend

### Summary

<div>

There we go - a help for you to call Pickles from MsBuild and
PowerShell. Remember that you can call it from
<a href="https://github.com/picklesdoc/pickles/wiki"
target="_blank">Nant and as a console application</a> too. It works much
the same and is easy to figure out how to get to work from these
samples.




Pickles will greatly enhance how the non-developers in your team can
read and access the specification. You want them to read, comment and be
a part of daily work with the specs. Don't let developer-centric tools
stop you from doing that.




My example as described above can be
<a href="https://dl.dropbox.com/u/2408484/picklesLab.zip"
target="_blank">downloaded here, as a zip.</a>

</div>

</div>
