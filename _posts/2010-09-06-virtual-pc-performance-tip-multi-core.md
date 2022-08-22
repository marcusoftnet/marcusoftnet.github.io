---
layout: post
title: Virtual PC performance tip Multi-core support
date: 2010-09-06T09:17:00.001Z
author: Marcus Hammarberg
tags:
  - Tools
  - Life of a consultant
modified_time: 2013-10-08T07:19:43.239Z
thumbnail: >-
  http://lh3.ggpht.com/\_TI0jeIedRFk/TISxkg8QexI/AAAAAAAAAlw/f0yoCKtF7YY/s72-c/taskmanagerwith2cores_thumb.jpg?imgmax=800
blogger_id: tag:blogger.com,1999:blog-36533086.post-8875288799659277872
blogger_orig_url: http://www.marcusoft.net/2010/09/virtual-pc-performance-tip-multi-core.html
---




I often get to work with brilliant people. That’s one the real benefits
of being a consultant, I would argue. Last week I got to know Thomas
Gyllencreutz that came onboard my project. He didn’t waste any time to
get the performance in our virtual development environments to new
heights. This post is a condensation of his findings that really got our
Virtual PC images flying.
A general performance tip is to put your virtual hard drive (.vhd-file)
on a separate hard drive, as <a
href="http://www.hanselman.com/blog/VMPerformanceChecklistBeforeYouComplainThatYourVirtualMachineIsSlow.aspx"
target="_blank">suggested by mr Hanselmann</a>.
OK, to get the multi-core support you’ll need to find out how many cores
your system have. The easiest way to do that is to open Task Manager
(CTRL+SHIFT+Esc) and check the number of CPU-boxes under the performance
tab:
[<img
src="http://lh3.ggpht.com/_TI0jeIedRFk/TISxkg8QexI/AAAAAAAAAlw/f0yoCKtF7YY/taskmanagerwith2cores_thumb.jpg?imgmax=800"
title="taskmanagerwith2cores" data-border="0"
style="border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; display: block; float: none; margin-left: auto; margin-right: auto;"
width="218" height="244" alt="taskmanagerwith2cores" />](http://lh3.ggpht.com/_TI0jeIedRFk/TISxkNZ28wI/AAAAAAAAAls/6TLk7gxM058/s1600-h/taskmanagerwith2cores%5B2%5D.jpg)
This guide expects you to have a existing .VHD-file. The one with the
performance you want to boost ;). The guide also works from a Windows XP
SP3 installation. You will need two files from it’s I386-folder
(HALMACPI.DLL and NTKRNLMP.EXE).
Finally, if you haven’t already, enable hardware virtualization in your
BIOS, if possible. That’s done different on different systems so I won’t
describe it here.
To be able to use the settings we need (SMP) we’ll use the free
<a href="http://www.virtualbox.org/" target="_blank">Virtual Box</a>
that can be <a href="http://www.virtualbox.org/wiki/Downloads"
target="_blank">downloaded here</a>. When that’s installed you can
follow along here (sorry, I have translated the buttons from my Swedish
installation):

1. Make a copy of the existing hard drive (.vhd) to a new folder
    (VirtualBox/HardDrives for example)
2. Start Virtual Box and chose New (virtual machine)
3. Give the new machine a name and go Next
4. Set the amount of memory you need. And Next
5. Select “Use existing hard drive” and select the .vhd you copied in
    step 1 (VirtualBox/HardDrives). You’ll need to add it with another
    dialog:
    1. Click the little green arrow on the folder
    2. Chose Add
    3. Browse to the file
    4. Click OK
6. Go next and Finish

We’re now ready to tweak the VirtualBox-image:

1. Right-click the created VirtualBox environment and select “Settings”
2. Click “System” in the left menu and select the following
    1. Activate IO APIC (needed for
        <a href="http://en.wikipedia.org/wiki/Symmetric_Multi-Processing"
        target="_blank">SMP support</a> )
    2. Select the number of processors you want the environment to use
3. Click “Screen” in the left menu
    1. Select the amount of graphic memory you want the environment to
        have (I have 128 Mb)
4. Click “Audio” in the left menu
    1. Uncheck Activate audio
5. Click “Network” in the left menu
    1. Select Bridged network card and you physical systems network
        card
6. Done!

When the VirtualBox environment starts up for the first time:

1. Be sure to cancel the installation of all windows drivers
2. And install the Guest Additions instead
3. Reboot the virtual machine

Right – now we’re closing in on the final part:

1. When the system is booted again, go to %WINDIR%\system32 and make
    copies (with new name) for these two files:
    1. %WINDIR%\system32\hal.dll to %WINDIR%\system32\hal**sp**.dll
    2. %WINDIR%\system32\ntoskrnl.exe to
        %WINDIR%\system32\ntoskrnl**sp**.exe
2. Now copy these two files from you Windows SP 3 installation
    (I386-folder) to %WINDIR%\system32:
    1. HALMACPI.DLL
    2. NTKRNLMP.EXE
3. Now we’re going to add a row in Boot.ini that is our configuration
    for multiprocessor support. **Be very careful when doing this,
    errors in boot.ini may cause your system to not boot correctly.**
    1. First show protected operating system files in the Explorer
        (Tools-\>Folder Options-\>View)
    2. Now remove the write protection from C:\Boot.ini
    3. Open C:\Boot.ini and add the following row:
       multi(0)disk(0)rdisk(0)partition(1)\WINNT="WinXP (native - SMP)"
        /execute /fastdetect /kernel=NTKRNLMP.EXE /hal=halmacpi.dll
    4. Save the file and write protect C:\Boot.ini again.
    5. And better put back the hiding of operating system files
4. Shut down the environment
5. In the VirtualBox console set the number of processors for your
    system
6. Start the virtual machine again
7. Wait a while for the system to find the drivers for your new
    configuration.
8. Check the task manager in the virtual image; it should now have the
    number of processors of your choice

Phew – that was a lot of stuff to do, that I mostly didn’t know much
about… But my virtual system is now flying! And I also got a lot better
screen resolution. Full screen, baby!
Thank you Thomas.

