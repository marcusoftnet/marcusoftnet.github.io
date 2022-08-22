---
layout: post
title: Creating a local NuGet repository with dependencies bundles
date: 2011-09-01T15:07:00.001+02:00
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
modified_time: 2011-09-01T16:03:37.637+02:00
thumbnail: http://lh5.ggpht.com/-n34J70F2SuA/Tl-Qnb6o0pI/AAAAAAAABBk/iH5qSo5veR4/s72-c/adding%252520new%252520nuget%252520package%252520source_thumb.jpg?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-640926282847787172
blogger_orig_url: http://www.marcusoft.net/2011/09/creating-local-nuget-repository-with.html
---


I’m loving <a href="http://www.nuget.org" target="_blank">NuGet</a> and
it’s totally changed the way I look on brining in external dependencies
to my projects. <a
href="http://www.marcusoft.net/2011/02/nuget-uninstall-remove-dependencies.html"
target="_blank">I've written about that before</a>.

But sometimes you want to install several packages into a project. For
example, when you install
<a href="www.specflow.org" target="_blank">SpecFlow</a> into a project
you also have to install a test framework such as
<a href="http://www.nunit.org/" target="_blank">NUnit</a> or
<a href="http://msdn.microsoft.com/en-us/library/ms182489(v=vs.80).aspx"
target="_blank">MsTest</a>. And maybe an assertion framework or a
mocking framework.

But this package will contain your (or your company) preferences and
maybe not be suitable to publish to NuGet.org for everyone to download.

In this post I’ll show you how to easily create a  local package where
you can setup the dependencies you want. And how to use it in your
solution.

#### Strategy

Our sneaky plan is to basically create a package that only has
dependencies. No code. And then store it in a local NuGet Repository.

#### Install NuGet Package Explorer

This will to large extent be done in the .nuspec file. A XML-file that
you can edit with any text editor. Or use the excellent
<a href="http://nuget.codeplex.com/releases/view/59864"
target="_blank">NuGet Package Explorer</a>. Go get it now. You want be
sorry.

#### Create a local NuGet repository

A local NuGet repository is simply a folder with NuGet packages. You can
follow the first 4 steps in <a
href="http://gregorsuttie.wordpress.com/2011/01/03/using-a-nuget-local-repository/"
target="_blank">this excellent blog post</a> or just go:

- Create a folder (mine is in C:\Dev\LocalNuGet)
- In Visual Studio go Tools-\>Library Package Manager-\>Package
    Manager Settings and add your path above to the Package Sources:

[<img
src="http://lh5.ggpht.com/-n34J70F2SuA/Tl-Qnb6o0pI/AAAAAAAABBk/iH5qSo5veR4/adding%252520new%252520nuget%252520package%252520source_thumb.jpg?imgmax=800"
title="adding new nuget package source"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="404" height="234"
alt="adding new nuget package source" />](http://lh6.ggpht.com/-jW0Q6Ymm4vk/Tl-Qmqj4qkI/AAAAAAAABBg/3tXjLnqUNrs/s1600-h/adding%252520new%252520nuget%252520package%252520source%25255B2%25255D.jpg)

- Double check that everything is fine, by going to the Package
    Manager console and try to select your package source in the drop
    down for Package Source:

[<img
src="http://lh3.ggpht.com/-KmPD18aU1WM/Tl-QoRMO1kI/AAAAAAAABBs/4TXoaWauquY/choosing%252520local%252520package%252520source_thumb.jpg?imgmax=800"
title="choosing local package source"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="329" height="296"
alt="choosing local package source" />](http://lh4.ggpht.com/-og5O_h4NrSw/Tl-Qn_vtSBI/AAAAAAAABBo/USYKOKqtQTo/s1600-h/choosing%252520local%252520package%252520source%25255B2%25255D.jpg)

#### Create the NuSpec file

Open NuGet Package Explorer and fill out the basic information about
your package (Id, Name, yada yada). A little gotcha is that you need to
go Edit-\>Edit package metadata (CTRL+K) to be able to edit the package.

[<img
src="http://lh5.ggpht.com/-Wv_7KZEh23c/Tl-QpqejnKI/AAAAAAAABB0/7B83EBcdE4E/nuget%252520package%252520explorer_thumb%25255B1%25255D.jpg?imgmax=800"
title="nuget package explorer"
style="background-image: none; border-bottom: 0px; border-left: 0px; padding-left: 0px; padding-right: 0px; display: block; float: none; margin-left: auto; border-top: 0px; margin-right: auto; border-right: 0px; padding-top: 0px"
data-border="0" width="404" height="559" alt="nuget package explorer" />](http://lh5.ggpht.com/-9SPMeWM5c7U/Tl-QowNKKuI/AAAAAAAABBw/kzu1GkwD1FU/s1600-h/nuget%252520package%252520explorer%25255B3%25255D.jpg)

Scroll down a bit and you’ll find a section on dependencies.

[<img
src="http://lh4.ggpht.com/-X_yneXl-ais/Tl-QqbfTT-I/AAAAAAAABB8/Aa8IQK4pWlA/dependencies_thumb%25255B1%25255D.jpg?imgmax=800"
title="dependencies"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="404" height="164" alt="dependencies" />](http://lh5.ggpht.com/-wE5-IJsVQ3I/Tl-Qp-2uHnI/AAAAAAAABB4/dg39hKZ6zgg/s1600-h/dependencies%25255B3%25255D.jpg)

Press the big +-button and add to open the search dialog and find your
package:

[<img
src="http://lh5.ggpht.com/-0CimBGxNbiM/Tl-QsLgF0vI/AAAAAAAABCE/KFTg2_0B0P8/search%252520nuget%252520dependency_thumb%25255B1%25255D.jpg?imgmax=800"
title="search nuget dependency"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="404" height="302"
alt="search nuget dependency" />](http://lh5.ggpht.com/-5JE4Kv6aAhc/Tl-QrhoHyMI/AAAAAAAABCA/4NwPX2PAchM/s1600-h/search%252520nuget%252520dependency%25255B3%25255D.jpg)

Please note that you can switch Package Source (i.e. NuGet repository).
Set it to the Microsoft official NuGet repository and find your package.
By doing this we will pull our dependencies from that source and don’t
need to store them locally. Super-lightweight in other words.

When you’re done press OK and your package is created.

#### Export and test

Finally save your created package into your local package source
(C:\Dev\LocalNuGet in my case). This will create a .nupkg file into that
directory. Since we have no “content” – just dependencies – it will only
be that solitaire file.

This file can be opened and re-edited with NuGet Package explorer, which
is great if you want to update version etc.

To test your handiwork do this:

- Open a project that you want to add your package to
- Go to Package Manager console
- Pick your Package Source (as above)
- Type “Install-Package" and hit tab. This will show your local
    packages
- Pick your package and hit Enter. And lo and behold:

[<img
src="http://lh3.ggpht.com/-8EHw-IxVTOY/Tl-QtMW7BgI/AAAAAAAABCM/rdj69ccGrWI/the%252520magic_thumb.jpg?imgmax=800"
title="the magic"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="404" height="285" alt="the magic" />](http://lh5.ggpht.com/-92NYaK6ZNKs/Tl-QsviPfiI/AAAAAAAABCI/H2GZUXl-m3s/s1600-h/the%252520magic%25255B2%25255D.jpg)

#### Conclusion

Using this approach we get a lot of good stuff:

You can <a
href="http://www.marcusoft.net/2011/02/nuget-uninstall-remove-dependencies.html"
target="_blank">“Uninstall-Package –RemoveDependencies”</a> on your
bundle. That will remove it with it’s dependencies.

You can build packages that build on top of each other. For example you
can have:

- SpecFlowWithNUnit – just
    <a href="www.specflow.org" target="_blank">SpecFlow</a> and NUnit.
- SpecFlowWithNunitAndShould – which has a dependency to your local
    package SpecFlowWithNUnit and adds dependency to Should from the
    official source
- SpecFlowWithNUnitAndShouldAndMoq – … you get the picture.

In this example I added dependencies to specific version of the other
NuGet package. This can be done by simply removing the version number of
your dependency in NuGet Package Explorer.

[<img
src="http://lh5.ggpht.com/-PIrztGDHuVQ/Tl-QuB79xqI/AAAAAAAABCU/6nFOqaGgAIQ/no%252520version%252520for%252520dependency_thumb.jpg?imgmax=800"
title="no version for dependency"
style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px"
data-border="0" width="334" height="140"
alt="no version for dependency" />](http://lh4.ggpht.com/-XXSdgRBBnZo/Tl-QtqK6aQI/AAAAAAAABCQ/tp5eSenC-6E/s1600-h/no%252520version%252520for%252520dependency%25255B2%25255D.jpg)

Finally this approach can be use to share repositories for a team, a
company or a group.

I hope you find this helpful.
