---
layout: post
title: Setting up a complete Node development machine.
From scratch. For free
date: '2014-03-26T02:45:00.002+01:00' author:
Marcus Hammarberg
tags:
  - Node - Javascript
  - Tools
modified_time: '2014-04-06T14:41:45.586+02:00'
thumbnail: http://4.bp.blogspot.com/-gILhj6-IEP4/Uy_XUm8ZHNI/AAAAAAAACHM/5Bl2QuYlNl8/s72-c/inceptiontop.jpg
blogger_id: tag:blogger.com,1999:blog-36533086.post-6779226674205683514
blogger_orig_url: http://www.marcusoft.net/2014/03/setting-up-complete-node-development.html
---


<div dir="ltr" style="text-align: left;" trbidi="on">

<div class="separator" style="clear: both; text-align: center;">

</div>

I got yet another computer. To work on. But there will be slow days on
airports and hotels with this baby to... So I decided to try something
new; I decided to go
<a href="http://en.wikipedia.org/wiki/Linux" target="_blank">Linux</a>
and setup a development environment for
<a href="http://nodejs.org/" target="_blank">Node Js</a>. I did not set
up a goal of this being a no-cost project, it just ended up that way
(with one worthy exception, in the end).

I have never used Linux before and decided to go with
<a href="http://www.ubuntu.com/" target="_blank">Ubuntu</a> that looked
like it would suit my Windows/Mac background best. It did too. It's been
a pure joy to use so far.

This blog post described what I did and what obstacles I ran into on the
way. It was ... not surprisingly maybe... but at least gratifyingly
simple and smooth. I've tried to describe it so that you can be both a
total newbie and a little bit more advance. The short version (aka
<a href="http://bit.ly/xivwY7" target="_blank">TL;DR</a>) comes first in
each section and then the details. Skip what you don't want to read.

I started with a normal PC Lenovo (2.5 Ghz, 4 Gb ram) with a 64-bits
Windows 8.1 Pro on it. The good news is that you don't have to care
about that. Because we are building a virtual computer using
<a href="https://www.virtualbox.org/" target="_blank">VirtualBox</a>.

This post is ~~pretty scary~~ very very long but the installation is
quick. Downloading Ubuntu and installing it it what's takes the most
time. With a good internet connection (that I do NOT have), you should
be able to complete all of this in under 1 hour.
Here we go.



### Downloading downloading downloading

<div>

This section will contain a lot of waiting. I've put in some information
for you to read in the meanwhile. Here it is in short form;

</div>

<div>

-   <a href="https://www.virtualbox.org/wiki/Downloads"
    target="_blank">Download VirtualBox</a>
-   <a href="http://www.ubuntu.com/download/desktop"
    target="_blank">Download Ubuntu installation media</a>

</div>

#### VirtualBox

<div>

First we need to get VirtualBox itself. Download the correct version for
your host operating system
<a href="https://www.virtualbox.org/wiki/Downloads" target="_blank">from
here</a>. 

</div>

|                                                                                                         |
|:-------------------------------------------------------------------------------------------------------:|
|                                                    <a
  href="http://4.bp.blogspot.com/-gILhj6-IEP4/Uy_XUm8ZHNI/AAAAAAAACHM/5Bl2QuYlNl8/s1600/inceptiontop.jpg"
                                           data-imageanchor="1"
           style="clear: left; margin-bottom: 1em; margin-left: auto; margin-right: auto;"><img
  src="http://4.bp.blogspot.com/-gILhj6-IEP4/Uy_XUm8ZHNI/AAAAAAAACHM/5Bl2QuYlNl8/s1600/inceptiontop.jpg"
                             data-border="0" width="200" height="200" /></a>                              |
|                                                 From <a
              href="http://www.forevergeek.com/2010/09/finally_an_affordable_inception_top/"
                                     target="_blank">ForeverGeek</a>                                      |

<div>

If you're new to this VirtualBox is free a virtualization software, from
<a href="http://www.oracle.com/" target="_blank">Oracle</a> of all
places. Meaning that we can create a single file (aka an image) that
represents an entire computer. With this you can run another computer in
your computer. It's a bit Inception-like but useful. 

</div>

<div>

Your physical computer, aka the host environment, is where you will run
VirtualBox. So you need to download the correct version for your host.
Windows, Mac what have you. 

</div>

<div>

Also way down at end of the downloads page there's a <a
href="http://www.oracle.com/technetwork/community/developer-vm/index.html"
target="_blank">link to a set of prebuilt images</a>. Virtual computers
that you can download. I had some problems to get that to work. And
downloading them on my **slow** network took forever.  

</div>

#### Ubuntu install media

<div>

<a
href="http://4.bp.blogspot.com/-DaHQeu_DBqA/Uy_V7J-e11I/AAAAAAAACHA/weW7PJZw494/s1600/download+ubuntu.jpg"
data-imageanchor="1"
style="clear: right; float: right; margin-bottom: 1em; margin-left: 1em;"><img
src="http://4.bp.blogspot.com/-DaHQeu_DBqA/Uy_V7J-e11I/AAAAAAAACHA/weW7PJZw494/s1600/download+ubuntu.jpg"
data-border="0" width="200" height="136" /></a>Let's
<a href="http://www.ubuntu.com/download/desktop"
target="_blank">download Ubuntu installation media</a>. We want the
desktop version (although the server version would probably do just fine
too). There's some helpful advice on the Ubuntu download page too, as
seen on the right. 

</div>

<div>



</div>

<div>

WATCHOUT! The version of VirtualBox that I have downloaded (just a few
weeks ago) only supported 32 bit Ubuntu. I got that in other words. Get
the one that is suitable for you.  

</div>

<div>



</div>

<div>

Once you click the Download button you will be taken to a "pay what it's
worth page". I strongly recommend that you pay a couple of bucks. An
operating system. For $10. Check the latests quotation for a Windows 8.1
license. You getting something very similar. 

</div>

<div>

But it's up to you. If you don't want to pay there's a "Not now. Take me
to the download"-link. 

</div>

<div>



</div>

<div>

Ubuntu is a free "distribution" of Linux. For us non-Linux people this
means that a company has taken the Linux core source code (it's open
source remember) and created a version of their own. And is now giving
it away for free. Ubuntu earns their money on consultancy and selling
support I would suspect. Amazingly true.

Ubuntu is <a href="http://en.wikipedia.org/wiki/Swahili_language"
target="_blank">Swahili</a>, btw, and
[means...](http://askubuntu.com/questions/424/what-does-ubuntu-mean) Nice,
huh?

</div>

<div>



</div>

<div>

Ok, that has not finished downloading yet. But will pretend it has. 

</div>

### Create your virtual computer

<div>

This is simple... if you know how. 

</div>

<div>

1.  Install VirtualBox ("Next, Next, Next, Wait, Finish")
2.  Create a new virtual machine and attach the Ubuntu installation
    media
3.  Boot up and complete the Ubuntu installation

</div>

#### Install VirtualBox on your host

<div>

Now that you have everything downloaded, first install VirtualBox on
your host system. This is your typical "Next, Next, Next, Wait,
Finish"-installation and I will not say much about that. Just
doubleclick the "VirtualBox-yada-yada-yada-Win.exe" file you downloaded
and you should be fine. 

</div>

#### Create your virtual machine

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://3.bp.blogspot.com/-QTOh92pfG00/Uy_dTa43_tI/AAAAAAAACHk/shGI9OrLqpY/s1600/createvirtual+machine.jpg"
data-imageanchor="1"
style="clear: right; float: right; margin-bottom: 1em; margin-left: 1em;"><img
src="http://3.bp.blogspot.com/-QTOh92pfG00/Uy_dTa43_tI/AAAAAAAACHk/shGI9OrLqpY/s1600/createvirtual+machine.jpg"
data-border="0" width="176" height="200" /></a>

</div>

<div>

Now, again if you're new to this it will be a bit strange. We will now
create a virtual computer machine. Or virtual machine for short and if
you under 85 years old, and stopped use that phrase. 

</div>

<div>



</div>

<div>

Luckily this is a breeze in VirtualBox. 

</div>

<div>

1.  Start VirtualBox
2.  Click New
3.  Give your machine a name
4.  Set the Operating system type and version
5.  Click Next

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://3.bp.blogspot.com/-5ecD9T8yTCw/Uy_dTds57MI/AAAAAAAACHo/73x1IDOP_pg/s1600/allocate+memory.jpg"
data-imageanchor="1"
style="clear: left; float: left; margin-bottom: 1em; margin-right: 1em;"><img
src="http://3.bp.blogspot.com/-5ecD9T8yTCw/Uy_dTds57MI/AAAAAAAACHo/73x1IDOP_pg/s1600/allocate+memory.jpg"
data-border="0" width="175" height="200" /></a>

</div>

<div>

That was pretty easy. Now we will allocate memory. Here you will have to
think about that your host operating system needs some memory to work
properly. VirtualBox has indicated what they think is max memory to
allocate to the virtual computer. I usually go below that just to make
sure. Here I have allocated 1664 out of my 4096 Mb to the virtual image.
Works fine for the things I will be doing. 

</div>

</div>

<div>



</div>

<div>



</div>

<div>

Now we will create the virtual hard drive. This was the thing that
confused me the most when I first started to use virtual machine, quite
a few years back. But when you think about it, its's natural; your
virtual machine needs a hard drive. It's a file stored on your host
system. We are now going to create it. I will not show every screen
here, most of them are super easy to grasp;

</div>

<div>

-   Select "Create new hard drive" and click Create
-   For your Virtual drive type select Virtual Disk Image (VDI) if you
    have no special reason not to
-   Click Next
-   Select "Dynamically allocated" as storage on physical drive. The
    slowness they are warning you about has never bothered me. Or I have
    not noticed it at least.

-   For file location you need to make sure that you know where the file
    ends up. Default it is under your user-folder on your host system. I
    usually put my virtual disk drives on a separate disk. Click the
    little browse symbol and choose a location
-   For size... well I went with 20 Gb. It will increase as needed. 
-   Click Create. 
-   And when you have done that your computer is done...

<div>

This is where I got confused, but the virtual machine you have now is
actually completed. You can compare this with buying a blank,
uninstalled computer from a store. Nothing is installed on it right now.

</div>

</div>

<div>

Let's fix that. 

</div>

### Installing Ubuntu on your virtual machine

<div>

1.  Attach the .ISO with Ubuntu
2.  Start the Virtual Machine and follow the installation instruction to
    install Ubuntu
3.  Done - Ubuntu is installed
4.  Oh yeah, install the VirtualBox Guest Additions as well.

</div>

<div>

If you got home with an empty computer, what would you do? Install an
OS. From a DVD probably. Let's do that, but from the .iso-file we
downloaded from Ubuntu.

</div>

<div>



</div>

<div class="separator" style="clear: both; text-align: center;">

</div>



<div class="separator" style="clear: both; text-align: center;">

<a
href="http://3.bp.blogspot.com/-Yq2Cx33pDCM/Uy_wTyVOsgI/AAAAAAAACIA/76WBmzIW_5E/s1600/virtual+machine+settings.jpg"
data-imageanchor="1"
style="clear: right; float: right; margin-bottom: 1em; margin-left: 1em;"><img
src="http://3.bp.blogspot.com/-Yq2Cx33pDCM/Uy_wTyVOsgI/AAAAAAAACIA/76WBmzIW_5E/s1600/virtual+machine+settings.jpg"
data-border="0" width="160" height="200" /></a>

</div>

<div>

The first thing you would do is to insert the DVD with the OS in the DVD
slot of your new physical computer. Well you don't have neither a DVD
nor a DVD player. We'll have to figure something else out. Select your
virtual machine in the VirtualBox (quite ugly, old school GUI) and
select Settings. 

</div>

<div>

This will open a scary dialog box where you can tweak all sorts of
settings for your virtual machine. Don't! If you're not absolutely sure
that ~~that's what that blogpost, on performance you read, said what you
should do~~ you know what your are doing. Things can stop working from
here. 

</div>

<div>



</div>

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://2.bp.blogspot.com/-fp9ou6UDGAY/Uy_wUPv0hRI/AAAAAAAACII/AVXInw365jQ/s1600/attach+iso+file.jpg"
data-imageanchor="1"
style="clear: left; float: left; margin-bottom: 1em; margin-right: 1em;"><img
src="http://2.bp.blogspot.com/-fp9ou6UDGAY/Uy_wUPv0hRI/AAAAAAAACII/AVXInw365jQ/s1600/attach+iso+file.jpg"
data-border="0" width="200" height="127" /></a>

</div>

<div>

Instead head over to the Storage-section and click that strange
little +-sign. This let's you choose a "disk". Choose the .ISO-file you
downloaded from Ubuntu and click ok. 

</div>

<div>

This is called mounting a ISO, and is the equivalent of putting a
physical DVD in the DVD drive of the computer. 

</div>

<div>



</div>

<div>



</div>

<div>



</div>

<div>

You are now ready to fire your computer up for the first time. This is
done by selecting your virtual machine and clicking Start (big green
arrow). 

</div>

<div>

When you do that it will install Ubuntu from the ISO-file. There's not
much use for me to repeat that process. It's smooth and requires you to
follow the on-screen instructions. Takes about 15 mins to install. Here
are the comments and caveats that got me wondering.  

</div>

<div>

-   The first thing that happened was that I got a big red screen saying
    "Uninitialized yada yada yada... upgrade BIOS yada yada yada...".
    That went away by itself
-   The first choice is if you want to "try" or "install" Ubuntu. A bit
    strange maybe but you of course should go with Install there.
-   Check "Downloading updates during install"
-    You want to erase the disk, since theres nothing on it and install
    Ubuntu on it
-   And the fill in the personal things. IMHO a strong password is not
    needed here since it will be run on your strong password protected
    computer... But you do as you want
-   As normal these days theres some commercials and instructions on how
    to use the OS during the install. Quite handy stuff if you are a
    newbie. Like I was at that point. 
-   Did you notice how Ubuntu keeps working while you where typing in
    thing and indicating your timezone and keyboard etc. Nice! 
-   Doing a lot of other things while installing is stupid. Like writing
    a blog post... The host is quite slow while installing. Or you might
    have to adjust the memory settings for your virtual machine. I
    backed it off to 1.2 Gb instead for faster handling on my host. 

When Ubuntu is installed it will ask you to reboot and then you can log
in again. In all honesty VirtualBox crashed on me here... Twice... I
reinstalled but the same thing happened. But unmounting and starting the
virtual machine worked just fine... Strange and a bit uneasy feeling.  

</div>

<div>



</div>

<div>

You can now "unmount" the .ISO file if you like, you don't need it
anymore. When the virtual machine is not running go to

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://3.bp.blogspot.com/-t2J3QEgM9X4/UzDY7vY0v9I/AAAAAAAACIo/SqzmQGVEzpw/s1600/unmount.jpg"
data-imageanchor="1"
style="clear: left; float: left; margin-bottom: 1em; margin-right: 1em;"><img
src="http://3.bp.blogspot.com/-t2J3QEgM9X4/UzDY7vY0v9I/AAAAAAAACIo/SqzmQGVEzpw/s1600/unmount.jpg"
data-border="0" width="320" height="60" /></a>

</div>

settings/storage like before, but remove the ISO file this time. 

</div>

<div>

You can also click the little disc at the bottom of the screen when you
virtual machine is running and chose "Remove disk from virtual drive". 

</div>

#### VirtualBox guest additions

<div>

Oh, one last thing. We should install the VirtualBox guest additions.
What's that you ask (and me too from time to time)?
<a href="https://www.virtualbox.org/manual/ch04.html"
target="_blank">Well:</a>

</div>

> They consist of device drivers and system applications that optimize
> the guest operating system for better performance and usability

You install them by:


1.  Start the virtual machine
2.  Click the Devices menu in the VirtualBox window that your virtual
    machine is running in
3.  This will mount a .iso with the guest additions and start installing
    it
4.  You will have to give your password to give the installation
    permission to run
5.  Don't be scared of the terminal window flashing by... It's the Linux
    way. "Press Return" when it's completed. 
6.  Soon it will be done and you're wise to restart the computer again.
7.  Done 



### Setting up VirtualBox

<div>

There's a few settings that I find useful and always to in VirtualBox.
First I make sure that I know which the Host-key is. This key is used to
invoke commands from your host environment. For example making the
virtual machine window fullscreen (Host+F). And now that it's fullscreen
go back again (Host+F again). 

</div>

<div>



</div>

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://3.bp.blogspot.com/-qC2CcjGQTQA/UzD0lN0pd0I/AAAAAAAACI0/leuk_W_4nEI/s1600/hostkey.jpg"
data-imageanchor="1"
style="clear: left; float: left; margin-bottom: 1em; margin-right: 1em;"><img
src="http://3.bp.blogspot.com/-qC2CcjGQTQA/UzD0lN0pd0I/AAAAAAAACI0/leuk_W_4nEI/s1600/hostkey.jpg"
data-border="0" width="200" height="139" /></a>

</div>

<div>

So... which is my host key then? That's actually pretty hard to find
out:

</div>

<div>

1.  Open VirtualBox 
2.  Got to File - Properties
3.  Select Input
4.  Select Virtual Machine
5.  In the top you'll find the Host Key Combination... For me it's the
    right CTRL-button. I seldom use that button for other things. 
6.  Easy huh? NOT!

</div>

<div>

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://4.bp.blogspot.com/-p-bSCG5FUhQ/UzI_9I2qLbI/AAAAAAAACJ4/a7SrY8XrejQ/s1600/hostkey+easy.jpg"
data-imageanchor="1"
style="clear: right; float: right; margin-bottom: 1em; margin-left: 1em;"><img
src="http://4.bp.blogspot.com/-p-bSCG5FUhQ/UzI_9I2qLbI/AAAAAAAACJ4/a7SrY8XrejQ/s1600/hostkey+easy.jpg"
data-border="0" /></a>

</div>

Luckily I found a much easier place to see the host key. The currently
selected host key is displayed in the lower right corner of the virtual
machine window. Here's that part of my screen that shows the "Right
Ctrl"-key as the host key. Click it to change.

I also make sure the that the clipboard is "bi-directional". That means
that I can copy something in the virtual machine and then paste it in a
program on my host. Or vice versa. Very handy. 

</div>

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://1.bp.blogspot.com/-KUKpl6c_eHc/UzD1WNngkpI/AAAAAAAACI8/Bg0I5qq4EjA/s1600/copy+and+past+settings.jpg"
data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
src="http://1.bp.blogspot.com/-KUKpl6c_eHc/UzD1WNngkpI/AAAAAAAACI8/Bg0I5qq4EjA/s1600/copy+and+past+settings.jpg"
data-border="0" width="320" height="168" /></a>

</div>

### Get to know Linux / Ubuntu

<div>

Skip this if you're not afraid of new OS's. If you are. Don't be that.
Read this instead. 

</div>

<div>



</div>

<div>

If you've used Windows XP/7 or 8 or OS X during the 2000-ies you will be
able to figure all of this out yourself. Here's my homescreen:

</div>

<div class="separator" style="clear: both; text-align: center;">

<a
href="http://3.bp.blogspot.com/-vQhUUFMjvMc/Uy_0V4X2ViI/AAAAAAAACIU/1SRbtDnn6Xs/s1600/ubuntu+homescreen.jpg"
data-imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img
src="http://3.bp.blogspot.com/-vQhUUFMjvMc/Uy_0V4X2ViI/AAAAAAAACIU/1SRbtDnn6Xs/s1600/ubuntu+homescreen.jpg"
data-border="0" width="640" height="305" /></a>

</div>

<div>



</div>

<div>

-   To the right is my Start-menu docked. You can see all my programs
    there. When you start a new program it will show there. You can then
    rightclick it and pin it to the start menu so that it's easy to
    start again
-   On this screen I've clicked the Ubuntu logo so that I can search
    through my system for applications and files
-   Theres an "explorer" that shows your files and folders. I have
    stored everything I use under my Home-folder. The first thing I
    created was Projects folder
-   When you open a window it's not fullscreen. You can make it so by
    click the square symbol in the upper left corner. Now those symbols
    got lost and you wonder where they are. You can find them again in
    the upper left corner of the desktop. Where the name of the
    application is visible. Confused me for awhile.
-   In the upper right corner there's a little cog-symbol. Click that to
    find Shut down... That took me QUITE sometime to find. 

<div>

There's loads of other things but all in all it was very easy to
understand and get started. I like it!

</div>

</div>

### Installing Node stuff

<div>

We are now ready to start installing the things we need to develop Node
applications. Here is the list of things that I use frequently. 

</div>

<div>



-   <a href="https://www.google.com/intl/en/chrome/browser/"
    target="_blank">Chrome for Linux</a>
-   [Node](http://nodejs.org/)
-   [Mongo Db](http://www.mongodb.org/)
-   <a href="http://robomongo.org/" target="_blank">Robomongo</a>
-   <a href="http://git-scm.com/" target="_blank">Git</a>
-   <a href="https://www.npmjs.org/package/nodemon"
    target="_blank">Nodemon</a>
-   <a href="https://www.npmjs.org/package/mocha" target="_blank">Mocha</a>

#### Chrome for Linux

<div>

Chrome is simplest to install from the
<a href="https://www.google.com/intl/en/chrome/browser/"
target="_blank">normal download site</a>. I always use Chrome on all my
computers and this is no exception. I always log in to Chrome as well
since it syncs my bookmarks, apps and history. 

</div>

<div>



</div>

<div>

Installing this way is very much like doing it on Windows or Mac.
Except... the file that you download is not an .exe of course. It's a
.deb (debian package). Save that and then double click it to start the
installation. This will open the "Ubuntu software center" and from there
you can click Install. 

</div>

<div>



</div>

<div>

Go ahead and install your favorite browser now. If it's not
<a href="http://www.mozilla.org/firefox/" target="_blank">Firefox</a>
because that's included...

</div>

#### Node

<div>

Now, using that browser, let's install [Node](http://nodejs.org/). Head
over to the [Node](http://nodejs.org/)-site and click Install. This will
download a .tar.gz file for you with the installation in. When that is
completed open the file and ... or we can do this the Linux way and
install it via apt-get. The way ~~God~~ Linus intended it. Either way
you'll be using the terminal a lot, might as well get to know it. 

</div>

<div>



</div>

<div>

Apt-get is a package manager that is used by Linux to install things on
your computer. Very handy and have been cloned in both Mac
(<a href="http://brew.sh/" target="_blank">Homebrew</a>) and Windows
(<a href="https://chocolatey.org/" target="_blank">Chocolatey</a>)

</div>

<div>

1.  Open the terminal by clicking the Ubuntu logo and search for
    Terminal
2.  Now enter this command; "<span
    style="font-family: Courier New, Courier, monospace;">sudo apt-get
    install nodejs</span>". Use CTRL+SHIFT+V to paste (CTRL+SHIFT+C to
    copy) in the terminal window
3.  "<span
    style="font-family: Courier New, Courier, monospace;"><a href="http://xkcd.com/149/" target="_blank">sudo</a></span>"
    just means that you run this as administrator, kinda. You will have
    to enter your password. 
4.  Wait while apt-get does it's magic.
5.  Done. To check if it worked type "<span
    style="font-family: Courier New, Courier, monospace;">node
    --version</span>" and you should see the version of Node that was
    just installed...

Sadly... that didn't bring down Nodes own package
manager, <a href="https://www.npmjs.org/" target="_blank">npm</a>. We
need that. Very soon. Let's do it again:

</div>

<div>

1.  Open terminal
2.  "<span style="font-family: Courier New, Courier, monospace;">sudo
    apt-get install npm</span>"
3.  Wait
4.  Check with "<span
    style="font-family: Courier New, Courier, monospace;">npm
    --version</span>"
5.  Done

</div>

<div>

And now npm is installed too. That's good we will be using it right
away.

</div>

<div>



</div>

<div>

Because the version of Node was way to low (in my case...0.6.12?!). But
you can use npm to upgrade it. There's a very nifty little tool called
"<a href="https://github.com/visionmedia/n" target="_blank">n</a>". No,
I'm not kidding. It's called
<a href="https://github.com/visionmedia/n" target="_blank">n</a>. Only.
Install it with npm and then you can update your version of node pretty
easy. 

</div>

<div>

1.  Open the terminal
2.  First we need to clear out the cache of npm; "<span
    style="font-family: Courier New, Courier, monospace;">sudo npm cache
    clean -f</span>"
3.  Then install n; "<span
    style="font-family: Courier New, Courier, monospace;">sudo npm
    install -g n</span>" (-g means install it globally on my system, not
    only in the local folder). If you got errors... see below. 
4.  Finally, use n to update NodeJs; "<span
    style="font-family: Courier New, Courier, monospace;">sudo n
    stable</span>" (in this case we're updating to the most recent
    stable release, but you can update it to a version number too.
    "<span style="font-family: Courier New, Courier, monospace;">sudo n
    0.11.9</span>" for example if you're planning on doing
    <a href="http://koajs.com/" target="_blank">KoaJs</a> work...)
5.  That means that you can install more than one version of Node on the
    system. And you can switch between version using the "<span
    style="font-family: Courier New, Courier, monospace;">n</span>"
    command. Read
    <a href="https://github.com/visionmedia/n" target="_blank">more on their
    site </a>

</div>

#### Errors errors errors

<div>

When I ran the "<span
style="font-family: Courier New, Courier, monospace;">npm
install</span>" command for the first time I ran into some problems. The
following error was shown "Error: failed to fetch from registry: n".
Luckily others <a
href="http://stackoverflow.com/questions/12913141/installing-from-npm-fails"
target="_blank">have had this problem too.</a> The solution was to set
the registry to use for npm, i.e. where it should look for packages.
Here's the command

</div>

> <span style="font-family: Courier New, Courier, monospace;">npm config
> set registry http://registry.npmjs.org/</span>

<div>

But it didn't stop there. When I ran "sudo n stable" it came back by
saying "/usr/local/bin/n: line 216: curl: command not found". Command
not found?! I typed "curl" at the prompt and here is what it said:

</div>

> <span
> style="font-family: Courier New, Courier, monospace;">marcus@marcusJsVm2:\~$
> curl
> The program 'curl' is currently not installed.  You can install it by
> typing:
> sudo apt-get install curl</span>

<div>

What a lovely error message! So I did that... "<span
style="font-family: Courier New, Courier, monospace;">sudo apt-get
install curl</span>"... and now finally it worked!

</div>

<div>



</div>

<div>

With that in place I could install n. And when that was done Node was
installed. Let's press on!

</div>

#### Mongo Db

<div>

That apt-get thing was fun. Let's do it again, to install Mongo Db, the
database of choice for most Node-developers. 

</div>

<div>



</div>

<div>

This is a little bit tricker since we need to add a keyserver to ensure
the validity of the packages. But nothing we cannot handled. It's
describe in <a
href="http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/"
target="_blank">greater detail here</a>, on the manufacturers page. 

</div>

<div>

1.  Open the terminal
2.  Add the MongoDb public key to apt-get's trusted servers; "<span
    style="font-family: Courier New, Courier, monospace;">sudo apt-key
    adv --keyserver hkp://keyserver.ubuntu.com:80 --recv
    7F0CEB10</span>"
3.  Create a MongoDb list file; "<span
    style="font-family: Courier New, Courier, monospace;">echo 'deb
    http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen'
    \| sudo tee /etc/apt/sources.list.d/mongodb.list</span>"
4.  Reload the apt-get repository; "<span
    style="font-family: Courier New, Courier, monospace;">sudo apt-get
    update</span>"
5.  And now, finally we can install the latest version of MongoDb;
    "<span style="font-family: Courier New, Courier, monospace;">sudo
    apt-get install mongodb-10gen</span>"
6.  We are now done and MongoDb is running in the background, as a
    service, ready for us to use. Type "<span
    style="font-family: Courier New, Courier, monospace;">mongo</span>"
    to open the interactive client. 

Phew! That  was tricky. But as I said; the terminal is the Linux way.
Might as well get used to it. Note that you could do all of this from
the NodeJs site as well. But you wouldn't learn as much. 

</div>

<div>



</div>

<div>

Ok, Mongo is installed. On to the next.

</div>

#### Robomongo

<div>

As much as I'm getting used to using the terminal for almost everything
it's some tasks where I like a GUI. Like browsing through and checking a
database for collections and content for example.
<a href="http://robomongo.org/" target="_blank">Robomongo</a> is a
graphical UI on MongoDb that I've come to love. 

</div>

<div>



</div>

<div>

Let's install it, but not via the terminal this time. <a
href="https://github.com/binarybirchtree/install-robomongo/blob/master/install-robomongo.sh"
target="_blank">That looked messy indeed.</a>

</div>

<div>

1.  Go to <a href="http://robomongo.org/" target="_blank">Robomongo </a>
2.  Click Download for Linux and pick the correct version 32/64 bit
3.  Wait for the download to complete
4.  Open the file which will open it in Ubuntu Software center.
5.  Click Install
6.  Done

</div>

#### Git

<div>

<a href="http://git-scm.com/" target="_blank">Git</a> is the de facto
standard for version control these days.
<a href="http://www.marcusoft.net/2014/02/mnb-git.html"
target="_blank">You must know it</a>. You must have it. As before trying
to run git from the terminal without it being installed gives you a
lovely error message;

</div>

<div>

> <span style="font-family: Courier New, Courier, monospace;">The
> program 'git' is currently not installed.  You can install it by
> typing:
> sudo apt-get install git</span>

</div>

<div>

And then you just follow the instructions and a "<span
style="font-family: 'Courier New', Courier, monospace;">sudo apt-get
install git</span>" later you are done. Git is installed.  

</div>

#### Global Node packages; Nodemon & Mocha

<div>

Finally I usually install two packages gobally.
<a href="https://www.npmjs.org/package/nodemon"
target="_blank">Nodemon</a> helps me monitor Node process so that I
 don't have to manually restart them when i make changes in my files.
And <a href="http://www.marcusoft.net/2014/02/mnb-mocha.html"
target="_blank">Mocha</a> is my choice of testing. 

</div>

<div>


Let's install both of them using npm;

</div>

<div>

1.  In the terminal
2.  "<span style="font-family: Courier New, Courier, monospace;">sudo
    npm install nodemon -g</span>"
3.  "<span style="font-family: Courier New, Courier, monospace;">sudo
    npm install mocha -g</span>"
4.  See you already fluent in this.
5.  Done.

</div>

</div>

<div>

### Get an editor

</div>

<div>

The only thing that is missing now is some way to write code. I use
Sublime. I'm paying for it. You should too. One license goes for all
platforms. It's well worth it! 

</div>

<div>



</div>

<div>

Install Sublime here.

</div>

<div>



</div>

<div>

Other options is Brackets and Atom (if you can get an invite in time). 

</div>

<div>



</div>

<div>

I will not write much about this since it's very much up to everyone's
taste (and the post is crazy long already). Depending on what you have
installed you will probably need to install some add-ins as well. 

</div>

### Summary

<div>

If you stayed with me for this long, I'm very grateful and hope that you
got value from this. I know that I was surprised how easy this
environment was to work with. I hope you will like it too. 

</div>

</div>
