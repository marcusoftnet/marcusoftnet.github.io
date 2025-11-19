---
layout: post
title: "Lessons from Installing 33 Developer Computers in 5 Hours"
author: "Marcus Hammarberg"
date: 2018-08-23 10:12:38
tags:
 - Lean
 - Javascript
 - Node
 - Life of a consultant
---

Recently, I undertook a fascinating task for a client. As the "Head of Curriculum" at the [School of Applied Technology](https://www.study-at-salt.com/), my responsibilities include crafting the content for bootcamps. Our inaugural bootcamp, "Fullstack JavaScript Developer with React and Express," required me to swiftly set up 33 developer computers to ensure students could start coding within hours.

Here's a rundown of how I accomplished this feat and the insights gleaned along the way.

<!-- excerpt-end -->

## Embracing Dotfiles

Dotfiles, denoted by filenames starting with '.', typically contain system and tool configurations on Linux and OSX systems. Leveraging [my personal dotfiles](https://github.com/marcusoftnet/dotfiles), which not only configure systems but also install necessary tools, I streamlined the setup process. By cloning my dotfiles repository and executing a bootstrap command, I can equip a new computer with everything I need in about 30 minutes.

For the bootcamp, where many students were new to programming or the platform, utilizing dotfiles provided a standardized and efficient setup process. Moreover, since all students were using identical systems (MacBook Pros), dotfiles proved to be a convenient delivery mechanism, enabling rapid configuration with tools like [HomeBrew](https://brew.sh/).

## Tool Highlights

Take a glance at [this file](https://github.com/saltsthlm/jsfullstackdev-dotfiles/blob/master/Brewfile) for a comprehensive list of tools installed. Some notable ones include:

* [Docker](https://www.docker.com/)
* [Font Fira Code](https://github.com/tonsky/FiraCode)
* [pgAdmin4](https://www.pgadmin.org/)
* [Robo 3T](https://robomongo.org/)
* [Slack](https://slack.com/)
* [Spectacle](https://www.spectacleapp.com/)
* [Sublime](https://www.sublimetext.com/)
* [Visual Studio Code](https://code.visualstudio.com/)
* [Oh-My-Zsh](https://ohmyz.sh/)

## Joining the Setup

If you're interested in replicating this setup, follow these steps:

1. Clone [the repository](https://github.com/saltsthlm/jsfullstackdev-dotfiles) to customize it for your needs.
   1. Place it in a `~/.dotfiles` directory.
2. Run the `~/.dotfiles/script/bootstrap.sh` script, which will guide you through setup.
3. Wait for about 30 minutes.
4. Done.

## The Setup Process and Optimization

Upon receiving 33 MacBook Pros, I embarked on the task with a clear objective: prepare these computers for student use expeditiously. My workflow revolved around:

1. Unboxing and initiating setup.
2. Installing the OS and configuring user accounts.
3. Executing dotfiles bootstrap scripts.
4. Rebooting for OS updates.
5. Verifying functionality.
6. Repacking for distribution.

### Flow Optimization

Applying lean principles, I optimized my workflow with the following rules:

* Prioritize work on nearly completed computers.
* Minimize idle time by initiating new work during setup downtime.
* Limit concurrent installations to prevent overload.

### Workflow Setup

I structured my workflow as follows:

1. Unbox and power on each computer.
   1. Configure initial settings and user accounts.
   2. Obtain bootstrap command from [repository](https://github.com/saltsthlm/jsfullstackdev-dotfiles).
2. Execute bootstrap script, requiring password input.
   1. Complete git configuration prompts.
   2. Await completion of bootstrap process.
3. Reboot for OS updates.
   1. Set up recovery disk and install updates.
4. Verify functionality post-reboot.
5. Repackage with user identification.

## Insights Gained

### The Challenge of Bootstrapping

Bootstrapping, often akin to "lifting yourself by the hair," presents unique challenges. For instance, installing dotfiles requires git, which isn't preinstalled on MacOS. To address this, I installed Homebrew first, illustrating the concept of [Yak Shaving](https://whatis.techtarget.com/definition/yak-shaving).

### The Importance of Testing

Prior extensive testing proved invaluable in ensuring a smooth setup process. From personal use to virtual environment testing, every iteration revealed and rectified issues, contributing to a seamless final execution.

### Continuous Optimization

Throughout the process, I identified and implemented optimizations:

* Employing a uniform password streamlined setup.
* Documenting setup steps and URLs facilitated execution.
* Leveraging student email data expedited account setup.
* Employing photos for serial number capture minimized errors.
* Simplifying packaging further streamlined the workflow.

### Adaptability Amid Disruptions

Encountering unexpected disruptions, like system reinstallations and declined positions, underscored the need for adaptability and preparedness.

## Conclusion

This endeavor was both educational and enjoyable, offering insights into lean methodologies, workflow optimization, scripting, dotfiles, and computer setup. I trust you found these insights valuable.
