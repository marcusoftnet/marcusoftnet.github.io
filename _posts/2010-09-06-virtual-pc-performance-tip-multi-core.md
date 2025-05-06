---
layout: post
title: Virtual PC performance tip Multi-core support
date: 2010-09-06T09:17:00.001Z
author: Marcus Hammarberg
tags:
  - Tools
  - Life of a consultant
modified_time: 2013-10-08T07:19:43.239Z
blogger_id: tag:blogger.com,1999:blog-36533086.post-8875288799659277872
blogger_orig_url: https://www.marcusoft.net/2010/09/virtual-pc-performance-tip-multi-core.html
---

I often get to work with brilliant people. That’s one of the real benefits of being a consultant, I would argue. Last week I got to know Thomas Gyllencreutz, who came onboard my project. He didn’t waste any time in getting the performance in our virtual development environments to new heights. This post is a condensation of his findings that really got our Virtual PC images flying.

A general performance tip is to put your virtual hard drive (.vhd-file) on a separate hard drive, as [suggested by Mr. Hanselman](http://www.hanselman.com/blog/VMPerformanceChecklistBeforeYouComplainThatYourVirtualMachineIsSlow.aspx).

OK, to get the multi-core support you’ll need to find out how many cores your system has. The easiest way to do that is to open Task Manager (CTRL+SHIFT+Esc) and check the number of CPU boxes under the performance tab:

![task manager with 2 cores](/img/taskmanagerwith2cores_thumb.jpg)

This guide expects you to have an existing .VHD-file—the one with the performance you want to boost ;). The guide also works from a Windows XP SP3 installation. You will need two files from its I386-folder (HALMACPI.DLL and NTKRNLMP.EXE).

Finally, if you haven’t already, enable hardware virtualization in your BIOS, if possible. That’s done differently on different systems, so I won’t describe it here.

To be able to use the settings we need (SMP), we’ll use the free [VirtualBox](http://www.virtualbox.org/), which can be [downloaded here](http://www.virtualbox.org/wiki/Downloads). When that’s installed, you can follow along here (sorry, I have translated the buttons from my Swedish installation):

1. Make a copy of the existing hard drive (.vhd) to a new folder (e.g., VirtualBox/HardDrives).
1. Start VirtualBox and choose New (virtual machine).
1. Give the new machine a name and click Next.
1. Set the amount of memory you need and click Next.
1. Select “Use existing hard drive” and select the .vhd you copied in step 1 (VirtualBox/HardDrives). You’ll need to add it with another dialog:
   1. Click the little green arrow on the folder.
   2. Choose Add.
   3. Browse to the file.
   4. Click OK.
1. Click Next and Finish.

We’re now ready to tweak the VirtualBox image:

1. Right-click the created VirtualBox environment and select “Settings.”
1. Click “System” in the left menu and select the following:
   1. Activate IO APIC (needed for [SMP support](http://en.wikipedia.org/wiki/Symmetric_Multi-Processing)).
   1. Select the number of processors you want the environment to use.
1. Click “Screen” in the left menu:
   1. Select the amount of graphic memory you want the environment to have (I have 128 MB).
1. Click “Audio” in the left menu:
   1. Uncheck Activate audio.
1. Click “Network” in the left menu:
   1. Select Bridged network card and your physical system's network card.
1. Done!

When the VirtualBox environment starts up for the first time:

1. Be sure to cancel the installation of all Windows drivers.
1. Install the Guest Additions instead.
1. Reboot the virtual machine.

Right – now we’re closing in on the final part:

1. When the system is booted again, go to %WINDIR%\system32 and make copies (with new names) of these two files:
   1. %WINDIR%\system32\hal.dll to %WINDIR%\system32\hal**sp**.dll
   1. %WINDIR%\system32\ntoskrnl.exe to %WINDIR%\system32\ntoskrnl**sp**.exe
1. Now copy these two files from your Windows XP SP3 installation (I386-folder) to %WINDIR%\system32:
   1. HALMACPI.DLL
   1. NTKRNLMP.EXE
1. Now we’re going to add a row in Boot.ini that is our configuration for multiprocessor support. **Be very careful when doing this, as errors in Boot.ini may cause your system to not boot correctly.**
   1. First, show protected operating system files in the Explorer (Tools -> Folder Options -> View).
   1. Now remove the write protection from C:\Boot.ini.
   1. Open C:\Boot.ini and add the following row:

      ```ini
      multi(0)disk(0)rdisk(0)partition(1)\WINNT="WinXP (native - SMP)" /execute /fastdetect /kernel=NTKRNLMP.EXE /hal=halmacpi.dll
      ```

   1. Save the file and write-protect C:\Boot.ini again.
   1. And better put back the hiding of operating system files.
1. Shut down the environment.
1. In the VirtualBox console, set the number of processors for your system.
1. Start the virtual machine again.
1. Wait a while for the system to find the drivers for your new configuration.
1. Check the task manager in the virtual image; it should now have the number of processors of your choice.

Phew – that was a lot of stuff to do that I mostly didn’t know much about… But my virtual system is now flying! And I also got a lot better screen resolution. Full screen, baby!

Thank you, Thomas.
