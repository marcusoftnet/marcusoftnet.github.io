---
layout: post
title: Setting up a complete Node development machine. From scratch. For free
date: 2014-03-26T01:45:00.002Z
author: Marcus Hammarberg
tags:
  - Node
  - Javascript
  - Tools
modified_time: 2014-04-06T12:41:45.586Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-6779226674205683514
blogger_orig_url: https://www.marcusoft.net/2014/03/setting-up-complete-node-development.html
---

I got yet another computer. To work on. But there will be slow days on airports and hotels with this baby to... So I decided to try something new; I decided to go Linux and setup a development environment for Node Js. I did not set up a goal of this being a no-cost project, it just ended up that way (with one worthy exception, in the end).

I have never used Linux before and decided to go with Ubuntu that looked like it would suit my Windows/Mac background best. It did too. It's been a pure joy to use so far.

This blog post described what I did and what obstacles I ran into on the way. It was ... not surprisingly maybe... but at least gratifyingly simple and smooth. I've tried to describe it so that you can be both a total newbie and a little bit more advance. The short version (aka TL;DR) comes first in each section and then the details. Skip what you don't want to read.

I started with a normal PC Lenovo (2.5 Ghz, 4 Gb ram) with a 64-bits Windows 8.1 Pro on it. The good news is that you don't have to care about that. Because we are building a virtual computer using VirtualBox.

This post is pretty scary very very long but the installation is quick. Downloading Ubuntu and installing it it what's takes the most time. With a good internet connection (that I do NOT have), you should be able to complete all of this in under 1 hour.
Here we go.

### Downloading downloading downloading

This section will contain a lot of waiting. I've put in some information for you to read in the meanwhile. Here it is in short form;

- Download VirtualBox
- Download Ubuntu installation media

#### VirtualBox

First we need to get VirtualBox itself. Download the correct version for your host operating system from here.

If you're new to this VirtualBox is free a virtualization software, from Oracle of all places. Meaning that we can create a single file (aka an image) that represents an entire computer. With this you can run another computer in your computer. It's a bit Inception-like but useful.

Your physical computer, aka the host environment, is where you will run VirtualBox. So you need to download the correct version for your host. Windows, Mac what have you.

Also way down at end of the downloads page there's a link to a set of prebuilt images. Virtual computers that you can download. I had some problems to get that to work. And downloading them on my **slow** network took forever.

#### Ubuntu install media

Let's download Ubuntu installation media. We want the desktop version (although the server version would probably do just fine too). There's some helpful advice on the Ubuntu download page too, as seen on the right.

WATCHOUT! The version of VirtualBox that I have downloaded (just a few weeks ago) only supported 32 bit Ubuntu. I got that in other words. Get the one that is suitable for you.

Once you click the Download button you will be taken to a "pay what it's worth page". I strongly recommend that you pay a couple of bucks. An operating system. For $10. Check the latests quotation for a Windows 8.1 license. You getting something very similar.

But it's up to you. If you don't want to pay there's a "Not now. Take me to the download"-link.

Ubuntu is a free "distribution" of Linux. For us non-Linux people this means that a company has taken the Linux core source code (it's open source remember) and created a version of their own. And is now giving it away for free. Ubuntu earns their money on consultancy and selling support I would suspect. Amazingly true.

Ubuntu is Swahili, btw, and means... Nice, huh?

Ok, that has not finished downloading yet. But will pretend it has.

### Create your virtual computer

This is simple... if you know how.

1. Install VirtualBox ("Next, Next, Next, Wait, Finish")
2. Create a new virtual machine and attach the Ubuntu installation media
3. Boot up and complete the Ubuntu installation

#### Install VirtualBox on your host

Now that you have everything downloaded, first install VirtualBox on your host system. This is your typical "Next, Next, Next, Wait, Finish"-installation and I will not say much about that. Just double click the "VirtualBox-yada-yada-yada-Win.exe" file you downloaded and you should be fine.

#### Create your virtual machine

Now, again if you're new to this it will be a bit strange. We will now create a virtual computer machine. Or virtual machine for short and if you under 85 years old, and stopped use that phrase.

Luckily this is a breeze in VirtualBox.

1. Start VirtualBox
2. Click New
3. Give your machine a name
4. Set the Operating system type and version
5. Click Next

That was easy, wasn't it?

#### Attach Ubuntu installation media

Now we will take our new virtual machine and attach the Ubuntu installation media to it. Meaning that we will boot from it. Which we can.

1. Start VirtualBox
2. Double-click on your new virtual machine
3. Click on the storage settings
4. In the "Storage tree" click on the little empty CD icon under "Controller: IDE"
5. Click the CD icon next to the "IDE Secondary Master" and select the Ubuntu installation media you downloaded
6. Click OK

We are now ready to boot from our Ubuntu installation media. Next up.

#### Boot up and complete Ubuntu installation

Finally, we get to see Ubuntu running on our machine. Kinda. As a virtual machine. Inside your computer. This is what we've been waiting for! This is the holy grail!

Ok, calm down.

1. Start VirtualBox
2. Double-click on your new virtual machine
3. Click on Start

Done. You will see Ubuntu booting. You will also see an installation window, much like the Windows installation process. Just answer the questions and watch it go. As a service to you, I can tell you that the keyboard is an US one. Not a Swedish one. You will change this in a later step. Just go with the flow, for now. (Use the "Super"-key to get started. Also known as the "Window"-key).

#### Configure Ubuntu

Ubuntu is installed but we are not done yet. We need to do some post-installation setup.

First, you will be asked to restart. Do that.

Once rebooted, you will be logged in. Finally. Ubuntu is now up and running on your machine!

Next, we'll set up a proper development environment.

### Set up Node.js development environment

Now that Ubuntu is installed and running, we can set up our Node.js development environment. This involves installing Node.js and npm (Node Package Manager).

#### Install Node.js and npm

Open a terminal (you can do this by clicking the Ubuntu icon in the upper-left corner, typing "Terminal" and hitting Enter). Then, follow these steps:

1. Update your package index: `sudo apt-get update`
2. Install Node.js and npm: `sudo apt-get install nodejs npm`
3. Verify that Node.js and npm were successfully installed: `node -v` and `npm -v`

That's it! You now have Node.js and npm installed on your Ubuntu machine. You can start building Node.js applications right away.

### Summary

In this blog post, we went through the process of setting up a development environment for Node.js on Ubuntu using VirtualBox. We started by downloading VirtualBox and Ubuntu installation media, then created a virtual machine, booted up Ubuntu, and completed the installation. Finally, we set up a Node.js development environment by installing Node.js and npm.

I hope this post was helpful to you. Let me know if you have any questions or run into any issues!
