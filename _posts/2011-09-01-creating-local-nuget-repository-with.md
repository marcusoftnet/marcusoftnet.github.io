---
layout: post
title: Creating a Local NuGet Repository with Dependency Bundles
date: 2011-09-01T13:07:00.001Z
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
modified_time: 2011-09-01T14:03:37.637Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-640926282847787172
blogger_orig_url: https://www.marcusoft.net/2011/09/creating-local-nuget-repository-with.html
---

I’m loving [NuGet](http://www.nuget.org) and it’s totally changed the way I look at bringing in external dependencies to my projects. [I've written about that before](https://www.marcusoft.net/2011/02/nuget-uninstall-remove-dependencies.html).

Sometimes, you need to install several packages into a project. For example, when installing [SpecFlow](www.specflow.org), you might also need a test framework like [NUnit](http://www.nunit.org/) or [MsTest](http://msdn.microsoft.com/en-us/library/ms182489(v=vs.80).aspx), and perhaps an assertion or mocking framework.

If you want a package that includes your or your company’s preferences, and is not necessarily suitable for publishing to NuGet.org, here’s how to create a local package with dependencies only.

### Strategy

Our approach is to create a package that contains only dependencies—no code—and store it in a local NuGet Repository.

### Install NuGet Package Explorer

Most of the work will be done in the `.nuspec` file, an XML file that you can edit with any text editor or use the excellent [NuGet Package Explorer](http://nuget.codeplex.com/releases/view/59864). Download it now; you won’t regret it.

### Create a Local NuGet Repository

A local NuGet repository is simply a folder containing NuGet packages. Here’s how to set it up:

1. Create a folder (e.g., `C:\Dev\LocalNuGet`).
2. In Visual Studio, go to Tools → Library Package Manager → Package Manager Settings, and add your folder path to the Package Sources:
3. Verify everything is set up correctly by going to the Package Manager console and selecting your package source in the drop-down menu:

   ![Choosing Local Package Source](/img/choosing%25252520local%25252520package%25252520source_thumb.jpg)

### Create the NuSpec File

Open NuGet Package Explorer and fill out the basic information about your package (Id, Name, etc.). To edit the package metadata, go to Edit → Edit package metadata (CTRL+K).

Scroll down to the dependencies section:

   ![Dependencies](/img/dependencies_thumb%2525255B1%2525255D.jpg)

Click the big `+` button to add dependencies. Use the search dialog to find the packages you need:

You can switch the Package Source to the official NuGet repository to pull dependencies from there, keeping your local package lightweight.

### Export and Test

Save your package into your local package source directory (`C:\Dev\LocalNuGet` in this example). This will create a `.nupkg` file with only dependencies.

To test your package:

1. Open a project where you want to add your package.
2. Go to the Package Manager console.
3. Select your Package Source.
4. Type `Install-Package` and hit tab to see your local packages.
5. Select your package and press Enter.

   ![The Magic](/img/the%25252520magic_thumb.jpg)

### Conclusion

Using this method, you can:

- Use `Uninstall-Package –RemoveDependencies` to remove your bundle with its dependencies.
- Create packages that build on top of each other. For example:
  - `SpecFlowWithNUnit` – just SpecFlow and NUnit.
  - `SpecFlowWithNunitAndShould` – depends on `SpecFlowWithNUnit` and adds Should.
  - `SpecFlowWithNUnitAndShouldAndMoq` – and so on.

You can also manage versions of dependencies by simply not specifying version numbers in the NuGet Package Explorer.

This approach is great for sharing repositories within a team, company, or group.

I hope you find this helpful.
