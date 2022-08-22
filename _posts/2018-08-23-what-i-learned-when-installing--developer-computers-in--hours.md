---
layout: post
title: What I learned when installing 33 developer computers in 5 hours
author: Marcus Hammarberg
date: 2018-08-23 10:12:38
tags:
 - Lean
 - Javascript
 - Node
  - Life of a consultant
---

Yesterday I had a very interesting task for a client. I work as (brace yourselves for a cool title) "Head of curriculum" for [School of Applied Technology](https://www.study-at-salt.com/). They create and run bootcamps and the first one we are running is "Fullstack JavaScript developer with React and Express". That title means that I've been creating the content of the course together with the person (Jakob) teaching it.

Ok, to the point of this post. Part of this work means that we need 33 students to get up and running with their developer computers super fast. We want code to be written after a few hours.

Said and done - I created a set of [dotfiles](https://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/) which will configure their computers properly with all the tools and (my opinionated) settings they will need.

Yesterday 33 MacBook Pros came to the Aptitud office and 5 hours later I had installed, configured and test them all.

<img src="/img/gettingReady.jpg" style="width:100%" />

In this blog post I wanted to describe how that was accomplished and what I learned in the process. The post will be some lean learnings and some bash scripting and something about dotfiles.

<!-- excerpt-end -->

## The dotfiles and why I went this route

Dotfiles are the files starting with `.` On Linux and OSX systems these typically contains configuration about your system and tools. A community has grown around sharing and tweaking these files to suit your particular need.

The [files I'm using for my personal need](https://github.com/marcusoftnet/dotfiles) are very elaborate and does not only configure your system but actually installs all the tools you need. So when I get a new computer at a client, I simply clone my dotfiles- repository into `~/Marcus/.dotfiles` and run the bootstrapping command. About 30 minutes later everything I need is not only installed but also configured the way I like it.

Since many of the students in the bootcamp are new to programming or the platform we thought that we could help them get a suitable environment in order by using dotfiles  to configure their computer. They can then fork and tweak their settings to their individual need.

Also, everyone is using identical systems (MacBook Pros of the same release)  it proves a good delivery mechanism for getting the systems fast to a useable state. It also meant that I could do some simplifications in the deliver, for example I knew that everything could be installed with [HomeBrew](https://brew.sh/)

### What's in the box?

The easiest way to answer that question is to ask you to look through [this file](https://github.com/saltsthlm/jsfullstackdev-dotfiles/blob/master/Brewfile) which contains all the tools, but some highlights are

* [docker](https://www.docker.com/) to do virtulization and containers
* [font-fira-code](https://github.com/tonsky/FiraCode) - which is the coolest font for programers (I think)
* [pgAdmin4](https://www.pgadmin.org/) - a postgres management tool
* [robo-3t](https://robomongo.org/) - a [MongoDb](https://www.mongodb.com/) management tool
* [slack](https://slack.com/) - chatting tool
* [spectacle](https://www.spectacleapp.com/) - to easier position your windows in OsX
* [sublime](https://www.sublimetext.com/) - an awesome editor
* [visual studio code](https://code.visualstudio.com/) - an even awesomer editor
* [Oh-My-Zsh](https://ohmyz.sh/) - the most awesome shell you will ever use

### How can I be part of this?

Well first of all - Yes you can. :)

Secondly do this:

1. Clone [the repository](https://github.com/saltsthlm/jsfullstackdev-dotfiles) so that you can tweak it for your own settings
   1. Put it in a `~/.dotfiles` directory
2. Run the `~/.dotfiles/script/bootstrap.sh` script, which will take you through a little wizard
3. Wait for about 30 minutes
4. Done.

Now, that was for you and your computer. In the next section I will tell the story on how I did this 33 times over.

## The process and how I optimised it

Yesterday morning 33 brand new MacBook Pros came to my office. My task was clear: Get these computers ready for the students so that they can start coding on them without any hassle. That meant that I had to:

1. Unbox them (which was AWESOME fun - the mother of all unboxings as I will refer to it from now on)
2. Install the OS
3. Set up a user for each user (and note the serial number of *their* computer)
4. Run the dotfiles as described above
5. Reboot the computer, which will install OS updates
6. Start the computer up and do some tests

<img src="/img/smilingUnboxing.jpg" style="width:100%" />

Here I am before I start. See that smile? I couldn't wipe it off. Also notice the big pile of unfinished work in the background.

### My flow policies and rules

Being a lean guy I immediately started to think about flow, lead times and work in process limits. This led me to set up some very simple rules for myself:

* I will work my way backward; starting with the computer closest to being completed
* I will only pick up new work when I don't need to input something. For example, some of the early stages of an installation takes some time (creating a user took about 1-2 minutes to create, before I could click the next button) In those times I could pick up new work.
* I will not many simultaneous installations - turned out to be around 5 computers running. With 6 I got really busy and stressed out.

### Setting up the workflow

All of this put together gave me a workflow like that looked like this:

<img src="/img/installationWorkflow.png" style="width:100%" />

1. Open and remove plastic
2. Start computer
   1. Make initial configuration (language, location, wifi access, keyboard)
   2. Make user config (username and password, by pass Siri, Touch ID etc that I couldn't do on the user behalf)
   3. Get the command to do bootstrapping (see below) from https://github.com/saltsthlm/jsfullstackdev-dotfiles
3. Run that command in the terminal, which required some password typing
   1. Enter git name and user when requested
   2. Wait for bootstrap to start
4. Reboot computer
   1. Setup recovery disk
   2. Get updates for os installed
5. Log back in and check that everything works as expected
   1. In all honesty I just did a few checks
6. Then I repacked the computer in it's box
   1. And put the name of the user on a sticky on top

### Statistics

- Each computer took about 35 minutes from the time I picked it from the pile until I put it back into it's box
- I started 1000, took 1 hour lunch and finished 1600 on the minute. So 5 hours for 33 computers = 6,6 per hour

## What I learned

Here's a few things I learned while doing this

### Bootstrapping is hard

Bootstrapping is sometimes referred to as "lifting yourself by the hair"... Here's an example:

In order to get the dotfiles onto a computer, you need to run git command (`git clone https://github.com/saltsthlm/jsfullstackdev-dotfiles.git .dotfiles`). But a clean installation of MacOS doesn't contain OSX. That needs to be installed with `xcode-select --install`, but that opens a dialog box and hence cannot be done in a script. In doing 33 installations in succession I really wanted to minimise the number of clicks needed to be done.

Preferably I wanted one single script to do the complete installation. But that would also be impossible due to that dialog box to install git...

Turns out - git is installed as part of the installation of [HomeBrew](https://brew.sh/) . So as long as I installed Homebrew first I should be fine.

To put it differently: I needed to install Homebrew, to install git that I need to do the installation. This my friends is called [Yak Shaving](https://whatis.techtarget.com/definition/yak-shaving)

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">A fully shaved Yak. <br>.<br>.<br>.<br>I won&#39;t say how long it took. <a href="https://t.co/sSWC1Pk7wH">pic.twitter.com/sSWC1Pk7wH</a></p>&mdash; mike rizzi (@rizzi) <a href="https://twitter.com/rizzi/status/1030752083975327746?ref_src=twsrc%5Etfw">August 18, 2018</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

I ended up with a single script that I could trigger with one command to do the full installation. Here's the script

```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

git clone https://github.com/saltsthlm/jsfullstackdev-dotfiles.git ~/.dotfiles

bash ~/.dotfiles/script/bootstrap

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

1. Install Homebrew
2. Now that we have git - clone the repository
3. Run the bootstrap script (which, incidentally, installs Homebrew unless it's installed)
4. Run the script that installs [Oh-my-zsh](https://ohmyz.sh/)

This script can be run with this command

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/saltsthlm/jsfullstackdev-dotfiles/master/script/automationAug18.sh)"
```

Great - now I had one command to run in order to install everything in my dotfiles, including it's prerequisites.

### Testing, testing and then some testing

The process was smooth and I was up and running in just a few minutes. The reason for this was that I had run it many many times before I started.

First of all I have a version of the dotfiles on my own computer and I have used it for years now. I know this.

I then ran the [Salt dotfiles](https://github.com/saltsthlm/jsfullstackdev-dotfiles) many times and found many problems, on a virtual environment. I used [VirutalBox](https://www.virtualbox.org/) and a HighSierra image. Which meant that I could do a clean install many times over.

This was hugely beneficial for the smoothness in the process. During the day when I worked on the proper computers I didn't change a thing in the scripts itself. Instead I could focus on getting it right and help the work to flow faster.

### Optimisations and disruptions

As always, when I started to see many improvement opportunities as I started to work:

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">It is in the doing of the work that we discover the work that we must do. Doing exposes reality.</p>&mdash; Woody Zuill (@WoodyZuill) <a href="https://twitter.com/WoodyZuill/status/916946959977582592">October 8, 2017</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

Here's a few improvements that came to me as I worked:

* By having the same password for all computers I only needed to remember the password and didn't need to care about which user I used. With a simple instruction I can ask the students to change it afterwards
* Once the computer booted for the first time I needed to type the CURL-command above. It was took forever to get right so I wrote it in the ReadMe.md in our repository. Just typing the URL of the repository was hard so I created a http://bit.ly link that was shorter and easier to remember
* As part of the installation I needed to write the full name and email of each user. That was horrible hard to get right so I wrote the email of all students in the ReadMe.md
  * I then just copied the email and used that when created the full name (by removing the @-part)
  * I made sure to remove the emails from the file and the commit history once I was done
* I had to note the serial number of each computer (printed on the box) connected to the correct user. I did this in a Google Sheet. But the serial number was so small to read that I took a photo of each in order to see.
  * Before I found this out it took me 1-2 minutes to make out from the box
  * When I flipped to box over (to photo the serial number) I needed to take the plastic out, but not the lid off - since that could send the computer flipping out on the table. Not that it happened ... well only once and not that hard
* In the beginning I spent a lot of frustrating minutes trying to put the empty box back and out of the lid. I then realised that I only needed to match the computer to it's corresponding bottom part (where the serial number is written). I could use any old lid.
  * You can see the lids in a pile in the workflow picture above
Another thing I learned from was when I got a call half-way through and they said that one person had declined their position. Of course it was one of the computers I've completed. So I had to learn how to [reinstall a MacBook Pro from scratch](https://support.apple.com/en-us/HT204904)

## Summary

This was a real fun task and I learned a lot both about lean, flow and scripting, dotfiles and computers.

I hope you found this useful too.
