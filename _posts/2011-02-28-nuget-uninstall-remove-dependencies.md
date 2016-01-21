---
layout: post
title: Uninstall package with NuGet–and remove dependencies
date: '2011-02-28T20:42:00.001+01:00'
author: Marcus Hammarberg
tags:
- Tools
- .NET
- Life of a consultant
modified_time: '2012-03-16T11:27:06.796+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-7037828051590389229
blogger_orig_url: http://www.marcusoft.net/2011/02/nuget-uninstall-remove-dependencies.html
---

With <a href="http://nuget.codeplex.com/" target="_blank">NuGet</a> I almost long to add new stuff to my project – it’s a breeze and you almost forget the hustle of keeping track of what’s referenced and not.

One of the core features of NuGet is that it not only install the requested component, it also installs all the dependencies of the component – in the right versions. That list can be quite long. But what if you want to reverse the install?

<a name='more'></a>

For example the other day I wanted to include <a href="http://openidportablearea.codeplex.com/" target="_blank">OpenIdPortableArea</a> in my <a href="http://www.asp.net/mVC/" target="_blank">ASP.NET MVC</a> application. It’s just a simple NuGet away. I went:

<code>Install-Package OpenIdPortableArea</code>

in the package manager console and NuGet went:

{% highlight bash %}
'MvcContrib' not installed. Attempting to retrieve dependency from source...
Done.
'MicrosoftWebMvc (≥ 2.0)' not installed. Attempting to retrieve dependency from source...
Done.
'Mvc2Futures (≥ 2.0.50217.0)' not installed. Attempting to retrieve dependency from source...
Done.
'DotNetOpenAuth' not installed. Attempting to retrieve dependency from source...
Done.
Successfully installed 'Mvc2Futures 2.0.50217.0'.
Successfully installed 'MicrosoftWebMvc 2.0'.
Successfully installed 'MvcContrib 2.0.95.0'.
Successfully installed 'DotNetOpenAuth 3.4.6.10357'.
Successfully installed 'OpenIdPortableArea 1.0.0.3'.
Successfully added 'Mvc2Futures 2.0.50217.0' to Web.
Successfully added 'MicrosoftWebMvc 2.0' to Web.
Successfully added 'MvcContrib 2.0.95.0' to Web.
Successfully added 'DotNetOpenAuth 3.4.6.10357' to Web.
Successfully added 'OpenIdPortableArea 1.0.0.3' to Web.
{% endhighlight %}

(Please note the AutoComplete feature by hitting tab; command names, parameters and even remote package name. Start typing (in my case) <code>OpenId</code>, hit TAB and make your choice).

As you can see – quite a lot of dependencies, one of the even added stuff to my web.config. But hey – I don’t care much. That’s NuGet’s problems nowadays. So all these components are pulled down, put into my packages folder (in the Solution root) and referenced in my project of choice.

But now I want to reverse that action. In this particular case I want to wait for an update of the OpenIdPortableArea package and use that. There is a simple <a href="http://nuget.codeplex.com/documentation?title=Package%20Manager%20Console%20Command%20Reference" target="_blank">uninstall package</a> command. But what about the dependencies?

Again – it works just fine with the switch <code>‑RemoveDependencies</code> So I simply go:

<code>Uninstall-Package OpenIdPortableArea –RemoveDependencies</code>

and NuGet does this:

{% highlight bash %}
Successfully removed 'OpenIdPortableArea 1.0.0.3' from Web.
Successfully removed 'DotNetOpenAuth 3.4.6.10357' from Web.
Successfully removed 'MvcContrib 2.0.95.0' from Web.
Successfully removed 'MicrosoftWebMvc 2.0' from Web.
Successfully removed 'Mvc2Futures 2.0.50217.0' from Web.
Successfully uninstalled 'OpenIdPortableArea 1.0.0.3'.
Successfully uninstalled 'DotNetOpenAuth 3.4.6.10357'.
Successfully uninstalled 'MvcContrib 2.0.95.0'.
Successfully uninstalled 'MicrosoftWebMvc 2.0'.
Successfully uninstalled 'Mvc2Futures 2.0.50217.0'.
{% endhighlight %}


And my project is clean as a baby... well I know from experience that that saying is not very well put – but it’s clean, let’s keep it to that. Everything is back to the state it was. The components are gone, the references as well and even any code changes that was made such as updating your web.config.

NuGet is just brilliant! It just works! Changed the way you looked on taking dependencies on <a href="http://en.wikipedia.org/wiki/Open-source_software" target="_blank">OSS</a> projects.

{% include adsense.html %}