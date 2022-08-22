---
layout: post
title: Setting up a new development machine without pressing Next a single time using
  Chocolately
date: 2013-08-01T18:28:00.001Z
author: Marcus Hammarberg
tags:
  - Tools
  - .NET
  - Agile
  - Visual Studio
modified_time: 2013-08-05T06:49:42.359Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-3525796959481201604
blogger_orig_url: http://www.marcusoft.net/2013/08/DevInstallChocolatey.html
---


<div>

Up to now I have sadly not have time to look into
<a href="http://chocolatey.org/" target="_blank">Chocolatey</a>. I know
what it is but I haven't played with it. As the time grew closer to set
up a new development machine I thought I'd give it a run Chocolatey a
run for it's money.

> Could my entire development environment be installed using a script?
> That is - from a bare-bones Windows installation could I run a script
> and get *every*thing I needed in place.

This was a real challenge since I don't know (nor want to learn) any
<a href="http://en.wikipedia.org/wiki/Windows_PowerShell"
target="_blank">powershell</a> and consider myself to be a newbie
Chocolatey user.

This post describes my journey.

### Getting a virtual windows installation in place

<div>

I use OS X and
<a href="http://www.virtualbox.org/" target="_blank">VirtualBox</a> to
run virtual instances of windows. Creating a virtual image is simple
enough in VirtualBox and then you can attach an .iso-file with the
Windows installation.

</div>

<div>
</div>

<div>

The Windows 8.1 installation was pretty fast and within 30-40 minutes I
had a bare-bones Windows installation in place.

</div>

### Getting my stuff in place - local version

<div>

One of the really cool things about Chocolatey is that you can install
it directly from the prompt (that's cmd-prompt, no powershell stuff)
with a command you just copy from
<a href="http://chocolatey.org/" target="_blank">their homepage</a>:

</div>

When Chocolatey is installed you can start using it's <a
href="https://github.com/chocolatey/chocolatey/wiki/CommandsReference"
target="_blank">commands</a> of which the most interesting is the "<span
style="font-family: Courier New, Courier, monospace;"><a href="https://github.com/chocolatey/chocolatey/wiki/CommandsInstall"
target="_blank">cinst</a>" command. This is the command that
installs a
<a href="http://chocolatey.org/packages" target="_blank">Chocolatey
package</a> for you. I ended up using "<span
style="font-family: Courier New, Courier, monospace;"><a
href="https://github.com/chocolatey/chocolatey/wiki/CommandsInstallMissing"
target="_blank">cinstm</a>"that only does the install if the
package isn't installed before.

This means that it's now only a matter of doing a long list of
powershell (cinst is a powershell command) commands. Like this one for
example that installs
<a href="http://www.7-zip.org/" target="_blank">7Zip</a>:

There are four problems with this, at least for me:

- I don't like powershell
- I don't want to sit around issuing commands every other minute or
    hour (for big installs)
- It's not repeatable
- I don't know or remember the packages I want to have. Chocolatey has
    1200 packages at the time of writing.

Let's leave that last one and address the other issues first. I would
like a file with these commands in and then just execute those commands.
This can be done (thanks
<a href="https://github.com/carllindelof" target="_blank">Calle</a> for
the tip) with this command:
<div>

And then my devApps.ps1 file just contains installation commands I want.
Like this for example:

I could then merge the "get Chocolatey" -command with the "install dev
apps"-command and have a single install.bat that I run to get this to
run:

### Getting my stuff in place - cloud version

</div>

<div>

If you start looking around in the Chocolatey package directory you'll
soon get too-much-apathy. There's really no way to know what is in there
without searching for it, which implies that you know what to search
for. And what is good.

</div>

<div>
</div>

<div>

Over a number of installations and years we have all stacked up our own
favorite tools and utilities that we like (and in some cases have a
unhealthy relationship with).  

</div>

<div>
</div>

<div>

Now if there could only be a way to save my list of things that I like
and usually install. This way I could share it with others and get tips,
suggestions and maybe even inspire them.

</div>

<div>
</div>

<div>

But hey - there is such a way! I can store my <span
style="font-family: Courier New, Courier, monospace;">devApps.ps1-file
in the cloud, at <a
href="https://github.com/marcusoftnet/ScriptsAndStuff/blob/master/DevMachineInstall/devApps.ps1"
target="_blank">GitHub.com</a> for example.  There people could actually
make pull requests and forks of my file to improve it.

</div>

<div>
</div>

<div>

So now I can only copy that file onto every new machine ... no - wait.
There's a better way. Chocolatey used a cool little function called
<span style="font-family: Courier New, Courier, monospace;">((new-object
net.webclient).DownloadString() in their install command. I can
use that too and download my devApps.ps1 file from Github.

</div>

<div>
</div>

<div>

Like this:

A small gotcha for me was that you have to reference the RAW-version of
the file. Of course, once you think about it since you don't want to
download the GitHub HTML-page. Of course - but I missed that the first
time around.

</div>

### Summary

<div>

This is so cool - I now have a installation script for all my
development application that takes my machine from bare-bones Windows
too fully installed development mode. Its repeatable (if I need to do
this), it's shareable (so I can get tips and suggestions and share with
others), its automated (I don't have to do next, next, next for hours)
and I only one powershell command. Not too bad.

My installation scripts can be found, forked and improved
here: <https://github.com/marcusoftnet/ScriptsAndStuff>

### Update

</div>

<div>

Right smack in the middle of my installation my virtual machine
rebooted. I don't really know why but that gave script-based
installations time to really shine.

</div>

<div>
</div>

<div>

How did I recover from such a horrible thing as a machine reboot?

</div>

<div>

Simple - just ran the exact same script again. Since it's using <span
style="font-family: Courier New, Courier, monospace;">cinstm
<span style="font-family: inherit;">the script went through what
was installed already and then continued where it ended... I had to
rerun the command but that was all. Cool. Really cool!

### <span style="font-family: inherit;">Update 2

</div>

<div>

<span style="font-family: inherit;">It worked... Kind of (see below)! It
took me about 4 hours of letting the script run. Resharper and
WebEssentials2012 failed but that was because of me. The script
installed those add-ins to Visual Studio before Visual Studio itself. So
I modified the <a href="https://github.com/marcusoftnet/ScriptsAndStuff"
target="_blank">script</a> to run the Visual Studio installs
first.

</div>

<div>

<span style="font-family: inherit;">

</div>

<div>

<span style="font-family: inherit;">Also I failed. I forgot that for
Visual Studio 2013 Preview you also need to install "ASP.NET and
Web Tools 2013 Refresh". But that's for a preview product so I felt that
it didn't count. Now did it?

</div>

</div>
