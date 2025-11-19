---
layout: post
title: Move files at regular intervals on OSX
date: 2013-08-19T13:05:00.002Z
author: Marcus Hammarberg
tags:
  - Tools
  - Life of a consultant
modified_time: 2013-08-19T13:05:55.135Z
thumbnail: /img/Screen+Shot+2013-08-19+at+14.41.50+.png
blogger_id: tag:blogger.com,1999:blog-36533086.post-7696849555794418675
blogger_orig_url: https://www.marcusoft.net/2013/08/move-files-at-regular-intervals-on-osx.html
---

I've been starting to use [Automator](http://support.apple.com/kb/HT2488) for some tasks that I commonly do and it's actually quite capable although a bit convoluted and secretive.

In this post I'll describe how to "write" a little task that moves files from one folder to another on a set schedule. I'm using this to move photos from my DropBox-folder to my SkyDrive-folder. This is done since I sync photos to DropBox and it fills up after awhile. And yes - I understand that this problem will come back for SkyDrive.

Ok - here we go:

## Automating moving files

![The trigger happy Automator robot](/img/Screen+Shot+2013-08-19+at+14.41.50+.png)

Open Automator - I still have a problem with that cute robot holding a bazooka. I want to move files not blow them to heaven come. Well, well - open the Automator application.

You are now greeted with a big dialog that asks you to pick a "Type for your document". This is a question that at least I didn't know how to answer but you could go with Workflow or Application - both will work for our objectives. I picked Workflow.

## Find the files

Now search for a couple of Actions in the search box. First we need to find the finder items that we want to move ("Find Finder Items" is the name of that action).  Double-click that action and it will appear in the area to the right.

Now you can configure where the Find Finder Items action is going to look and based on which criteria the selection shall be done. My task looks in the /Dropbox/Camera uploads/ folder and selects all the files that is "not in the last 1 months". There's loads of combinations and opportunities for the selection.

**Watch out!** I had some trouble to get the [Find Finder Items action to work](http://www.nickshubin.com/articles/mac/find_finder_item.html). In the end I had to re-index my [search index for spotlight](http://support.apple.com/kb/ht2409).

### Move the files

To move the files we need another action called: "Move Finder Items". Search for it and double-click it. You can then configure where you want the files moved to. "Which files?", you might wonder. Well the files that you've sent to the action. It's selected with the Find Finder items.

When you're done your complete application looks like this:

![Automator workflow](/img/Screen+Shot+2013-08-19+at+14.50.09+.png)

Save the application with a suitable name: MovePhotos.application for example.

### Scheduling jobs with ... iCal?

The second part of the story is to run this task on a recurring basis. Weekly for me, but choose your poison. This is strangely enough done with iCal. Yes - the calendar application. (You can do this at the terminal but hey - this is the graphical guide).

Here is how it's done:

Open iCal

Create a new calendar (File -> New Calendar -> On my Mac). Call it "Scheduled applications" or something that helps you understand which calendar it is.

Create a new event on the day and time when you want the application to run. For example on a Friday at 0830.

Double click the event and set the following:

1. Repeat - how often you want this to run. I choose weekly
2. Calendar - set it in "Scheduled applications" so that you don't have to see these events.
3. Under "Alert" chose "Open file" and then the application that you have created with Automator above.
4. Give the event a suitable name. "Move photos" for example.

Done

### Conclusion

This actually works very nicely for me. But it took me a couple of hours to figure out. Now you don't have to endure the same pain. And me neither when I look again.
