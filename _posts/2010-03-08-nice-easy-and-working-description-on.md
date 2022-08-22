---
layout: post
title: Nice, easy and working description on how to compact a Virtual PC Image
date: '2010-03-08T15:19:00.000+01:00'
author: Marcus Hammarberg
tags:
  - Tools
  - Life of a consultant
modified_time: '2010-12-14T16:22:38.159+01:00'
blogger_id: tag:blogger.com,1999:blog-36533086.post-8330981049797861552
blogger_orig_url: http://www.marcusoft.net/2010/03/nice-easy-and-working-description-on.html
---

I have looked so long for this; a short and sweet description on how
to compact Virtual PC images. Here it
is: <http://kurtsh.spaces.live.com/blog/cns!DA410C7F7E038D!1902.entry>

1. Clear out the machine of filler
    I recommend installing CCLEANER.EXE from <http://ccleaner.com> which
    deletes all temporary files from the Windows installation, Internet
    Explorer cache, the Recycle Bin, and any number of other
    "garbage"/"temp" directories in the VPC.
2. Disable hibernation
    If you have hiberation turned on, there's a colossal sized file
    called hiberfil.sys in the root of the .VHD.  Go into Power options
    in Control Panel and disable hiberation to get rid of this file.
3. Capture the Virtual Disk Precompactor .ISO
    In the menu of Virtual PC windows for your machine, capture the
    Virtual Disk Precompactor .ISO file which is located at:
    c:\program files\microsoft virtual pc\virtual machine
    additions\virtual disk precompactor.iso
4. Run the Precompactor
    Go to My Computer and double click on the mounted disk.  It will
    begin to run the precompactor software which will essentially zero
    out all the free space on the disk, making it available for
    elimination from the file by the Virtual Disk Wizard, which we will
    use later.  This process may take upwards of 15 minutes
5. Shutdown the Virtual PC
6. Run the VPC2007 Virtual Disk Wizard
    From the Virtual PC console, click File-Virtual Disk Wizard and
    "Edit an existing virtual disk".  It will ask you to identify the
    .VHD file to reduce in size - select it.
7. Compact the .VHD
    Select the "Compact" option then select "Replacing the original
    file".  This will take a few minutes.

One thing to note is that bullet point \#3 describes that you should
attach the .ISO image that is referenced. This can be done directly in
Virtual PC and the menu command is called capture (CD -\> capture ISO
image...). Maybe self explanatory for some but I looked around a while
for that one...
